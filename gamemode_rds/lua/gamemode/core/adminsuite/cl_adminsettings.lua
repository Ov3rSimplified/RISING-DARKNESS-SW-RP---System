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
//** [[   Adminsuite | cl_adminsettings.lua   ]]** \\
local RDSUI = _RDS.Adminsuite.UI.AdminSettings

/* Usable Vars
 - RDSUI.Scroll
*/
function RDSUI:RegisterSelection()
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
    _RDS.Adminsuite.UI.Select:AddSheet( "Arabica", Panel, Color(0,255,157), "materials/rdsrp/icon/admin_setting.png", _RDS.Adminsuite.UI.AdminSettings.Scroll)
    RDSUI:Selection()
end

/* Usable Vars
 - RDSUI.PlayerSelect
 - RDSUI.ServerSelect
*/
function RDSUI:Selection()
    local scrw, scrh = ScrW(), ScrH()
    local Playerr = RDSUI.Scroll:Add("DButton")
    Playerr:Dock(TOP)
    Playerr:DockMargin(5,5,5,0)
    Playerr:SetTall(scrh * 0.12 )
    Playerr:SetText( "" )
        Playerr.Paint = function(self,w,h)
            local clr = _RDS:Color("WHITE", 255)
            if self:IsHovered() then  clr = _RDS:Color("PETER RIVER", 255) draw.RoundedBox(5,0,0,w,h,clr) end
            draw.RoundedBox(5,2,2,w-4,h-4,Color(47,47,47))
            draw.SimpleText("Player", "RDS.Admin.btnply", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
        Playerr.DoClick = function()
            RDSUI:PlayerSettings()
        end
    RDSUI.PlayerSelect = Playerr
    local Server = RDSUI.Scroll:Add("DButton")
    Server:Dock(TOP)
    Server:DockMargin(5,5,5,0)
    Server:SetTall(scrh * 0.12 )
    Server:SetText( "" )
        Server.Paint = function(self,w,h)
            local clr = _RDS:Color("WHITE", 255)
            if self:IsHovered() then clr = _RDS:Color("PETER RIVER", 255)  draw.RoundedBox(5,0,0,w,h,clr) end
            draw.RoundedBox(5,2,2,w-4,h-4,Color(47,47,47))
            draw.SimpleText("Modules", "RDS.Admin.btnply", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
        Server.DoClick = function()
            RDSUI:ServerSettings()
        end
        RDSUI.ServerSelect = Server
end 

/* Usable Vars 
 - RDSUI.PlayerButton
*/
function RDSUI:PlayerSettings()
    RDSUI.Scroll:Clear()

    local scrw, scrh = ScrW(), ScrH()

    local search = _RDS.Adminsuite.UI.Select:Add("DTextEntry")
    search:Dock(TOP)
    search:DockMargin(5,5,5,0)
    search:SetTall(scrh*0.04)
    search:SetPlaceholderText("Suchen")
    search:SetFont("RDSRP.25")
    _RDS.Adminsuite.UI:BackButton(function() search:Remove() RDSUI.Scroll:Clear() RDSUI:Selection() end)

    for k,ply in pairs(player.GetAll()) do 
            
        local items = {}

        local function playerbutton(ply)
            local playerbutton = {}
            playerbutton.Button = RDSUI.Scroll:Add("DButton")
            playerbutton.Button:Dock(TOP)
            playerbutton.Button:DockMargin(5,5,5,0)
            playerbutton.Button:SetTall(scrh*0.1)
            playerbutton.Button:SetText( ply:GetName() )
            playerbutton.Button:SetFont("RDS.Admin.btnply")
            playerbutton.Button:SetTextColor(_RDS:Color("WHITE", 255))
            playerbutton.Button.Paint = function(self,w,h)
                    local clr = _RDS:Color("WHITE", 255)
                    if self:IsHovered() then clr = _RDS:Color("PETER RIVER", 255) draw.RoundedBox(5,0,0,w,h,clr) else  clr = _RDS:Color("WHITE", 255) end
                    self:SetTextColor(clr) 
                    draw.RoundedBox(5,2,2,w-4,h-4,Color(47,47,47))
                end

            table.insert(items, playerbutton)
            RDSUI.PlayerButton = playerbutton.Button

            local Avatar = vgui.Create( "RDSRP.CircleAvatar",  playerbutton.Button )
            Avatar:SetPos(10,0)
            Avatar:SetSize(scrw*0.060,playerbutton.Button:GetTall())
            Avatar:SetPlayer( ply, 16 )
            Avatar:SetMaskSize( 50 )
        end    


        function search:OnChange()
            local search_text = self:GetText():lower()
            if (#search_text == 0) then
                for _,v in pairs(items) do
                    v.Button:SetVisible(true)
                end
            else
                for _,v in pairs(items) do
                    if (v.Button:GetText():lower():find(search_text,1,true)) then
                        v.Button:SetVisible(true)
                    else
                        v.Button:SetVisible(false)
                    end
                end
            end
        end

        playerbutton(ply) // Call the Playerbuttons

        local function Playersite(ply)
            net.Start("RDSRP.IPlayer.GetCharacterID")
            net.WriteType(ply)
            net.SendToServer()

            timer.Simple(0.4, function()
                
            search:Remove()
            RDSUI.Scroll:Clear()
            _RDS.Adminsuite.UI:BackButton(function() RDSUI.Scroll:Clear() RDSUI:PlayerSettings() end)

            local pnl = RDSUI.Scroll:Add("DPanel")
            pnl:Dock(TOP) 
            pnl:DockMargin(0,0,0,0) 
            pnl:SetTall(scrh*0.12) 
                pnl.Paint = nil
            local lblb = vgui.Create("DLabel", pnl)
            lblb:Dock(FILL)
            lblb:DockMargin(0,0,0,0)
            lblb:SetText( "" )
                lblb.Paint = function(self,w,h)
                    draw.SimpleText(ply:GetName().." | "..steamworks.GetPlayerName( ply:SteamID64() ) , "RDS.Admin.btnply", self:GetWide() / 2 - scrw * 0.26, self:GetTall() / 2 - 9, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                end 
            local Avatar = vgui.Create( "RDSRP.CircleAvatar", pnl )
            Avatar:SetPos(scrw*0.01,0)
            Avatar:SetSize(scrw*0.060,scrh*0.1)
            Avatar:SetPlayer( ply, 16 )
            Avatar:SetMaskSize( 50 )
            
            
            local TOPPanel = RDSUI.Scroll:Add("DPanel")
            TOPPanel:Dock(TOP)
            TOPPanel:SetTall(scrh * 0.34)
            TOPPanel:DockMargin(10,0,0,0) 
            TOPPanel.Paint = nil
            local Info = TOPPanel:Add("DPanel")
            Info:Dock(LEFT)
            Info:SetWide(scrh * 0.34)
                Info.Paint = function(self,w,h)
                    draw.RoundedBoxEx(10,0,0,w,h,Color(53,53,53),false,false,true,true)
                end
            local ID = vgui.Create("DLabel", Info)
            ID:Dock(TOP)
            ID:DockMargin(3,3,3,0)
            ID:SetTall(scrh*0.05)
            ID:SetText("  ID: "..tostring(_RDS.CharacterID))
            ID:SetFont("RDSRP.30")
            ID:SetTextColor(Color(255,255,255))
                ID.Paint = function(self,w,h)
                    surface.SetDrawColor(Color(47,47,47)) 
                    surface.DrawOutlinedRect(0,0,w,h,2)
                end 
            local ID2 = vgui.Create("DPanel", Info)
            ID2:Dock(TOP)
            ID2:DockMargin(3,3,3,0)
            ID2:SetTall(scrh*0.05)
                ID2.Paint = function(self,w,h)
                    surface.SetDrawColor(Color(47,47,47)) 
                    surface.DrawOutlinedRect(0,0,w,h,2)
                    draw.SimpleText("  Get", "RDSRP.30", 2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                end
            local s64 = ID2:Add("DButton")
            s64:Dock(RIGHT)
            s64:DockMargin(0,5,5,5)
            s64:SetText("64")
            s64:SetFont("RDSRP.30")
                s64.Paint = function(self,w,h)
                    surface.SetDrawColor(_RDS:Color("WHITE", 255))
                    surface.DrawOutlinedRect(0,0,w,h,2)
                    local col = _RDS:Color("WHITE", 255)
                    if self:IsHovered() then draw.RoundedBox(0,0,0,w,h,_RDS:Color("WHITE", 255)) col = _RDS:Color("BLACK", 255) end
                    self:SetTextColor(col)
                end
                s64.DoClick = function()
                    if ply:IsPlayer() then 
                        _RDS:Notify("success", "Erfolgreich!", "Du hast die SteamID kopiert!", 2)
                        SetClipboardText( ply:SteamID() )
                    else
                        _RDS:Notify("error", "Fehler!", "Diese/-r/Das Hat keine 64ID", 2)
                    end
                end
            local sid = ID2:Add("DButton")
            sid:Dock(RIGHT)
            sid:DockMargin(0,5,5,5)
            sid:SetText("ID")
            sid:SetFont("RDSRP.30")
                sid.Paint = function(self,w,h)
                    surface.SetDrawColor(_RDS:Color("WHITE", 255))
                    surface.DrawOutlinedRect(0,0,w,h,2)
                    local col = _RDS:Color("WHITE", 255)
                    if self:IsHovered() then draw.RoundedBox(0,0,0,w,h,_RDS:Color("WHITE", 255)) col = _RDS:Color("BLACK", 255) end
                    self:SetTextColor(col)
                end
                sid.DoClick = function()
                    if ply:IsPlayer() then 
                        _RDS:Notify("success", "Erfolgreich!", "Du hast die Steam[64]ID kopiert!", 2)
                        SetClipboardText( ply:SteamID64() )
                    else
                        _RDS:Notify("error", "Fehler!", "Diese/-r/Das Hat keine 64ID", 2)
                    end
                end
            local gex = ID2:Add("DButton")
            gex:Dock(RIGHT)
            gex:DockMargin(0,5,5,5)
            gex:SetText("Gex")
            gex:SetFont("RDSRP.30")
                gex.Paint = function(self,w,h)
                    surface.SetDrawColor(_RDS:Color("WHITE", 255))
                    surface.DrawOutlinedRect(0,0,w,h,2)
                    local col = _RDS:Color("WHITE", 255)
                    if self:IsHovered() then draw.RoundedBox(0,0,0,w,h,_RDS:Color("WHITE", 255)) col = _RDS:Color("BLACK", 255) end
                    self:SetTextColor(col)
                end
                gex.DoClick = function()
                    if ply:IsPlayer() then 
                        _RDS:Notify("success", "Erfolgreich!", "Du hast das GExtension Profil erfolgreich geöffnet!", 2)
                        gui.OpenURL( "https://rising-darkness.net/gextension/index.php?t=user&id="..ply:SteamID64() )
                    else
                        _RDS:Notify("error", "Fehler!", "Diese/-r/Das Hat kein GExtension Profil!", 2)
                    end
                end

            local tabele = {
                {
                    prefix = "Questsystem Zurücksetzen",
                    func = function()
                        if ply:IsBot() then 
                            _RDS:Notify("error", "FEHLGESCHLAGEN", "Das ist ein Bot und er hat kein Eintrag", 2)
                            return 
                        end
                            _RDS:Notify("success", "Zurückgesetzt!", "Die Versuche wurden von '"..ply:GetName().."' zurückgesetzt!", 2)

                        local tbl = {
                            what = "reset",
                            var =  "new",
                            ply = ply:SteamID()
                        }

                        net.Start("RDS.Questsystem.system")
                        net.WriteTable(tbl)
                        net.SendToServer()
                        _RDS.QuestSystem.Try = 2
                    end
                },
            }
            for k,v in pairs(tabele) do    
                local button = TOPPanel:Add("DButton")
                button:Dock(TOP)
                button:DockMargin(10,0,10,5)
                button:SetTall(scrh*0.05)
                button:SetText("")
                    button.Paint = function(self,w,h)
                        local clr = _RDS:Color("WHITE", 255)
                        if self:IsHovered() then  clr = _RDS:Color("PETER RIVER", 255) draw.RoundedBox(5,0,0,w,h,clr) end
                        draw.RoundedBox(5,2,2,w-4,h-4,Color(47,47,47))
                        draw.SimpleText(v.prefix, "RDS.Admin.btnply", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
                    button.DoClick = v.func
                end

        local function charsettings()
            local charactersettings = RDSUI.Scroll:Add("DPanel")
            charactersettings:Dock(TOP)
            charactersettings:DockMargin(7,8,7,0)
            charactersettings:SetTall( scrh * 0.8 )
                charactersettings.Paint = function(self,w,h)
                    draw.RoundedBox(5,0,0,w,h,Color(47,47,47))
                end
            local topp = charactersettings:Add("DLabel")
            topp:Dock(TOP)
            topp:DockMargin(0,0,0,0)
            topp:SetTall( scrh * 0.08 ) 
            topp:SetText( "" )
                topp.Paint = function(self,w,h)
                    draw.RoundedBoxEx(5,0,0,w,h,Color(32,32,32),true,true,false,false)
                    draw.SimpleText("Spezialisierungen", "RDS.Admin.btn", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            local can = charactersettings:Add("DPanel")
            can:Dock(LEFT)
            can:DockMargin(5,10,10,0)
            can:SetWide( scrw * 0.322)
                can.Paint = function(self,w,h)
                    surface.SetDrawColor( Color(32,32,32) )
                    surface.DrawOutlinedRect(0,0,w,h,2) 
                end
                local can_top = can:Add("DLabel")
                can_top:Dock(TOP)
                can_top:DockMargin(0,0,0,0)
                can_top:SetTall( scrh * 0.04 )
                can_top:SetText( "" )
                    can_top.Paint = function(self,w,h)
                        surface.SetDrawColor( Color(32,32,32) )
                        surface.DrawOutlinedRect(0,0,w,h,2)
                        draw.SimpleText("Kann bekommen", "RDSRP.25", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
                local can_fill = vgui.Create("DScrollPanel", can)
                can_fill:Dock(FILL)
                local sbar = can_fill:GetVBar()
                sbar:SetSize(5,0)
                sbar:SetHideButtons( true )
                function sbar.btnGrip:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(255,0,0),false,false,false,false) end
                function sbar:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),false,false,false,false) end
                function sbar.btnUp:Paint(w, h) return end
                function sbar.btnDown:Paint(w, h) return end
                    for k,v in pairs(_RDS.Advtraining.Trainings) do 
                        if _RDS.Advtraining.Whitelist[k][cCharacterID] then  
                            continue
                        else 
                            if v.restrictions[ ply:Team() ] then 
                                
                            local item = can_fill:Add("DButton")
                            item:Dock(TOP)
                            item:DockMargin(10,6,10,0)
                            item:SetTall( scrh * 0.1 )
                            item:SetText("")
                                item.Paint = function(self,w,h)
                                    local clr = _RDS:Color("WHITE", 255)
    
                                    if self:IsHovered() then 
                                        clr = _RDS:Color("PETER RIVER", 255)
                                        draw.RoundedBox(5,0,0,w,h,clr) --255,193,7,255
                                    end
                                    draw.RoundedBox(5,2,2,w-4,h-4,Color(53,52,52))
                                    draw.SimpleText(v.categorys.weaponname, "RDS.Admin.btn", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                                end
                                item.DoClick = function()
                                    local Menu = DermaMenu()
                                    Menu:AddOption( "Geben.", function()
                                        net.Start("RDSRP.Roleplay.Trainings.Load")
    
                                        local merge = { [cCharacterID] = true }
                                        table.Merge(_RDS.Advtraining.Whitelist[k], merge)
                                            _RDS.WriteCTable(_RDS.Advtraining.Whitelist)
                                        net.SendToServer()
                                        _RDS:Notify("success", "Gegeben!", "Du hast die Spezialisierung ["..v.categorys.weaponname.."] an ("..ply:GetName()..") gegeben!", 2)

                                        charactersettings:Remove()
                                        timer.Simple(0.2, function()
                                            charsettings()
                                        end)
                                        
                                    end)
                                    Menu:Open()
                                end
                            else
                                continue 
                            end
                        end 
                    end
            local have = charactersettings:Add("DPanel")
            have:Dock(LEFT)
            have:DockMargin(10,10,5,0)
            have:SetWide( scrw * 0.332)
                have.Paint = function(self,w,h)
                    surface.SetDrawColor( Color(32,32,32) )
                    surface.DrawOutlinedRect(0,0,w,h,2)
                end
                local can_have = have:Add("DLabel")
                can_have:Dock(TOP)
                can_have:DockMargin(0,0,0,0)
                can_have:SetTall( scrh * 0.04 )
                can_have:SetText( "" )
                    can_have.Paint = function(self,w,h)
                        surface.SetDrawColor( Color(32,32,32) )
                        surface.DrawOutlinedRect(0,0,w,h,2)
                        draw.SimpleText("hat", "RDSRP.25", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
                local have_fill = vgui.Create("DScrollPanel", have)
                have_fill:Dock(FILL)
                local sbar = have_fill:GetVBar()
                sbar:SetSize(20,0)
                sbar:SetHideButtons( true )
                function sbar.btnGrip:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(255,0,0),false,false,false,true) end
                function sbar:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),false,false,false,true) end
                function sbar.btnUp:Paint(w, h) return end
                function sbar.btnDown:Paint(w, h) return end
                    for k,v in pairs(_RDS.Advtraining.Trainings) do
                        if not _RDS.Advtraining.Whitelist[k][cCharacterID] then  
                            continue
                        end

                        local item = have_fill:Add("DButton")
                        item:Dock(TOP)
                        item:DockMargin(10,6,10,0)
                        item:SetTall( scrh * 0.1 )
                        item:SetText("")
                            item.Paint = function(self,w,h)
                                local clr = _RDS:Color("WHITE", 255)
                                if self:IsHovered() then clr = _RDS:Color("PETER RIVER", 255) draw.RoundedBox(5,0,0,w,h,clr) end
                                draw.RoundedBox(5,2,2,w-4,h-4,Color(53,52,52))
                                draw.SimpleText(v.categorys.weaponname, "RDS.Admin.btn", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                            end
                            item.DoClick = function()
                                local Menu = DermaMenu()
                                Menu:AddOption( "Entfernen.", function()
                                    net.Start("RDSRP.Roleplay.Trainings.Load")
                                    _RDS.Advtraining.Whitelist[k][ cCharacterID ] = nil
                                        _RDS.WriteCTable(_RDS.Advtraining.Whitelist) 
                                    net.SendToServer()
                                    _RDS:Notify("success", "Entfernt!", "Du hast die Spezialisierung ["..v.categorys.weaponname.."] von ("..ply:GetName()..") entfernt!", 2)
                                    charactersettings:Remove()
                                    timer.Simple(0.2, function()
                                        charsettings()
                                    end)
                                end)
                                Menu:Open()
                            end
                    end
                end
            charsettings()
        end)
        end

        RDSUI.PlayerButton.DoClick = function()
                net.Start("RDSRP.Roleplay.Trainings.ReLoad")
                net.SendToServer()        
                net.Start("RDSRP.Adminsuite.GetCharacterID")
                net.WriteType(ply) 
                net.SendToServer()
                timer.Simple(0.2, function()
                    Playersite(ply)                
                end)
        end
    end
end

function RDSUI:ServerSettings()
    _RDS.Adminsuite.UI:BackButton(function() RDSUI.Scroll:Clear() RDSUI:Selection() end)
    RDSUI.Scroll:Clear()
    local scrw, scrh = ScrW(), ScrH()

    for k,v in SortedPairsByMemberValue(_RDS.Adminsuite.UI.ServerConfigModules, "id", false) do
        local panel = vgui.Create( "DPanel", RDSUI.Scroll )	-- Create a collapsible category
        panel:Dock( TOP )		
        panel:DockMargin(5,5,5,0) 
        panel:SetTall(scrh*0.09)
        panel.Paint = function(self,w,h)
                    draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
            end
        local Title = panel:Add("DLabel")
        Title:Dock(LEFT)
        Title:SetWide(scrw*0.15)
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
         --  button.OnDepressed = function() end
         /*
    	local info = panel:Add("RichText")
        info:Dock(LEFT)
        info:SetWide(scrw*0.3)
        info:InsertColorChange(255,255,255,225)
        info:AppendText(tostring(v.description))
            info.PerformLayout = function(self)
                self:SetFontInternal("RDSRP.25")
            end
            */
    end
end