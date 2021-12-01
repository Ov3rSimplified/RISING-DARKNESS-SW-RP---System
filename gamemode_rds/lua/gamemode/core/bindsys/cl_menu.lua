--
_RDS.bindsys.Menu = _RDS.bindsys.Menu or {}
local Gtbl = _RDS.bindsys.Menu




local function Menu()
    local scrw,scrh = ScrW(), ScrH()

    Gtbl.Frame = vgui.Create("RDSRP.BPanel")
    Gtbl.Frame:SetSize(scrw*0.35,scrh*0.7)
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
        draw.SimpleText("⸻ Keybinds ⸻", "RDS.Admin.Title", self:GetWide()/2, scrh*0.040, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end


    Gtbl.FILL = vgui.Create("DScrollPanel", Gtbl.Frame)
    Gtbl.FILL:Dock( FILL )
    Gtbl.FILL:DockMargin(10,scrh*0.050,10,0)
        Gtbl.FILL.Paint = nil


        local sbar = Gtbl.FILL:GetVBar()
        sbar:SetSize(0,0)
            function sbar:Paint(w, h) return end
            function sbar.btnUp:Paint(w, h) return end
            function sbar.btnDown:Paint(w, h) return end
            function sbar.btnGrip:Paint(w, h) return end

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


local function Elements()
    local scrw,scrh = ScrW(), ScrH()

    for k, v in pairs(_RDS.bindsys.Binds) do     

        local pnl = vgui.Create("DPanel", Gtbl.FILL )
        pnl:Dock(TOP)
        pnl:DockMargin(0,5,0,5)
        pnl:SetTall(scrh*0.07)

            pnl.Paint  = function(self,w,h)
                draw.RoundedBox(15,0,0,w,h,Color(71,71,71))
            end


            local title = vgui.Create("DLabel", pnl)
            title:Dock(LEFT)
            title:DockMargin(5,0,0,0)
            title:SetWide(scrw*0.2)
            title:SetText( "" )

                title.Paint = function(self,w,h)
                    draw.SimpleText(k, "RDSRP.bsys.bindtitle", 0, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                end


            local binder = vgui.Create("DBinder", pnl)
            binder:Dock(RIGHT)
            binder:DockMargin(0,0,0,0)
            binder:SetWide(scrw*0.07)
            binder:SetFont("RDSRP.bsys.bindertitle")
            binder:SetValue(v.key)

                binder.Paint = function(self,w,h)
                    draw.RoundedBoxEx(15,0,0,w+1,h,Color(37,37,37),false,true,false,true)
                end

                function binder:OnChange( Key )
                    cookie.Set("RDSRP.Bind."..v.name, Key) 
                    v.key = binder:GetValue()
                end

    end
end
 





function Gtbl:Init()
    Menu()
    Elements()
end

concommand.Add("lila", function()
    Gtbl:Init()
end)