--
_RDS.bindsys = _RDS.bindsys or {}
_RDS.bindsys.Binds = _RDS.bindsys.Binds or {}
_RDS.bindsys.Menu = _RDS.bindsys.Menu or {}


function _RDS.bindsys.LoadCLBinds()
    for k,v in pairs(_RDS.bindsys.Binds) do 
        v.key = cookie.GetNumber("RDSRP.Bind."..v.name, v.key )
    end 
end

function _RDS.bindsys:UserBinds()
    local scrw,scrh = ScrW(), ScrH()

    local Main = vgui.Create("DScrollPanel", _RDS.PlayerSettings.Frame)
    Main:Dock(FILL)

    for k, v in pairs(_RDS.bindsys.Binds) do     

        local pnl = vgui.Create("DPanel", Main )
        pnl:Dock(TOP)
        pnl:DockMargin(10,5,10,5)
        pnl:SetTall(scrh*0.07)

            pnl.Paint  = function(self,w,h)
                draw.RoundedBox(5,0,0,w,h,Color(71,71,71))
            end


            local title = vgui.Create("DLabel", pnl)
            title:Dock(LEFT)
            title:DockMargin(5,0,0,0)
            title:SetWide(scrw*0.5)
            title:SetText( "" )

                title.Paint = function(self,w,h)
                    draw.SimpleText(k, "RDSRP.bsys.bindtitle", 0, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                end


            local binder = vgui.Create("DBinder", pnl)
            binder:Dock(RIGHT)
            binder:DockMargin(0,0,0,0)
            binder:SetWide(scrw*0.07)
            binder:SetFont("RDSRP.bsys.bindertitle")
            binder:SetValue( v.key )

                binder.Paint = function(self,w,h)
                    draw.RoundedBoxEx(5,0,0,w+1,h,Color(37,37,37),false,true,false,true)
                end

                function binder:OnChange( Key )
                    cookie.Set("RDSRP.Bind."..v.name, Key) 
                    v.key = binder:GetValue()
                end
    end
    _RDS.PlayerSettings.FILL:AddSheet( "Arabica", Main, Color(255,0,0), "materials/rdsrp/icon/keyboardkey.png")
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
    name = "Thirdperson",
    txt = "Change the Thirdperson",
    key = KEY_T,
    restrict = {},  
    func = function()
        LocalPlayer():ConCommand("stp")
    end
}) 
 
_RDS:KeybindRegister({
    name = "Adminsuite",
    txt = "",
    key = KEY_F9,
    restrict = {},  
    func = function()
        _RDS.Adminsuite.UI:Main()
    end
}) 
 
_RDS:KeybindRegister({
    name = "Interface",
    txt = "",
    key = KEY_F11,
    restrict = {},  
    func = function()
        _RDS.Interface.UI:Main()
    end
}) 
 
 