--
_RDS.Config = _RDS.Config or {}

// ONLY RANKS WITH FULL ACCES!!
_RDS.Config.AdminValue = {
    ["superadmin"] = true,
    ["admin"] = true,
    ["user"] = false
}

_RDS.Config.ExtraUserOptions = {
    ["superadmin"] = true,
    ["user"] = false
}

_RDS.Config.Debug = true --THIS IS A DEVELOPER MODE!!!! NOT USE THIS WHEN THE SERVER NOT IN WORK IS!!! 

// Weapon chest
_RDS.Config.WeaponchestModel = "models/reizer_props/srsp/sci_fi/armory_01/armory_01.mdl"
_RDS.Config.WeaponchestText = "Waffenkiste"

 
// Quest system
_RDS.Config.QuestmanModel = "models/reizer_props/srsp/sci_fi/console_02_3/console_02_3.mdl"
_RDS.Config.QuestmanText = "Abfrage"
_RDS.Config.QuestmanVertical = 10

_RDS.Config.Faction = _RDS.Config.Faction or {}

/* A Config to Change the Charactersystem Quickly and Savetly! */


_RDS.Config.EscapeButtons = {

    ["Spielen"] = {
        func = function()
            _RDS.Escape.Frame:Remove()
        end,
        order = 1,
    },

    ["Forum"] = {
        func = function()
        end,
        order = 2,
    },

    ["Einstellungen"] = {
        func = function() _RDS.PlayerSettings:Init() end,
        order = 3,
    },
 
    ["Verlassen"] = {
        func = function()
           LocalPlayer():ConCommand("disconnect")
        end,
        order = 100,
    },

}

// Weapons for weaponchest

_RDS.Advtraining.Trainings = { 
    ["rw_sw_z6"] = { 
        restrictions = { 
            [TEAM_Jane] = false,
        },
        whitelist = {}, 
 
        categorys = { 
            weaponname = "Z-6",
            category = "Primary"
        },
        picture = "jUlFuRg",
    },
    ["rw_sw_dc15s"] = {
        restrictions = { 
            [TEAM_Jane] = true, 
        },
        whitelist = {},
        categorys = {
            weaponname = "DC-15S",
            category = "Secondary"
        },
        picture = "Z0rEmGO",
    },
    ["rw_sw_dc15a"] = {
        restrictions = { 
            [TEAM_Jane] = true,
        },
        whitelist = {},

        categorys = {
            weaponname = "DC-15A",
            category = "Primary"
        }, 
        picture = "g1C6TkR",
    },

    ["rw_sw_dc17ext"] = { 
        restrictions = { 
            [TEAM_Jane] = false,
        },  
        whitelist = {},

        categorys = {
            weaponname = "DC-17",
            category = "Secondary"
        }, 
        picture = "62rsK1y",
    },
}  