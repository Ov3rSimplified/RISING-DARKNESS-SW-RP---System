_RDS.Admin.IConfig = _RDS.Admin.IConfig or {}
_RDS.Admin.ISVConfig = {}
_RDS.Admin.IConfig = {
    ["Rank"] = {
        ["superadmin"] = {
            noaccess = false,
            fullacces = true,
            QMenu = false,
            CMenu = false,
            Adminmenu = false, 
            DonatorOptions = false
        },   
        ["admin"] = {
            noaccess = false,
            fullacces = true,
            QMenu = false,
            CMenu = false,
            Adminmenu = false,
            DonatorOptions = false
        },   
        ["user"] = {
            noaccess = true,
            fullacces = false,
            QMenu = false,
            CMenu = false,
            Adminmenu = false,
            DonatorOptions = false
        }  
    },
    ["Qsys"] = {
        Questmodule = {},
        Core = {},
    }, 
    ["AdvTrain"] = {
    },
    ["Stamina"] = {
        Core = {
            MaxStandardStamina = 100,
            StaminaRegenMul = 1,
            StaminaDecayMul = 0.5,
        },
        Customthings = {},
    },
    ["Weaponsystem"] = {
        Core = {
            MaxPrimary = 1,
            MaxSecondary = 1,
            MaxSideArm = 1,
            MaxGadgets = 1,
        },
        Weapons = {
        }
    },
    ["Binds"] = {
        ["Thirdperson"] = {
            txt = "Change the Thirdperson",
            key = KEY_T,
            restrict = {},
            func = "Command",
            exec = "stp"
        },
        ["Adminsuite"] = {
            txt = "",
            key = KEY_F9,
            restrict = {},
            func = "Function",
            exec = [[ _RDS.Adminsuite.UI:Main()]]
        },
        ["Interface"] = { 
            txt = "",
            key = KEY_F11,
            restrict = {},
            func = "Function",
            exec = [[net.Start("RDSRP.InterFace.Menu") net.SendToServer()]]

        },
        ["Befehle"] = {
            txt = "",
            key = KEY_F2,
            restrict = {},
            func = "Function",
            exec = [[_RDS.Temporder.UI:UI()]] 

        },
    },
    ["Specialisation"] = { 
        Core = { 
            Specialisationpakets = {
                ["Heavy Infantry"] = {
                    restrictions = { 
                        [TEAM_Jane] = true, 
                    },
                    whitelist = {},  
                    Short = "HI", 
                    focus = {
                        ["Offensiv"] = {
                            ["tds_dlt19"] = true,

                        },
                        ["Defensiv"] = {
                            ["tds_t21b"] = true
                        }
                    }
                },
                ["Engineer"] = {
                    restrictions = { 
                        [TEAM_Jane] = true,
                    },
                    whitelist = {},  
                    Short = "EG",
                    focus = {
                        ["Flame Trooper"] = {
                            ["weapon_vfirethrower"] = true
                        },
                        ["Bombsquad"] = {
                            ["weapon_frag"] = true
                        }
                    }
                }
            },
            Equipmentpakets = {
                ["tds_dlt19"] = {  
                    categorys = { 
                        weaponname = "DLT-19",
                        category = "Weapon",
                        section = "Primary"
                    }, 
                    picture = "jUlFuRg", 
                    isTFA = true,
                    informations = nil
                },
                ["tds_t21b"] = {  
                    categorys = { 
                        weaponname = "T-21b",
                        category = "Weapon",
                        section = "Primary"
                    }, 
                    picture = "jUlFuRg", 
                    isTFA = true,
                    informations = nil
                },
                ["weapon_frag"] = {  
                    categorys = { 
                        weaponname = "Bomb",
                        category = "Gadget",
                        section = "Gadget"
                    }, 
                    picture = "jUlFuRg", 
                    isTFA = false,
                    informations = nil
                },
                ["weapon_vfirethrower"] = {  
                    categorys = { 
                        weaponname = "Flame Thrower",
                        category = "Weapon",
                        section = "Gadget"
                    }, 
                    picture = "jUlFuRg", 
                    isTFA = false,
                    informations = nil
                },
            }
        },
        Whitelistmanager = {},
        Equipmentsettings = {
            MaxPrimary = 1,
            MaxSecondary = 1,
            MaxSideArm = 1,
            MaxGadgets = 1,
        }
    }, 
    ["Factions"] = {
        Core = {
            ["RDSRP_FACTION_1"] = {
                Name = "TestFaction1",
                Short = "TF1",
                Color = Color(255,0,0),
                Icon = {
                    Kind = "Material", --(ImgurID, Material)
                    Path = "hlmv/background"
                },
                Coredata = {
                    Leader = TEAM_Jane,
                    Subunits = {
                        ["RDSRP_FACTION_1_SUBFACTION_1"] = {
                            Name = "TestSubFaction1",
                            Short = "TSU1",
                            Color = Color(182,81,78),
                            Icon = {
                                Kind = "Material", --(ImgurID, Material)
                                Path = "hlmv/background"
                            },
                            Leader = {
                                ["TEAM_Kaka"] = true,
                            },
                            Ranks = {
                                ["Private"] = {
                                    Short = "PVT",
                                    ExtraWeapons = {},
                                    Insignia = "", -- MATERIAL Or IMGURID
                                },
                                ["PrivateFirstClass"] = {
                                    Short = "PFC",
                                    ExtraWeapons = {},
                                    Insignia = "", -- MATERIAL Or IMGURID
                                }
                            },
                            Job = RDSRP_21stTEP,
                        },
                        ["RDSRP_FACTION_1_SUBFACTION_2"] = {
                            Name = "TestSubFaction2",
                            Short = "TSU2",
                            Color = Color(182,81,78),
                            Icon = {
                                Kind = "Material", --(ImgurID, Material)
                                Path = "hlmv/background"
                            },
                            Leader = {
                                ["TEAM_Kaka"] = true,
                            },
                            Ranks = {
                                ["Private"] = {
                                    Short = "PVT",
                                    ExtraWeapons = {},
                                    Insignia = "", -- MATERIAL Or IMGURID
                                },
                                ["PrivateFirstClass"] = {
                                    Short = "PFC",
                                    ExtraWeapons = {},
                                    Insignia = "", -- MATERIAL Or IMGURID
                                }
                            },
                            Job = RDSRP_21stTEP,
                        }
                    }
                } 
            }
        },
    }
}  