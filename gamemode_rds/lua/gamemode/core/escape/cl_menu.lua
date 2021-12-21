--

local Gtbl = _RDS.Escape


function Gtbl:Btns()
    local scrw, scrh = ScrW(), ScrH()


    local btnpnl = Gtbl.Frame:Add("DPanel")
    btnpnl:SetPos(0,scrh*0.07)
    btnpnl:SetSize(scrw*0.24,scrh*0.7)
        btnpnl.Paint = nil

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


    local scroll = btnpnl:Add("DScrollPanel")
    scroll:Dock(TOP)
    scroll:DockMargin(0,0,0,0)
    scroll:SetTall(scrh*0.51)

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

            if self:IsHovered() then
                barStatus = math.Clamp(barStatus + speed * FrameTime(), 0, 1)
            else
                barStatus = math.Clamp(barStatus - speed * FrameTime(), 0, 1)
            end

            if self:IsHovered() then 
                draw.RoundedBox(10,5,0,scrw*0.005,h * barStatus,Color(255,255,255))
            end
                draw.SimpleText(k, "RDS.ESCmenu.Title", self:GetWide()/2, self:GetTall()/2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
    end








end