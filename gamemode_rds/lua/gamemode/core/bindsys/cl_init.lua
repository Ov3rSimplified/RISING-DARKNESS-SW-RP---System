--
_RDS.bindsys = _RDS.bindsys or {}
_RDS.bindsys.Binds = _RDS.bindsys.Binds or {}
 
function _RDS.bindsys.LoadCLBinds()
    for k,v in pairs(_RDS.bindsys.Binds) do 
        v.key = cookie.GetNumber("RDSRP.Bind."..v.name, v.key )
    end
end
     
 
function _RDS.bindsys.TestUI()

    local FRame = vgui.Create("DFrame")
    FRame:SetSize(ScrW()*0.4,ScrH()*0.6)
    FRame:Center()
    FRame:MakePopup()

    for k,v in pairs(_RDS.bindsys.Binds) do    

        local bind = vgui.Create("DBinder", FRame)
        bind:Dock(TOP)
        bind:SetValue(v.key)

        function bind:OnChange( Key )
            cookie.Set("RDSRP.Bind."..v.name, Key) 
            v.key = Key
        end
    end
end 




local delay = 0
local open = false
hook.Add( "PlayerButtonDown", "RDSRP.BindKeyCheck", function(ply, btn)
if delay < CurTime() then 
    for k,v in pairs(_RDS.bindsys.Binds) do    
        if btn == v.key then
            v.func()
        end
    end
    delay = CurTime() + 0.2
end
end )

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


_RDS:KeybindRegister({
    name = "Test",
    txt = "test1",
    key = KEY_L, 
    restrict = { 
        ["user"] = true, 
        ["superadmin"] = true 
    },  
    func = function()
        LocalPlayer():ChatPrint("Du HOMO")
    end
}) 
 
_RDS:KeybindRegister({
    name = "Thirdperson",
    txt = "Change the Thirdperson",
    key = KEY_T,
    restrict = {},  
    func = function()
        LocalPlayer():ConCommand("stp")
    end
}) 
 

PrintTable(_RDS.bindsys.Binds)
_RDS.bindsys.LoadCLBinds()