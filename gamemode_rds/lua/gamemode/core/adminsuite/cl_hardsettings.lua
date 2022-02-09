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
//** [[   Adminsuite | cl_hardsettings.lua   ]]** \\
local RDSUI = _RDS.Adminsuite.UI.HardSettings


local Items = {
    {
        id = 1, 
        name = "Rangverwaltung",
        func = function()
            RDSUI:Ranksettings()
        end
    },
    {
        id = 1, 
        name = "Tastenbelegung",
        func = function()
            RDSUI:BindSettings()
        end
    }
}

/* 
    Usable Vars
    RDSUI.Scroll
*/
function RDSUI:RegisterSelection()
    if _RDS.Admin.IConfig["Rank"][LocalPlayer():GetUserGroup()].fullacces then
        local Panel = _RDS.Adminsuite.UI.Select:Add("DPanel")
        Panel:Dock(FILL)
        Panel.Paint = function() return end
        local Scroll = Panel:Add("DScrollPanel")
        Scroll:Dock(FILL)
        local sbar = Scroll:GetVBar()
        sbar:SetSize(20,0)
        sbar:SetHideButtons( true )
        function sbar.btnGrip:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(255,0,0),false,false,false,true) end
        function sbar:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),false,false,false,true) end
        function sbar.btnUp:Paint(w, h) return end
        function sbar.btnDown:Paint(w, h) return end
            RDSUI.Scroll = Scroll
        _RDS.Adminsuite.UI.Select:AddSheet( "Arabica", Panel, Color(255,0,0), "materials/rdsrp/icon/settings.png", _RDS.Adminsuite.UI.HardSettings.Scroll)
        RDSUI:ConfigItems()
    else
       -- _RDS:Notify("error", "Fehler!", "Du hast keine Rechte, um das Adminsuite zu öffen!", 2)
        return 
    end
end

function RDSUI:ConfigItems()
    local scrw,scrh = ScrW(), ScrH()
    for k,v in SortedPairsByMemberValue(Items, "id", false) do
        local panel = RDSUI.Scroll:Add( "DPanel" )	-- Create a collapsible category
        panel:Dock( TOP )		
        panel:DockMargin(5,5,5,0) 
        panel:SetTall(scrh*0.09)
        panel.Paint = function(self,w,h)
                    draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
            end
        local Title = panel:Add("DLabel")
        Title:Dock(LEFT)
        Title:SetWide(scrw*0.25)
        Title:SetText("")
            Title.Paint = function(self,w,h)
                draw.SimpleText(v.name, "RDSRP.40", 4, self:GetTall() / 2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            end
        local button = panel:Add("DButton")
        button:Dock(RIGHT)
        button:DockMargin(0,5,5,5)
        button:SetWide(scrw*0.15)
            button.Paint = function(self,w,h)
                self:SetFont("RDSRP.30")
                self:SetTextColor(_RDS:Color("WHITE", 255))
                self:SetText("CONFIG")
                local col = Color(46,46,46)
                draw.RoundedBox(14,0,0,w,h,Color(21,80,21))
                if self:IsHovered() then 
                    col = Color(21,80,21)
                else
                    col = Color(46,46,46)
                end
                draw.RoundedBox(14,2,2,w-4,h-4,col)
            end
            button.DoClick = function()
                RDSUI.Scroll:Clear() 
                v.func() 
            end
    end
end

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

function RDSUI:BindSettings()
    local scrw,scrh = ScrW(), ScrH()
    RDSUI.Scroll:Clear()
    local top = _RDS.Adminsuite.UI.Select:Add("DPanel")
    top:Dock(TOP)
    top:DockMargin(0,0,0,0)
    top:SetTall(scrh*0.075)
    top:SetText("")
        top.Paint = function(self,w,h)
            draw.RoundedBoxEx(15,0,0,w,h,Color(46,46,46),false,false,false,false)
            draw.SimpleText("⸻ Tastenverwaltung ⸻", "RDS.Admin.btn", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        local TOPp = top
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
    _RDS.Adminsuite.UI:BackButton(function() top:Remove() RDSUI.Scroll:Clear() RDSUI:ConfigItems() end)


    local function Bindss()
        for k,v in pairs(_RDS.Admin.IConfig["Binds"]) do         
            local PANEL =  _RDS.Adminsuite.UI.HardSettings.Scroll:Add("DPanel")
            PANEL:Dock(TOP)
            PANEL:DockMargin(10,10,10,0)
            PANEL:SetTall(scrh*0.09)
                PANEL.Paint = function(self,w,h)
                    draw.RoundedBox(0,0,0,w,h,Color(46,46,46))
                end
            local RankPanel = PANEL:Add("DLabel")
            RankPanel:SetText("")
            RankPanel:Dock(LEFT)
            RankPanel:SetWide(scrw*0.20)
            RankPanel:DockMargin(5,5,5,5)
                RankPanel.Paint = function(self,w,h)
                    draw.SimpleText(k, "RDS.Admin.btn", 5, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
                end
            local Delete = PANEL:Add("DButton")
            Delete:Dock(RIGHT)
            Delete:DockMargin(0,0,0,0)
            Delete:SetWide(scrw*0.05)
            Delete:SetText("✘")
            Delete:SetFont("RDSRP.30")
            Delete:SetTextColor(Color(255,255,255))
                Delete.DoClick = function()
                    _RDS.Admin.IConfig["Binds"][k] = nil
                    net.Start("RDSRP.IConfig.Load")
                    _RDS.WriteCTable(_RDS.Admin.IConfig)
                    net.SendToServer()
                    _RDS.Adminsuite.UI.HardSettings.Scroll:Clear()
                    timer.Simple(0.1,function()
                        Bindss()
                    end)
                end
                Delete.Paint = function(self,w,h)
                    local col = Color(46,46,46)
                    draw.RoundedBox(14,0,0,w,h,Color(255,0,0))
                    if self:IsHovered() then 
                        col = Color(255,0,0)
                    else
                        col = Color(46,46,46)
                    end
                    draw.RoundedBox(14,2,2,w-4,h-4,col)
                end
            local Edit = PANEL:Add("DButton")
            Edit:Dock(RIGHT)
            Edit:DockMargin(0,0,5,0)
            Edit:SetWide(scrw*0.05)
            Edit:SetText("E")
            Edit:SetFont("RDSRP.30")
            Edit:SetTextColor(Color(255,255,255))
                Edit.DoClick = function()
                    local Window = vgui.Create( "RDSRP.BPanel" )
                    Window:SetSize( ScrW() * 0.34, ScrH() * 0.5 )
                    Window:Center()
                    Window:MakePopup()
                    -- Window:DoModal()
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
                    text:SetValue(k)
                    text:SetFont("RDS.Admin.btnply")
                    text:SetPlaceholderText("Title")
        
                    local desc = vgui.Create("DTextEntry", Window)
                    desc:Dock( TOP )
                    desc:DockMargin(10,5,10,0)
                    desc:SetTall(scrh*0.06)
                    desc:SetFont("RDS.Admin.btnply")
                    desc:SetValue(v.txt)
                    desc:SetPlaceholderText("Description")
        
                    local bind = vgui.Create("DBinder", Window)
                    bind:Dock( TOP )
                    bind:DockMargin(10,5,10,0)
                    bind:SetTall(scrh*0.06)
                    bind:SetValue(v.key)
                    bind:SetFont("RDS.Admin.btnply")
        
        
                    local selfunc = vgui.Create("DComboBox", Window)
                    selfunc:Dock( TOP )
                    selfunc:DockMargin(10,5,10,0)
                    selfunc:SetTall(scrh*0.06)
                    selfunc:SetValue(v.func)
                    selfunc:SetText(v.func)
                    selfunc:SetFont("RDS.Admin.btnply")
        
                    selfunc:AddChoice("URL", nil, nil)
                    selfunc:AddChoice("Command", nil, nil)
                    selfunc:AddChoice("Runstring", nil, nil)
                    selfunc:AddChoice("Function", nil, nil)
        
        
                    local func = vgui.Create("DTextEntry", Window)
                    func:Dock( TOP )
                    func:DockMargin(10,5,10,0)
                    func:SetTall(scrh*0.06)
                    func:SetValue(v.exec)
                    func:SetFont("RDS.Admin.btnply")
                    func:SetPlaceholderText("Function")
        
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
                                _RDS.Admin.IConfig["Binds"][k] = nil
                                local tbl = {
                                    [text:GetValue()] = {
                                        txt = desc:GetValue(),
                                        key = bind:GetValue(),
                                        func =  selfunc:GetText(),
                                        exec = func:GetText()
                                    }
                                }
                                table.Merge(_RDS.Admin.IConfig["Binds"],tbl)
                                net.Start("RDSRP.IConfig.Load")
                                _RDS.WriteCTable(_RDS.Admin.IConfig)
                                net.SendToServer()
        
                                _RDS.Adminsuite.UI.HardSettings.Scroll:Clear()
                                timer.Simple(0.1,function()
                                    Bindss()
                                end)
                                Window:Remove()
                            end
                end
                Edit.Paint = function(self,w,h)
                    local col = Color(46,46,46)
                    draw.RoundedBox(14,0,0,w,h,Color(255,145,0))
                    if self:IsHovered() then 
                        col = Color(255,145,0)
                    else
                        col = Color(46,46,46)
                    end
                    draw.RoundedBox(14,2,2,w-4,h-4,col)                
                end
            end
        end
            Bindss()

        add.DoClick = function()
            local Window = vgui.Create( "RDSRP.BPanel" )
            Window:SetSize( ScrW() * 0.34, ScrH() * 0.5 )
            Window:Center()
            Window:MakePopup()
            -- Window:DoModal()
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
            text:SetPlaceholderText("Title")

            local desc = vgui.Create("DTextEntry", Window)
            desc:Dock( TOP )
            desc:DockMargin(10,5,10,0)
            desc:SetTall(scrh*0.06)
            desc:SetFont("RDS.Admin.btnply")
            desc:SetPlaceholderText("Description")

            local bind = vgui.Create("DBinder", Window)
            bind:Dock( TOP )
            bind:DockMargin(10,5,10,0)
            bind:SetTall(scrh*0.06)
            bind:SetFont("RDS.Admin.btnply")


            local selfunc = vgui.Create("DComboBox", Window)
            selfunc:Dock( TOP )
            selfunc:DockMargin(10,5,10,0)
            selfunc:SetTall(scrh*0.06)
            selfunc:SetText("Select function?")
            selfunc:SetFont("RDS.Admin.btnply")

            selfunc:AddChoice("URL", nil, nil)
            selfunc:AddChoice("Command", nil, nil)
            selfunc:AddChoice("Runstring", nil, nil)
            selfunc:AddChoice("Function", nil, nil)

            local transselectfunction
            selfunc.OnSelect = function(index, text, data)
                transselectfunction = data
            end

            local func = vgui.Create("DTextEntry", Window)
            func:Dock( TOP )
            func:DockMargin(10,5,10,0)
            func:SetTall(scrh*0.06)
            func:SetFont("RDS.Admin.btnply")
            func:SetPlaceholderText("Function")

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
                        local execc
                        local l, r = "[[", "]]"
                        if transselectfunction == "URL" then 
                            execc = func:GetText()
                        elseif transselectfunction == "Command" then 
                            execc = func:GetText()
                        elseif transselectfunction == "Runstring" then 
                            execc = func:GetText()
                        elseif transselectfunction == "Function" then 
                            execc = func:GetText()
                        end
                        local tbl = {
                            [text:GetText()] = {
                                txt = desc:GetText(),
                                key = bind:GetValue(),
                                func = transselectfunction,
                                exec = execc
                            }
                        }
                        table.Merge(_RDS.Admin.IConfig["Binds"],tbl)
                        net.Start("RDSRP.IConfig.Load")
                        _RDS.WriteCTable(_RDS.Admin.IConfig)
                        net.SendToServer()

                        _RDS.Adminsuite.UI.HardSettings.Scroll:Clear()
                        timer.Simple(0.1,function()
                            Bindss()
                        end)
                        Window:Remove()
                    end
        end
end


/*
 local correct = vgui.Create( "RDSRP.Switch", Window ) -- Create the checkbox
                correct:Dock( TOP )
                correct:DockMargin(10,5,10,0)
                correct:SetText("Correct?")
                correct:SetChecked( false )
                local corract_c = false
                correct.OnChange = function(self)
                        if (self:GetChecked() == true) then 
                            corract_c = true
                        else
                            corract_c = false
                        end
                    end
*/
PrintTable(_RDS.Admin.IConfig["Binds"])