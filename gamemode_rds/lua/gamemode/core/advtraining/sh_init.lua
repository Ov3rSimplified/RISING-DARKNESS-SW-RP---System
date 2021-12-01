--
_RDS.Advtraining = _RDS.Advtraining or {}



/*
<--- {[ Faction Table ]} --->

k = DarkRP Kategorie
MainLeader = Maybe Player oder TEAM_
[Faction].SubLeader = Player oder TEAM_
 

*/ 
_RDS.Advtraining.Factions = {
    ["21st Nova Corps"] = {
        MainLeader = TEAM_Jane,
        SubFactions = {
            ["Special Operative Marine"] = {
                SubLeader = TEAM_,
                trainings = {
                    ["Grappling Hook"] = true,
                    ["Jetpack"] = true,
                }
                
            }
        }
    }
}





_RDS.Advtraining.Trainings = {
    ["rw_sw_z6"] = {
        restrictions = { 
            [TEAM_Jane] = true,
        },
        whitelist = {
            ["STEAM_0:1:186404828"] = true,
        },
        categorys = {
            weaponname = "Z-6",
            category = "Primary"
        },
        picture = "jUlFuRg",
        informations = {}
    },


    ["rw_sw_dc15s"] = {
        restrictions = { 
            [TEAM_Jane] = true,
        },
        whitelist = {
            ["STEAM_0:1:186404828"] = true,
        },
        categorys = {
            weaponname = "DC-15S",
            category = "Secondary"
        },
        picture = "Z0rEmGO",
        informations = {}
    },
    ["rw_sw_dc15a"] = {
        restrictions = { 
            [TEAM_Jane] = true,
        },
        whitelist = {
            ["STEAM_0:1:186404828"] = true,
        },
        categorys = {
            weaponname = "DC-15A",
            category = "Primary"
        },
        picture = "g1C6TkR",
        informations = {}
    },

    ["rw_sw_dc17ext"] = {
        restrictions = { 
            [TEAM_Jane] = true,
        },
        whitelist = {
            ["STEAM_0:1:186404828"] = true,
        },
        categorys = {
            weaponname = "DC-17",
            category = "Secondary"
        },
        picture = "62rsK1y",
        informations = {}
    },
}  


// restricted Jobs, when a player whitelisted and they has a Wrong Job, then the player cant use this
    // player who whitelisted to this extended