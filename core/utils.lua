local settings = require "core.settings"
local enums    = require "data.enums"
local utils    = {}

function utils.distance_to(target)
    local player_pos = get_player_position()
    local target_pos

    if target.get_position then
        target_pos = target:get_position()
    elseif target.x then
        target_pos = target
    end

    return player_pos:dist_to(target_pos)
end


function utils.player_in_zone(zname)
    return get_current_world():get_current_zone_name() == zname
end



function utils.get_horde_portal()
    local actors = actors_manager:get_all_actors()
    for _, actor in pairs(actors) do
        local name = actor:get_skin_name()
        local distance = utils.distance_to(actor)
        if distance < 100 then
            if name == enums.portal_names.horde_portal then
                return actor
            end
        end
    end
end

function utils.get_town_portal()
    local actors = actors_manager:get_all_actors()
    for _, actor in pairs(actors) do
        local name = actor:get_skin_name()
        if name == enums.misc.portal then
           return actor
        end
    end
end


function utils.get_blacksmith()
    local actors = actors_manager:get_all_actors()
    for _, actor in pairs(actors) do
        local name = actor:get_skin_name()
        if name == enums.misc.blacksmith then
            console.print("blacksmith location found: " .. name)
            return actor
        end
    end
    --console.print("No blacksmith found")
    return nil
end

function utils.get_jeweler()
    local actors = actors_manager:get_all_actors()
    for _, actor in pairs(actors) do
        local name = actor:get_skin_name()
        if name == enums.misc.jeweler then
            local position = actor:get_position()
            console.print(string.format("Jeweler location found: %s at position: (x: %f, y: %f, z: %f)", name, position:x(), position:y(), position:z()))
            return actor
        end
    end
    --console.print("No jeweler found")
    return nil
end


function utils.get_chest(chest_type)
    local actors = actors_manager:get_all_actors()
    for _, actor in pairs(actors) do
        local name = actor:get_skin_name()
        if name == chest_type then
            return actor
        end
    end
    return nil
end

function utils.get_stash()
    local actors = actors_manager:get_all_actors()
    for _, actor in pairs(actors) do
        local name = actor:get_skin_name()
        if name == "Stash" then
            return actor
        end
    end
    return nil
end

function utils.get_consumable_info(item)
    if not item then
        console.print("Error: Item is nil")
        return nil
    end
    local info = {}
    -- Helper function to safely get item properties
    local function safe_get(func, default)
        local success, result = pcall(func)
        return success and result or default
    end
    -- Get the item properties
    info.name = safe_get(function() return item:get_name() end, "Unknown")
    return info
end

function utils.get_aether_actor()
    local actors = actors_manager:get_all_actors()
    for _, actor in pairs(actors) do
        local name = actor:get_skin_name()
        if name == "BurningAether" or name == "S05_Reputation_Experience_PowerUp_Actor" then
            return actor
        end
    end
    return nil
end

return utils