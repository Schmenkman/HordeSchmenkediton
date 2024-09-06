local gui = require "gui"
local settings = {
    enabled = false,
    salvage = false,
    path_angle = 90,
    selected_chest_type = nil,
}

function settings:update_settings()
    settings.enabled = gui.elements.main_toggle:get()
    settings.salvage = gui.elements.salvage_toggle:get() -- Change this line
    settings.path_angle = gui.elements.path_angle_slider:get()
    settings.selected_chest_type = gui.elements.chest_type_selector:get()
    settings.always_open_ga_chest = gui.elements.always_open_ga_chest:get()
end

return settings