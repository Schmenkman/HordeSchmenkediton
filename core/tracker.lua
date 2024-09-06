local tracker = {
    start_dungeon_time = nil,
    horde_opened = false,
    ga_chest_opened = false,
    selected_chest_opened = false,
    gold_chest_opened = false,
    finished_chest_looting = false,
    exit_horde_start_time = 0,
    needs_salvage = false,
    has_salvaged = false,
}

function tracker.check_time(key, delay)
    local current_time = get_time_since_inject()
    if not tracker[key] or current_time - tracker[key] >= delay then
        tracker[key] = current_time
        return true
    end
    return false
end
return tracker