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
    },
    {
        id = 1, 
        name = "Spezialisierungen",
        func = function()
            RDSUI:SpecialisationSettings()
        end
    },
    {
        id = 1, 
        name = "Fraktionsystem",
        func = function()
            RDSUI:Factionsys()
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
 