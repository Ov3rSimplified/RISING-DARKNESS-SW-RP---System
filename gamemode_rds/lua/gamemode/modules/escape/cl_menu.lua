--

local Gtbl = _RDS.Escape

function Gtbl:Title()
    local scrw, scrh = ScrW(), ScrH()
        local mat = Material("materials/rdsrp/logos/titel.png")

        local title = Gtbl.Frame:Add("DPanel")
        title:SetPos(scrw*0.07,scrh*0.0)
        title:SetSize(scrw*0.38,scrh*0.17)
        title.Paint = function(self,w,h)
            surface.SetDrawColor(_RDS:Color("WHITE", 255))
            surface.SetMaterial(mat)
            surface.DrawTexturedRect(0,0,w,h)
        end 

        local SUBte = Gtbl.Frame:Add("DPanel")
        SUBte:SetPos(scrw*0.1,scrh*0.17)
        SUBte:SetSize(scrw*0.3,scrh*0.1)
            SUBte.Paint = nil
            local top = SUBte:Add("DLabel")
            top:Dock(TOP)
            top:SetText("Auswahlmenu")
            top:SetFont("RDSRP.ESC.Button")
            top:SetTall(SUBte:GetTall()/2)
            top:SetTextColor(_RDS:Color("WHITE",255))
            local top2 = SUBte:Add("DLabel")
            top2:Dock(TOP)
            top2:SetText("Auswahlmenu")
            top2:SetFont("RDSRP.ESC.Aurebesh")
            top2:SetTall(SUBte:GetTall()/2)
            top2:SetTextColor(Color(117,117,117))

end


function Gtbl:Sidline()
    local scrw, scrh = ScrW(), ScrH()
        local mat = Material("materials/rdsrp/mat/sideline.png")
    local label = vgui.Create("DLabel", Gtbl.Frame)
    label:Dock(LEFT)
    label:SetWide(scrw * 0.1)
    label:SetText("")
        label.Paint = function(self,w,h)
            surface.SetDrawColor(_RDS:Color("WHITE", 255))
            surface.SetMaterial(mat)
            surface.DrawTexturedRect(0,0,w,h)
        end 
end



function Gtbl:Btns()
    local scrw, scrh = ScrW(), ScrH()



    local btnpnl = Gtbl.Frame:Add("DPanel")
    btnpnl:SetPos(scrw*0.101,scrh*0.3)
    btnpnl:SetSize(scrw*0.29,scrh*0.95)
        btnpnl.Paint = nil
 /*
        local top = btnpnl:Add("DPanel")
        top:Dock( TOP )
        top:DockMargin(0,0,0,0)
        top:SetTall( scrh*0.19 )

            top.Paint = function(self,w,h)
                --draw.RoundedBox(0,0,0,w,h,Color(0,0,0,140))
            end

            local top_bottomn = top:Add("DLabel")
            top_bottomn:Dock( BOTTOM )
            top_bottomn:DockMargin(0,0,0,0)
            top_bottomn:SetTall(scrh*0.05)
            top_bottomn:SetText( "" )

            local mattt = Material("materials/rdsrp/mat/ppts.png")

            top_bottomn.Paint = function(self,w,h)
                    surface.SetDrawColor(_RDS:Color("WHITE", 255))
                    surface.SetMaterial(mattt)
                    surface.DrawTexturedRect(0,0,w,h)
                end


            local top_bottom = top:Add("DLabel")
            top_bottom:Dock( BOTTOM )
            top_bottom:DockMargin(0,0,0,0)
            top_bottom:SetTall(scrh*0.006)

                top_bottom.Paint = function(self,w,h)
                    draw.RoundedBox(0,0,0,w,h,_RDS:Color("WHITE", 255))
                end


            local rds_don = vgui.Create("DLabel", top )
            rds_don:Dock(BOTTOM)
            rds_don:DockMargin(0,0,0,0)
            rds_don:SetTall(scrh*0.05)
            rds_don:SetText( "" )

                rds_don.Paint = function(self,w,h)
                    draw.SimpleText("RISING DARKNESS", "RDS.ESCmenu.Title", 0, 0, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT)
                end

            
            local gray = vgui.Create("DLabel", top )
            gray:Dock(BOTTOM)
            gray:DockMargin(0,0,0,0)
            gray:SetTall(scrh*0.021)
            gray:SetText( "" )
            
                gray.Paint = function(self,w,h)
                    draw.SimpleText("RISING DARKNESS", "RDS.ESCmenu.graytitle", 3, 0, Color(128,128,128), TEXT_ALIGN_LEFT)
                end
 */

    local scroll = btnpnl:Add("DScrollPanel")
    scroll:Dock(TOP)
    scroll:DockMargin(0,0,0,0)
    scroll:SetTall(scrh*0.8)

        scroll.Paint = function(self,w,h)
     --       draw.RoundedBox(0,0,0,w,h,Color(0,0,0,140))
        end


    local sbar = scroll:GetVBar()
    sbar:SetSize(0,0)
        function sbar:Paint(w, h) return end
        function sbar.btnUp:Paint(w, h) return end
        function sbar.btnDown:Paint(w, h) return end
        function sbar.btnGrip:Paint(w, h) return end
    


     for k, v in SortedPairsByMemberValue(_RDS.Config.EscapeButtons, "order", false) do

        local mattt = Material("materials/rdsrp/mat/dddd.png")
        local rollsound = "isounds/roll.mp3"
        local inputsound = "isounds/inputclick.mp3"  

    local btn = scroll:Add("DButton",btnpnl)
    btn:Dock( TOP )
    btn:SetTall( scrh * 0.1 )
    btn:DockMargin(0,5,0,0)
    btn:SetText( "" )
    btn:SetFont("RDSRP.ESC.Button")
                    
    local speed = 4
    local barStatus = 0  

          btn.DoClick =  v.func

          function btn.OnDepressed()
            surface.PlaySound(inputsound)
          end

          function btn.OnCursorEntered()
            surface.PlaySound(rollsound)
          end

          function btn.Paint(self,w,h)

            local clr = Color(255,255,255)
            if self:IsHovered() then
                barStatus = math.Clamp(barStatus + speed * FrameTime(), 0, 1)
            else
                barStatus = math.Clamp(barStatus - speed * FrameTime(), 0, 1)
            end
                draw.RoundedBox(0,0,0,w,h, _RDS:Color("BLACK", 130))
                surface.SetDrawColor(_RDS:Color("WHITE", 255))
                surface.DrawOutlinedRect(0,0,w,h,2)

                if self:IsHovered() then 
                    clr = _RDS.PlayerConfig.config["CustomHoverColor"]
                surface.SetDrawColor(clr)
                surface.DrawOutlinedRect(0,0,w,h,5)
                end


                draw.SimpleText(k, "RDSRP.ESC.Button", 10, self:GetTall()/2, clr, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            end
    end
end

 
function Gtbl:PlayerInformation()
    local scrw, scrh = ScrW(), ScrH()
    local lply = LocalPlayer()
/*
    self.PlayerInfo = self.Frame:Add("DPanel") 
    self.PlayerInfo:Dock(TOP) 
    self.PlayerInfo:DockMargin(scrw*0.75,0,0,0) 
    self.PlayerInfo:SetTall(scrh*0.06) 
        self.PlayerInfo.Paint = function(s,w,h)
            surface.SetDrawColor( _RDS:Color("WHITE",255) )
          --  surface.DrawOutlinedRect(0,0,w,h,1)
          --draw.RoundedBox(0, 0, 0, w, h, ColorAlpha(color_white, 50))
        end

        local line =  self.Frame:Add("DPanel")
        line:Dock(TOP) 
        line:DockMargin(scrw*0.75,0,0,0) 
        line:SetTall(scrh*0.005)
        
            line.Paint = function(s,w,h)
                draw.RoundedBox(0, 0, 0, w, h, ColorAlpha(color_white, 50))
            end

    local Avatar = self.PlayerInfo:Add("AvatarImage")
    Avatar:Dock(LEFT)
    Avatar:DockMargin(2,2,2,2)
    Avatar:SetWide( scrw * 0.040 )
    Avatar:SetPlayer( lply, 1000 )

    local wide = scrw*0.4
    local name = self.PlayerInfo:Add("DLabelEditable")
    name:Dock(LEFT)
    name:DockMargin(0,0,0,0)
    name:SetWide(wide)
    name:SetText("")
        name.Paint = function(s,w,h)
            s:SetTextColor(_RDS:Color("WHITE", 255))
            if string.len(s:GetText()) > 12 then 
                s:SetFont("RDSRP.15")
            elseif string.len(s:GetText()) > 22 then 
                s:SetFont("RDSRP.15")
            else
                s:SetFont("RDSRP.25")
            end

            s:SetText(lply:GetName())
        end

*/
end

