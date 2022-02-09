_RDS.Admin.IConfig = _RDS.Admin.IConfig or {}

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
            exec = [[_RDS.Interface.UI:Main()]]

        },
        ["Befehle"] = {
            txt = "",
            key = KEY_F2,
            restrict = {},
            func = "Function",
            exec = [[_RDS.Temporder.UI:UI()]]

        },
    }
}  