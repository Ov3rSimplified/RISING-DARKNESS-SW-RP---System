_RDS.Advtraining.Factionsystem = _RDS.Advtraining.Factionsystem or {}

local Gtbl = _RDS.Advtraining.Factionsystem


local delay = 0
local open = false
hook.Add( "Think", "openthink", function()
	if open and !input.IsKeyDown( KEY_J ) then
		open = false
	end
	if input.IsKeyDown( KEY_J ) and !open and delay < CurTime() then
		delay = CurTime() + 0.2
		open = true
		Gtbl:Init() 
	end
end )

function Gtbl:TOP()

    local scrw, scrh = ScrW(), ScrH()

    local pnl = Gtbl.Frame:Add("DPanel")
    pnl:SetPos(0,scrh*0.0)
    pnl:SetSize(scrw*0.24,scrh*0.7)
    pnl.Paint = nil


    local top = pnl:Add("DPanel")
    top:Dock( TOP )
    top:DockMargin(0,0,0,0)
    top:SetTall( scrh*0.19 )

        top.Paint = function(self,w,h)
            --draw.RoundedBox(0,0,0,w,h,Color(0,0,0,140))
        end

        local top_bottomn = top:Add("DLabel")
        top_bottomn:Dock( BOTTOM )
        top_bottomn:DockMargin(0,0,0,0)
        top_bottomn:SetTall(scrh*0.02)
        top_bottomn:SetText( "" )

        local mattt = Material("materials/rdsrp/mat/prpts.png")

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
                draw.SimpleText("Fraktions Menu", "RDS.ESCmenu.Title", 0, 0, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT)
            end

        
        local gray = vgui.Create("DLabel", top )
        gray:Dock(BOTTOM)
        gray:DockMargin(0,0,0,0)
        gray:SetTall(scrh*0.021)
        gray:SetText( "" )
        
            gray.Paint = function(self,w,h)
                draw.SimpleText("Fraktions Menu", "RDS.ESCmenu.graytitle", 3, 0, Color(128,128,128), TEXT_ALIGN_LEFT)
            end


end



local function MemberOnline()
        local scrw, scrh = ScrW(), ScrH()
        local marginl,margint,marginr,marginu = 5,scrh*0.23,0,scrh*0.050

        local pnl = vgui.Create("DPanel", Gtbl.Frame )
        pnl:Dock(LEFT)
        pnl:DockMargin(marginl,margint,marginr,marginu)
        pnl:SetWide(scrw*0.25)

            pnl.Paint = function(self,w,h)
                surface.SetDrawColor(_RDS:Color("WHITE", 255))
                surface.DrawOutlinedRect(0,0,w,h,2)
            end

        local top = pnl:Add("DLabel")
        top:Dock(TOP)
        top:DockMargin(0,0,0,10)
        top:SetTall(scrh*0.05)
        top:SetText("")

            top.Paint = function(self,w,h)
                surface.SetDrawColor(_RDS:Color("WHITE", 255))
                surface.DrawOutlinedRect(0,0,w,h,2)
                draw.SimpleText("Aktive Mitglieder", "RDSRP.25", self:GetWide()/2, self:GetTall()/2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end


        local spanel = vgui.Create("DScrollPanel", pnl)
        spanel:Dock(FILL)
        spanel:DockMargin(0,0,0,0)

        local sbar = spanel:GetVBar()
        sbar:SetSize(0,0)
        function sbar:Paint(w, h) return end
        function sbar.btnUp:Paint(w, h) return end
        function sbar.btnDown:Paint(w, h) return end
        function sbar.btnGrip:Paint(w, h) return end

        local faction
        local subfactions
        for k,v in pairs(_RDS.Advtraining.Factions) do    
            faction = k
        end
        for k,v in pairs(_RDS.Advtraining.Factions[faction].SubFactions) do    
            subfactions = k
        end

            for k,v in pairs(_RDS.Advtraining.Factions[faction].SubFactions) do
                
                v.elements = vgui.Create("DCollapsibleCategory", spanel)
                v.elements:Dock(TOP)
                v.elements:DockMargin(15,10,15,0)
                v.elements:SetHeaderHeight(scrh*0.05)
                v.elements:SetLabel("")

                v.elements.Paint = function(self,w,h)
                        surface.SetDrawColor(_RDS:Color("WHITE", 255))
                        surface.DrawOutlinedRect(0,0,w,h,2)

                        local txt = v.elements:ChildCount() -1
                        draw.SimpleText(k.." ["..txt.."]", "RDSRP.25", self:GetWide()/2, scrh*0.019, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
            end

        local maxx
        
    for k, v in pairs(player.GetBots()) do
        _RDS.Advtraining.Factions[ faction ].SubFactions[ v:getJobTable().subfaction ].tempply = 0
        if ( v:IsBot() and _RDS.Advtraining.Factions[ faction ].SubFactions[ v:getJobTable().subfaction ] ) then 
            local tbl = _RDS.Advtraining.Factions[ faction ].SubFactions[ v:getJobTable().subfaction ]
            PrintTable(_RDS.Advtraining.Factions[ faction ])
               
            if tbl.elements then 
                local btn =  vgui.Create("DButton", tbl.elements)
                btn:Dock(TOP)
                btn:SetTall(scrh*0.1)
                btn:SetText("")
                
                    btn.Paint = function(self,w,h)
                        surface.SetDrawColor(_RDS:Color("WHITE", 255))
                        surface.DrawOutlinedRect(0,0,w,h,2)
                    end
                
                    btn.DoClick = function()
                    end

                local Avatar = vgui.Create( "AvatarImage", btn )
                Avatar:Dock(LEFT)
                Avatar:DockMargin(10,10,0,10)
                Avatar:SetWide( scrw * 0.040)
                Avatar:SetPlayer( v, 16 )

                local name = vgui.Create("DLabel", btn)
                name:Dock( FILL )
                name:DockMargin(0,0,0,0)
                name:SetText("")

                    name.Paint = function(self,w,h)
                        draw.SimpleText(v:GetName(), "RDSRP.25", self:GetWide()/2, self:GetTall()/2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
            
            end                
        end
    end

end 


function Gtbl:Init()

    local scrw, scrh = ScrW(), ScrH()
    
    if IsValid(Gtbl.Frame) then 

        Gtbl.Frame:Remove()
        open = false

    else

        Gtbl.Frame = vgui.Create("RDSRP.BPanel")
        Gtbl.Frame:SetSize(scrw, scrh) 
        Gtbl.Frame:Center()
        Gtbl.Frame:MakePopup()
 
            Gtbl.Frame.Paint = function(self,w,h)
                draw.RoundedBox(0,0,0,w,h,Color(0,0,0,130))
            end

        Gtbl:TOP()

        for k,v in pairs(_RDS.Advtraining.Factions) do   
            if v.Leader[ LocalPlayer():Team() ] then      
                MemberOnline()
            end
        end
        open = true 

    end

end