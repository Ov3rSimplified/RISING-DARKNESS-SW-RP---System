--
if CLIENT then 
    net.Receive("RDSRP.PlayerDeadCheck", function()
        local DdFrame = vgui.Create("DFrame")
        DdFrame:SetSize(ScrW(),ScrH())
        DdFrame:Center()
        DdFrame:MakePopup()
            local time = 1 -1
            local sec = 59
            timer.Create("TdO-Test Timer", 60, 1, function()
                time = time -1
                sec = 59
                if time < 0 then
                    print("d")
                    DdFrame:Remove()
                end
            end)
            timer.Create("TdO-Test Sec", 1, 1 * 60, function() 
                sec = sec-1
            end)
            DdFrame.Paint = function(self,w,h)
                _RDS:DrawBlurRect(0, 0, w, h, 3, 6)
                draw.RoundedBox(15, self:GetWide() / 2 - w/2 + 500, self:GetTall() /2 - 250, ScrW() * 0.5, ScrH() * 0.5,_RDS:Color("BLACK",130))
                draw.RoundedBox(15, self:GetWide() / 2 - w/2 + 500, self:GetTall() /2, ScrW() * 0.5, ScrH() * 0.01,_RDS:Color("POMEGRANATE",255))
                draw.SimpleText("Zeit verbleibend "..time..":"..sec,"RDSRP.ESC.Button", self:GetWide() /2, self:GetTall() /2 - 40, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.DrawText("Du hast das RP Verlassen während du Tod warst, dies\nhat eventuell das RP von einem anderen Medic geschadet :(","RDSRP.PDC.35", self:GetWide() /2, self:GetTall() /2 + 40, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
    end) 
end
