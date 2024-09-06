local enums = {
    
    portal_names = {
        horde_portal = "Portal_Dungeon_Generic"
    },
    misc = {
        blacksmith = "TWN_Scos_Cerrigar_Crafter_Blacksmith",
        jeweler = "TWN_Scos_Cerrigar_Vendor_Weapons",
        portal = "TownPortal"
    },
    positions = {
        blacksmith_position = vec3:new(-1685.5394287109, -596.86566162109, 37.6484375),
        jeweler_position = vec3:new(-1658.699219, -620.020508, 37.888672), 
        portal_position = vec3:new(-1656.7141113281, -598.21716308594, 36.28515625) 
        
        
    },
    chest_types = {
        [0] = "BSK_UniqueOpChest_Gear",
        [1] = "BSK_UniqueOpChest_Materials",
        [2] = "BSK_UniqueOpChest_Gold",
        [3] = "BSK_UniqueOpChest_GreaterAffix"
    },
    chest_types = {
        GEAR = "BSK_UniqueOpChest_Gear",
        MATERIALS = "BSK_UniqueOpChest_Materials",
        GOLD = "BSK_UniqueOpChest_Gold",
        GREATER_AFFIX = "BSK_UniqueOpChest_GreaterAffix"
    },
    waypoints = {
        CERRIGAR = 0x76D58,
    },
}

return enums