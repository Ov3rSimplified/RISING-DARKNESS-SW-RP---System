// RISING DARKNESS!
// Copyright (c) 2022 RISING DARKNESS
//--------------------------------------------\\
// Code written for RDS:RP[RISING DARKNESS], 
// they only have the permission to use,
// edit or own the codeline/gamemode. 
//
// Code Written by:
//     - Ov3rSimplified
//     - Rooki
//     -  
//     -
//     -
//** [[   Interface | sh_index.lua   ]]** \\
_RDS.Interface = _RDS.Interface or {}
_RDS.Interface.UI = _RDS.Interface.UI or {}
_RDS.Interface.Shared = _RDS.Interface.Shared or {}

if SERVER then 

    util.AddNetworkString("RDSRP.InterFace.Menu")

    net.Receive("RDSRP.InterFace.Menu", function(len,ply)
        tbl = {
            ID = ply:GetCharacterID()
        }
        net.Start("RDSRP.InterFace.Menu")
        _RDS.WriteCTable(tbl)
        net.Broadcast()
    end)
end
