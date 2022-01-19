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
//** [[   Adminsuite | cl_questsys.lua   ]] **\\
_RDS.Adminsuite.UI.Config.QSys = {}
local RDSC = _RDS.Adminsuite.UI.Config.QSys
local Scroll = _RDS.Adminsuite.UI.AdminSettings.Scroll

function RDSC:Main()
    local scrw, scrh = ScrW(), ScrH()
    local top = _RDS.Adminsuite.UI.Select:Add("DPanel")
    top:Dock(TOP)
    top:DockMargin(0,0,0,0)
    top:SetTall(scrh*0.075)
    top:SetText("")
        top.Paint = function(self,w,h)
            draw.RoundedBoxEx(15,0,0,w,h,Color(46,46,46),false,false,false,false)
            draw.SimpleText("⸻ Questsystem ⸻", "RDS.Admin.btn", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        RDSC.TOP = top
        _RDS.Adminsuite.UI:BackButton(function() top:Remove() _RDS.Adminsuite.UI.AdminSettings.Scroll:Clear() _RDS.Adminsuite.UI.AdminSettings:ServerSettings() end)
    
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
        RDSC.CConfig = add
        add.DoClick = function()
            RDSC:Config()
        end


    for k,v in pairs(_RDS.Admin.IConfig["Qsys"].Questmodule) do
        
        
        local Item = _RDS.Adminsuite.UI.AdminSettings.Scroll:Add("DCollapsibleCategory")
        Item:Dock(TOP)
        Item:DockMargin(10,5,10,0)
        Item:SetHeaderHeight(scrh*0.05)
        Item:SetLabel("")
        Item:SetExpanded(true)
            Item.Paint = function(self,w,h)
                if self:GetExpanded() == true then  
                    draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
                else
                    draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
                end
                draw.SimpleText(v.Question, "RDS.Admin.btnply", self:GetWide()/2, scrh*0.025, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        local panel = vgui.Create("DPanel", Item)
        panel:Dock(TOP)
        panel:SetTall(scrh*0.2)
            panel.Paint = function(self,w,h)
                draw.RoundedBoxEx(14,2,2,w-4,h-4,Color(23,22,22,255),false,false,true,true)
            end
        local infopanel = panel:Add("DPanel")
        infopanel:Dock(LEFT)
        infopanel:DockMargin(0,0,0,0)
        infopanel:SetWide(scrw*0.240)
            infopanel.Paint = nil
        local number = vgui.Create("DLabel", infopanel)
        number:Dock(TOP)
        number:DockMargin(5,15,0,0)
        number:SetText("Number: "..k)
        number:SetFont("RDS.Admin.Configsmall")
        local endquestion = vgui.Create("DLabel", infopanel)
        endquestion:Dock(TOP)
        endquestion:DockMargin(5,15,0,0)
        endquestion:SetText("EndQuestion: "..tostring(v.EndQuestion))
        endquestion:SetFont("RDS.Admin.Configsmall")

        local AnswerPanel = panel:Add("DScrollPanel", panel)
        AnswerPanel:Dock(RIGHT) 
        AnswerPanel:DockMargin(0,0,0,0)
        AnswerPanel:SetWide(scrw*0.240)
            AnswerPanel.Paint = function(self,w,h)
                surface.SetDrawColor(Color(46,46,46))
                surface.DrawOutlinedRect(0,0,w,h,2)
            end
        local sbar = AnswerPanel:GetVBar()
        sbar:SetSize(0,0)
        function sbar:Paint(w, h) return end
        function sbar.btnUp:Paint(w, h) return end
        function sbar.btnDown:Paint(w, h) return end
        function sbar.btnGrip:Paint(w, h) return end

        local delite = _RDS.Admin.IConfig["Qsys"].Questmodule[k].Answers

        for k, v in pairs(_RDS.Admin.IConfig["Qsys"].Questmodule[k].Answers) do    
            local m = AnswerPanel:Add("DPanel")
            m:Dock(TOP)
            m:DockMargin(14,4,14,10)
            m:SetTall(scrh*0.03)
                m.Paint = function(self,w,h)
                    draw.RoundedBox(0,0,0,w,h,Color(47,47,47))
                end
            local ttl = vgui.Create("DLabel", m)
            ttl:Dock(LEFT)
            ttl:SetWide(scrw*0.16)
            ttl:DockMargin(0,0,5,0)
            ttl:SetText("")
            ttl:SetFont("RDSRP.25")
                ttl.Paint = function(self,w,h)
                    surface.SetDrawColor(Color(29,28,28))
                    surface.DrawOutlinedRect(0,0,w,h,2)
                    draw.SimpleText(k, "RDSRP.25", 5, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

                end
            local mp = vgui.Create("DLabel", m)
            mp:Dock(LEFT)
            --mp:SetWide(scrw*0.06)
            mp:SetText("")
                mp.Paint = function(self,w,h)
                    surface.SetDrawColor(Color(29,28,28))
                    surface.DrawOutlinedRect(0,0,w,h,2)
                    draw.SimpleText(tostring(v.correct), "RDSRP.25", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            local cls = vgui.Create("DButton", m)
            cls:Dock(RIGHT)
            cls:DockMargin(0,0,0,0)
            cls:SetWide(scrw*0.02)
            cls:SetText("✖")
            cls:SetFont("RDSRP.25")
            cls:SetTextColor(_RDS:Color("WHITE", 255))
                cls.Paint = function(self,w,h)
                    if self:IsHovered() then 
                        draw.RoundedBox(0,0,0,w,h,Color(255,0,0))
                    else
                        surface.SetDrawColor(Color(255,0,0))
                        surface.DrawOutlinedRect(0,0,w,h,2)
                    end
                end
                cls.DoClick = function()
                    delite[k] = nil
                    net.Start("RDSRP.IConfig.Load")
                    net.WriteTable(_RDS.Admin.IConfig)
                    net.SendToServer()
                    _RDS.Adminsuite.UI.AdminSettings.Scroll:Clear()
                    RDSC.TOP:Remove()
                    RDSC:Main()  
                end
        end

        local Execute = vgui.Create("DPanel", panel)
        Execute:Dock(TOP)
        Execute:SetTall(scrh*0.2)
            Execute.Paint = nil 
        local AddQuest = Execute:Add("DButton")
        AddQuest:Dock(TOP)
        AddQuest:DockMargin(5,5,5,0)
        AddQuest:SetTall(scrh*0.05)
            AddQuest.Paint = function(self,w,h)
                self:SetFont("RDSRP.30")
                self:SetTextColor(_RDS:Color("WHITE", 255))
                self:SetText("Add Quest")
                local col = Color(59,59,59)
                draw.RoundedBox(14,0,0,w,h,Color(21,80,21))
                if self:IsHovered() then 
                    col = Color(21,80,21)
                else
                    col = Color(23,22,22,255)
                end
                draw.RoundedBox(14,2,2,w-4,h-4,col)
            end
            AddQuest.DoClick = function()
                local Window = vgui.Create( "RDSRP.BPanel" )
                Window:SetSize( ScrW() * 0.34, ScrW() * 0.2 )
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
                text:SetPlaceholderText("Question")
                local pnl = vgui.Create("DPanel", Window)
                pnl:Dock( TOP )
                pnl:DockMargin(10,5,10,0)
                    pnl.Paint = nil
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
                local close = vgui.Create("DButton", Window)
                close:Dock(BOTTOM)
                close:DockMargin(20,0,20,10)
                close:SetText( "Abbrechen" )
                close:SetTextColor( _RDS:Color("WHITE", 255))
                close:SetTall(ScrH() * 0.03 )
                    close.Paint = function(self,w,h)
                        local clr
                        if self:IsHovered() then 
                            draw.RoundedBoxEx(6,0,0,w,h,Color(0,255,13),true,true,true,true)
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
                    enter.DoClick = function(self,w,h)
                        local l = {
                            [text:GetText()] = {
                                correct = corract_c or false,
                            }
                        }
                        local pos = delite
                        table.Merge(pos, l)
                        net.Start("RDSRP.IConfig.Load")
                        net.WriteTable(_RDS.Admin.IConfig)
                        net.SendToServer()
                        Window:Remove()

                        _RDS.Adminsuite.UI.AdminSettings.Scroll:Clear()
                        RDSC.TOP:Remove()
                        RDSC:Main()                            
                    end 
            end
        local Delete = Execute:Add("DButton")
        Delete:Dock(TOP)
        Delete:DockMargin(5,5,5,0)
        Delete:SetTall(scrh*0.05)
            Delete.Paint = function(self,w,h)
                self:SetFont("RDSRP.30")
                self:SetTextColor(_RDS:Color("WHITE", 255))
                self:SetText("Delete")
                local col = Color(59,59,59)
                draw.RoundedBox(14,0,0,w,h,Color(255,0,0))
                if self:IsHovered() then 
                    col = Color(255,0,0)
                else
                    col = Color(23,22,22,255)
                end
                draw.RoundedBox(14,2,2,w-4,h-4,col)
            end
            Delete.DoClick = function()
                _RDS.Admin.IConfig["Qsys"].Questmodule[k] = nil
                net.Start("RDSRP.IConfig.Load")
                net.WriteTable(_RDS.Admin.IConfig)
                net.SendToServer()
                _RDS.Adminsuite.UI.AdminSettings.Scroll:Clear()
                RDSC.TOP:Remove()
                RDSC:Main()    
            end
            local Edit = Execute:Add("DButton")
            Edit:Dock(TOP)
            Edit:DockMargin(5,5,5,0)
            Edit:SetTall(scrh*0.05)
            Edit.Paint = function(self,w,h)
                    self:SetFont("RDSRP.30")
                    self:SetTextColor(_RDS:Color("WHITE", 255))
                    self:SetText("Edit")
                    local col = Color(59,59,59)
                    draw.RoundedBox(14,0,0,w,h,Color(255,123,0))
                    if self:IsHovered() then 
                        col = Color(255,123,0)
                    else
                        col = Color(23,22,22,255)
                    end
                    draw.RoundedBox(14,2,2,w-4,h-4,col)
                end
                Edit.DoClick = function()

                    local Window = vgui.Create( "RDSRP.BPanel" )
                    Window:SetSize( ScrW() * 0.34, ScrW() * 0.2 )
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
                    local number = vgui.Create("DNumberWang", Window)
                    number:Dock( TOP )
                    number:DockMargin( 10,5,10,0 )
                    number:SetTall(scrh*0.05)
                    number:SetPlaceholderText("Sort")
                    number:SetFont("RDS.Admin.btnply")
                    number:SetValue(k)
                    number:SetDisabled(true)
                    local text = vgui.Create("DTextEntry", Window)
                    text:Dock( TOP )
                    text:DockMargin(10,5,10,0)
                    text:SetTall(scrh*0.06)
                    text:SetFont("RDS.Admin.btnply")
                    text:SetPlaceholderText("Question")
                    text:SetText(v.Question)
                    local pnl = vgui.Create("DPanel", Window)
                    pnl:Dock( TOP )
                    pnl:DockMargin(10,5,10,0)
                        pnl.Paint = nil
                    local endquest = vgui.Create( "RDSRP.Switch", Window ) -- Create the checkbox
                    endquest:Dock( TOP )
                    endquest:DockMargin(10,5,10,0)
                    endquest:SetText("EndQuest?")
                    endquest:SetChecked( v.EndQuestion )
                    local endquest_c = false
                    endquest.OnChange = function(self)
                            if (self:GetChecked() == true) then 
                                endquest_c = true
                            else
                                endquest_c = false
                            end
                        end
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
                    enter:SetText( "Speichern" )
                    enter:SetTextColor( _RDS:Color("WHITE", 255))
                    enter:SetTall(ScrH() * 0.03 )
                        enter.Paint = function(self,w,h)
                            local clr
                            if self:IsHovered() then 
                                draw.RoundedBoxEx(6,0,0,w,h,Color(0,255,13),true,true,true,true)
                            end
                            draw.RoundedBox(6,2,2,w-4,h-4,Color(46,46,46))
                        end
                        enter.DoClick = function(self,w,h)

                            v.Question = text:GetText() or "NULL"
                            v.EndQuestion = endquest_c or false

                            net.Start("RDSRP.IConfig.Load")
                            net.WriteTable(_RDS.Admin.IConfig)
                            net.SendToServer()
                            Window:Remove()
                            _RDS.Adminsuite.UI.AdminSettings.Scroll:Clear()
                            RDSC.TOP:Remove()
                            RDSC:Main()                            
                        end 













                    --_RDS.Admin.IConfig["Qsys"].Questmodule[k] = nil
                   -- net.Start("RDSRP.IConfig.Load")
                    --net.WriteTable(_RDS.Admin.IConfig)
                   -- net.SendToServer()
                    --_RDS.Adminsuite.UI.AdminSettings.Scroll:Clear()
                   --RDSC.TOP:Remove()
                   -- RDSC:Main()    
                end





    end
end

 
function RDSC:Config()
    local scrw, scrh = ScrW(), ScrH()
    _RDS.Adminsuite.UI.AdminSettings.Scroll:Clear()
    RDSC.CConfig:Remove()
    _RDS.Adminsuite.UI:BackButton(function() RDSC.TOP:Remove() _RDS.Adminsuite.UI.AdminSettings.Scroll:Clear() RDSC:Main() end)

    local tbl = {}

    local pnl = vgui.Create("DPanel", _RDS.Adminsuite.UI.AdminSettings.Scroll)
    pnl:Dock( TOP )
    pnl:DockMargin( 0,0,0,0 )
    pnl:SetTall(scrh*0.9)

    pnl.Paint = nil

    local number = vgui.Create("DNumberWang", pnl)
    number:Dock( TOP )
    number:DockMargin( 10,5,scrw * 0.6,10 )
    number:SetTall(scrh*0.05)
    number:SetPlaceholderText("Sort")
    number:SetFont("RDS.Admin.btnply")

    local quest = vgui.Create("DTextEntry", pnl)
    quest:Dock( TOP )
    quest:DockMargin( 10,0,scrw * 0.4,0 )
    quest:SetTall(scrh*0.05)
    quest:SetPlaceholderText("Question")
    quest:SetFont("RDS.Admin.btnply")
    quest:SetPlaceholderText("Question")
	quest.OnTextChanged = function( self )
        tbl[number:GetValue()].Question = quest:GetText()
    end
    local add = vgui.Create("DButton", pnl)
    add:Dock( TOP )
    add:DockMargin( 10,5,scrw * 0.6,10 )
    add:SetTall(scrh*0.05)
    add:SetText("")
        add.Paint = function(self,w,h)
            if self:IsHovered() then 
                draw.RoundedBox(0,0,0,w,h,Color(8,49,8))
            else
                surface.SetDrawColor(Color(8,49,8))
                surface.DrawOutlinedRect(0,0,w,h,2)
            end
            draw.SimpleText("ADD", "RDSRP.25", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    local ans_panel = vgui.Create("DPanel", pnl)
    ans_panel:Dock( TOP )
    ans_panel:DockMargin( 15,0,15,0 )
    ans_panel:SetTall(scrh*0.35)
        ans_panel.Paint = function(self,w,h)
            surface.SetDrawColor(Color(47,47,47))
            surface.DrawOutlinedRect(0,0,w,h,2)
        end
    local ans = vgui.Create("DScrollPanel", ans_panel)
    ans:Dock( FILL )
        local function seeanswer()
            ans:Clear()
            for k, v in pairs(tbl[number:GetValue()].Answers) do  
                local m = ans:Add("DPanel")
                m:Dock(TOP)
                m:DockMargin(14,4,14,10)
                m:SetTall(scrh*0.03)
                    m.Paint = function(self,w,h)
                        draw.RoundedBox(0,0,0,w,h,Color(47,47,47))
                    end
                local ttl = vgui.Create("DLabel", m)
                ttl:Dock(LEFT)
                ttl:SetWide(scrw*0.4)
                ttl:DockMargin(0,0,5,0)
                ttl:SetText("")
                ttl:SetFont("RDSRP.25")
                    ttl.Paint = function(self,w,h)
                        surface.SetDrawColor(Color(29,28,28))
                        surface.DrawOutlinedRect(0,0,w,h,2)
                        draw.SimpleText(k, "RDSRP.25", 5, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

                    end
                local mp = vgui.Create("DLabel", m)
                mp:Dock(LEFT)
                mp:SetWide(scrw*0.06)
                mp:SetText("")
                    mp.Paint = function(self,w,h)
                        surface.SetDrawColor(Color(29,28,28))
                        surface.DrawOutlinedRect(0,0,w,h,2)
                        draw.SimpleText(tostring(v.correct), "RDSRP.25", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
                local cls = vgui.Create("DButton", m)
                cls:Dock(RIGHT)
                cls:DockMargin(0,0,0,0)
                cls:SetWide(scrw*0.02)
                cls:SetText("✖")
                cls:SetFont("RDSRP.25")
                cls:SetTextColor(_RDS:Color("WHITE", 255))
                    cls.Paint = function(self,w,h)
                        if self:IsHovered() then 
                            draw.RoundedBox(0,0,0,w,h,Color(255,0,0))
                        else
                            surface.SetDrawColor(Color(255,0,0))
                            surface.DrawOutlinedRect(0,0,w,h,2)
                        end
                    end
                cls.DoClick = function(self,w,h)
                    tbl[number:GetValue()].Answers[k] = nil 
                    ans:Clear()
                        timer.Simple(0.2, function()
                            seeanswer()
                        end)
                end
            end
        end
    local eq = vgui.Create("DPanel", pnl)
    eq:Dock( TOP )
    eq:DockMargin( 0,0,0,0 )
    eq:SetTall(scrh*0.03)
        eq.Paint = nil
    local endquest = vgui.Create( "RDSRP.Switch", eq ) -- Create the checkbox
    endquest:Dock( LEFT )
    endquest:DockMargin(10,5,10,0)
    endquest:SetText("Ist das die Endfrage?")
    endquest:SetChecked( false )
        endquest.OnChange = function(self)
            if (self:GetChecked() == true) then 
                tbl[number:GetValue()].EndQuestion = true
            else
                tbl[number:GetValue()].EndQuestion = false
            end
        end

    add.DoClick = function()
        local Window = vgui.Create( "RDSRP.BPanel" )
            Window:SetSize( ScrW() * 0.34, ScrW() * 0.2 )
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
            text:SetPlaceholderText("Question")
            local pnl = vgui.Create("DPanel", Window)
            pnl:Dock( TOP )
            pnl:DockMargin(10,5,10,0)
                pnl.Paint = nil
            local truue = vgui.Create("DCheckBoxLabel", pnl)
            truue:Dock( LEFT )
            truue:DockMargin(10,5,10,0)
            truue:SetText( "Correct" )
            local close = vgui.Create("DButton", Window)
            close:Dock(BOTTOM)
            close:DockMargin(20,0,20,10)
            close:SetText( "Abbrechen" )
            close:SetTextColor( _RDS:Color("WHITE", 255))
            close:SetTall(ScrH() * 0.03 )
                close.Paint = function(self,w,h)
                    local clr
                    if self:IsHovered() then 
                        draw.RoundedBoxEx(6,0,0,w,h,Color(0,255,13),true,true,true,true)
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
                        local l = {
                            [text:GetText()] = {
                                correct = truue:GetChecked() or false,
                            }
                        }
                        local pos = tbl[number:GetValue()].Answers
                        table.Merge(pos, l)
                        PrintTable(tbl)
                        Window:Remove()
                        ans:Clear()
                            timer.Simple(0.2, function()
                                seeanswer()
                            end)
                    end
        end
        local addd = vgui.Create("DButton", pnl)
        addd:Dock( TOP )
        addd:DockMargin( 10,5,scrw * 0.6,10 )
        addd:SetTall(scrh*0.05)
        addd:SetText("") 
            addd.DoClick = function()
                if quest:GetText() == "" then 
                    return 
                    _RDS:Notify("error", "FEHLER!", "Füge eine Frage bei 'Question' ein", 2)
                end
                local ins = _RDS.Admin.IConfig["Qsys"].Questmodule
                table.Merge(ins, tbl)
                net.Start("RDSRP.IConfig.Load")
                net.WriteTable(_RDS.Admin.IConfig)
                net.SendToServer()
                _RDS:Notify("success", "Erstellt!", "Du hast Erfolgreich die Frage Erstellt!", 2)
                _RDS.Adminsuite.UI.AdminSettings.Scroll:Clear()
                RDSC.TOP:Remove()
                RDSC:Main()  
            end
            addd.Paint = function(self,w,h)
                if self:IsHovered() then 
                    draw.RoundedBox(0,0,0,w,h,Color(8,49,8))
                else
                    surface.SetDrawColor(Color(8,49,8))
                    surface.DrawOutlinedRect(0,0,w,h,2)
                end
                draw.SimpleText("Hinzufügen", "RDSRP.25", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        // is here, because it have to become the other locals for Disable!
        //
        local disabledthings = {
            [quest] = true,
            [add] = true,
            [addd] = true,
            [endquest] = true,
            [ans] = true,
        }
        
        number.OnValueChange = function(self)
            tbl = {}
            tbl[self:GetValue()] = { Question = "", EndQuestion = false, Answers = {} }
            PrintTable(tbl)
            if self:GetValue() == 0 then 
                for k,v in pairs(disabledthings) do 
                    k:SetDisabled(true)
                end
            else
                for k,v in pairs(disabledthings) do 
                    k:SetDisabled(false)
                end
            end
            seeanswer()
        end
        for k,v in pairs(disabledthings) do 
            k:SetDisabled(true)
        end
end

