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
//** [[   Adminsuite | cl_init.lua   ]]** \\
local RDSUI = _RDS.Adminsuite.UI

function RDSUI:Main()
    if _RDS.Admin.IConfig["Rank"][LocalPlayer():GetUserGroup()].Adminmenu or _RDS.Admin.IConfig["Rank"][LocalPlayer():GetUserGroup()].fullacces then

        local scrw,scrh = ScrW(), ScrH()
        _RDS.Advtraining.Whitelist = _RDS.Advtraining.Whitelist or {}
        
        net.Start("RDSRP.Roleplay.Trainings.ReLoad")
        net.SendToServer()
        
        timer.Simple(0.1,function()
            
        local MainFrame = vgui.Create("RDSRP.BPanel")
        if IsValid(self.MainFrame) then 
            MainFrame:Remove() 
        else
        MainFrame:SetSize(scrw * 0.75, scrh * 0.84)
        MainFrame:Center()
        MainFrame:MakePopup()
      --  MainFrame:SetKeyBoardInputEnabled(false)
        MainFrame:SetAlpha( 0 )
        MainFrame:AlphaTo( 255, 0.25, 0 )
            MainFrame.Paint = function(self,w,h)
                draw.RoundedBox(15,0,0,w,h,Color(23,22,22,255))
            end
        end
        RDSUI.MainFrame = MainFrame
        local Top = MainFrame:Add("DPanel", MainFrame)
        Top:Dock(TOP)
        Top:DockMargin(0,0,0,0) 
        Top:SetTall(scrh*0.1)
            Top.Paint = function(self,w,h)
                draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,false,false)
                draw.SimpleText("⸻ RDSRP Adminsuite ⸻", "RDS.Admin.Title", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        local close = Top:Add("DButton")
        close:Dock(RIGHT)
        close:DockMargin(0,40,20,40)
        close:SetWide(scrw*0.015) 
        close:SetText("")
            close.DoClick = function()
                MainFrame:AlphaTo( 0,0.25, 0, function() MainFrame:Remove() end )
            end
            local cross = Material("materials/rdsrp/icon/cross.png")
            close.Paint = function(self,w,h)
                local col = _RDS:Color("WHITE", 255)
                if self:IsHovered() then col = Color(250,0,0) else col = _RDS:Color("WHITE", 255) end
                surface.SetDrawColor(col)
                surface.SetMaterial(cross)
                surface.DrawTexturedRect(0,0,w,h)
            end
        local Back = Top:Add("DButton")
        Back:Dock(RIGHT)
        Back:DockMargin(0,40,20,40)
        Back:SetWide(scrw*0.015)
        Back:SetText("")
            local arrow = Material("materials/rdsrp/icon/larrow.png")
            Back.Paint = function(self,w,h)
                local col = _RDS:Color("WHITE", 255)
                if self:IsHovered() then col = Color(250,133,0) else col = _RDS:Color("WHITE", 255) end
                surface.SetDrawColor(col)
                surface.SetMaterial(arrow)
                surface.DrawTexturedRect(0,0,w,h)
            end
        RDSUI.Back = Back

        local Fill = vgui.Create("RDSRP.SideSelect", MainFrame)
        Fill:Dock(FILL)
        RDSUI.Select = Fill
        _RDS.Adminsuite.UI.AdminSettings:RegisterSelection()
        _RDS.Adminsuite.UI.HardSettings:RegisterSelection()
        end)
    elseif _RDS.Admin.IConfig["Rank"][LocalPlayer():GetUserGroup()].noaccess then        
        _RDS:Notify("error", "Fehler!", "Du hast keine Rechte, um das Adminsuite zu öffen!", 2)
        return 
    else
        _RDS:Notify("error", "Fehler!", "Du hast keine Rechte, um das Adminsuite zu öffen!", 2)
        return 
    end
end 

function _RDS.Adminsuite.UI:BackButton(func)
    RDSUI.Back.DoClick = func
end 
 
hook.Add("InitPostEntity", "23483rf9wf0n92", function()
    net.Start("RDSRP.IConfig.ReLoad")
        net.SendToServer()
   --         include("gamemode/config/sh_hardconfig.lua")
end)   

net.Start("RDSRP.IConfig.ReLoad")
    net.SendToServer()
     --  include("gamemode/config/sh_hardconfig.lua")
    
 
    
     
 
























 


















































