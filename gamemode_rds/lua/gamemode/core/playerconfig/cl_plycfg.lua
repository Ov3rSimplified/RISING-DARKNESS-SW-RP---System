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
//** [[   PlayerConfig | cl_plycfg.lua   ]] **\\
_RDS.PlayerConfig.Core = {}
local CORE = _RDS.PlayerConfig.Core

function CORE:Load(tbl)
    if istable(tbl) then 
        if file.IsDir("rdsrp/plyconfig", "DATA") then 
            file.Write("rdsrp/plyconfig/configdata.json", util.TableToJSON(tbl) )
        else
            file.CreateDir("rdsrp/plyconfig")
        end
        _RDS.PlayerConfig.config = tbl
    else
        return 
        print("Error while loading the Playerconfig! [Sended isnt a Table!]")
    end
end


function CORE:ReLoad()
    if file.IsDir("rdsrp/plyconfig", "DATA") then
        if file.Exists("rdsrp/plyconfig/configdata.json", "DATA") then 
                local tl = file.Read("rdsrp/plyconfig/configdata.json")
                _RDS.PlayerConfig.config = util.JSONToTable(tl)
        else
                return
        end
    else
        file.CreateDir("rdsrp/plyconfig")
    end
end