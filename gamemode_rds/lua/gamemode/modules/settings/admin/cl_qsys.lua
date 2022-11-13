
_RDS.Admin.QSys = _RDS.Admin.QSys or {}

local Gtbl = _RDS.Admin.QSys
local red = Color(250,0,0)
local orange = Color(255,94,0)

function Gtbl:OpenConfigView()
    local scrw,scrh = ScrW(), ScrH()
    local ScrollP =  _RDS.PlayerSettings.Menu.Admin.Main

    Gtbl.top = vgui.Create("DPanel", _RDS.PlayerSettings.Menu.Admin.Main ) 
    Gtbl.top:Dock(TOP)
    Gtbl.top:DockMargin(0,10,0,20)
    Gtbl.top:SetText("")
    Gtbl.top:SetTall(scrh*0.045)

    Gtbl.top.Paint = nil
 

    local add = vgui.Create("DButton", Gtbl.top)
    add:Dock(FILL)
    add:DockMargin(10,0,10,0)
    add:SetWide(scrw*0.090)
    add:SetText("")

        add.Paint = function(self,w,h)
            local clr = _RDS:Color("WHITE", 255)
            if self:IsHovered() then 
                draw.RoundedBox(5,0,0,w,h,Color(255,123,0)) --255,193,7,255
                clr = Color(255,123,0)
            end
                
            draw.RoundedBox(5,2,2,w-4 , h-4,Color(47,47,47))
            draw.SimpleText("Add", "RDS.Admin.btn", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

        add.DoClick = function()
            add:Remove()
            ScrollP:Clear()
            Gtbl:Add()
        end


    local sbar = ScrollP:GetVBar()
    sbar:SetSize(0,0)
    function sbar:Paint(w, h) return end
    function sbar.btnUp:Paint(w, h) return end
    function sbar.btnDown:Paint(w, h) return end
    function sbar.btnGrip:Paint(w, h) return end

    Gtbl.Item = ScrollP:Add("DScrollPanel")
    Gtbl.Item:Dock(TOP)
    Gtbl.Item:DockMargin(0,0,0,0)
    Gtbl.Item:SetTall(scrh*0.6)
    
    local sbar = Gtbl.Item:GetVBar()
    sbar:SetSize(20,0)
    sbar:SetHideButtons( true )
    function sbar.btnGrip:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(255,0,0),false,false,false,false) end
    function sbar:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),false,false,false,false) end
    function sbar.btnUp:Paint(w, h) return end
    function sbar.btnDown:Paint(w, h) return end
    
    
    for k,v in pairs(_RDS.Admin.IConfig["Qsys"].Questmodule) do     
 
        local m = Gtbl.Item:Add("DCollapsibleCategory")
        m:Dock(TOP)
        m:DockMargin(10,0,10,10)
        m:SetHeaderHeight(scrh*0.05)
        m:SetLabel("")

        m.Paint = function(self,w,h)
            if self:GetExpanded() == true then  
                draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
            else
                draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
            end

            draw.SimpleText(v.Question, "RDS.Admin.btnply", self:GetWide()/2, scrh*0.025, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end


        local p = vgui.Create("DPanel", m)
        p:Dock(TOP)
        p:SetTall(scrh*0.2)

            p.Paint = function(self,w,h)
              draw.RoundedBoxEx(14,2,2,w-4,h-4,Color(23,22,22,255),false,false,true,true)
            end


        local p1 = p:Add("DPanel")
        p1:Dock(LEFT)
        p1:DockMargin(0,0,0,0)
        p1:SetWide(scrw*0.240)

            p1.Paint = nil


            local p11 = vgui.Create("DLabel", p1)
            p11:Dock(TOP)
            p11:DockMargin(5,15,0,0)
            p11:SetText("Number: "..k)
            p11:SetFont("RDS.Admin.Configsmall")


            local p12 = vgui.Create("DLabel", p1)
            p12:Dock(TOP)
            p12:DockMargin(5,15,0,0)
            p12:SetText("EndQuestion: "..tostring(v.EndQuestion))
            p12:SetFont("RDS.Admin.Configsmall")

        local p2 = p:Add("DScrollPanel", p)
        p2:Dock(RIGHT)
        p2:DockMargin(0,0,0,0)
        p2:SetWide(scrw*0.240)


        local sbar = p2:GetVBar()
        sbar:SetSize(0,0)
        function sbar:Paint(w, h) return end
        function sbar.btnUp:Paint(w, h) return end
        function sbar.btnDown:Paint(w, h) return end
        function sbar.btnGrip:Paint(w, h) return end
    

        local delite = _RDS.Admin.IConfig["Qsys"].Questmodule

            for k, v in pairs(_RDS.Admin.IConfig["Qsys"].Questmodule[k].Answers) do    

                local mn = p2:Add("DCollapsibleCategory")
                mn:Dock(TOP)
                mn:DockMargin(0,5,5,0)
                mn:SetHeaderHeight(scrh*0.03)
                mn:SetLabel(k)
                mn:SetExpanded(false)

                local mnp = vgui.Create("DLabel", mn)
                mnp:Dock(TOP)
                mnp:DockMargin(0,0,0,0)
                mnp:SetText("")
                    
                    mnp.Paint = function(self,w,h)
                        draw.SimpleText("Correct: "..tostring(v.correct), "DermaDefault", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
            end


            local del = vgui.Create("DButton", p1)
            del:Dock(BOTTOM)
            del:DockMargin(scrw*0.070,0,scrw*0.070,10)
            del:SetTall(scrh*0.03)
            del:SetText("")

                del.Paint = function(self,w,h)
                    local clr = _RDS:Color("WHITE", 255)
                    if self:IsHovered() then 
                        draw.RoundedBox(5,0,0,w,h,red) --255,193,7,255
                        clr = red
                    end
                        
                    draw.RoundedBox(5,2,2,w-4 , h-4,Color(47,47,47))
                    draw.SimpleText("Delete", "RDS.Admin.Configsmall", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end


                del.DoClick = function()
                    chat.AddText(red, "[RDS:RP] ", Color(19,160,241), [[Your deleted "answer" was correctly printed in the console!]])
                    MsgC(red, "[RDS:RP] ", Color(255,255,255), "================================================\n")

                    for k,v in pairs(_RDS.Admin.IConfig["Qsys"].Questmodule) do     
                        PrintTable(_RDS.Admin.IConfig["Qsys"].Questmodule[k])
                    end

                    _RDS:Notify("success", "Gelöscht!", "Du hast Erfolgreich die Frage gelöscht!", 2)

                    _RDS.Admin.IConfig["Qsys"].Questmodule[k] = nil
                    net.Start("RDSRP.IConfig.Load")
                    net.WriteTable(_RDS.Admin.IConfig)
                    net.SendToServer()

                    _RDS.PlayerSettings.Menu.Admin.Main:Clear()
                    timer.Simple(0.1, function()
                        Gtbl:OpenConfigView()
                    end)
                    
                 end

                 /*

                local edit = vgui.Create("DButton", p1)
                edit:Dock(BOTTOM)
                edit:DockMargin(scrw*0.070,0,scrw*0.070,10)
                edit:SetTall(scrh*0.03)
                edit:SetText("")
    
                edit.Paint = function(self,w,h)
                        local clr = _RDS:Color("WHITE", 255)
                        if self:IsHovered() then 
                            draw.RoundedBox(5,0,0,w,h,orange) --255,193,7,255
                            clr = orange
                        end
                            
                        draw.RoundedBox(5,2,2,w-4 , h-4,Color(47,47,47))
                        draw.SimpleText("Edit", "RDS.Admin.Configsmall", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end

                edit.DoClick = function()
                end

            */
    end
end


function Gtbl:Add()
    local scrw,scrh = ScrW(), ScrH()
    local ScrollP =  _RDS.PlayerSettings.Menu.Admin.Main

    local tbl = {}

    local pnl = vgui.Create("DPanel", ScrollP)
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

        _RDS.PlayerSettings.Menu.Admin.Main:Clear()
            timer.Simple(0.1, function()
                Gtbl:OpenConfigView()
            end)
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
