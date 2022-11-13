--
_RDS.bindsys = _RDS.bindsys or {}
_RDS.bindsys.Binds = _RDS.bindsys.Binds or {}


function _RDS.bindsys.LoadCLBinds()
    for k,v in pairs(_RDS.Admin.IConfig["Binds"]) do 
        v.key = cookie.GetNumber("RDSRP.Bind."..v.name, v.key )
    end 
end

local delay = 0
local open = false
hook.Add( "PlayerButtonDown", "RDSRP.BindKeyCheck", function(ply, btn)
    if delay < CurTime() then 
        for k,v in pairs(_RDS.Admin.IConfig["Binds"]) do    
            if btn == v.key then
                if v.func == "URL" then 
                    gui.OpenURL( v.exec )
                elseif v.func == "Command" then 
                    LocalPlayer():ConCommand(tostring(v.exec))
                elseif v.func == "Runstring" then 
                    RunString( v.exec )
                elseif v.func == "Function" then 
                    local functi = CompileString(v.exec, k, false)
                    functi()
                   -- v.exec()
                end 
                
                --v.func()
            end
        end
        delay = CurTime() + 0.2
    end
end)

function _RDS:KeybindRegister(data)
    data.name = data.name or "NUll"
    data.txt = data.txt or "NULL"
    data.key = data.key or nil
    data.restrict = data.restrict or {}
    data.func = data.func or nil 

    _RDS.bindsys.Binds[data.name] = data
    hook.Run("_RDS:KeybindRegister")
end
hook.Add("_RDS:KeybindRegister", nil, nil)

/*


_RDS.bindsys.Binds = {
    ["Thirdperson"] = {
        txt = "Change the Thirdperson",
        key = KEY_T,
        restrict = {},
        func = function()
            LocalPlayer():ConCommand("stp")
        end
    },
    ["Adminsuite"] = {
        txt = "",
        key = KEY_F9,
        restrict = {},
        func = function()
            _RDS.Adminsuite.UI:Main()
        end
    },
    ["Interface"] = {
        txt = "",
        key = KEY_F11,
        restrict = {},
        func = function()
            _RDS.Interface.UI:Main()
        end
    },
    ["Befehle"] = {
        txt = "",
        key = KEY_F2,
        restrict = {},
        func = function()
            _RDS.Temporder.UI:UI()
        end
    },
}
*/