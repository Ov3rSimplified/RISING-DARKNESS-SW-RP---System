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
//** [[   Temporder | cl_init.lua   ]]** \\
_RDS.Temporder.UI = {}


function _RDS.Temporder.UI:UI()
    local scrw, scrh = ScrW(), ScrH()
    local open
    if (IsValid(_RDS.Temporder.UI.panel)) then 
        _RDS.Temporder.UI.panel:Remove()
        open = false
    else
        _RDS.Temporder.UI.panel = vgui.Create("RDSRP.BPanel")
        _RDS.Temporder.UI.panel:SetPos(scrw * 0.003, scrh * 0.13)
        _RDS.Temporder.UI.panel:SetSize(scrw * 0.19, scrh * 0.5)
            _RDS.Temporder.UI.panel.Paint = function(self, w, h)
               -- draw.RoundedBox(0, 0, 0, w, h, Color(0,0,0,50))
            end
        local top = _RDS.Temporder.UI.panel:Add("DLabel")
        top:Dock(TOP)
        top:DockMargin(0, 0, 0, 0)
        top:SetText("")
        top:SetTall(scrh * 0.06)
            top.Paint = function(self, w, h)
                draw.DrawText("⸻ BEFEHLE ⸻", "FONT_HUD_INFOTITLE", self:GetWide() / 2, 0, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        _RDS.Temporder.UI.scroll = _RDS.Temporder.UI.panel:Add("DScrollPanel")
        _RDS.Temporder.UI.scroll:Dock(FILL)
        _RDS.Temporder.UI.scroll.Paint = function(self,w,h)
                draw.RoundedBox(7.5, 0, 0, w, h, Color(0,0,0,50))
            end
            local sbar = _RDS.Temporder.UI.scroll:GetVBar()
            sbar:SetSize(2,0)
             sbar:SetHideButtons( true )
             function sbar.btnGrip:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(255,255,255),false,false,false,true) end
             function sbar:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),false,false,false,true) end
             function sbar.btnUp:Paint(w, h) return end
             function sbar.btnDown:Paint(w, h) return end
        _RDS.Temporder.UI:Content()
        local bottom = _RDS.Temporder.UI.panel:Add("DLabel")
        bottom:Dock(BOTTOM)
        bottom:DockMargin(0,10,0,0)
        bottom:SetTall(scrh*0.06)
        bottom:SetText("")
            bottom.Paint = function(self,w,h)
                draw.RoundedBox(7.5, 0, 0, w, h, Color(0,0,0,50))
                draw.DrawText("Drücke [" .. tostring(input.GetKeyName(_RDS.Admin.IConfig["Binds"]["Befehle"].key)) .. "] um dieses Feld zu Öffnen oder Schließen\n Drücke [F3] um den Mauszeiger zu aktivieren", "RDSRP.15", self:GetWide() / 2, scrh * 0.015, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        open = true
    end
end

function _RDS.Temporder.UI:Content()
    local scrw, scrh = ScrW(), ScrH()
    local empty
    if table.IsEmpty(_RDS.Temporder.ClientOrders) then 
        empty = true 
    else
        empty = false
    end
    if empty then 
        local emptydempty = _RDS.Temporder.UI.scroll:Add("DLabel")
        emptydempty:Dock(TOP)
        emptydempty:SetTall(scrh*0.1)
        emptydempty:SetText("")
            emptydempty.Paint = function(self,w,h)
                draw.SimpleText("Zurzeit keine Befehle!", "RDSRP.25", self:GetWide() / 2, self:GetTall() / 2, Color(255, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
    else
        for k, v in pairs(_RDS.Temporder.ClientOrders) do
            local priocolor = Color(255, 255, 255)
            if v.priority == 1 then 
                priocolor = Color(0,255,85)
            elseif v.priority == 2 then 
                priocolor = Color(255,136,0)
            elseif v.priority == 3 then 
                priocolor = Color(255,0,0)
            end
            local btn = _RDS.Temporder.UI.scroll:Add("DCollapsibleCategory")
            btn:Dock(TOP)    
            btn:DockMargin(5,9,5,0)
            btn:SetLabel("")
            btn:SetHeaderHeight(scrh*0.04)
                btn.Paint = function(self,w,h)
                    draw.SimpleText(k, "HCS.20", self:GetWide() / 2, scrh*0.02, priocolor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    surface.SetDrawColor(Color(255, 255, 255))
                    surface.DrawOutlinedRect(0,0,w,h,2)
                end            
            local pnl = vgui.Create("DPanel", btn)
            pnl:Dock(TOP)
            pnl:SetTall(scrh*0.15)
                pnl.Paint = function(self,w,h)
                    surface.SetDrawColor(Color(255, 255, 255))
                    surface.DrawOutlinedRect(0,0,w,h,1)
                end
            local richtext = pnl:Add( "RichText" )
            richtext:Dock( FILL )
            richtext:InsertColorChange(255,255,255,255)
            richtext:AppendText(v.description) 
                richtext.PerformLayout = function(self)
                    self:SetFontInternal("HCS.15")
                end 
        end
    end
end



concommand.Add("12d", function()
    if IsValid(_RDS.Temporder.UI.panel) then 
        _RDS.Temporder.UI:UI()
    else
        _RDS.Temporder.UI:UI()
    end
end)

