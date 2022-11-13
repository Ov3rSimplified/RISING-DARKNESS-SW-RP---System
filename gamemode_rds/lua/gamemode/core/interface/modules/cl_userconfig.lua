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
//** [[   Interface | cl_userconfig.lua   ]]** \\
_RDS.Interface.UI.Userconfig = {}
local RDSUI = _RDS.Interface.UI.Userconfig

function RDSUI:OpenUserconfig()
    local scrw, scrh = ScrW(),ScrH()

    RDSUI.Panel = vgui.Create( "DPanel", panel )
    RDSUI.Panel:Dock( FILL )
    RDSUI.Panel:DockMargin(scrw*0.25,0,scrw*0.25,0)
        RDSUI.Panel.Paint = function( self, w, h ) 
          draw.RoundedBox( 0, 0, 0, w, h, _RDS:Color("BLACK",130) )
          surface.SetDrawColor(_RDS:Color("WHITE",255))
          surface.DrawOutlinedRect(0,0,w,h,2)
        end 
    
    _RDS.Interface.UI.SelectBar:AddSheet( "Einstellung", RDSUI.Panel )
    self:Config()
end

function RDSUI:Config()
    local scrw, scrh = ScrW(),ScrH()

    local Top = RDSUI.Panel:Add("DLabel")
    Top:Dock(TOP)
    Top:DockMargin(0,0,0,0)
    Top:SetTall(scrh*0.05)
    Top:SetText("")
        Top.Paint = function(self,w,h)
            draw.SimpleText("Konfiguration", "RDSRP.40", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE",255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

    local Main = vgui.Create("DScrollPanel", RDSUI.Panel)
    Main:Dock(FILL)

    local sbar = Main:GetVBar()
    sbar:SetSize(2,0)
    sbar:SetHideButtons( true )
    function sbar.btnGrip:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(255,255,255),false,false,false,true) end
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
               -- draw.RoundedBox(5,0,0,w,h,Color(71,71,71))
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
                v.element:SetTall(scrh * v.buttonheight)
        
                    v.element.Paint = function(self,w,h)
                       -- draw.RoundedBox(5,0,0,w,h,Color(46,45,45))
                       local clr = _RDS:Color("WHITE", 255)
                       if self:IsHovered() then clr = _RDS:Color("PETER RIVER", 255) else clr = _RDS:Color("WHITE",255) end
                       draw.RoundedBox(5,2,2,w-4,h-4,_RDS:Color("BLACK",130))
                       surface.SetDrawColor( clr )
                       surface.DrawOutlinedRect(0,0,w,h,2)
                    end
        
                local info = v.element:Add("DLabel")
                info:Dock( LEFT )
                info:DockMargin(3,0,0,0)
                info:SetText( "" )
                info:SetWide(scrw*0.4)
        
                    info.Paint = function(self,w,h)
                        draw.SimpleText(v.title, "RDSRP.30", 10, self:GetTall()/2, clr, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                    end

                    if v.what == "ComboBox" then 
                        v.setting = vgui.Create("DComboBox", v.element)
                        v.setting:Dock(RIGHT)
                        v.setting:DockMargin(0,scrh*0.050,15,scrh*0.050)
                        v.setting:SetWide(scrw*0.14)
                        v.setting:SetValue( _RDS.PlayerConfig.config[k] )
                            for value, data in pairs( _RDS.PlayerSettings.Config[k].comboitems ) do 
                                v.setting:AddChoice(value, data)
                            end
                        v.setting.OnSelect = v.savefunc
                    elseif v.what == "CheckBox" then 
                        v.setting = vgui.Create( "RDSRP.Switch", v.element ) -- Create the checkbox
                        v.setting:Dock(RIGHT)
                        v.setting:SetText("")
                        v.setting:DockMargin(0,32.5,15,0)
                        v.setting:SetChecked( _RDS.PlayerConfig.config[k] )
                            v.setting.OnChange = v.savefunc
                    elseif v.what == "ColorPalette" then  
                        v.setting = vgui.Create( "DColorCombo", v.element ) 
                        v.setting:Dock(RIGHT)
                        v.setting:DockMargin(0,0,15,0)
                        v.setting:SetColor( _RDS.PlayerConfig.config[k] ) 
                        v.setting.OnValueChanged = v.savefunc 
                    elseif v.what == "TextEntry" then 
                        v.setting = vgui.Create( "DTextEntry", v.element ) -- Create the checkbox
                        v.setting:Dock(RIGHT)
                        v.setting:SetText( tostring(_RDS.PlayerConfig.config[k]) )
                        v.setting:SetPlaceholderText("Hier die ImgurID")
                        v.setting:SetWide(scrw * 0.13)
                        v.setting:DockMargin(0,20,15,20)
                        v.setting:SetFont("RDSRP.20")
                        
                        v.setting.OnEnter = v.savefunc 
        
                      --  v.setting:SetHistoryEnabled( true )
                       -- v.setting:AddHistory( "LUl" )
                        
                    end
            end
    end
end

