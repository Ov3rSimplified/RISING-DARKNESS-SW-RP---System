--
_RDS.Admin = _RDS.Admin or {}
local Gtbl = _RDS.Admin

_RDS.Admin.Player = _RDS.Admin.Player or {}
--table.Empty(_RDS.Admin.Player)
 
PrintTable(_RDS.Admin.Player) 

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
                Gtbl.btn:SetVisible(true)
            end
        else
            for _,v in pairs(_RDS.Admin.Player) do
                    if (Gtbl.btn:GetText():lower():find(search_text,1,true)) then
                        Gtbl.btn:SetVisible(true)
                    else
                        Gtbl.btn:SetVisible(false)
                    end
                end
            end
        end
end
 */

local function Open()

    local scrw,scrh = ScrW(), ScrH()

    Gtbl.Frame = vgui.Create("RDSRP.BPanel")
    Gtbl.Frame:SetSize(scrw*0.5,scrh*0.8)
    Gtbl.Frame:Center()
    Gtbl.Frame:MakePopup()

        Gtbl.Frame.Paint = function(self,w,h)
            draw.RoundedBox(15,0,0,w,h,Color(23,22,22,255))
        end

    Gtbl.Title = vgui.Create("DLabel", Gtbl.Frame)
    Gtbl.Title:Dock( TOP )
    Gtbl.Title:DockMargin(0,0,0,0)
    Gtbl.Title:SetText( "" )
    Gtbl.Title:SetTall( scrh * 0.08 )

    Gtbl.Title.Paint = function(self,w,h)
        draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,false,false)
        draw.SimpleText("⸻ Adminsuite ⸻", "RDS.Admin.Title", self:GetWide()/2, scrh*0.040, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end


    Gtbl.FILL = vgui.Create("DScrollPanel", Gtbl.Frame)
    Gtbl.FILL:Dock( FILL )
    Gtbl.FILL:DockMargin(10,scrh*0.050,10,0)
        Gtbl.FILL.Paint = nil

    local close = vgui.Create("DButton", Gtbl.Frame)
    close:Dock( BOTTOM )
    close:DockMargin(scrw*0.080,0,scrw*0.080,20)
    close:SetTall(scrh*0.06)
    close:SetText("")

        close.Paint = function(self,w,h)
            local clr = _RDS:Color("WHITE", 255)
            if self:IsHovered() then 
                draw.RoundedBox(5,0,0,w,h,Color(255,123,0)) --255,193,7,255
                clr = Color(255,123,0)
            end
                
            draw.RoundedBox(5,2,2,w-4 , h-4,Color(47,47,47))
            draw.SimpleText("Schließen", "RDSRP.QeSt.Quest", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

        close.DoClick = function()
            Gtbl.Frame:Remove()
        end
end 



local function Player()
    local scrw,scrh = ScrW(), ScrH()

    for k,v in pairs(player.GetAll()) do    

        Gtbl.btn = Gtbl.FILL:Add("DButton")
        Gtbl.btn:Dock(TOP)
        Gtbl.btn:DockMargin(0,0,0,10)
        Gtbl.btn:SetTall(scrh*0.1)
        Gtbl.btn:SetText( "" )
        
        table.insert(_RDS.Admin.Player, v:GetName() )

        Gtbl.btn.Paint = function(self,w,h)
            local clr = _RDS:Color("WHITE", 255)

            if self:IsHovered() then 
                clr = _RDS:Color("PETER RIVER", 255)
                draw.RoundedBox(5,0,0,w,h,clr) --255,193,7,255
            end

            draw.RoundedBox(5,2,2,w-4,h-4,Color(47,47,47))
            draw.SimpleText(v:GetName(), "RDS.Admin.btnply", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
         end
         
         local Avatar = vgui.Create( "RDSRP.CircleAvatar",  Gtbl.btn )
         Avatar:SetPos(10,0)
         Avatar:SetSize(scrw*0.060,Gtbl.btn:GetTall())
         Avatar:SetPlayer( v, 16 )
         Avatar:SetMaskSize( 50 )

         Gtbl.btn.DoClick = function()
            Gtbl.FILL:Clear()

            local pnl = Gtbl.FILL:Add("DPanel")
            pnl:Dock(TOP)
            pnl:DockMargin(0,0,0,0)
            pnl:SetTall(scrh*0.18)
            pnl.Paint = nil

                local Avatar = vgui.Create( "RDSRP.CircleAvatar", pnl )
                Avatar:SetPos(scrw*0.215,0)
                Avatar:SetSize(scrw*0.060,scrh*0.1)
                Avatar:SetPlayer( v, 16 )
                Avatar:SetMaskSize( 50 )


                local ttl = vgui.Create("DLabel", pnl)
                ttl:Dock(BOTTOM)
                ttl:DockMargin(0,0,0,0)
                ttl:SetText("")
                ttl:SetTall(scrh*0.12)

                    ttl.Paint = function(self,w,h)
                        draw.SimpleText(v:GetName(), "RDS.Admin.btnply", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end 


            local pnl_clip = vgui.Create("DPanel", Gtbl.FILL)
            pnl_clip:Dock( TOP )
            pnl_clip:DockMargin(0,0,0,0)
            pnl_clip:SetTall(scrh*0.06)
            pnl_clip.Paint = nil

            local w = scrw * 0.24
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
                    SetClipboardText( v:SteamID() )
                    chat.AddText(Color(250,0,0), "[RDS:RP] ", Color(255,255,255), "SteamID wurde Kopiert!" ) 
                    surface.PlaySound( "buttons/button15.wav" )

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
                    SetClipboardText( v:SteamID64() )
                    chat.AddText(Color(250,0,0), "[RDS:RP] ", Color(255,255,255), "Steam64ID wurde Kopiert!" ) 
                    surface.PlaySound( "buttons/button15.wav" )

                end
                
                local questsysreset = Gtbl.FILL:Add("DButton")
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
                        surface.PlaySound( "buttons/button15.wav" )
                        chat.AddText(Color(250,0,0), "[RDS:RP] ", Color(255,255,255), "Versuche wurde von [ "..v:SteamID().." ] zurückgesetzt!" ) 
                        surface.PlaySound( "buttons/button15.wav" )

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
        end    
    end
end

local function Server()
    local scrw,scrh = ScrW(), ScrH()

    
    local Qsys = Gtbl.FILL:Add("DButton")
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
        Gtbl.FILL:Clear()
        _RDS.Admin.QSys:OpenConfigView()
     end


end




local function Elements()
    local scrw,scrh = ScrW(), ScrH()


    local btn_ply = Gtbl.FILL:Add("DButton")
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
            Gtbl.FILL:Clear()
            Player()
        end


        local btn_sv = Gtbl.FILL:Add("DButton")
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
                Gtbl.FILL:Clear()
                Server()
            end
end


function Gtbl.Init()
    Open()
    Elements()
end

 
concommand.Add("_RDS.Admin", function()
    if _RDS.Config.AdminValue[ LocalPlayer():GetUserGroup() ] then 
        Gtbl.Init()
    else
        chat.AddText(Color(250,0,0), "[TEST RDS:RP] ", Color(255,255,255), "Du hast nicht ausreichend Rechte dafür!\n")
    end
end)