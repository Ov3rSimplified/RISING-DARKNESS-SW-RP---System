--
local Gtbl = _RDS.QuestSystem  
   
local points = 0
local toptitle = "OOC-Ausbildungs Abfrage" 
local passed = false 
local try

function Gtbl.OpenMenu()

    local scrw, scrh = ScrW(), ScrH()
    toptitle = "OOC-Ausbildungs Abfrage"
 
    Gtbl.Frame = vgui.Create("RDSRP.BPanel")--"RDSRP.BPanel")
    Gtbl.Frame:SetSize(scrw*0.5, scrh*0.69)
    Gtbl.Frame:Center()
    Gtbl.Frame:MakePopup()

        Gtbl.Frame.Paint = function(self,w,h)
            --draw.RoundedBox(5,0,0,w,h,Color(255,255,255)) --255,193,7,255
            draw.RoundedBox(15,0,0,w,h,Color(23,22,22,255))
        end

    Gtbl.Top = vgui.Create("DPanel", Gtbl.Frame)
    Gtbl.Top:Dock(TOP)
    Gtbl.Top:DockMargin(0,0,0,0)
    Gtbl.Top:SetTall(scrh*0.09)

        Gtbl.Top.Paint = function(self,w,h)
            draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,false,false)
            draw.SimpleText(toptitle, "RDSRP.QeSt.MainTitle", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
        
    Gtbl.Scroll = vgui.Create("DScrollPanel", Gtbl.Frame)
    Gtbl.Scroll:Dock(FILL)
    Gtbl.Scroll:DockMargin(10,0,10,0)

    Gtbl.Bottom = vgui.Create("DPanel", Gtbl.Frame)
    Gtbl.Bottom:Dock(BOTTOM)
    Gtbl.Bottom:DockMargin(0,0,0,20)
    Gtbl.Bottom:SetTall(scrh*0.06)

        Gtbl.Bottom.Paint = nil
end
 

local dat = 1

local function Elements()
    
    local gpa = Gtbl.Frame
    local gsa = Gtbl.Scroll
    local scrw, scrh = ScrW(), ScrH()

        local title = gsa:Add("DLabel")
        title:Dock( TOP )
        title:DockMargin(0,15,0,20)
        title:SetTall(scrh*0.05)
        title:SetText("")
            title.Paint = function(self,w,h)
                draw.SimpleText(_RDS.Admin.IConfig["Qsys"].Questmodule[dat].Question or "N/A", "RDSRP.QeSt.QuestTitle", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end

        if try == 0 or passed then 
            title:Remove()
            toptitle = "Fehler beim Öffnen!"

            local errortxt = gsa:Add("DLabel")
            errortxt:Dock( TOP )
            errortxt:DockMargin(0,scrh*0.14,0,20)
            errortxt:SetTall(scrh*0.35)
            errortxt:SetText("")
            errortxt.Paint = function(self,w,h)
                local txt
                local space = "             "
                    if passed then 
                        txt = "Du hast bereits erfolgreich den \n"..space.."Test bestanden!"
                    elseif try == 0 then 
                        txt = "Du hast leider keine Versuche mehr!\nBitte Rufe einen Admin um mehr\nVersuche zu erhalten"
                    end
                    draw.DrawText(txt, "RDSRP.QeSt.QuestTitle", scrw*0.085, 0, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT)
                end
        end

    for k, v in pairs(_RDS.Admin.IConfig["Qsys"].Questmodule[dat].Answers) do
        if try == 0 or passed then 
            continue  
        end
        local btn = gsa:Add("DButton")
        btn:Dock(TOP)
        btn:DockMargin(0,0,0,5)
        btn:SetTall(scrh*0.08) 
        btn:SetText("")
        

            btn.Paint = function(self,w,h)
                local clr = _RDS:Color("WHITE", 255)
                if self:IsHovered() then 
                    draw.RoundedBox(5,0,0,w,h,Color(0,225,255)) --255,193,7,255
                    clr = Color(0,225,255)
                end
                    
                draw.RoundedBox(5,2,2,w-4,h-4,Color(47,47,47))
                draw.SimpleText(k, "RDSRP.QeSt.Quest", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end

            btn.DoClick = function()
                if _RDS.Admin.IConfig["Qsys"].Questmodule[dat].EndQuestion == true then 
                    Gtbl.Scroll:Clear()
                    timer.Simple(0.1, function()
                        Gtbl.Endscreen()
                    end)
                    if _RDS.Admin.IConfig["Qsys"].Questmodule[dat].Answers[k].correct then
                        points = points + 1
                    end

                else
                    if _RDS.Admin.IConfig["Qsys"].Questmodule[dat].Answers[k].correct then 
                        points = points + 1
                    end

                    Gtbl.Scroll:Clear()
                    dat = dat + 1
                    timer.Simple(0.1, function()
                        Elements()
                    end)
                end
        end
    end 
 
    local close = Gtbl.Bottom:Add("DButton")
    close:SetText("")
    close:Dock(FILL)
    close:DockMargin(scrw*0.080,0,scrw*0.080,0)
        close.DoClick = function()
            if try == 0 or passed then 
                Gtbl.Frame:Remove()
            else
                Derma_Query( "Dadurch Verlierst du deine Punkte!",
                "Stopp! Möchtest du wirklich abbrechen?", 
                "ja!", function() Gtbl.Frame:Remove() points = 0 dat = 1 end, "Nein", function() end )
            end
        end  

        close.Paint = function(self,w,h)
            local clr = _RDS:Color("WHITE", 255)
            if self:IsHovered() then 
                draw.RoundedBox(5,0,0,w,h,Color(255,123,0)) --255,193,7,255
                clr = Color(255,123,0)
            end
                
            draw.RoundedBox(5,2,2,w-4 , h-4,Color(47,47,47))
            draw.SimpleText("Schließen", "RDSRP.QeSt.Quest", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
end

local function Endscreen()
    local scrw, scrh = ScrW(), ScrH()

    toptitle = "Ergebnis "..points.." von "..table.Count(_RDS.Admin.IConfig["Qsys"].Questmodule)..""

    local txt
    local half = math.Round( table.Count( _RDS.Admin.IConfig["Qsys"].Questmodule ) / 2 )
 
    if points < half then  
        txt = "Du hast nicht Bestanden!"
        try = try - 1
    end
        if try == 0 then 
            local stbl = {
                what = "notpassed", 
                var = "quest_notpassed",
                ply = LocalPlayer():SteamID()
            }
            net.Start("RDS.Questsystem.system")
            net.WriteTable(stbl)
            net.SendToServer()
        end

        if try == 1 then
            local stbl = {
                what = "notpassed", 
                var = "quest_1try",
                ply = LocalPlayer():SteamID()
            }
            net.Start("RDS.Questsystem.system")
            net.WriteTable(stbl)
            net.SendToServer()
        end
    if points > half then 
        txt = "Du hast Bestanden!"

            local stbl = {
                what = "passed", 
                var = "quest_passed",
                ply = LocalPlayer():SteamID()
            }
            net.Start("RDS.Questsystem.system")
            net.WriteTable(stbl)
            net.SendToServer() 
            _RDS:Notify("success", "Bestanden!", "Du hast erfolgreich den OOC-Test bestanden!", 4)
        end
    if points == half then 
        txt = "Versuche es Erneut"
    end

    local text = Gtbl.Scroll:Add("DLabel")
    text:Dock( TOP )
    text:DockMargin(0,20,0,30)
    text:SetTall(scrh*0.05)
    text:SetText("")
    text.Paint = function(self,w,h)
            draw.SimpleText(txt, "RDSRP.QeSt.QuestTitle", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
end

function Gtbl.Init()

    net.Start("RDS.Questsystem.Readall")
    net.SendToServer()

    
    local stbl = { 
        what = "Create",
        ply = LocalPlayer():SteamID()
    }

    net.Start("RDS.Questsystem.system")
    net.WriteTable(stbl)
    net.SendToServer()

 timer.Simple(0.2, function()

    
    for k, v in pairs(_RDS.QuestSystem.Readall) do
        if v.var == "quest_notpassed" then 
            try = 0
        end
        if v.var == "quest_1try" then 
            try = try
        end
        if v.var == "new" then 
            try = 2
            passed = false
        end
        if v.var == "quest_passed" then 
            passed = true
        end
    end 

       Gtbl.OpenMenu()
        Elements()

    end)
end

function Gtbl.Endscreen()
    Endscreen()
end


concommand.Add("_RDS.OpenQuestsyquestion", Gtbl.Init)

concommand.Add("dg", function()
    PrintTable(_RDS.QuestSystem.Readall) 
end)
 
net.Start("RDS.Questsystem.Readall")
net.SendToServer()

hook.Add("InitPostEntity", "_RDS.Questsystem.Init", function()
    net.Start("RDS.Questsystem.Readall")
    net.SendToServer()

    for k, v in pairs(_RDS.QuestSystem.Readall) do
        if v.var == "quest_notpassed" then 
            try = 0
        end
        if v.var == "quest_1try" then 
            try = try
        end
        if v.var == "new" then 
            try = 2
            passed = false
        end
        if v.var == "quest_passed" then 
            passed = true
        end 
    end  

end) 

net.Receive("RDS.Questsystem.Readall", function()
    local tl = net.ReadType()
    _RDS.QuestSystem.Readall = tl
end)     


