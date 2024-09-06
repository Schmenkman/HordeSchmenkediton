local gui = {}
local plugin_label = "Infernal Horde - Schmenkedition"

local function create_checkbox(key)
    return checkbox:new(false, get_hash(plugin_label .. "_" .. key))
end

-- Add chest types enum
gui.chest_types_enum = {
    GEAR = 0,
    MATERIALS = 1,
    GOLD = 2,
}

gui.chest_types_options = {
    "Gear",
    "Materials",
    "Gold",
}

gui.elements = {
    main_tree = tree_node:new(0),
    main_toggle = create_checkbox("main_toggle"),
    settings_tree = tree_node:new(1),
    melee_logic = create_checkbox("melee_logic"),
    salvage_toggle = create_checkbox("salvage_toggle"),
    path_angle_slider = slider_int:new(0, 360, 90, get_hash("path_angle_slider")), -- 90 is a default value
    chest_type_selector = combo_box:new(0, get_hash("chest_type_selector")),
    always_open_ga_chest = create_checkbox("always_open_ga_chest"),
}

function gui.render()
    if not gui.elements.main_tree:push("Infernal Horde - Schmenkedtion") then return end

    gui.elements.main_toggle:render("Enable", "Enable the bot")
    
    if gui.elements.settings_tree:push("Settings") then
        gui.elements.melee_logic:render("Melee", "Do we need to move into Melee?")  
        gui.elements.salvage_toggle:render("Salvage", "Enable salvaging items")
        gui.elements.path_angle_slider:render("Path Angle", "Adjust the angle for path filtering (0-360 degrees)")
        
        -- Updated chest type selector to use the new enum structure
        gui.elements.chest_type_selector:render("Chest Type", gui.chest_types_options, "Select the type of chest to open")
        gui.elements.always_open_ga_chest:render("Always Open GA Chest", "Toggle to always open Greater Affix chest when available")
        
        gui.elements.settings_tree:pop()
    end

    gui.elements.main_tree:pop()
end

return gui