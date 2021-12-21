--
_RDS.PlayerSettings = _RDS.PlayerSettings or {}
local Gtbl = _RDS.PlayerSettings 
 
function Gtbl:Init()

    if IsValid(Gtbl.Frame) then 
        Gtbl.Frame:Remove()
    end

    local scrw,scrh = ScrW(), ScrH()
 
    Gtbl.Frame = vgui.Create("RDSRP.BPanel")
    Gtbl.Frame:SetSize(scrw * 0.75, scrh * 0.84)
    Gtbl.Frame:Center()
    Gtbl.Frame:MakePopup()

        Gtbl.Frame.Paint = function(self,w,h)
            draw.RoundedBox(15,0,0,w,h,Color(23,22,22,255))
        end

    Gtbl.TOP = vgui.Create("DPanel", self.Frame)
    Gtbl.TOP:Dock(TOP)
    Gtbl.TOP:DockMargin(0,0,0,0)
    Gtbl.TOP:SetTall(scrh*0.1)

        Gtbl.TOP.Paint = function(self,w,h)
            draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,false,false)
            draw.SimpleText("⸻ RDSRP Einstellungen ⸻", "RDS.Admin.Title", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        end

        local close = self.TOP:Add("DButton")
        close:Dock(RIGHT)
        close:DockMargin(0,40,20,40)
        close:SetWide(scrw*0.015)
        close:SetText("")

            close.DoClick = function()
                self.Frame:Remove()
            end

            close.Paint = function(self,w,h)
                draw.RoundedBoxEx(100,0,0,w,h,Color(255,0,0),true,true,true,true)
            end

    Gtbl.FILL = vgui.Create("RDSRP.SideSelect", Gtbl.Frame)
    Gtbl.FILL:Dock(FILL)

    _RDS.PlayerSettings.Menu:UserSettings()

    _RDS.PlayerSettings.Menu:UserBinds()
    _RDS.PlayerSettings.Menu:OpenAdminConfig()


end

concommand.Add("olp", function()
    Gtbl:Init()
end)