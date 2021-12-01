--
_RDS.Advtraining = _RDS.Advtraining or {}

local Gtbl = _RDS.Advtraining

function Gtbl:OpenMenu()

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
        draw.SimpleText("⸻ Test ⸻", "RDS.Admin.Title", self:GetWide()/2, scrh*0.040, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
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
            draw.SimpleText("Schließen", "RDS.UI.Closebutton", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

        close.DoClick = function()
            Gtbl.Frame:Remove()
        end
end

local function Elements()
    local scrw,scrh = ScrW(), ScrH()
    local scrollP = Gtbl.FILL


    for k,v in pairs(_RDS.Advtraining.Trainings) do   

        local pnl = vgui.Create("DButton", scrollP )
        pnl:Dock(TOP)
        pnl:DockMargin(0,0,0,0)
        pnl:SetTall(scrh*0.15)
        pnl:SetText( "" )

        pnl.Paint = function(self,w,h)
            surface.SetDrawColor(_RDS:Color("WHITE", 255))
            surface.DrawOutlinedRect(0,0,w,h,2)
            draw.SimpleText(k, "RDS.UI.Closebutton", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

        pnl.DoClick = function(self,w,h)
            if _RDS.Advtraining.Trainings[k].restrictions[ LocalPlayer():Team() ] and _RDS.Advtraining.Trainings[k].whitelist[ LocalPlayer():SteamID() ] then
                chat.AddText("youre OK!")
            else
                chat.AddText("youre not OK!")
            end

        end
    end

end



function Gtbl:Init()
    Gtbl:OpenMenu()
    Elements()
end


concommand.Add("testi", function()
    Gtbl:Init()
end)