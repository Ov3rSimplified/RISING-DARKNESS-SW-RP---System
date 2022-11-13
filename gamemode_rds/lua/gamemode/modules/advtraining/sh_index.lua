_RDS.Advtraining = _RDS.Advtraining or {}
_RDS.Advtraining.Weaponchest = _RDS.Advtraining.Weaponchest or {}
_RDS.Advtraining.Whitelist = {}

local Load = {
    "gamemode/core/advtraining/cl_init.lua",
    "gamemode/core/advtraining/sv_init.lua",
    "gamemode/core/advtraining/weaponchest/cl_menu.lua",
    "gamemode/core/advtraining/weaponchest/sv_networking.lua",
}
for k,v in ipairs(Load) do   
    _RDS:LoadFile(v) 
end

/* 

<--- {[ Faction Table ]} ---> 

k = DarkRP Kategorie
MainLeader = Maybe Player oder TEAM_
[Faction].SubLeader = Player oder TEAM_
  
_RDS.Advtraining.Factions = { 
    ["21st Nova Corps"] = {
        Leader = {
            [TEAM_Jane] = true,
        },
        SubFactions = {
            ["Special Operative Marine"] = {
                SubLeader = nil,
              --  trainings = {
               --     ["Grappling Hook"] = {
               --         weapons = {
               --             ["rw_sw_dc15a"] = true,
               --         },
               --         vehicles = {},
               --     },
               --     ["Jetpack"] = nil,
               -- },
                ranks = {
                    ["Kadett"] = nil,
                    ["Private"] = nil,
                    ["Private First Class"] = nil,
                    ["Specialist"] = nil,
                    ["Lance Corporal"] = nil,
                    ["Corporal"] = nil,
                    ["Sergeant"] = nil,
                    ["Staff Sergeant"] = nil,
                    ["Senior Sergeant"] = nil,
                    ["Sergeant Major"] = nil,
                    ["Second Lieutnenant"] = nil,
                    ["First Lieutnenant"] = nil,
                    ["Captain"] = nil,
                    ["Major"] = nil,
                },
                tempply, 
            },
            ["Marshall Marine Platoon"] = {
                SubLeader = nil,
              --  trainings = {
               --     ["Grappling Hook"] = {
               --         weapons = {
               --             ["rw_sw_dc15a"] = true,
               --         },
               --         vehicles = {},
               --     },
               --     ["Jetpack"] = nil,
               -- },
               ranks = {
                ["Kadett"] = nil,
                ["Private"] = nil,
                ["Private First Class"] = nil,
                ["Specialist"] = nil,
                ["Lance Corporal"] = nil,
                ["Corporal"] = nil,
                ["Sergeant"] = nil,
                ["Staff Sergeant"] = nil,
                ["Senior Sergeant"] = nil,
                ["Sergeant Major"] = nil,
                ["Second Lieutnenant"] = nil,
                ["First Lieutnenant"] = nil,
                ["Captain"] = nil,
                ["Major"] = nil,
            },
               tempply, 
            },
            ["Technical Engineering Platoon"] = {
                SubLeader = nil,
              --  trainings = {
               --     ["Grappling Hook"] = {
               --         weapons = {
               --             ["rw_sw_dc15a"] = true,
               --         },
               --         vehicles = {},
               --     },
               --     ["Jetpack"] = nil,
               -- },
               ranks = {
                ["Kadett"] = nil,
                ["Private"] = nil,
                ["Private First Class"] = nil,
                ["Specialist"] = nil,
                ["Lance Corporal"] = nil,
                ["Corporal"] = nil,
                ["Sergeant"] = nil,
                ["Staff Sergeant"] = nil,
                ["Senior Sergeant"] = nil,
                ["Sergeant Major"] = nil,
                ["Second Lieutnenant"] = nil,
                ["First Lieutnenant"] = nil,
                ["Captain"] = nil,
                ["Major"] = nil,
            },
               tempply,
            },
        }
    },
    ["501st Elite Legion"] = {
        Leader = {
            [TEAM_MOB] = true,
        },
        SubFactions = {
            ["Komisch1"] = {
                SubLeader = nil,
              --  trainings = {
               --     ["Grappling Hook"] = {
               --         weapons = {
               --             ["rw_sw_dc15a"] = true,
               --         },
               --         vehicles = {},
               --     },
               --     ["Jetpack"] = nil,
               -- },
              --  ranks = {
                 --   ["Kadett"] = nil,
                  --  ["Private"] = nil,
                  --  ["Private First Class"] = nil,
                 --   ["Specialist"] = nil,
                  --  ["Lance Corporal"] = nil,
                  --  ["Corporal"] = nil,
                  --  ["Sergeant"] = nil,
                  --  ["Staff Sergeant"] = nil,
                  --  ["Senior Sergeant"] = nil,
                  --  ["Sergeant Major"] = nil,
                   -- ["Second Lieutnenant"] = nil,
                  --  ["First Lieutnenant"] = nil,
                  --  ["Captain"] = nil,
                --    ["Major"] = nil,
               -- },
                tempply, 
            },
            ["Komisch2"] = {
                SubLeader = nil,
              --  trainings = {
               --     ["Grappling Hook"] = {
               --         weapons = {
               --             ["rw_sw_dc15a"] = true,
               --         },
               --         vehicles = {},
               --     },
               --     ["Jetpack"] = nil,
               -- },
              --  ranks = {
                 --   ["Kadett"] = nil,
                  --  ["Private"] = nil,
                  --  ["Private First Class"] = nil,
                 --   ["Specialist"] = nil,
                  --  ["Lance Corporal"] = nil,
                  --  ["Corporal"] = nil,
                  --  ["Sergeant"] = nil,
                  --  ["Staff Sergeant"] = nil,
                  --  ["Senior Sergeant"] = nil,
                  --  ["Sergeant Major"] = nil,
                   -- ["Second Lieutnenant"] = nil,
                  --  ["First Lieutnenant"] = nil,
                  --  ["Captain"] = nil,
                --    ["Major"] = nil,
               -- },
               tempply, 
            },
            ["Komisch3"] = {
                SubLeader = nil,
              --  trainings = {
               --     ["Grappling Hook"] = {
               --         weapons = {
               --             ["rw_sw_dc15a"] = true,
               --         },
               --         vehicles = {},
               --     },
               --     ["Jetpack"] = nil,
               -- },
              --  ranks = {
                 --   ["Kadett"] = nil,
                  --  ["Private"] = nil,
                  --  ["Private First Class"] = nil,
                 --   ["Specialist"] = nil,
                  --  ["Lance Corporal"] = nil,
                  --  ["Corporal"] = nil,
                  --  ["Sergeant"] = nil,
                  --  ["Staff Sergeant"] = nil,
                  --  ["Senior Sergeant"] = nil,
                  --  ["Sergeant Major"] = nil,
                   -- ["Second Lieutnenant"] = nil,
                  --  ["First Lieutnenant"] = nil,
                  --  ["Captain"] = nil,
                --    ["Major"] = nil,
               -- },
               tempply,
            },
        }
    }
}
*/
// restricted Jobs, when a player whitelisted and they has a Wrong Job, then the player cant use this
    // player who whitelisted to this extended