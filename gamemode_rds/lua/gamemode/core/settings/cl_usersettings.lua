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

    for key, value in SortedPairsByMemberValue(_RDS.PlayerSettings.Category, "sortorder", false) do   

        value.item = vgui.Create("DCollapsibleCategory", Main)
        value.item:Dock(TOP)
        value.item:DockMargin(5,5,5,5)
        value.item:SetHeaderHeight(scrh*0.09)
        value.item:SetLabel("")

            value.item.Paint = function(self,w,h)
                draw.RoundedBox(5,0,0,w,h,Color(71,71,71))
                draw.SimpleText(key, "RDS.ESCmenu.Title", self:GetWide()/2, 19, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER)
            end

            local ffill = vgui.Create("DScrollPanel", value.item)
            ffill:Dock(TOP)
            ffill:SetTall(scrh*value.height)

            for k, v in SortedPairsByMemberValue(_RDS.PlayerSettings.Config, "sortorder", false) do   
                if key == v.category then 
                else
                    continue 
                end

                v.element = vgui.Create("DPanel", ffill)
                v.element:Dock( TOP )
                v.element:DockMargin(5,5,5,5)
                v.element:SetTall(scrh*0.14)
        
                    v.element.Paint = function(self,w,h)
                        draw.RoundedBox(5,0,0,w,h,Color(46,45,45))
                    end
        
                local info = v.element:Add("DLabel")
                info:Dock( LEFT )
                info:DockMargin(3,0,0,0)
                info:SetText( "" )
                info:SetWide(scrw*0.4)
        
                    info.Paint = function(self,w,h)
                        draw.SimpleText(v.title, "RDSRP.Settings.Title", 10, self:GetTall()/2, clr, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
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
                        v.setting:SetChecked( _RDS.PlayerSettings.Config[k].basevar or false )
                            v.setting.OnChange = v.savefunc
                    elseif v.what == "ColorPalette" then  
                        v.setting = vgui.Create( "DColorCombo", v.element ) 
                        v.setting:Dock(RIGHT)
                        v.setting:DockMargin(0,0,scrw*0.018,0)
                        v.setting:SetColor( _RDS.PlayerSettings.Config[k].basevar or Color(255,255,255) ) 
                        v.setting.OnValueChanged = v.savefunc 
                    elseif v.what == "TextEntry" then 
                        v.setting = vgui.Create( "DTextEntry", v.element ) -- Create the checkbox
                        v.setting:Dock(RIGHT)
                        v.setting:SetText( _RDS.PlayerSettings.Config[k].basevar or "" )
                        v.setting:SetPlaceholderText("Hier die ImgurID")
                        v.setting:SetWide(scrw * 0.13)
                        v.setting:DockMargin(0,scrh*0.045,scrw*0.018,scrh*0.045)
                        v.setting:SetFont("RDSRP.25")
                        
                        v.setting.OnEnter = v.savefunc 
        
                      --  v.setting:SetHistoryEnabled( true )
                       -- v.setting:AddHistory( "LUl" )
                        
                    end
            end
    end


    _RDS.PlayerSettings.FILL:AddSheet( "Arabica", Main, Color(255,0,0), "materials/rdsrp/icon/settings.png")
    
end

_RDS.PlayerOptionsRaw = {} 


function _RDS:LOADUserOptions()
    _RDS.PlayerOptionsRaw = {} 

    if cookie.GetString("RDSRP.UserOption", nil) then 
        _RDS.PlayerOptionsRaw = util.JSONToTable(cookie.GetString("RDSRP.UserOption"))
    
        for k,v in pairs(_RDS.PlayerOptionsRaw) do   
            _RDS.PlayerSettings.Config[k].basevar = v      
        end  
    else 
        local tbl = {}
        cookie.Set("RDSRP.UserOption", util.TableToJSON(tbl))
    end  
end
 
local function load() 
    _RDS.PlayerOptionsRaw = {} 
    _RDS.PlayerOptionsRaw = util.JSONToTable(cookie.GetString("RDSRP.UserOption"))

    for k,v in pairs(_RDS.PlayerOptionsRaw) do   
       _RDS.PlayerSettings.Config[k].basevar = v      
  end   
end       
_RDS.PlayerOptionsRaw = {} 


function _RDS:SETUserOptions() 
    _RDS.PlayerOptionsRaw = {} 
    if _RDS.Config.ExtraUserOptions[ LocalPlayer():GetUserGroup() ] then  

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

// Load Files
timer.Simple(0.1, function()
    --load()
    start()   
    _RDS:LOADUserOptions()
end)

concommand.Add("_RDS.ResetPlyCookie", function()
    cookie.Delete("RDSRP.UserOption") 
end) 