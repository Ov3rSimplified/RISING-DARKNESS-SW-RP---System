local mat_col_spec = 76561198799235527
local mat_armory = Material( "craphead_scripts/armory_robbery_ui/police_armory_ui.png" )

local col_dgray = Color( 26, 26, 26, 255 )
local col_lgray = Color( 19, 19, 19, 255 )

local col_green = Color( 0, 75, 0, 255 )
local col_light_green = Color( 0, 125, 0, 255 )

local col_red = Color( 75, 0, 0, 255 )
local col_light_red = Color( 125, 0, 0, 255 )

local col_restricted = Color( 30, 30, 30, 255 )
local col_restricted_hover = Color( 25, 25, 25, 255 )















net.Receive( "ARMORY_Weapon_Menu", function( len, ply )

	local readent = net.ReadEntity()
	local scrw,scrh = ScrW(), ScrH()

	net.Start("RDSRP.Roleplay.Trainings.ReLoad")
    net.SendToServer()

	net.Start("RDSRP.IPlayer.GetCharacterID")
	local isd = LocalPlayer()
	net.WriteType(isd)
	net.SendToServer()

	
timer.Simple(0.1, function()
	
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



	for k,v in pairs(_RDS.Advtraining.Trainings) do   
		local mainK = k
		local wep = weapons.Get(mainK)

			local tbl = {
				["Feuerrate"] =  wep.Primary.RPM.." RPM" or "N/A",
				["Schaden"] =  wep.Primary.Damage or "N/A",
				["Überhitzungsstufen"] = wep.heatStep or "N/A",
				["Kategorie"] = _RDS.Advtraining.Trainings[k].categorys.category
			}

			if _RDS.Advtraining.Whitelist[k][LocalPlayer().CharacterID] then 
				goto fas
			else
				continue 
			end
 
			::fas::
	--	PrintTable(_RDS.Advtraining.Whitelist)
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
					net.Start( "ARMORY_DepositItem" )
						net.WriteTable( tbl )
						net.WriteEntity(readent)
					net.SendToServer()
				else
					net.Start( "ARMORY_RetrieveItem" )
						net.WriteTable( tbl )
						net.WriteEntity(readent)
					net.SendToServer()
				end
			end

		end

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
			net.Start("ARMORY_CloseDoor")
			net.WriteEntity(readent)
			net.SendToServer() 
			
            Frame:Remove()
		--	SetBodygroup(1,0)
		end

	end) 

end )
























/*
net.Receive( "ARMORY_Weapon_Menu", function( len, ply )
	local GUI_Armory_Frame = vgui.Create( "DFrame" )
	GUI_Armory_Frame:SetTitle( "" )
	GUI_Armory_Frame:SetSize( ScrW() * 0.5, ScrH() * 0.5 )
	GUI_Armory_Frame:SetPos( ScrW() * 0.5, ScrH() * 0.5 )
	GUI_Armory_Frame:SetMouseInputEnabled( true ) 
	GUI_Armory_Frame:Center()
	GUI_Armory_Frame.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, ScrW() * 0.48, ScrH() * 0.495, Color(0,0,0,130) )
		surface.SetDrawColor( Color(0,0,0,130) )
		surface.DrawOutlinedRect( 0, 0, ScrW() * 0.48, ScrH() * 0.495, 2 )
		surface.DrawOutlinedRect( 0, 0, ScrW() * 0.48, ScrH() * 0.060, 2 )

		-- Draw the top title.
		draw.SimpleText( "W A F F E N K I S T E", "ARMORY_UIFontTitle", ScrW() * 0.064, ScrH() * 0.030, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	GUI_Armory_Frame:MakePopup()
	GUI_Armory_Frame:SetDraggable( false )
	GUI_Armory_Frame:ShowCloseButton( false )
	
	local GUI_Armory_Exit = vgui.Create( "DButton", GUI_Armory_Frame )
	GUI_Armory_Exit:SetSize( ScrW() * 0.09, ScrH() * 0.04 )
	GUI_Armory_Exit:SetPos( ScrW() * 0.385, ScrH() * 0.01 )
	GUI_Armory_Exit:SetText( "Schließen" )
	GUI_Armory_Exit:SetFont( "ARMORY_UIFontTitle" )
	GUI_Armory_Exit:SetTextColor( Color(255,0,0) )
	GUI_Armory_Exit.Paint = function(s,w,h)
		--draw.RoundedBox(0,0,0,w,h,Color(250,0,0))
		surface.DrawOutlinedRect(0,0,w,h,2)
	end
	GUI_Armory_Exit.DoClick = function()
		GUI_Armory_Frame:Remove()
		
		net.Start("ARM_LOCKER_CloseDoorAnim")
		net.SendToServer()
	end
	
	local GUI_Item_Panel = vgui.Create( "DPanelList", GUI_Armory_Frame )
	GUI_Item_Panel:SetSize( ScrW() * 0.466, ScrH() * 0.4125 )
	GUI_Item_Panel:SetPos( ScrW() * 0.01, ScrH() * 0.073 )
	GUI_Item_Panel:EnableVerticalScrollbar( true )
	GUI_Item_Panel:EnableHorizontal( true )
	GUI_Item_Panel.Paint = function( self, w, h )
		draw.RoundedBox( 2, 0, 2, w, h, color_transparent )
	end
	if ( GUI_Item_Panel.VBar ) then
		GUI_Item_Panel.VBar.Paint = function( self, w, h )
			draw.RoundedBoxEx( 0, 0, 0, w, h, color_transparent ) -- BG
		end
		
		GUI_Item_Panel.VBar.btnUp.Paint = function( self, w, h )
			draw.RoundedBox( 4, 0, 2, w, h, color_transparent )
		end
		
		GUI_Item_Panel.VBar.btnGrip.Paint = function( self, w, h )
			draw.RoundedBoxEx( 16, -5, 3, w, h, Color(0,0,0,130), false, false, false, false )
		end
		
		GUI_Item_Panel.VBar.btnDown.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, color_transparent )
		end
	end
	
	for k, wep in pairs( CH_Armory_Locker.Weapons ) do
		if wep.Name then
			if CH_Armory_Locker.Config.HideRestrictedItems and table.HasValue( CH_Armory_Locker.TeamCategories[ wep.Weapon ], team.GetName( LocalPlayer():Team() ) ) then
				local GUI_ItemPanel = vgui.Create("DPanelList")
				GUI_ItemPanel:SetSize( ScrW() * 0.455, ScrH() * 0.155 )
				GUI_ItemPanel:SetPos( ScreenScale( 3.3 ), ScreenScale( 10 ) )
				GUI_ItemPanel:SetSpacing( 50 )
				GUI_ItemPanel.Paint = function( self, w, h )
					-- Outer
					draw.RoundedBox( 0,0,0, w, h, Color(0,0,0,130) )
					
					-- Weapon model frame
				--	draw.RoundedBox( 2, ScrW() * 0.011, ScrH() * 0.019, ScrW() * 0.125, ScrH() * 0.13, col_lgray )
					
					-- Weapon text frame
					surface.SetDrawColor(Color(0,0,0,130))
					surface.DrawOutlinedRect(0,0,w,h)
				--	draw.RoundedBox( 2, ScrW() * 0.138, ScrH() * 0.019, ScrW() * 0.313, ScrH() * 0.13, col_lgray )
					
				end
				
				surface.SetFont( "ARMORY_UIFontText" )
				local x, y = surface.GetTextSize( wep.Name )
			
			--if CH_Armory_Locker.Config.HideRestrictedItems and table.HasValue( CH_Armory_Locker.TeamCategories[ wep.Weapon ], team.GetName( LocalPlayer():Team() ) ) then
				local GUI_Item_Name = vgui.Create( "DLabel", GUI_ItemPanel )
				GUI_Item_Name:SetPos( ( GUI_ItemPanel:GetWide() / 6.25 ) - ( x / 2 ), ScrH() * 0.025 )
				GUI_Item_Name:SetFont( "ARMORY_UIFontText" )
				GUI_Item_Name:SetColor( color_white )
				GUI_Item_Name:SetText( wep.Name )
				GUI_Item_Name:SizeToContents()
			

	
				local GUI_Item_Icon = vgui.Create( "DModelPanel", GUI_ItemPanel )
				GUI_Item_Icon:SetPos( ScrW() * 0.005, ScrH() * 0.055 )
				GUI_Item_Icon:SetSize( ScreenScale( 90 ), ScreenScale( 35 ) )
				GUI_Item_Icon:SetModel( wep.Model )
				GUI_Item_Icon:GetEntity():SetAngles( Angle( -10, 0, 15 ) )
				local mn, mx = GUI_Item_Icon.Entity:GetRenderBounds()
				local size = 0
				size = math.max( size, math.abs( mn.x ) + math.abs( mx.x ) )
				size = math.max( size, math.abs( mn.y ) + math.abs( mx.y ) )
				size = math.max( size, math.abs( mn.z ) + math.abs( mx.z ) )
				GUI_Item_Icon:SetFOV( 45 )
				GUI_Item_Icon:SetCamPos( Vector( size, size, size ) )
				GUI_Item_Icon:SetLookAt( (mn + mx) * 0.5 )
				function GUI_Item_Icon:LayoutEntity( Entity ) return end
				
				-- Weapon Description
				local GUI_Item_Desc = vgui.Create( "DLabel", GUI_ItemPanel )
				GUI_Item_Desc:SetPos( ScrW() * 0.145, ScrH() * 0.025 )
				GUI_Item_Desc:SetFont( "ARMORY_UIFontText" )
				GUI_Item_Desc:SetColor( Color( 100, 100, 100, 230 ) )
				GUI_Item_Desc:SetText( "Beschreibung" )
				GUI_Item_Desc:SizeToContents()
				
				local x, y = surface.GetTextSize( wep.Desc )

				local GUI_Item_DescText = vgui.Create( "DLabel", GUI_ItemPanel )
				if x <= 500 then
					GUI_Item_DescText:SetPos( ScrW() * 0.145, ScrH() * 0.03 )
				elseif x <= 1000 then
					GUI_Item_DescText:SetPos( ScrW() * 0.145, ScrH() * 0.04 )
				else
					GUI_Item_DescText:SetPos( ScrW() * 0.145, ScrH() * 0.05 )
				end
				
				GUI_Item_DescText:SetSize( ScrW() * 0.27, ScrH() * 0.055 )
				GUI_Item_DescText:SetFont( "ARMORY_UIFontText" )
				GUI_Item_DescText:SetColor( Color( 230, 230, 230, 230 ) )
				GUI_Item_DescText:SetWrap( true )
				GUI_Item_DescText:SetText( wep.Desc )

				-- Retrieve/Deposit Button
				local GUI_Retrieve_Item = vgui.Create("DButton", GUI_ItemPanel)
				GUI_Retrieve_Item:SetPos( ScrW() * 0.372, ScrH() * 0.11 )
				GUI_Retrieve_Item:SetSize( ScrW() * 0.075, ScrH() * 0.031 )
				GUI_Retrieve_Item:SetText("")
				GUI_Retrieve_Item.Paint = function( self, w, h )
					if CH_Armory_Locker.Config.UseJobRestrictions and CH_Armory_Locker.TeamCategories[ wep.Weapon ] and not table.HasValue( CH_Armory_Locker.TeamCategories[ wep.Weapon ], team.GetName( LocalPlayer():Team() ) ) then
						self:SetToolTip( "Only the following jobs can retrieve this item: ".. table.concat( CH_Armory_Locker.TeamCategories[ wep.Weapon ], ", " ) )
						if self:IsHovered() then
							draw.RoundedBoxEx( 8, 0, 0, w, h, col_restricted_hover, false, false, false, false )
						else
							draw.RoundedBoxEx( 8, 0, 0, w, h, col_restricted, false, false, false, false )
						end
					elseif not LocalPlayer():HasWeapon( wep.Weapon ) then
						if self:IsHovered() then
							surface.SetDrawColor( Color( 0, 125, 0, 255 ) )
							surface.DrawOutlinedRect(0,0,w,h,2)
					else
							surface.SetDrawColor( Color( 0, 75, 0, 255 ) )
							surface.DrawOutlinedRect(0,0,w,h,2)
						end
					else
						if self:IsHovered() then
							surface.SetDrawColor( Color( 125, 0, 0, 255 ) )
							surface.DrawOutlinedRect(0,0,w,h,2)
						else
							surface.SetDrawColor( Color( 75, 0, 0, 255 ) )
							surface.DrawOutlinedRect(0,0,w,h,2)
						end
					end


					
					local btn_text = "N/A"
					
					if CH_Armory_Locker.Config.UseJobRestrictions and CH_Armory_Locker.TeamCategories[ wep.Weapon ] and not table.HasValue( CH_Armory_Locker.TeamCategories[ wep.Weapon ], team.GetName( LocalPlayer():Team() ) ) then
						btn_text = "Item Restricted"
					elseif wep.Category == "pistol" or wep.Category == "smg" or wep.Category == "rifle" or wep.Category == "shotgun" or wep.Category == "sniper" then
						if LocalPlayer():HasWeapon( wep.Weapon ) then
							btn_text = "Ablegen"
						else
							btn_text = "Entnehmen"
						end
					elseif wep.Category == "ammo" then
						btn_text = "Entnehmen"
					elseif wep.Category == "armor" then
						btn_text = "Entnehmen"
					elseif wep.Category == "health" then
						btn_text = "Entnehmen"
					end
					
					draw.SimpleText( btn_text, "ARMORY_UIFontTextButton", w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				end
				GUI_Retrieve_Item.DoClick = function()
					GUI_Armory_Frame:Remove()
							
					if wep.Category == "pistol" or wep.Category == "smg" or wep.Category == "rifle" or wep.Category == "shotgun" or wep.Category == "sniper" then
						if LocalPlayer():HasWeapon( wep.Weapon ) then
							net.Start( "ARMORY_DepositItem" )
								net.WriteDouble( k )
							net.SendToServer()
						else
							net.Start( "ARMORY_RetrieveItem" )
								net.WriteDouble( k )
							net.SendToServer()
						end
					else
						net.Start( "ARMORY_RetrieveItem" )
							net.WriteDouble( k )
						net.SendToServer()
					end
							
					net.Start("ARM_LOCKER_CloseDoorAnim")
					net.SendToServer()
				end
						
				GUI_Item_Panel:AddItem( GUI_ItemPanel )
			elseif not CH_Armory_Locker.Config.HideRestrictedItems then
				local GUI_ItemPanel = vgui.Create("DPanelList")
				GUI_ItemPanel:SetSize( ScrW() * 0.455, ScrH() * 0.155 )
				GUI_ItemPanel:SetPos( ScreenScale( 3.3 ), ScreenScale( 10 ) )
				GUI_ItemPanel:SetSpacing( 10 )
				GUI_ItemPanel.Paint = function( self, w, h )
					-- Outer
					draw.RoundedBox( 2, ScrW() * 0.008, ScrH() * 0.015, w, h, col_dgray )
					
					-- Weapon model frame
					draw.RoundedBox( 2, ScrW() * 0.011, ScrH() * 0.019, ScrW() * 0.125, ScrH() * 0.13, col_lgray )
					
					-- Weapon text frame
					draw.RoundedBox( 2, ScrW() * 0.138, ScrH() * 0.019, ScrW() * 0.313, ScrH() * 0.13, col_lgray )
				end
				
				surface.SetFont( "ARMORY_UIFontText" )
				local x, y = surface.GetTextSize( wep.Name )
				
				local GUI_Item_Name = vgui.Create( "DLabel", GUI_ItemPanel )
				GUI_Item_Name:SetPos( ( GUI_ItemPanel:GetWide() / 6.25 ) - ( x / 2 ), ScrH() * 0.025 )
				GUI_Item_Name:SetFont( "ARMORY_UIFontText" )
				GUI_Item_Name:SetColor( color_white )
				GUI_Item_Name:SetText( wep.Name )
				GUI_Item_Name:SizeToContents()
				
				local GUI_Item_Icon = vgui.Create( "DModelPanel", GUI_ItemPanel )
				GUI_Item_Icon:SetPos( ScrW() * 0.005, ScrH() * 0.055 )
				GUI_Item_Icon:SetSize( ScreenScale( 90 ), ScreenScale( 35 ) )
				GUI_Item_Icon:SetModel( wep.Model )
				GUI_Item_Icon:GetEntity():SetAngles( Angle( -10, 0, 15 ) )
				local mn, mx = GUI_Item_Icon.Entity:GetRenderBounds()
				local size = 0
				size = math.max( size, math.abs( mn.x ) + math.abs( mx.x ) )
				size = math.max( size, math.abs( mn.y ) + math.abs( mx.y ) )
				size = math.max( size, math.abs( mn.z ) + math.abs( mx.z ) )
				GUI_Item_Icon:SetFOV( 45 )
				GUI_Item_Icon:SetCamPos( Vector( size, size, size ) )
				GUI_Item_Icon:SetLookAt( (mn + mx) * 0.5 )
				function GUI_Item_Icon:LayoutEntity( Entity ) return end
				
				-- Vehicle Description
				local GUI_Item_Desc = vgui.Create( "DLabel", GUI_ItemPanel )
				GUI_Item_Desc:SetPos( ScrW() * 0.145, ScrH() * 0.025 )
				GUI_Item_Desc:SetFont( "ARMORY_UIFontText" )
				GUI_Item_Desc:SetColor( Color( 100, 100, 100, 230 ) )
				GUI_Item_Desc:SetText( "Beschreibung" )
				GUI_Item_Desc:SizeToContents() 
				
				local x, y = surface.GetTextSize( wep.Desc )

				local GUI_Item_DescText = vgui.Create( "DLabel", GUI_ItemPanel )
				if x <= 500 then
					GUI_Item_DescText:SetPos( ScrW() * 0.145, ScrH() * 0.03 )
				elseif x <= 1000 then
					GUI_Item_DescText:SetPos( ScrW() * 0.145, ScrH() * 0.04 )
				else
					GUI_Item_DescText:SetPos( ScrW() * 0.145, ScrH() * 0.05 )
				end
				
				GUI_Item_DescText:SetSize( ScrW() * 0.27, ScrH() * 0.055 )
				GUI_Item_DescText:SetFont( "ARMORY_UIFontText" )
				GUI_Item_DescText:SetColor( Color( 230, 230, 230, 230 ) )
				GUI_Item_DescText:SetWrap( true )
				GUI_Item_DescText:SetText( wep.Desc )
				


				-- Retrieve/Deposit Button
				local GUI_Retrieve_Item = vgui.Create("DButton", GUI_ItemPanel)
				GUI_Retrieve_Item:SetPos( ScrW() * 0.372, ScrH() * 0.11 )
				GUI_Retrieve_Item:SetSize( ScrW() * 0.075, ScrH() * 0.031 )
				GUI_Retrieve_Item:SetText("")
				GUI_Retrieve_Item.Paint = function( self, w, h )
					if CH_Armory_Locker.Config.UseJobRestrictions and CH_Armory_Locker.TeamCategories[ wep.Weapon ] and not table.HasValue( CH_Armory_Locker.TeamCategories[ wep.Weapon ], team.GetName( LocalPlayer():Team() ) ) then
						self:SetToolTip( "Only the following jobs can retrieve this item: ".. table.concat( CH_Armory_Locker.TeamCategories[ wep.Weapon ], ", " ) )
						if self:IsHovered() then
							draw.RoundedBoxEx( 8, 0, 0, w, h, col_restricted_hover, false, false, false, false )
						else
							draw.RoundedBoxEx( 8, 0, 0, w, h, col_restricted, false, false, false, false )
						end
					elseif not LocalPlayer():HasWeapon( wep.Weapon ) then
						if self:IsHovered() then
							surface.SetDrawColor( Color( 0, 125, 0, 255 ) )
							surface.DrawOutlinedRect(0,0,w,h,2)
					else
							surface.SetDrawColor( Color( 0, 75, 0, 255 ) )
							surface.DrawOutlinedRect(0,0,w,h,2)
						end
					else
						if self:IsHovered() then
							surface.SetDrawColor( Color( 125, 0, 0, 255 ) )
							surface.DrawOutlinedRect(0,0,w,h,2)
						else
							surface.SetDrawColor( Color( 75, 0, 0, 255 ) )
							surface.DrawOutlinedRect(0,0,w,h,2)
						end
					end


					
					local btn_text = "N/A"
					
					if CH_Armory_Locker.Config.UseJobRestrictions and CH_Armory_Locker.TeamCategories[ wep.Weapon ] and not table.HasValue( CH_Armory_Locker.TeamCategories[ wep.Weapon ], team.GetName( LocalPlayer():Team() ) ) then
						btn_text = "Item Restricted"
					elseif wep.Category == "pistol" or wep.Category == "smg" or wep.Category == "rifle" or wep.Category == "shotgun" or wep.Category == "sniper" then
						if LocalPlayer():HasWeapon( wep.Weapon ) then
							btn_text = "Ablegen"
						else
							btn_text = "Entnehmen"
						end
					elseif wep.Category == "ammo" then
						btn_text = "Entnehmen"
					elseif wep.Category == "armor" then
						btn_text = "Entnehmen"
					elseif wep.Category == "health" then
						btn_text = "Entnehmen"
					end
					
					draw.SimpleText( btn_text, "ARMORY_UIFontTextButton", w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				end
				GUI_Retrieve_Item.DoClick = function()
					if CH_Armory_Locker.Config.UseJobRestrictions and CH_Armory_Locker.TeamCategories[ wep.Weapon ] and not table.HasValue( CH_Armory_Locker.TeamCategories[ wep.Weapon ], team.GetName( LocalPlayer():Team() ) ) then
						return
					end
					
					GUI_Armory_Frame:Remove()
					
					if wep.Category == "pistol" or wep.Category == "smg" or wep.Category == "rifle" or wep.Category == "shotgun" or wep.Category == "sniper" then
						if LocalPlayer():HasWeapon( wep.Weapon ) then
							net.Start( "ARMORY_DepositItem" )
								net.WriteDouble( k )
							net.SendToServer()
						else
							net.Start( "ARMORY_RetrieveItem" )
								net.WriteDouble( k )
							net.SendToServer()
						end
					else
						net.Start( "ARMORY_RetrieveItem" )
							net.WriteDouble( k )
						net.SendToServer()
					end
					
					net.Start("ARM_LOCKER_CloseDoorAnim")
					net.SendToServer()
				end
				
				
				GUI_Item_Panel:AddItem( GUI_ItemPanel )
			end
		end
		
	end
end )
*/