local colours = {
	{"white",      "White",      "#ffffffc0",   "rainbow:daisies",              {50,50},4},
	{"cyan",       "Cyan",       "#00ffffc0",   "rainbow:tulip",                {75,90},5},
	{"magenta",    "Magenta",    "#ff00ffc0",   "rainbow:dianthus",             {45,80},6},
	{"yellow",     "Yellow",     "#ffff00c0",   "rainbow:dandelion",            {10,75},7},
	{"black",      "Black",      "#000000c0",   "default:coal_lump",            {65,65},8},
	{"red",        "Red",        "#ff0000c0",   "rainbow:mushroom_red",         {35,60},9},
	{"green",      "Green",      "#5a8041c0",   "rainbow:junglegrass",          {95,50},10},
	{"blue",       "Blue",       "#0000ffc0",   "rainbow:geranium",             {49,49},11},
	{"pink",       "Pink",       "#ff9090c0",   "rainbow:rose",                 {20,50},12},
	{"brown",      "Brown",      "#a78c45c0",   "rainbow:mushroom_brown",       {65,35},13},
	{"lightgreen", "Light Green","#b5ff81c0",   "rainbow:greenery",             {35,35},14},
	{"violet",     "Violet",     "#900090c0",   "rainbow:violet",               {75,20},15},
	{"grey",       "Grey",       "#909090c0",   "rainbow:",                     {50,50},16},
	{"orange",     "Orange",     "#ff8401c0",   "rainbow:orangeflower",         {20,25},17},
	{"darkgrey",   "Dark Grey",  "#303030c0",   "rainbow:cookieflower",         {90,30},18},
	{"darkbrown",  "Dark Brown", "#5C4033c0",   "",                             {68,38},19},
	{"darkred",    "Dark Red",   "#800000c0",   "",                             {68,38},19},
	{"gold",       "Gold",       "#ffd700c0",   "",                             {68,38},19},
	{"lightblue",  "Light Blue", "#0091ffc0",   "caverealms:glow_gem",          {68,38},19},
	{"darkyellow",  "Dark Yellow", "#ffc30ec0",   "",                           {68,38},19},
	{"darkorange",  "Dark Orange", "#ff5d00c0",   "",                           {68,38},19},
	{"sand",        "Sand",       "#c2c260c0",   "",                           {68,38},19},
    }

local add_node = function(a,b,c,d,e)
    local nodename = "cglass:"..c[1]

    if string.find(a,":") then
        nodename = a.."_" .. c[1]
    end
    local node = e
    local tiles={}
    if e.ctiles then
        tiles = e.ctiles
    else
        local k = ""
        local v = ""
        for k,v in pairs(e.tiles) do
            table.insert(tiles, v .. "^[colorize:" .. c[3] )
        end
    end

    if e.wield_image then node.wield_image=e.wield_image.."^[colorize:"..c[3] end
    if e.inventory_image then node.inventory_image=e.inventory_image.."^[colorize:"..c[3] end
    node.groups[a] = 1
    node.description = c[2].." "..b
    node.tiles = tiles
	node.on_place = minetest.rotate_node,
    minetest.register_node( nodename, node)
    minetest.register_craft({
        type = "shapeless",
        output = nodename,
        recipe = { "group:"..a, "rainbow:dye_"..c[1] }
    })
end

for _, row in ipairs(colours) do
    add_node("glass", "Glass", row, "saw",{
        drawtype = "glasslike_framed_optional",
        tiles = {"default_glass.png"},
        paramtype = "light",
        sunlight_propagates = true,
        is_ground_content = false,
        groups = {glass=1,cracky = 3, oddly_breakable_by_hand = 3},
        sounds = default.node_sound_glass_defaults(),
    })
end

minetest.register_alias("cglass:dark_grey","cglass:darkgrey")
