--
_RDS.PlayerSettings.Menu = _RDS.PlayerSettings.Menu or {}
local Gtbl = _RDS.PlayerSettings.Menu

function Gtbl:UserSettings()
    local scrolltbl = {}
    local scrw,scrh = ScrW(), ScrH()

    local Main = vgui.Create("DScrollPanel", _RDS.PlayerSettings.Frame)
    Main:Dock(FILL)

    local sbar = Main:GetVBar()
    sbar:SetSize(20,0)
    sbar:SetHideButtons( true )
    function sbar.btnGrip:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(255,0,0),false,false,false,true) end
    function sbar:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),false,false,false,true) end
    function sbar.btnUp:Paint(w, h) return end
    function sbar.btnDown:Paint(w, h) return end

    for k, v in pairs( _RDS.PlayerSettings.Config ) do   

        v.element = vgui.Create("DPanel", Main)
        v.element:Dock( TOP )
        v.element:DockMargin(5,5,5,5)
        v.element:SetTall(scrh*0.14)

            v.element.Paint = function(self,w,h)
                draw.RoundedBox(5,0,0,w,h,Color(71,71,71))
            end

        local info = v.element:Add("DLabel")
        info:Dock( LEFT )
        info:DockMargin(3,0,0,0)
        info:SetText( "" )
        info:SetWide(scrw*0.1)

            info.Paint = function(self,w,h)
                draw.SimpleText(k, "RDSRP.Settings.Title", 10, self:GetTall()/2, clr, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            end

            if v.what == "ComboBox" then 
                v.setting = vgui.Create("DComboBox", v.element)
                v.setting:Dock(RIGHT)
                v.setting:DockMargin(0,scrh*0.050,30,scrh*0.050)
                v.setting:SetWide(scrw*0.14)
                v.setting:SetValue( "options" )
                    for value, data in pairs( _RDS.PlayerSettings.Config[k].comboitems ) do 
                        v.setting:AddChoice(value, data)
                    end
                v.setting.OnSelect = v.savefunc
            elseif v.what == "CheckBox" then 
                v.setting = vgui.Create( "RDSRP.Switch", v.element ) -- Create the checkbox
                v.setting:Dock(RIGHT)
                v.setting:SetText("")
                v.setting:DockMargin(0,scrh*0.055,scrw*0.018,0)
                v.setting:SetChecked( true )
            elseif v.what == "ColorPalette" then  
                v.setting = vgui.Create( "DColorCombo", v.element ) 
                v.setting:Dock(RIGHT)
                v.setting:DockMargin(0,0,scrw*0.018,0) 

                v.setting.OnValueChanged = v.savefunc 
            end
    end

    _RDS.PlayerSettings.FILL:AddSheet( "Arabica", Main, Color(255,0,0), "materials/rdsrp/icon/settings.png")
    
end

function Gtbl:UserBinds()
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
            title:SetWide(scrw*0.2)
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


_RDS.PlayerOptionsRaw = {} 

local function load() 
    _RDS.PlayerOptionsRaw = {} 
    --_RDS.PlayerOptionsRaw = util.JSONToTable(cookie.GetString("RDSRP.UserOption"))

    for k,v in pairs(_RDS.PlayerOptionsRaw) do   
       _RDS.PlayerSettings.Config[k].basevar = v  
  end   
end     
  
function _RDS:SETUserOptions() 
    if _RDS.Config.ExtraUserOptions[ LocalPlayer():GetUserGroup() ] then  
        _RDS.PlayerOptionsRaw = {} 
        
        for k, v in pairs(_RDS.PlayerSettings.Config) do    
            tbl = { [k] = v.basevar }  
            _RDS.PlayerOptionsRaw[k] = v.basevar

                if v.basevar == nil then 
                    if _RDS.Config.Debug then 
                        _RDS:DebugPrint( Color(255,0,0), "CANT INSERT! (> "..k.." <)" )
                    end
                    _RDS.PlayerOptionsRaw = {} 
                else
                    if _RDS.Config.Debug then 
                        _RDS:DebugPrint( Color(9,255,0), "CAN INSERT! (> "..k.." <)" )
                    end
                    cookie.Set("RDSRP.UserOption", util.TableToJSON(_RDS.PlayerOptionsRaw))
                    load()
                end  
                PrintTable(_RDS.PlayerOptionsRaw) 
        end 
    else 
        for k, v in pairs(_RDS.PlayerSettings.Config) do  
           v.basevar = nil
        end 
    end
   -- PrintTable(_RDS.PlayerOptionsRaw)  
end    
 
local function start() 
    if cookie.GetString("RDSRP.UserOption", nil) then 
        _RDS:SETUserOptions()
    else
        local tbl = {}
        cookie.Set("RDSRP.UserOption", util.TableToJSON(tbl))
    end
end   
  
load()
start() 

concommand.Add("_RDS.ResetPlyCookie", function()
    cookie.Delete("RDSRP.UserOption") 
end) 