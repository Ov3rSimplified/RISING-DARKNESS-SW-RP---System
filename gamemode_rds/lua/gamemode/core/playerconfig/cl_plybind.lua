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
//** [[   PlayerConfig | cl_plybind.lua   ]] **\\ 
local CORE = _RDS.PlayerConfig.plybind

function CORE:Load(tbl)
    if istable(tbl) then 
        if file.IsDir("rdsrp/plyconfig", "DATA") then 
            file.Write("rdsrp/plyconfig/binddata.json", util.TableToJSON(tbl) )
        else
            file.CreateDir("rdsrp/plyconfig")
        end
        _RDS.PlayerConfig.plybind.binds = tbl
    else
        return 
        print("Error while loading the Playerdata! [Sended isnt a Table!]")
    end
end


function CORE:ReLoad()
    if file.IsDir("rdsrp/plyconfig", "DATA") then
        if file.Exists("rdsrp/plyconfig/binddata.json", "DATA") then 
                local tl = file.Read("rdsrp/plyconfig/binddata.json")
                _RDS.PlayerConfig.plybind.binds = util.JSONToTable(tl)
        else
                return
        end
    else 
        file.CreateDir("rdsrp/plyconfig")
    end
end


local delay = 0
local open = false 
hook.Add( "PlayerButtonDown", "RDSRP.plybind.KeyBindCheck", function(ply, btn)
    if table.IsEmpty(_RDS.PlayerConfig.plybind.binds) then 
        return
    else
        if delay < CurTime() then 
            for k,v in pairs(_RDS.PlayerConfig.plybind.binds) do    
                if btn == v.key then
                    if v.cmd then 
                        LocalPlayer():ConCommand(v.cmd)
                    end
                end
            end
            delay = CurTime() + 0.2
        end
    end
end)
