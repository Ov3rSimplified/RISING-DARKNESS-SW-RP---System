--
concommand.Add("..d", function()
    net.Start("LoadingInfo")
    net.SendToServer() 
end)
_RDS.PlayerSettings.Menu.Admin = _RDS.PlayerSettings.Menu.Admin or {}
local Gtbl = _RDS.PlayerSettings.Menu.Admin 

_RDS.Admin.Player = _RDS.Admin.Player or {}
 
  
 
local function Open()  
    _RDS.Advtraining.Whitelist = _RDS.Advtraining.Whitelist or {}
    local scrw,scrh = ScrW(), ScrH()

    Gtbl.MainMain = vgui.Create("DPanel", _RDS.PlayerSettings.Frame)
    Gtbl.MainMain:Dock(FILL)

    Gtbl.MainMain.Paint = nil
    

    Gtbl.Main = vgui.Create("DScrollPanel", Gtbl.MainMain)
    Gtbl.Main:Dock(FILL)


    local sbar = Gtbl.Main:GetVBar()
    sbar:SetSize(20,0)
    sbar:SetHideButtons( true )
    function sbar.btnGrip:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(255,0,0),false,false,false,true) end
    function sbar:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),false,false,false,true) end
    function sbar.btnUp:Paint(w, h) return end
    function sbar.btnDown:Paint(w, h) return end


    local btn = Gtbl.Main:Add("DButton")
    btn:Dock(TOP)
    btn:DockMargin(5,5,5,0)
    btn:SetTall(scrh * 0.12 )
    btn:SetText( "" )

        btn.Paint = function(self,w,h)
            local clr = _RDS:Color("WHITE", 255)

            if self:IsHovered() then 
                clr = _RDS:Color("PETER RIVER", 255)
                draw.RoundedBox(5,0,0,w,h,clr) --255,193,7,255
            end

            draw.RoundedBox(5,2,2,w-4,h-4,Color(47,47,47))
            draw.SimpleText("Player", "RDS.Admin.btnply", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

        btn.DoClick = function()
            Gtbl.Player()
        end



        
    local btn = Gtbl.Main:Add("DButton")
    btn:Dock(TOP)
    btn:DockMargin(5,5,5,0)
    btn:SetTall(scrh * 0.12 )
    btn:SetText( "" )

        btn.Paint = function(self,w,h)
            local clr = _RDS:Color("WHITE", 255)

            if self:IsHovered() then 
                clr = _RDS:Color("PETER RIVER", 255)
                draw.RoundedBox(5,0,0,w,h,clr) --255,193,7,255
            end

            draw.RoundedBox(5,2,2,w-4,h-4,Color(47,47,47))
            draw.SimpleText("Server", "RDS.Admin.btnply", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

        btn.DoClick = function()
            Gtbl.Server()
        end
        

end 

local function register()
    _RDS.PlayerSettings.FILL:AddSheet( "Arabica", Gtbl.MainMain, Color(255,0,0), "materials/rdsrp/icon/admin_setting.png")
 
end


function Gtbl.Player()

    net.Start("RDSRP.Roleplay.Trainings.ReLoad")
    net.SendToServer()

    Gtbl.Main:Clear()
    local scrw,scrh = ScrW(), ScrH()

    _RDS:AdminBackButton(function() 
        Gtbl.Main:Clear()
        timer.Simple(0.2, function()
            Open()
        end) 
    end)

    for k,v in pairs(player.GetAll()) do    
        local plyy = v

        local btn = Gtbl.Main:Add("DButton")
        btn:Dock(TOP)
        btn:DockMargin(5,5,5,0)
        btn:SetTall(scrh*0.1)
        btn:SetText( "" )
        
        table.insert(_RDS.Admin.Player, v:GetName() )

        btn.Paint = function(self,w,h)
            local clr = _RDS:Color("WHITE", 255)

            if self:IsHovered() then 
                clr = _RDS:Color("PETER RIVER", 255)
                draw.RoundedBox(5,0,0,w,h,clr) --255,193,7,255
            end

            draw.RoundedBox(5,2,2,w-4,h-4,Color(47,47,47))
            draw.SimpleText(v:GetName(), "RDS.Admin.btnply", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
         end
         
         local Avatar = vgui.Create( "RDSRP.CircleAvatar",  btn )
         Avatar:SetPos(10,0)
         Avatar:SetSize(scrw*0.060,btn:GetTall())
         Avatar:SetPlayer( v, 16 )
         Avatar:SetMaskSize( 50 )

         btn.DoClick = function()





    // ------------------------------------- \\
    local plya = v
    net.Start("RDSRP.IPlayer.GetCharacterID")
    net.WriteType(plya)
    net.SendToServer()

    // ------------------------------------- \\

    timer.Simple(0.4, function()          
        print( cCharacterID )

            Gtbl.Main:Clear()

            local pnl = Gtbl.Main:Add("DPanel")
            pnl:Dock(TOP)
            pnl:DockMargin(0,0,0,0)
            pnl:SetTall(scrh*0.12)
                pnl.Paint = nil


                local lblb = vgui.Create("DLabel", pnl)
                lblb:Dock(FILL)
                lblb:DockMargin(0,0,0,0)
                lblb:SetText( "" )
                    lblb.Paint = function(self,w,h)
                        draw.SimpleText(v:GetName(), "RDS.Admin.btnply", self:GetWide() / 2 - scrw * 0.20, self:GetTall() / 2 - 9, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
    
                local Avatar = vgui.Create( "RDSRP.CircleAvatar", pnl )
                Avatar:SetPos(scrw*0.01,0)
                Avatar:SetSize(scrw*0.060,scrh*0.1)
                Avatar:SetPlayer( v, 16 )
                Avatar:SetMaskSize( 50 )
 
            local pnl_clip = vgui.Create("DPanel", Gtbl.Main)
            pnl_clip:Dock( TOP )
            pnl_clip:DockMargin(0,0,0,0)
            pnl_clip:SetTall(scrh*0.06)
            pnl_clip.Paint = nil

            local w = scrw * 0.333
            local steamidc = pnl_clip:Add("DButton")
            steamidc:Dock(LEFT)
            steamidc:DockMargin(0,0,0,0)
            steamidc:SetWide(w)
            steamidc:SetText("")

                steamidc.Paint = function(self,w,h)
                    local clr = _RDS:Color("WHITE", 255)

                    if self:IsHovered() then 
                        clr = _RDS:Color("PETER RIVER", 255)
                        draw.RoundedBox(5,0,0,w,h,clr) --255,193,7,255
                    end
    
                    draw.RoundedBox(5,2,2,w-4,h-4,Color(47,47,47))
                    draw.SimpleText("SteamID", "RDS.Admin.btn", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end

                steamidc.DoClick = function()
                    if v:IsBot() then 
                        _RDS:Notify("error", "FEHLGESCHLAGEN", "Das ist ein Bot und er hat keine ID", 2)
                        return 
                    end
                    SetClipboardText( v:SteamID() )
                    _RDS:Notify("success", "Kopiert!", "Du hast die SteamID von '"..v:GetName().."' Kopiert!", 2)


                end

            local namecliper = pnl_clip:Add("DButton")
            namecliper:Dock(LEFT)
            namecliper:DockMargin(20,0,0,0)
            namecliper:SetWide(w)
            namecliper:SetText("")
                     
                namecliper.Paint = function(self,w,h)
                    local clr = _RDS:Color("WHITE", 255)

                    if self:IsHovered() then 
                        clr = _RDS:Color("PETER RIVER", 255)
                        draw.RoundedBox(5,0,0,w,h,clr) --255,193,7,255
                    end
    
                    draw.RoundedBox(5,2,2,w-4,h-4,Color(47,47,47))
                    draw.SimpleText("Steam64ID", "RDS.Admin.btn", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end

                namecliper.DoClick = function()
                    if v:IsBot() then 
                        _RDS:Notify("error", "FEHLGESCHLAGEN", "Das ist ein Bot und er hat keine ID", 2)
                        return 
                    end
                    SetClipboardText( v:SteamID64() )
                    _RDS:Notify("success", "Kopiert!", "Du hast die Steam64ID von '"..v:GetName().."' Kopiert!", 2)

                end
                

                local Infoooo = Gtbl.Main:Add("DButton")
                Infoooo:Dock(TOP)
                Infoooo:DockMargin(0,10,0,0)
                Infoooo:SetText("")
                Infoooo:SetTall(scrh*0.06)

                Infoooo.Paint = function(self,w,h)
                    local clr = _RDS:Color("WHITE", 255)

                    if self:IsHovered() then 
                        clr = _RDS:Color("PETER RIVER", 255)
                        draw.RoundedBox(5,0,0,w,h,clr) --255,193,7,255
                    end
    
                    draw.RoundedBox(5,2,2,w-4,h-4,Color(47,47,47))
                    draw.SimpleText("Character Info", "RDS.Admin.btn", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end

                Infoooo.DoClick = function()
                    local frame = vgui.Create("DFrame")
                    frame:SetSize(scrw*0.3,scrh*0.5)
                    frame:Center()
                    frame:SetTitle("Character Info")
                    frame:MakePopup()

                    local vars = {
                        {
                            var = cCharacterID,
                            vor = "ID",
                        },
                        {
                            var = v:GetName(),
                            vor = "Name",
                        },
                    }

                    local scroll = frame:Add("DScrollPanel")
                    scroll:Dock(FILL)

                    for k,v in pairs(vars) do
                        
                        local labl = vgui.Create("DLabel", scroll)
                        labl:Dock(TOP)
                        labl:DockMargin(0,0,0,0)
                        labl:SetText(v.vor..": "..v.var) 

                    end

                end

                local questsysreset = Gtbl.Main:Add("DButton")
                questsysreset:Dock(TOP)
                questsysreset:DockMargin(0,10,0,0)
                questsysreset:SetText("")
                questsysreset:SetTall(scrh*0.06)
                        
                questsysreset.Paint = function(self,w,h)
                    local clr = _RDS:Color("WHITE", 255)

                    if self:IsHovered() then 
                        clr = _RDS:Color("PETER RIVER", 255)
                        draw.RoundedBox(5,0,0,w,h,clr) --255,193,7,255
                    end
    
                    draw.RoundedBox(5,2,2,w-4,h-4,Color(47,47,47))
                        draw.SimpleText("Questsystem Reseten", "RDS.Admin.btn", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
    
                    questsysreset.DoClick = function()
                        if v:IsBot() then 
                            _RDS:Notify("error", "FEHLGESCHLAGEN", "Das ist ein Bot und er hat kein Eintrag", 2)
                            return 
                        end
                        _RDS:Notify("success", "Zurückgesetzt!", "Die Versuche wurden von '"..v:GetName().."' zurückgesetzt!", 2)

                        local tbl = {
                            what = "reset",
                            var =  "new",
                            ply = v:SteamID()
                        }

                        net.Start("RDS.Questsystem.system")
                        net.WriteTable(tbl)
                        net.SendToServer()
                        _RDS.QuestSystem.Try = 2
                    end


 
    local function charsettings()

            local charactersettings = Gtbl.Main:Add("DPanel")
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
                    draw.SimpleText("Character["..tostring(cCharacterID).."] - "..v:GetName(), "RDS.Admin.btn", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
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

                    for k,v in pairs(_RDS.Advtraining.Trainings) do 

                      if _RDS.Advtraining.Whitelist[k][cCharacterID] then  
                            continue
                        else 
                            if v.restrictions[ plyy:Team() ] then 

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
                                        _RDS:Notify("success", "Gegeben!", "Du hast die Spezialisierung ["..v.categorys.weaponname.."] an ("..plyy:GetName()..") gegeben!", 2)

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

                                if self:IsHovered() then 
                                    clr = _RDS:Color("PETER RIVER", 255)
                                    draw.RoundedBox(5,0,0,w,h,clr) --255,193,7,255
                                end
                    
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
                                    _RDS:Notify("success", "Entfernt!", "Du hast die Spezialisierung ["..v.categorys.weaponname.."] von ("..plyy:GetName()..") entfernt!", 2)

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
    end
end

 

function Gtbl.Server()
    Gtbl.Main:Clear()
    local scrw,scrh = ScrW(), ScrH()

    
    local Qsys = Gtbl.Main:Add("DButton")
    Qsys:Dock(TOP)
    Qsys:DockMargin(0,0,0,10)
    Qsys:SetTall(scrh*0.1)
    Qsys:SetText( "" )
    

    Qsys.Paint = function(self,w,h)
        local clr = _RDS:Color("WHITE", 255)

        if self:IsHovered() then 
            clr = _RDS:Color("PETER RIVER", 255)
            draw.RoundedBox(5,0,0,w,h,clr) --255,193,7,255
        end

        draw.RoundedBox(5,2,2,w-4,h-4,Color(47,47,47))
        draw.SimpleText("Quest System", "RDS.Admin.btnply", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
     end


     Qsys.DoClick = function()
        Gtbl.Main:Clear()
        _RDS.Admin.QSys:OpenConfigView()
     end
end



/*


local function Elements()
    local scrw,scrh = ScrW(), ScrH()


    local btn_ply = Gtbl.Main:Add("DButton")
    btn_ply:Dock(TOP)
    btn_ply:DockMargin(0,0,0,0)
    btn_ply:SetTall(scrh*0.1)
    btn_ply:SetText( "" )

        btn_ply.Paint = function(self,w,h)
            local clr = _RDS:Color("WHITE", 255)

            if self:IsHovered() then 
                clr = _RDS:Color("PETER RIVER", 255)
                draw.RoundedBox(5,0,0,w,h,clr) --255,193,7,255
            end

            draw.RoundedBox(5,2,2,w-4,h-4,Color(47,47,47))
            draw.SimpleText("Player", "RDS.Admin.btn", self:GetWide()/2, scrh*0.046, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

        btn_ply.DoClick = function()
            Gtbl.Main:Clear()
            Player()
        end


        local btn_sv = Gtbl.Main:Add("DButton")
        btn_sv:Dock(TOP)
        btn_sv:DockMargin(0,10,0,0)
        btn_sv:SetTall(scrh*0.1)
        btn_sv:SetText( "" )
    
            btn_sv.Paint = function(self,w,h)
                local clr = _RDS:Color("WHITE", 255)

                if self:IsHovered() then 
                    clr = _RDS:Color("PETER RIVER", 255)
                    draw.RoundedBox(5,0,0,w,h,clr) --255,193,7,255
                end

                draw.RoundedBox(5,2,2,w-4,h-4,Color(47,47,47))
                draw.SimpleText("Server", "RDS.Admin.btn", self:GetWide()/2, scrh*0.046, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end

            btn_sv.DoClick = function()
                Gtbl.Main:Clear()
                Server()
            end
end
*/
function _RDS.PlayerSettings.Menu:OpenAdminConfig()
    if _RDS.Config.AdminValue[ LocalPlayer():GetUserGroup() ] then 
        Open()
        register()
    else
        --_RDS:Notify("error", "Fehler!", "Du hast nicht die benötigten Berechtigungen, um dies zu tun.", duration)
        return
    end
end

 
/* 

local function CreateSearch()

    local pnl = Gtbl.Frame:Add("DPanel")
    pnl:Dock( TOP )
    pnl:DockMargin(0,0,0,0)

    local search = pnl:Add("DTextEntry")
    search:Dock( FILL )
    search:DockMargin(0,0,0,0)
    search:SetPlaceholderText( "Suchen" )

    function search:OnChange()
        local search_text = self:GetText():lower()
        if (#search_text == 0) then
            for _,v in pairs(_RDS.Admin.Player) do
                btn:SetVisible(true)
            end
        else
            for _,v in pairs(_RDS.Admin.Player) do
                    if (btn:GetText():lower():find(search_text,1,true)) then
                        btn:SetVisible(true)
                    else
                        btn:SetVisible(false)
                    end
                end
            end
        end 
end 
 */ 
  
hook.Add("InitPostEntity", "23483rf9wf0n92", function()
        net.Start("RDSRP.Roleplay.Trainings.ReLoad")
        net.SendToServer()
            include("gamemode/config/sh_config.lua")
end)  

net.Start("RDSRP.Roleplay.Trainings.ReLoad")
net.SendToServer()
include("gamemode/config/sh_config.lua")


concommand.Add("_RDS.ReloadSpecs", function()
    net.Start("RDSRP.Roleplay.Trainings.ReLoad") 
    net.SendToServer()
    include("gamemode/config/sh_config.lua")
 end)   
     