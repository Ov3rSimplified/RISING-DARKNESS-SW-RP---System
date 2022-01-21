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
//** [[   Interface | cl_init.lua   ]]** \\

local RDSUI = _RDS.Interface.UI

function RDSUI:Main()
    local scrw, scrh = ScrW(), ScrH()
    RDSUI.MPanel = vgui.Create("RDSRP.BPanel")
    RDSUI.MPanel:SetSize(ScrW(),ScrH())
    RDSUI.MPanel:Center()
    RDSUI.MPanel:MakePopup()
    RDSUI.MPanel.Paint = function(self,w,h)
            local mater = Material("materials/rdsrp/interface/background.png")
            surface.SetDrawColor(_RDS:Color("WHITE", 255))
            surface.SetMaterial(mater)
            surface.DrawTexturedRect(0,0,w,h)
        end
    local ScreenPanel = RDSUI.MPanel:Add("DPanel")
    ScreenPanel:Dock(FILL)
    ScreenPanel:DockMargin(0,0,0,0)
    local mater = Material("materials/rdsrp/interface/test2.png")
    ScreenPanel.Paint = function(self,w,h)
        surface.SetDrawColor(_RDS:Color("WHITE", 255)) 
        surface.SetMaterial(mater)
        surface.DrawTexturedRect(0,0,w,h)
    end
    local close = ScreenPanel:Add("DButton")
    close:SetPos(scrw * 0.78, scrh * 0.06)
    close:SetSize(scrw * 0.2, scrh * 0.053)
    local battn = Material("materials/rdsrp/interface/button.png")
        close.Paint = function(self,w,h)
            self:SetText("Schließen")
            self:SetFont("RDS.Admin.btn")
                if self:IsHovered() then 
                    self:SetTextColor(_RDS:Color("POMEGRANATE", 255))
                else
                    self:SetTextColor(_RDS:Color("WHITE", 255))
                end
        end
        close.DoClick = function()
            RDSUI.MPanel:Remove()
        end
        local ActionPanel = ScreenPanel:Add("DPanel")
        ActionPanel:Dock(FILL)
        ActionPanel:DockMargin(5,scrh*0.112,5,5)
        ActionPanel.Paint = nil
   
    local SelectBar = ActionPanel:Add("RDSRP.InterFaceSelect")
    SelectBar:Dock(FILL)
    SelectBar:TargetHover(5, _RDS:Color("PETER RIVER",130))
    SelectBar:TargetColor(_RDS:Color("BELIZE HOLE",255))
    RDSUI.SelectBar = SelectBar

     /*
    local panel1 = vgui.Create( "DPanel", panel )
    panel1:Dock( FILL )
    panel1.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 128, 255, 130 ) ) end 
    panel:AddSheet( "Inventar", panel1, Color(0,255,157), "materials/rdsrp/icon/admin_setting.png")

    local panel2 = vgui.Create( "DPanel", panel )
    panel2:Dock( FILL )
    panel2.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 128, 255, 130 ) ) end 
    panel:AddSheet( "Binds", panel2, Color(255,0,0), "")

    local panel3 = vgui.Create( "DPanel", panel )
    panel3:Dock( FILL )
    panel3.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 128, 255, 130 ) ) end 
    panel:AddSheet( "Perks", panel3, Color(255,0,0), "")

    local panel4 = vgui.Create( "DPanel", panel )
    panel4:Dock( FILL )
    panel4.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 128, 255, 130 ) ) end 
    panel:AddSheet( "Settings", panel4, Color(255,0,0), "")
*/
    RDSUI:GetMenus()    
end

function RDSUI:GetMenus()
    _RDS.Interface.UI.Inventory:OpenInventory()
    _RDS.Interface.UI.Binds:OpenBinds()
end