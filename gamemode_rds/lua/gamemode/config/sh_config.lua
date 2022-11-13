--

_RDS = _RDS or {}
_RDS.Config = _RDS.Config or {}

// ONLY RANKS WITH FULL ACCES!!
_RDS.Config.AdminValue = {

} 
--_RDS.Config.AdminValue["user"].QMenu
_RDS.Config.ExtraUserOptions = {
    ["superadmin"] = true,
    ["user"] = true
}

if GAMEMODE then 
timer.Simple(0.1,function()



    _RDS.Config.Debug = true --THIS IS A DEVELOPER MODE!!!! NOT USE THIS WHEN THE SERVER NOT IN WORK IS!!! 
    _RDS.Config.UseVoidChar = true
    
    // Weapon chest
    _RDS.Config.WeaponchestModel = "models/reizer_props/srsp/sci_fi/armory_01/armory_01.mdl"
    _RDS.Config.WeaponchestText = "Waffenkiste"
    _RDS.Config.WeaponchestBGOpen = {1,0}
    _RDS.Config.WeaponchestBGClose = {1,1}

    
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

        ["Gmod Optionen"] = {
            func = function() gui.ActivateGameUI() RunConsoleCommand( "gamemenucommand", "openoptionsdialog" ) end,
            order = 4,
        },

        ["Konsole"] = {
            func = function() RunConsoleCommand("showconsole") gui.ActivateGameUI() end,
            order = 5,
        },
    
        ["Verlassen"] = {
            func = function()
            LocalPlayer():ConCommand("disconnect")
            end,
            order = 100,
        },

    }

    // Weapons for weaponchest
    /* Example:

        [STRING Weaponclass] = { 
            restrictions = { 
            --   [VALUE Teamname] = Boolean,
            },
            categorys = { 
                weaponname = STRING Name,
                category = STRING Category [Primary, Secondary]
            },
            picture = STRING ImgurID,
        },

    */

    _RDS.Advtraining.Trainings = { 
        ["tds_dlt19"] = {  
            restrictions = { 
                [TEAM_Jane] = true,
            },
            categorys = { 
                weaponname = "DLT-19",
                category = "Primary"
            }, 
            picture = "jUlFuRg", 
            isTFA = true,
            informations = nil
        },
        ["rw_sw_dc15a"] = {  
            restrictions = { 
                [TEAM_Jane] = true,
            },
            categorys = { 
                weaponname = "DC-15A",
                category = "Primary"
            }, 
            picture = "jUlFuRg", 
            isTFA = true,
            informations = nil
        },
        ["tds_rw_dc15le"] = {  
            restrictions = { 
                [TEAM_Jane] = true,
            },
            categorys = { 
                weaponname = "DC-15LE",
                category = "Primary"
            }, 
            picture = "jUlFuRg", 
            isTFA = true,
            informations = nil
        },
        ["tds_rw_dc15x"] = {  
            restrictions = { 
                [TEAM_Jane] = true,
            },
            categorys = { 
                weaponname = "DC-15X",
                category = "Primary"
            }, 
            picture = "jUlFuRg", 
            isTFA = true,
            informations = nil
        },
        ["tds_rw_dc15s"] = {  
            restrictions = { 
                [TEAM_Jane] = true,
            },
            categorys = { 
                weaponname = "DC-15S",
                category = "Primary"
            }, 
            picture = "jUlFuRg", 
            isTFA = true,
            informations = nil
        },
        ["tds_rw_westarm4"] = {  
            restrictions = { 
                [TEAM_Jane] = true,
            },
            categorys = { 
                weaponname = "westar-M4",
                category = "Primary"
            }, 
            picture = "jUlFuRg", 
            isTFA = true,
            informations = nil
        },
        ["tds_rw_z6"] = {  
            restrictions = { 
                [TEAM_Jane] = true,
            },
            categorys = { 
                weaponname = "Z6",
                category = "Primary"
            }, 
            picture = "jUlFuRg", 
            isTFA = true,
            informations = nil
        },
--[[       
        ["tds_rw_dc17"] = {  
            restrictions = { 

                /* 21st */
                [TEAM_21stBacara] = true,
                [TEAM_21stKdt] = true,
                [TEAM_21stMMPPVT] = true,
                [TEAM_21stMMPPFC] = true,
                [TEAM_21stMMPSPC] = true,
                [TEAM_21stMMPLCPL] = true,
                [TEAM_21stMMPCPL] = true,
                [TEAM_21stMMPSGT] = true,
                [TEAM_21stMMPSSGT] = true,
                [TEAM_21stMMPSRSGT] = true,
                [TEAM_21stMMPSSGTMJR] = true,
                [TEAM_21stMMPSSLT] = true,
                [TEAM_21stMMPSFLT] = true,
                [TEAM_21stMMPSCPT] = true,
                [TEAM_21stTEPPVT] = true,
                [TEAM_21stTEPPFC] = true,
                [TEAM_21stTEPSPC] = true,
                [TEAM_21stTEPLCPL] = true,
                [TEAM_21stTEPCPL] = true,
                [TEAM_21stTEPSGT] = true,
                [TEAM_21stTEPSSGT] = true,
                [TEAM_21stTEPSRSGT] = true,
                [TEAM_21stTEPSGTMJR] = true,
                [TEAM_21stTEPSLT] = true,
                [TEAM_21stTEPFLT] = true,
                [TEAM_21stTEPCPT] = true, 

                [TEAM_21stAADPVT] = true,
                [TEAM_21stAADPFC] = true,
                [TEAM_21stAADSPC] = true,
                [TEAM_21stAADLCPL] = true,
                [TEAM_21stAADCPL] = true,
                [TEAM_21stAADSGT] = true,
                [TEAM_21stAADSSGT] = true,
                [TEAM_21stAADSRSGT] = true,
                [TEAM_21stAADSGTMJR] = true,
                [TEAM_21stAADSLT] = true,
                [TEAM_21stAADFLT] = true,
                [TEAM_21stAADCPT] = true,


                [TEAM_21stSOMPVT] = true,
                [TEAM_21stSOMPFC] = true,
                [TEAM_21stSOMSPC] = true,
                [TEAM_21stSOMLCPL] = true,
                [TEAM_21stSOMCPL] = true,
                [TEAM_21stSOMSGT] = true,
                [TEAM_21stSOMSSGT] = true,
                [TEAM_21stSOMSRSGT] = true,
                [TEAM_21stSOMSGTMJR] = true,
                [TEAM_21stSOMSLT] = true,
                [TEAM_21stSOMFLT] = true,
                [TEAM_21stSOMCPT] = true,
                [TEAM_21stSOMMJRK] = true,
            
            
            /* 501st */

            [TEAM_501stKDT] = true,
            [TEAM_501stCMD] = true,
            [TEAM_501stAIPPVT] = true,
            [TEAM_501stAIPPFC] = true,
            [TEAM_501stAIPSPC] = true,
            [TEAM_501stAIPLCPL] = true,
            [TEAM_501stAIPCPL] = true,
            [TEAM_501stAIPSGT] = true,
            [TEAM_501stAIPSSGT] = true,
            [TEAM_501stAIPSRSGT] = true,
            [TEAM_501stAIPSGTMJR] = true,
            [TEAM_501stAIPSLT] = true,
            [TEAM_501stAIPFLT] = true,
            [TEAM_501stAIPCPT] = true,
            [TEAM_501stAIPMJR] = true,

            [TEAM_501stARFPVT] = true,
            [TEAM_501stARFPFC] = true,
            [TEAM_501stARFSPC] = true,
            [TEAM_501stARFLCPL] = true,
            [TEAM_501stARFCPL] = true,
            [TEAM_501stARFSGT] = true,
            [TEAM_501stARFSSGT] = true,
            [TEAM_501stARFSRSGT] = true,
            [TEAM_501stARFSLT] = true,
            [TEAM_501stARFFLT] = true,
            [TEAM_501stARFCPT] = true,

            [TEAM_501stMSPPVT] = true,
            [TEAM_501stMSPPFC] = true,
            [TEAM_501stMSPSPC] = true,
            [TEAM_501stMSPLCPL] = true,
            [TEAM_501stMSPCPL] = true,
            [TEAM_501stMSPSGT] = true,
            [TEAM_501stMSPSSGT] = true,
            [TEAM_501stMSPSRSGT] = true,
            [TEAM_501stMSPSGTMJR] = true,
            [TEAM_501stMSPSLT] = true,
            [TEAM_501stMSPFLT] = true,
            [TEAM_501stMSPCPT] = true,

            [TEAM_501stFSQPVT] = true,
            [TEAM_501stFSQPFC] = true,
            [TEAM_501stFSQSPC] = true,
            [TEAM_501stFSQLCPL] = true,
            [TEAM_501stFSQCPL] = true,
            [TEAM_501stFSQSGT] = true,
            [TEAM_501stFSQSSGT] = true,
            [TEAM_501stFSQSRSGT] = true,
            [TEAM_501stFSQSGTMJR] = true,
            [TEAM_501stFSQSLT] = true,
            [TEAM_501stFSQFLT] = true,
            [TEAM_501stFSQCPT] = true,
            [TEAM_501stARCSGT] = true,
            [TEAM_501stARCSSGT] = true,
            [TEAM_501stARCSRSGT] = true,
            [TEAM_501stARCSGTMJR] = true,
            [TEAM_501stARCSLT] = true,
            [TEAM_501stARCFLT] = true,
            [TEAM_501stARCCPT] = true,

            },
            categorys = { 
                weaponname = "DC-17",
                category = "Secondary"  
            },
            picture = "jUlFuRg",
            isTFA = true,
            informations = nil

        },
        ["tds_rw_dc15s"] = {  
            restrictions = { 
                [TEAM_21stBacara] = true,
                [TEAM_21stKdt] = true,
                [TEAM_21stMMPPVT] = true,
                [TEAM_21stMMPPFC] = true,
                [TEAM_21stMMPSPC] = true,
                [TEAM_21stMMPLCPL] = true,
                [TEAM_21stMMPCPL] = true,
                [TEAM_21stMMPSGT] = true,
                [TEAM_21stMMPSSGT] = true,
                [TEAM_21stMMPSRSGT] = true,
                [TEAM_21stMMPSSGTMJR] = true,
                [TEAM_21stMMPSSLT] = true,
                [TEAM_21stMMPSFLT] = true,
                [TEAM_21stMMPSCPT] = true,
                [TEAM_21stTEPPVT] = true,
                [TEAM_21stTEPPFC] = true,
                [TEAM_21stTEPSPC] = true,
                [TEAM_21stTEPLCPL] = true,
                [TEAM_21stTEPCPL] = true,
                [TEAM_21stTEPSGT] = true,
                [TEAM_21stTEPSSGT] = true,
                [TEAM_21stTEPSRSGT] = true,
                [TEAM_21stTEPSGTMJR] = true,
                [TEAM_21stTEPSLT] = true,
                [TEAM_21stTEPFLT] = true,
                [TEAM_21stTEPCPT] = true, 
                [TEAM_21stAADPVT] = true,
                [TEAM_21stAADPFC] = true,
                [TEAM_21stAADSPC] = true,
                [TEAM_21stAADLCPL] = true,
                [TEAM_21stAADCPL] = true,
                [TEAM_21stAADSGT] = true,
                [TEAM_21stAADSSGT] = true,
                [TEAM_21stAADSRSGT] = true,
                [TEAM_21stAADSGTMJR] = true,
                [TEAM_21stAADSLT] = true,
                [TEAM_21stAADFLT] = true,
                [TEAM_21stAADCPT] = true,
                [TEAM_21stSOMPVT] = true,
                [TEAM_21stSOMPFC] = true,
                [TEAM_21stSOMSPC] = true,
                [TEAM_21stSOMLCPL] = true,
                [TEAM_21stSOMCPL] = true,
                [TEAM_21stSOMSGT] = true,
                [TEAM_21stSOMSSGT] = true,
                [TEAM_21stSOMSRSGT] = true,
                [TEAM_21stSOMSGTMJR] = true,
                [TEAM_21stSOMSLT] = true,
                [TEAM_21stSOMFLT] = true,
                [TEAM_21stSOMCPT] = true,
                [TEAM_21stSOMMJRK] = true,

                /* 501st */

                [TEAM_501stKDT] = true,
                [TEAM_501stCMD] = true,
                [TEAM_501stAIPPVT] = true,
                [TEAM_501stAIPPFC] = true,
                [TEAM_501stAIPSPC] = true,
                [TEAM_501stAIPLCPL] = true,
                [TEAM_501stAIPCPL] = true,
                [TEAM_501stAIPSGT] = true,
                [TEAM_501stAIPSSGT] = true,
                [TEAM_501stAIPSRSGT] = true,
                [TEAM_501stAIPSGTMJR] = true,
                [TEAM_501stAIPSLT] = true,
                [TEAM_501stAIPFLT] = true,
                [TEAM_501stAIPCPT] = true,
                [TEAM_501stAIPMJR] = true,
    
                [TEAM_501stARFPVT] = true,
                [TEAM_501stARFPFC] = true,
                [TEAM_501stARFSPC] = true,
                [TEAM_501stARFLCPL] = true,
                [TEAM_501stARFCPL] = true,
                [TEAM_501stARFSGT] = true,
                [TEAM_501stARFSSGT] = true,
                [TEAM_501stARFSRSGT] = true,
                [TEAM_501stARFSLT] = true,
                [TEAM_501stARFFLT] = true,
                [TEAM_501stARFCPT] = true,
    
                [TEAM_501stMSPPVT] = true,
                [TEAM_501stMSPPFC] = true,
                [TEAM_501stMSPSPC] = true,
                [TEAM_501stMSPLCPL] = true,
                [TEAM_501stMSPCPL] = true,
                [TEAM_501stMSPSGT] = true,
                [TEAM_501stMSPSSGT] = true,
                [TEAM_501stMSPSRSGT] = true,
                [TEAM_501stMSPSGTMJR] = true,
                [TEAM_501stMSPSLT] = true,
                [TEAM_501stMSPFLT] = true,
                [TEAM_501stMSPCPT] = true,
    
                [TEAM_501stFSQPVT] = true,
                [TEAM_501stFSQPFC] = true,
                [TEAM_501stFSQSPC] = true,
                [TEAM_501stFSQLCPL] = true,
                [TEAM_501stFSQCPL] = true,
                [TEAM_501stFSQSGT] = true,
                [TEAM_501stFSQSSGT] = true,
                [TEAM_501stFSQSRSGT] = true,
                [TEAM_501stFSQSGTMJR] = true,
                [TEAM_501stFSQSLT] = true,
                [TEAM_501stFSQFLT] = true,
                [TEAM_501stFSQCPT] = true,
                [TEAM_501stARCSGT] = true,
                [TEAM_501stARCSSGT] = true,
                [TEAM_501stARCSRSGT] = true,
                [TEAM_501stARCSGTMJR] = true,
                [TEAM_501stARCSLT] = true,
                [TEAM_501stARCFLT] = true,
                [TEAM_501stARCCPT] = true,
            },
            categorys = { 
                weaponname = "DC-15S",
                category = "Secondary"
            }, 
            picture = "jUlFuRg",    
            isTFA = true,
            informations = nil
        },
        ["tds_rw_dc15a"] = {  
            restrictions = { 
                [TEAM_21stBacara] = true,
                [TEAM_21stKdt] = true,
                [TEAM_21stMMPPVT] = true,
                [TEAM_21stMMPPFC] = true,
                [TEAM_21stMMPSPC] = true,
                [TEAM_21stMMPLCPL] = true,
                [TEAM_21stMMPCPL] = true,
                [TEAM_21stMMPSGT] = true,
                [TEAM_21stMMPSSGT] = true,
                [TEAM_21stMMPSRSGT] = true,
                [TEAM_21stMMPSSGTMJR] = true,
                [TEAM_21stMMPSSLT] = true,
                [TEAM_21stMMPSFLT] = true,
                [TEAM_21stMMPSCPT] = true,
                [TEAM_21stTEPPVT] = true,
                [TEAM_21stTEPPFC] = true,
                [TEAM_21stTEPSPC] = true,
                [TEAM_21stTEPLCPL] = true,
                [TEAM_21stTEPCPL] = true,
                [TEAM_21stTEPSGT] = true,
                [TEAM_21stTEPSSGT] = true,
                [TEAM_21stTEPSRSGT] = true,
                [TEAM_21stTEPSGTMJR] = true,
                [TEAM_21stTEPSLT] = true,
                [TEAM_21stTEPFLT] = true,
                [TEAM_21stTEPCPT] = true, 
                [TEAM_21stAADPVT] = true,
                [TEAM_21stAADPFC] = true,
                [TEAM_21stAADSPC] = true,
                [TEAM_21stAADLCPL] = true,
                [TEAM_21stAADCPL] = true,
                [TEAM_21stAADSGT] = true,
                [TEAM_21stAADSSGT] = true,
                [TEAM_21stAADSRSGT] = true,
                [TEAM_21stAADSGTMJR] = true,
                [TEAM_21stAADSLT] = true,
                [TEAM_21stAADFLT] = true,
                [TEAM_21stAADCPT] = true,
                [TEAM_21stSOMPVT] = true,
                [TEAM_21stSOMPFC] = true,
                [TEAM_21stSOMSPC] = true,
                [TEAM_21stSOMLCPL] = true,
                [TEAM_21stSOMCPL] = true,
                [TEAM_21stSOMSGT] = true,
                [TEAM_21stSOMSSGT] = true,
                [TEAM_21stSOMSRSGT] = true,
                [TEAM_21stSOMSGTMJR] = true,
                [TEAM_21stSOMSLT] = true,
                [TEAM_21stSOMFLT] = true,
                [TEAM_21stSOMCPT] = true,
                [TEAM_21stSOMMJRK] = true,



                /* 501st */

                [TEAM_501stKDT] = true,
                [TEAM_501stCMD] = true,
                [TEAM_501stAIPPVT] = true,
                [TEAM_501stAIPPFC] = true,
                [TEAM_501stAIPSPC] = true,
                [TEAM_501stAIPLCPL] = true,
                [TEAM_501stAIPCPL] = true,
                [TEAM_501stAIPSGT] = true,
                [TEAM_501stAIPSSGT] = true,
                [TEAM_501stAIPSRSGT] = true,
                [TEAM_501stAIPSGTMJR] = true,
                [TEAM_501stAIPSLT] = true,
                [TEAM_501stAIPFLT] = true,
                [TEAM_501stAIPCPT] = true,
                [TEAM_501stAIPMJR] = true,
    
                [TEAM_501stARFPVT] = true,
                [TEAM_501stARFPFC] = true,
                [TEAM_501stARFSPC] = true,
                [TEAM_501stARFLCPL] = true,
                [TEAM_501stARFCPL] = true,
                [TEAM_501stARFSGT] = true,
                [TEAM_501stARFSSGT] = true,
                [TEAM_501stARFSRSGT] = true,
                [TEAM_501stARFSLT] = true,
                [TEAM_501stARFFLT] = true,
                [TEAM_501stARFCPT] = true,
    
                [TEAM_501stMSPPVT] = true,
                [TEAM_501stMSPPFC] = true,
                [TEAM_501stMSPSPC] = true,
                [TEAM_501stMSPLCPL] = true,
                [TEAM_501stMSPCPL] = true,
                [TEAM_501stMSPSGT] = true,
                [TEAM_501stMSPSSGT] = true,
                [TEAM_501stMSPSRSGT] = true,
                [TEAM_501stMSPSGTMJR] = true,
                [TEAM_501stMSPSLT] = true,
                [TEAM_501stMSPFLT] = true,
                [TEAM_501stMSPCPT] = true,
    
                [TEAM_501stFSQPVT] = true,
                [TEAM_501stFSQPFC] = true,
                [TEAM_501stFSQSPC] = true,
                [TEAM_501stFSQLCPL] = true,
                [TEAM_501stFSQCPL] = true,
                [TEAM_501stFSQSGT] = true,
                [TEAM_501stFSQSSGT] = true,
                [TEAM_501stFSQSRSGT] = true,
                [TEAM_501stFSQSGTMJR] = true,
                [TEAM_501stFSQSLT] = true,
                [TEAM_501stFSQFLT] = true,
                [TEAM_501stFSQCPT] = true,
                [TEAM_501stARCSGT] = true,
                [TEAM_501stARCSSGT] = true,
                [TEAM_501stARCSRSGT] = true,
                [TEAM_501stARCSGTMJR] = true,
                [TEAM_501stARCSLT] = true,
                [TEAM_501stARCFLT] = true,
                [TEAM_501stARCCPT] = true,
            },
            categorys = { 
                weaponname = "DC-15A",
                category = "Primary"
            },
            picture = "jUlFuRg",
            isTFA = true,
            informations = nil
        },

    /* 21st  MMP Waffen spezis */

        ["rds_dlt_23v"] = {  
            restrictions = { 
                [TEAM_21stBacara] = true,
                [TEAM_21stMMPPVT] = true,
                [TEAM_21stMMPPFC] = true,
                [TEAM_21stMMPSPC] = true,
                [TEAM_21stMMPLCPL] = true,
                [TEAM_21stMMPCPL] = true,
                [TEAM_21stMMPSGT] = true,
                [TEAM_21stMMPSSGT] = true,
                [TEAM_21stMMPSRSGT] = true,
                [TEAM_21stMMPSSGTMJR] = true,
                [TEAM_21stMMPSSLT] = true,
                [TEAM_21stMMPSFLT] = true,
                [TEAM_21stMMPSCPT] = true,
                
            },
            categorys = { 
                weaponname = "DLT-23v",
                category = "Primary"
            },
            picture = "jUlFuRg", 
            isTFA = true,
            informations = nil
        },

        ["tds_rw_z6"] = {  
            restrictions = { 
                [TEAM_21stBacara] = true,
                [TEAM_21stMMPPVT] = true,
                [TEAM_21stMMPPFC] = true,
                [TEAM_21stMMPSPC] = true,
                [TEAM_21stMMPLCPL] = true,
                [TEAM_21stMMPCPL] = true,
                [TEAM_21stMMPSGT] = true,
                [TEAM_21stMMPSSGT] = true,
                [TEAM_21stMMPSRSGT] = true,
                [TEAM_21stMMPSSGTMJR] = true,
                [TEAM_21stMMPSSLT] = true,
                [TEAM_21stMMPSFLT] = true,
                [TEAM_21stMMPSCPT] = true,
            },
            categorys = { 
                weaponname = "Z-6",
                category = "Primary"
            },
            picture = "jUlFuRg", 
            isTFA = true,
            informations = nil
        },

        ["tds_rw_dc15e"] = {  
            restrictions = { 
                [TEAM_21stBacara] = true,
                [TEAM_21stMMPPVT] = true,
                [TEAM_21stMMPPFC] = true,
                [TEAM_21stMMPSPC] = true,
                [TEAM_21stMMPLCPL] = true,
                [TEAM_21stMMPCPL] = true,
                [TEAM_21stMMPSGT] = true,
                [TEAM_21stMMPSSGT] = true,
                [TEAM_21stMMPSRSGT] = true,
                [TEAM_21stMMPSSGTMJR] = true,
                [TEAM_21stMMPSSLT] = true,
                [TEAM_21stMMPSFLT] = true,
                [TEAM_21stMMPSCPT] = true,
            },
            categorys = { 
                weaponname = "DC-15E",
                category = "Primary"
            },
            picture = "jUlFuRg", 
            isTFA = true,
            informations = nil
        },


    /* 21st  TEP Waffen spezis */

    ["weapon_vfirethrower"] = {  
        restrictions = { 
            [TEAM_21stBacara] = true,
            [TEAM_21stTEPPVT] = true,
            [TEAM_21stTEPPFC] = true,
            [TEAM_21stTEPSPC] = true,
            [TEAM_21stTEPLCPL] = true,
            [TEAM_21stTEPCPL] = true,
            [TEAM_21stTEPSGT] = true,
            [TEAM_21stTEPSSGT] = true,
            [TEAM_21stTEPSRSGT] = true,
            [TEAM_21stTEPSGTMJR] = true,
            [TEAM_21stTEPSLT] = true,
            [TEAM_21stTEPFLT] = true,
            [TEAM_21stTEPCPT] = true, 
        },
        categorys = { 
            weaponname = "Flammenwerfer",
            category = "Primary"
        },
        picture = "jUlFuRg", 
        isTFA = false,
        informations = {
            ["Art"] = "Flammenwerfer ya salame"
        }
    },

    ["seal6-c4"] = {  
        restrictions = { 
            [TEAM_21stBacara] = true,
            [TEAM_21stTEPPVT] = true,
            [TEAM_21stTEPPFC] = true,
            [TEAM_21stTEPSPC] = true,
            [TEAM_21stTEPLCPL] = true,
            [TEAM_21stTEPCPL] = true,
            [TEAM_21stTEPSGT] = true,
            [TEAM_21stTEPSSGT] = true,
            [TEAM_21stTEPSRSGT] = true,
            [TEAM_21stTEPSGTMJR] = true,
            [TEAM_21stTEPSLT] = true,
            [TEAM_21stTEPFLT] = true,
            [TEAM_21stTEPCPT] = true, 
        },
        categorys = { 
            weaponname = "Sprengsätze",
            category = "Utils"
        },
        picture = "jUlFuRg", 
        isTFA = false,
        informations = {
            ["Werfen"] = "Rechter Muskel",
            ["Zünden"] = "Linker Muskel"
        }
    },

    /* 501st aip */

        ["rw_sw_rps6"] = {  
            restrictions = { 
                [TEAM_501stCMD] = true,
                [TEAM_501stAIPPVT] = true,
                [TEAM_501stAIPPFC] = true,
                [TEAM_501stAIPSPC] = true,
                [TEAM_501stAIPLCPL] = true,
                [TEAM_501stAIPCPL] = true,
                [TEAM_501stAIPSGT] = true,
                [TEAM_501stAIPSSGT] = true,
                [TEAM_501stAIPSRSGT] = true,
                [TEAM_501stAIPSGTMJR] = true,
                [TEAM_501stAIPSLT] = true,
                [TEAM_501stAIPFLT] = true,
                [TEAM_501stAIPCPT] = true,
                [TEAM_501stAIPMJR] = true,
            },
            categorys = { 
                weaponname = "RPS-6",
                category = "Primary"
            }, 
            picture = "jUlFuRg", 
            isTFA = true,
            informations = nil
        },




    /* Executioner Platoon */

        ["tds_dlt19"] = {  
            restrictions = { 
                [TEAM_EPPVT] = true,
                [TEAM_EPPFC] = true,
                [TEAM_EPSPC] = true,
                [TEAM_EPLCPL] = true,
                [TEAM_EPCPL] = true,
                [TEAM_EPSGT] = true,
                [TEAM_EPSSGT] = true,
                [TEAM_EPSRSGT] = true,
                [TEAM_EPSGTMJR] = true,
                [TEAM_EPSLT] = true,
                [TEAM_EPFLT] = true,
                [TEAM_EPCPT] = true,
            },
            categorys = { 
                weaponname = "DLT-19",
                category = "Primary"
            }, 
            picture = "jUlFuRg", 
            isTFA = true,
            informations = nil
        },

        ["rw_sw_electrostaff"] = {  
            restrictions = { 
                [TEAM_EPPVT] = true,
                [TEAM_EPPFC] = true,
                [TEAM_EPSPC] = true,
                [TEAM_EPLCPL] = true,
                [TEAM_EPCPL] = true,
                [TEAM_EPSGT] = true,
                [TEAM_EPSSGT] = true,
                [TEAM_EPSRSGT] = true,
                [TEAM_EPSGTMJR] = true,
                [TEAM_EPSLT] = true,
                [TEAM_EPFLT] = true,
                [TEAM_EPCPT] = true,
            },
            categorys = { 
                weaponname = "Elektrostab",
                category = "Utils"
            }, 
            picture = "jUlFuRg", 
            isTFA = true,
            informations = nil
        },


        ["swat_shield"] = {  
            restrictions = { 
                [TEAM_EPPVT] = true,
                [TEAM_EPPFC] = true,
                [TEAM_EPSPC] = true,
                [TEAM_EPLCPL] = true,
                [TEAM_EPCPL] = true,
                [TEAM_EPSGT] = true,
                [TEAM_EPSSGT] = true,
                [TEAM_EPSRSGT] = true,
                [TEAM_EPSGTMJR] = true,
                [TEAM_EPSLT] = true,
                [TEAM_EPFLT] = true,
                [TEAM_EPCPT] = true,
            },
            categorys = { 
                weaponname = "Schild",
                category = "Utils"
            }, 
            picture = "jUlFuRg", 
            isTFA = false,
            informations = {
                ["Zweck"] = "Es Schützt."
            }
        },
]]
    } 


    --rw_sw_electrostaff
end)
end
 
  