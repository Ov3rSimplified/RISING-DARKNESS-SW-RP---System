local mat_col_spec = 76561198799235527
local mat_armory = Material( "craphead_scripts/armory_robbery_ui/police_armory_ui.png" )

--_RDS.Advtraining.Weaponchest = _RDS.Advtraining.Weaponchest or {}
 



net.Receive( "RDSRP.Weaponchest.Menu", function( len, ply )

	local readent = net.ReadEntity()
	local scrw,scrh = ScrW(), ScrH()

	net.Start("RDSRP.Roleplay.Trainings.ReLoad")
    net.SendToServer()

	net.Start("RDSRP.IPlayer.GetCharacterID")
	local isd = LocalPlayer()
	net.WriteType(isd)
	net.SendToServer()
	include("gamemode/config/sh_config.lua")

 
	
timer.Simple(0.5, function()
	
    local Frame = vgui.Create("RDSRP.BPanel")
    Frame:SetSize(scrw*0.55,scrh*0.9)
    Frame:Center()
    Frame:MakePopup()

        Frame.Paint = function(self,w,h)
            draw.RoundedBox(15,0,0,w,h,Color(23,22,22,255))
        end

    local Title = vgui.Create("DLabel", Frame)
    Title:Dock( TOP )
    Title:DockMargin(0,0,0,0)
    Title:SetText( "" )
    Title:SetTall( scrh * 0.08 )

    Title.Paint = function(self,w,h)
        draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,false,false)
        draw.SimpleText("⸻ Waffenkiste ⸻", "RDS.Admin.Title", self:GetWide()/2, scrh*0.040, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
 
	local info = vgui.Create("DLabel",Frame)
	info:Dock( TOP )
	info:DockMargin(0,0,0,0)
	info:SetTall(scrh*0.03)
	info:SetText( "" )

		info.Paint = function(self,w,h)
					
			local primweap = primweap or 0
			local secweap = secweap or 0

			for k,v in pairs( LocalPlayer():GetWeapons() ) do 
				if _RDS.Advtraining.Trainings[v:GetClass()] then 

					if v:GetClass() and _RDS.Advtraining.Trainings[v:GetClass()].categorys.category == "Primary" then
						primweap = primweap + 1
					end
					if v:GetClass() and _RDS.Advtraining.Trainings[v:GetClass()].categorys.category == "Secondary" then
						secweap = secweap + 1
					end
				end
			end
			
			draw.SimpleText("Primär ["..tostring(primweap).."]  || Sekundär ["..tostring(secweap).."]", "RDS.AdvTrain.informations", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

    local fill = vgui.Create("DScrollPanel", Frame)
    fill:Dock( FILL )
    fill:DockMargin(10,scrh*0.050,10,0)
		fill.Paint = nil

		local sbar = fill:GetVBar()
		sbar:SetSize(0,0)
		function sbar:Paint(w, h) return end
		function sbar.btnUp:Paint(w, h) return end
		function sbar.btnDown:Paint(w, h) return end
		function sbar.btnGrip:Paint(w, h) return end

		if _RDS.Advtraining.Trainings == nil then 
			_RDS:Notify("error", "Fehler!", "Es Exestieren keine Table Daten!", 2)
			goto close
		end


	for k,v in pairs(_RDS.Advtraining.Trainings) do  
		
		local mainK = k
		local wep = weapons.Get(mainK)

			local tbl = {
				["Feuerrate"] =  "N/A" or wep.Primary.RPM.." RPM", 
				["Schaden"] =  "N/A" or wep.Primary.Damage,
				["Überhitzungsstufen"] = "N/A" or  wep.heatStep,
				["Kategorie"] = "N/A" or _RDS.Advtraining.Trainings[k].categorys.category
			}

			if not v.isTFA then 
				tbl = v.informations
				if v.informations == nil then 
					tbl = {
						["Angaben"] = "Nicht Exestent!"
					}
				end
			else
				tbl["Feuerrate"] = wep.Primary.RPM.." RPM"
				tbl["Schaden"] = wep.Primary.Damage
				tbl["Überhitzungsstufen"] =  wep.heatStep
				tbl["Kategorie"] = _RDS.Advtraining.Trainings[k].categorys.category
			end


			::nottfa::
			if _RDS.Advtraining.Whitelist[k][cCharacterID] then 
				goto fas 
			else
				continue 
			end 
 
			::fas::
			
		local collab = vgui.Create("DCollapsibleCategory", fill)
		collab:Dock(TOP)
		collab:DockMargin(0,0,0,10)
		collab:SetHeaderHeight(scrh*0.1)
		collab:SetLabel("")

			collab.Paint = function(self,w,h)
				if self:GetExpanded() == true then  
					draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
				else
					draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
				end	
				draw.SimpleText("⸻ ".._RDS.Advtraining.Trainings[k].categorys.weaponname.." ⸻", "RDS.AdvTrain.Weapontitle", self:GetWide()/2, scrh * 0.05, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

			end

		local panel = vgui.Create("RDSRP.BPanel", collab)
		panel:Dock(TOP)
		panel:DockMargin(0,0,0,10)
		panel:SetTall(scrh*0.5)

		local clr = _RDS:Color("WHITE", 255)

			panel.Paint = function(self,w,h)
				draw.RoundedBox(5,0,0,w,h,Color(47,47,47))
			end


		local Bottom = panel:Add("DPanel")
		Bottom:Dock( BOTTOM )
		Bottom:DockMargin(0,0,0,0)
		Bottom:SetTall(scrh*0.06)
		Bottom.Paint = nil

		local right = panel:Add("DPanel")
		right:Dock( RIGHT )
		right:DockMargin(0,0,0,0)
		right:SetWide(scrw*0.25)
		right.Paint = function(self,w,h)
			surface.SetDrawColor( _RDS:Color("WHITE", 255))
			surface.DrawOutlinedRect(0,scrh*0.045,w,scrh*0.35,2)
		end


			local r_top = vgui.Create("DLabel", right)
			r_top:Dock(TOP)
			r_top:DockMargin(0,0,0,0)
			r_top:SetTall(scrh*0.05)
			r_top:SetText( "" )

				r_top.Paint = function(self,w,h)
					draw.SimpleText("Information", "RDS.AdvTrain.Title", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				end

			for k,v in pairs(tbl) do   
				local r_info = vgui.Create("DLabel", right)
				r_info:Dock(TOP)
				r_info:DockMargin(10,0,0,6)
				r_info:SetTall(scrh*0.035)
				r_info:SetText( "" )
				
				r_info.Paint = function(self,w,h)
					draw.SimpleText(k..": "..tostring(v), "RDS.AdvTrain.informations", 0, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)					
				end
			end

		local left = panel:Add("DImage")
		left:Dock( LEFT )
		left:DockMargin(0,0,0,0)
		left:SetWide(scrw*0.25)
		left:SetMaterial(_RDS:GetImgurImage(_RDS.Advtraining.Trainings[k].picture))

		local nim = Bottom:Add("DButton")
		nim:Dock(FILL)
		nim:DockMargin(scrw*0.090,5,scrw*0.090,5)
		nim:SetTall(scrh*0.04)
		nim:SetText( "" )
	
			nim.Paint = function(self,w,h)
				local btn_text
				local clrr = _RDS:Color("WHITE", 255)

				if LocalPlayer():HasWeapon( k ) then
					btn_text = "Ablegen"
				else
					btn_text = "Entnehmen"
				end


				if self:IsHovered() then 
					if LocalPlayer():HasWeapon( k ) then
						btn_text = "Ablegen"
						clrr = Color(255,0,0)
					else
						btn_text = "Entnehmen"
						clrr = Color(0,255,13)
					end

					draw.RoundedBox(5,0,0,w,h,clrr) --255,193,7,255
				end
					
				draw.RoundedBox(5,2,2,w-4,h-4,Color(102, 99, 99))
				draw.SimpleText(btn_text or "N/A", "RDS.AdvTrain.Title", self:GetWide()/2, self:GetTall()/2, clrr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
			
			nim.DoClick = function()

				local tbl = {
					weapon = k,
					ceateg = _RDS.Advtraining.Trainings[k].categorys.category,
					name = _RDS.Advtraining.Trainings[k].categorys.weaponname,
				}
				if LocalPlayer():HasWeapon( k ) then
					net.Start( "RDSRP.Weaponchest.DepositItem" )
						net.WriteTable( tbl )
						net.WriteEntity(readent)
					net.SendToServer()
				else
					net.Start( "RDSRP.Weaponchest.RetrieveItem" )
						net.WriteTable( tbl )
						net.WriteEntity(readent)
					net.SendToServer()
				end
			end

		end

		::close::
    local close = vgui.Create("DButton", Frame)
    close:Dock( BOTTOM )
    close:DockMargin(scrw*0.080,10,scrw*0.080,20)
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
			net.Start("RDSRP.Weaponchest.CloseDoor")
			net.WriteEntity(readent)
			net.SendToServer() 
            Frame:Remove()
		end

	end) 
end)

 print(_RDS.Admin.IConfig["Weaponsystem"].Core.MaxPrimary)