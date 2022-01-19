/*
local Scoreboard = Scoreboard or {}
Scoreboard.Counts = Scoreboard.Counts or {}


local function CreateFirstPanel()
    Scoreboard.Sizes = {}

end

local function CreateCategoryPanel(data)
    local job = data:getJobTable()



    if (not Scoreboard.Counts[job.category]) then
        local pnl = vgui.Create("DPanel", Scoreboard.Scroll)
        pnl:Dock(TOP)
        pnl:DockMargin(0,10,0,0)
        pnl:SetTall( ScrH()*0.15)

        pnl.Paint = function(self, w, h)
            draw.RoundedBox(0, 0, 0, w, h, _RDS:Color("BLACK", 130))
            draw.SimpleText(job.category, "rds_scoreboard_categ", self:GetWide()/2, ScrH() * 0.04, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.RoundedBox(0, ScrW() * 0.35, ScrH() * 0.08, ScrW() * 0.20, 10, _RDS:Color("WHITE", 255))
            draw.SimpleText(Scoreboard.Counts[job.category], "rds_scoreboard_categ", self:GetWide()/2, ScrH() * 0.12, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
 
        end
        Scoreboard.Counts[job.category] = 1



        local Anzahl = pnl:Add("DLabel")
        Anzahl:SetFont("rds_scoreboard_rowtext")
        Anzahl:SetText(1)
        Anzahl:SizeToContentsY(5)
        Anzahl:SetWide(Scoreboard.Sizes[2])
        Anzahl:SetContentAlignment(5) 
        Anzahl:Dock(LEFT)

        Anzahl.Think = function(self)
            self:SetText(Scoreboard.Counts[job.category])
        end


    else
        Scoreboard.Counts[job.category] = Scoreboard.Counts[job.category] + 1
    end
end

function Scoreboard.FillPlayers()
    CreateFirstPanel()

    for k, v in ipairs(player.GetAll()) do
        if (IsEntity(v) and v:IsPlayer() or IsBot(v)) then
            CreateCategoryPanel(v)
        end
    end
end

function Scoreboard.Open()
    if(not Scoreboard.Kategorien) then
        Scoreboard.Kategorien = {}
        for k, v in ipairs(DarkRP.getCategories().jobs) do
            Scoreboard.Kategorien[v.name] = v.color
        end
    end
    Scoreboard.Menu = vgui.Create("DPanel")
    Scoreboard.Menu:SetSize(ScrW() * 0.9, ScrH() * 0.9)
    Scoreboard.Menu:Center()
    Scoreboard.Menu:MakePopup()

        Scoreboard.Menu.Paint = function(self, w, h)
            draw.RoundedBox(0, 0, 0, w, h, _RDS:Color("WET ASPHALT", 250))
        end

    Scoreboard.Titlebar = Scoreboard.Menu:Add("DPanel")
    Scoreboard.Titlebar:Dock(TOP)
    Scoreboard.Titlebar:SetHeight(Scoreboard.Menu:GetTall() * 0.14)

        Scoreboard.Titlebar.Paint = function(self, w, h)
            draw.RoundedBox(0, 0, 0, w, h, _RDS:Color("BLACK", 250))
        end

    Scoreboard.Scroll = Scoreboard.Menu:Add("DScrollPanel")
    Scoreboard.Scroll:Dock(FILL)
    Scoreboard.Scroll.Paint = function(self, w, h) return end
    
    local title = Scoreboard.Titlebar:Add("DLabel")
    title:Dock(FILL)
    title:SetText("RDS - DevBox")
    title:SetContentAlignment(5)
    title:SetFont("rds_scoreboard_title")
    Scoreboard.FillPlayers()

    local line =  Scoreboard.Titlebar:Add("DLabel")
    line:Dock(BOTTOM)
    line:SetText("")
    
        line.Paint = function(self,w,h)
            draw.RoundedBox(0, 0, 0, w, h, _RDS:Color("WHITE", 250))
        end
end

function Scoreboard.Hide()
    if (Scoreboard.Menu) then
        Scoreboard.Menu:Remove()
    end
end

hook.Add("ScoreboardShow", "RDS_SC_S", function()
    Scoreboard.Open()

    return true
end)

hook.Add("ScoreboardHide", "RDS_SC_H", function()
    Scoreboard.Hide()

    if (Scoreboard.Counts) then
        Scoreboard.Counts = {}
    end

    return true
end)

timer.Simple(0.1, function()
    hook.Remove("ScoreboardHide", "FAdmin_scoreboard")
    hook.Remove("ScoreboardShow", "FAdmin_scoreboard")

    surface.CreateFont("rds_scoreboard_title", {
        font = "Arial",
        weight = 10,
        antialias = true
    })

    surface.CreateFont("rds_scoreboard_categ", {
        font = "CloseCaption_Bold",
        weight = 10,
        antialias = true
    })
    surface.CreateFont("rds_scoreboard_rowtext", {
        font = "CloseCaption_Bold",
        weight = 10,
        antialias = true
    })
end)
*/
