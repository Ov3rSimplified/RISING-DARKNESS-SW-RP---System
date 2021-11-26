--

local Gtbl = _RDS.Escape


function Gtbl:Btns()
    local scrw, scrh = ScrW(), ScrH()


    local btnpnl = Gtbl.Frame:Add("DScrollPanel")
    btnpnl:SetPos(0,scrh*0.16)
    btnpnl:SetSize(scrw*0.24,scrh*0.7)

        local top = btnpnl:Add("DPanel")
        top:Dock( TOP )
        top:DockMargin(0,0,0,0)
        top:SetTall( scrh*0.08 )

            top.Paint = function(self,w,h)
                draw.RoundedBox(0,0,0,w,h,Color(0,0,0,140))
            end

            local top_bottom = top:Add("DLabel")
            top_bottom:Dock( BOTTOM )
            top_bottom:DockMargin(0,0,0,0)
            top_bottom:SetTall(scrh*0.006)

                top_bottom.Paint = function(self,w,h)
                    draw.RoundedBox(0,0,0,w,h,_RDS:Color("WHITE", 255))
                end


    local btn = vgui.Create("DButton",btnpnl)
    btn:Dock( TOP )
                
       btn.DoClick = function()
           LocalPlayer():ConCommand("disconnect")
       end
    
end