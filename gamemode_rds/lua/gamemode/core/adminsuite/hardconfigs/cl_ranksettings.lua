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
//** [[   Adminsuite | cl_ranksettings.lua   ]]** \\
local RDSUI = _RDS.Adminsuite.UI.HardSettings


function RDSUI:Ranksettings()
    local scrw,scrh = ScrW(), ScrH()
    RDSUI.Scroll:Clear()
    local top = _RDS.Adminsuite.UI.Select:Add("DPanel")
    top:Dock(TOP)
    top:DockMargin(0,0,0,0)
    top:SetTall(scrh*0.075)
    top:SetText("")
        top.Paint = function(self,w,h)
            draw.RoundedBoxEx(15,0,0,w,h,Color(46,46,46),false,false,false,false)
            draw.SimpleText("⸻ Rankconfig ⸻", "RDS.Admin.btn", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        local TOPp = top
    _RDS.Adminsuite.UI:BackButton(function() top:Remove() RDSUI.Scroll:Clear() RDSUI:ConfigItems() end)
    local add = top:Add("DButton")
    add:Dock(RIGHT)
    add:DockMargin(0,0,0,0)
        add.Paint = function(self,w,h)
            self:SetFont("RDSRP.30")
            self:SetTextColor(_RDS:Color("WHITE", 255))
            self:SetText("✚")
            local col = Color(59,59,59)
            draw.RoundedBox(0,0,0,w,h,Color(21,80,21))
            if self:IsHovered() then 
                col = Color(21,80,21)
            else
                col = Color(46,46,46)
            end
            draw.RoundedBox(0,2,2,w-4,h-4,col)
        end
        local CConfig = add


    /* UI Code */

 local function Ranks()
    local PANEL =  _RDS.Adminsuite.UI.HardSettings.Scroll:Add("DPanel")
    PANEL:Dock(TOP)
    PANEL:DockMargin(10,10,10,0)
    PANEL:SetTall(scrw*0.36)
        PANEL.Paint = function(self,w,h)
            draw.RoundedBox(0,0,0,w,h,Color(46,46,46))
        end
    local RankPanel = PANEL:Add("DPanel")
    RankPanel:Dock(LEFT)
    RankPanel:SetWide(scrw*0.33)
    RankPanel:DockMargin(5,5,5,5)
        RankPanel.Paint = function(self,w,h)
            draw.RoundedBox(0,0,0,w,h,Color(34,34,34))
        end
        local RankTop = RankPanel:Add("DLabel")
        RankTop:Dock(TOP)
        RankTop:SetTall(scrh*0.05)
        RankTop:SetText("")
            RankTop.Paint = function(self,w,h)
                draw.SimpleText("Ränge", "RDSRP.40", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
            end
        local RankScroll = RankPanel:Add("DScrollPanel")
        RankScroll:Dock(FILL)

        for k,v in pairs(_RDS.Admin.IConfig["Rank"]) do   
            local Permbutton = RankScroll:Add("DButton")
            Permbutton:Dock(TOP)
            Permbutton:DockMargin(5,7,5,0)
            Permbutton:SetTall(scrh*0.07)
            Permbutton:SetFont("RDSRP.30")
            Permbutton:SetText(k)
                Permbutton.Paint = function(self,w,h)
                    local clr = _RDS:Color("WHITE", 255)
                    if self:IsHovered() then clr = _RDS:Color("PETER RIVER", 255) draw.RoundedBox(5,0,0,w,h,clr) else  clr = _RDS:Color("WHITE", 255) end
                    self:SetTextColor(clr) 
                    draw.RoundedBox(5,2,2,w-4,h-4,Color(47,47,47))
                end
                Permbutton.DoRightClick = function()
                    local Menu = DermaMenu()
                    Menu:AddOption( "Delete", function()
                        _RDS.Admin.IConfig["Rank"][k] = nil 
                        net.Start("RDSRP.IConfig.Load")
                        _RDS.WriteCTable(_RDS.Admin.IConfig)
                        net.SendToServer()   
                        _RDS.Adminsuite.UI.HardSettings.Scroll:Clear()
                        timer.Simple(0.1,function()
                            Ranks()
                        end)
                    end )
                    Menu:Open()
                end
            Permbutton.DoClick = function()
                RDSUI.PermScroll:Clear()
                timer.Simple(0.1,function()
                    for prefix,value in pairs(_RDS.Admin.IConfig["Rank"][k]) do 
                        local Perm = vgui.Create( "RDSRP.Switch", RDSUI.PermScroll ) -- Create the checkbox
                        Perm:Dock( TOP )
                        Perm:DockMargin(3,5,0,0)
                        Perm:SetText(string.upper(prefix))
                        Perm:SetChecked( value )
                        local corract_c = false
                        Perm.OnChange = function(self)
                                if (self:GetChecked() == true) then 
                                    _RDS.Admin.IConfig["Rank"][k][prefix] = true
                                    net.Start("RDSRP.IConfig.Load")
                                    _RDS.WriteCTable(_RDS.Admin.IConfig)
                                    net.SendToServer()                                
                                else
                                    _RDS.Admin.IConfig["Rank"][k][prefix] = false
                                    net.Start("RDSRP.IConfig.Load")
                                    _RDS.WriteCTable(_RDS.Admin.IConfig)
                                    net.SendToServer()                                
                                end 
                            end
                    end
                end)
            end
        end

    local PermPanel = PANEL:Add("DPanel")
    PermPanel:Dock(RIGHT)
    PermPanel:SetWide(scrw*0.33)
    PermPanel:DockMargin(5,5,5,5)
    PermPanel.Paint = function(self,w,h)
            draw.RoundedBox(0,0,0,w,h,Color(34,34,34))
        end
        local PermPanelTop = PermPanel:Add("DLabel")
        PermPanelTop:Dock(TOP)
        PermPanelTop:SetTall(scrh*0.05)
        PermPanelTop:SetText("")
            PermPanelTop.Paint = function(self,w,h)
                draw.SimpleText("Berechtigung", "RDSRP.40", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
            end
            local PermScroll = PermPanel:Add("DScrollPanel")
            PermScroll:Dock(FILL)
            RDSUI.PermScroll = PermScroll




 end

    Ranks()

    add.DoClick = function()

        local Window = vgui.Create( "RDSRP.BPanel" )
        Window:SetSize( ScrW() * 0.34, ScrH() * 0.2 )
        Window:Center()
        Window:MakePopup()
        Window:DoModal()
            Window.Paint = function(self,w,h)
                draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
                draw.RoundedBox(15,2,2,w-4,h-4,Color(23,22,22,255))
            end
        local top = vgui.Create("DPanel", Window)
        top:Dock(TOP)
        top:SetTall(ScrH()*0.05)
            top.Paint = function(self,w,h)
                draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,false,false)
                draw.SimpleText("Erstellung", "RDS.Admin.Configsmall", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        local text = vgui.Create("DTextEntry", Window)
        text:Dock( TOP )
        text:DockMargin(10,5,10,0)
        text:SetTall(scrh*0.06)
        text:SetFont("RDS.Admin.btnply")
        text:SetPlaceholderText("Rank")
        local close = vgui.Create("DButton", Window)
        close:Dock(BOTTOM)
        close:DockMargin(20,0,20,10)
        close:SetText( "Abbrechen" )
        close:SetTextColor( _RDS:Color("WHITE", 255))
        close:SetTall(ScrH() * 0.03 )
            close.Paint = function(self,w,h)
                local clr
                if self:IsHovered() then 
                    draw.RoundedBoxEx(6,0,0,w,h,Color(255,0,0),true,true,true,true)
                end
                draw.RoundedBox(6,2,2,w-4,h-4,Color(46,46,46))
            end
            close.DoClick = function()
                Window:Remove()
            end
        local enter = vgui.Create("DButton", Window)
        enter:Dock(BOTTOM)
        enter:DockMargin(20,0,20,10)
        enter:SetText( "Absenden" )
        enter:SetTextColor( _RDS:Color("WHITE", 255))
        enter:SetTall(ScrH() * 0.03 )
            enter.Paint = function(self,w,h)
                    local clr
                    if self:IsHovered() then 
                        draw.RoundedBoxEx(6,0,0,w,h,Color(0,255,13),true,true,true,true)
                    end
                    draw.RoundedBox(6,2,2,w-4,h-4,Color(46,46,46))
                end
                enter.DoClick = function()

                    local tbl = {
                        [text:GetText()] = {
                            noaccess = true,
                            fullacces = false,
                            QMenu = false,
                            CMenu = false,
                            Adminmenu = false,
                            DonatorOptions = false
                        }
                    }
                    table.Merge(_RDS.Admin.IConfig["Rank"],tbl)
                    net.Start("RDSRP.IConfig.Load")
                    _RDS.WriteCTable(_RDS.Admin.IConfig)
                    net.SendToServer()

                    _RDS.Adminsuite.UI.HardSettings.Scroll:Clear()
                    timer.Simple(0.1,function()
                        Ranks()
                    end)
                    Window:Remove()
                end
    end
end

