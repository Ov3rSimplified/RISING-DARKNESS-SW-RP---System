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
//** [[   Interface | cl_dashboard.lua   ]]** \\
_RDS.Interface.UI.Binds = {}
local RDSUI = _RDS.Interface.UI.Binds

function RDSUI:OpenBinds()
    local scrw, scrh = ScrW(),ScrH()

    RDSUI.Panel = vgui.Create( "DPanel", panel )
    RDSUI.Panel:Dock( FILL )
    RDSUI.Panel:DockMargin(scrw*0.25,0,scrw*0.25,0)
        RDSUI.Panel.Paint = function( self, w, h ) 
          draw.RoundedBox( 0, 0, 0, w, h, _RDS:Color("BLACK",130) )
          surface.SetDrawColor(_RDS:Color("WHITE",255))
          surface.DrawOutlinedRect(0,0,w,h,2)
        end 
    
    _RDS.Interface.UI.SelectBar:AddSheet( "Belegungen", RDSUI.Panel )
    RDSUI:BindMenu()
end

function RDSUI:BindMenu()
    local scrw, scrh = ScrW(),ScrH()

    local Top = self.Panel:Add("DLabel")
    Top:Dock(TOP)
    Top:DockMargin(0,0,0,0)
    Top:SetTall(scrh*0.05)
    Top:SetText("")
        Top.Paint = function(self,w,h)
            draw.SimpleText("Tastenbelegungn", "RDSRP.40", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE",255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    local ScrollPanel = self.Panel:Add("DScrollPanel")
    ScrollPanel:Dock(FILL)

    for k, v in pairs(_RDS.bindsys.Binds) do   
        local pnl = ScrollPanel:Add("DPanel")
        pnl:Dock(TOP)
        pnl:DockMargin(10,5,10,5)
        pnl:SetTall(scrh*0.07)
            pnl.Paint  = function(self,w,h)
                draw.RoundedBox(5,2,2,w-4,h-4,_RDS:Color("BLACK",130))
                surface.SetDrawColor( _RDS:Color("WHITE", 255) )
                surface.DrawOutlinedRect(0,0,w,h,2)
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
                local clr = _RDS:Color("WHITE", 255)
                if self:IsHovered() then clr = _RDS:Color("PETER RIVER", 255) else clr = _RDS:Color("WHITE",255) end
                binder:SetTextColor(clr)
                draw.RoundedBox(5,2,2,w-4,h-4,_RDS:Color("BLACK",130))
                surface.SetDrawColor( clr )
                surface.DrawOutlinedRect(0,0,w,h,2)
            end
            function binder:OnChange( Key )
                cookie.Set("RDSRP.Bind."..v.name, Key) 
                v.key = binder:GetValue()
            end
    end

end
