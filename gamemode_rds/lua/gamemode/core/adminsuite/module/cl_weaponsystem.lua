// RISING DARKNESS!
// Copyright (c) 2022 RISING DARKNESS
//--------------------------------------------\\
// Code written for RDS:RP[RISING DARKNESS], 
// they only have the permission to use,
// edit or own the codeline/gamemode. 
//
// Code Written by:
//     - Ov3rSimplified
//     - Rooki
//     -  
//     - 
//     -
//** [[   Adminsuite | cl_weaponsystem.lua   ]]** \\
_RDS.Adminsuite.UI.Config.WSys = {}
local RDSC = _RDS.Adminsuite.UI.Config.WSys


function RDSC:Main()
    local scrw, scrh = ScrW(), ScrH()
    local top = _RDS.Adminsuite.UI.Select:Add("DPanel")
    top:Dock(TOP)
    top:DockMargin(0,0,0,0)
    top:SetTall(scrh*0.075)
    top:SetText("")
        top.Paint = function(self,w,h)
            draw.RoundedBoxEx(15,0,0,w,h,Color(46,46,46),false,false,false,false)
            draw.SimpleText("⸻ WeaponsSystem ⸻", "RDS.Admin.btn", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        RDSC.TOP = top
        _RDS.Adminsuite.UI:BackButton(function() top:Remove() _RDS.Adminsuite.UI.AdminSettings.Scroll:Clear() _RDS.Adminsuite.UI.AdminSettings:ServerSettings() end)
    local MaxPrimaryPanel =  _RDS.Adminsuite.UI.AdminSettings.Scroll:Add("DPanel")
    MaxPrimaryPanel:Dock(TOP)
    MaxPrimaryPanel:DockMargin(5,5,5,0)
    MaxPrimaryPanel:SetTall(scrw*0.05)
    MaxPrimaryPanel.Paint = nil
    local MaxPrimaryValue = vgui.Create("DNumberWang", MaxPrimaryPanel)
    MaxPrimaryValue:Dock(LEFT)
    MaxPrimaryValue:DockMargin(5,20,0,20)
    MaxPrimaryValue:SetWide(ScrW()*0.05)
    MaxPrimaryValue:SetValue(_RDS.Admin.IConfig["Weaponsystem"].Core.MaxPrimary)
    MaxPrimaryValue:SetMin(0)
    MaxPrimaryValue:SetMax(10)
    MaxPrimaryValue:SetPlaceholderText("Number")
    MaxPrimaryValue:SetFont("RDSRP.40")
        MaxPrimaryValue.OnValueChange = function( self )
            _RDS.Admin.IConfig["Weaponsystem"].Core.MaxPrimary = self:GetValue()
            net.Start("RDSRP.IConfig.Load")
            net.WriteTable(_RDS.Admin.IConfig)
            net.SendToServer()
        end
    local MaxPrimaryText = vgui.Create("DLabel", MaxPrimaryPanel)
    MaxPrimaryText:Dock(LEFT)
    MaxPrimaryText:DockMargin(15,0,0,0)
    MaxPrimaryText:SetWide(ScrW()*0.3)
    MaxPrimaryText:SetText("")
        MaxPrimaryText.Paint = function(self,w,h)
            draw.SimpleText("Max. Primaryslots", "RDSRP.40", 0, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
        end
    local MaxSeconaryPanel =  _RDS.Adminsuite.UI.AdminSettings.Scroll:Add("DPanel")
    MaxSeconaryPanel:Dock(TOP)
    MaxSeconaryPanel:DockMargin(5,5,5,0)
    MaxSeconaryPanel:SetTall(scrw*0.05)
    MaxSeconaryPanel.Paint = nil
    local MaxSecondaryValue = vgui.Create("DNumberWang", MaxSeconaryPanel)
    MaxSecondaryValue:Dock(LEFT)
    MaxSecondaryValue:DockMargin(5,20,0,20)
    MaxSecondaryValue:SetWide(ScrW()*0.05)
    MaxSecondaryValue:SetValue(_RDS.Admin.IConfig["Weaponsystem"].Core.MaxSecondary)
    MaxSecondaryValue:SetMin(0)
    MaxSecondaryValue:SetMax(10)
    MaxSecondaryValue:SetPlaceholderText("Number")
    MaxSecondaryValue:SetFont("RDSRP.40")
    MaxSecondaryValue.OnValueChange = function( self )
            _RDS.Admin.IConfig["Weaponsystem"].Core.MaxSecondary = self:GetValue()
            net.Start("RDSRP.IConfig.Load")
            net.WriteTable(_RDS.Admin.IConfig)
            net.SendToServer()
        end
    local MaxPSecondaryText = vgui.Create("DLabel", MaxSeconaryPanel)
    MaxPSecondaryText:Dock(LEFT)
    MaxPSecondaryText:DockMargin(15,0,0,0)
    MaxPSecondaryText:SetWide(ScrW()*0.3)
    MaxPSecondaryText:SetText("")
    MaxPSecondaryText.Paint = function(self,w,h)
            draw.SimpleText("Max. Secondaryslots", "RDSRP.40", 0, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
        end
    local MaxSidearmPanel =  _RDS.Adminsuite.UI.AdminSettings.Scroll:Add("DPanel")
    MaxSidearmPanel:Dock(TOP)
    MaxSidearmPanel:DockMargin(5,5,5,0)
    MaxSidearmPanel:SetTall(scrw*0.05)
    MaxSidearmPanel.Paint = nil
    local MaxSidearmValue = vgui.Create("DNumberWang", MaxSidearmPanel)
    MaxSidearmValue:Dock(LEFT)
    MaxSidearmValue:DockMargin(5,20,0,20)
    MaxSidearmValue:SetWide(ScrW()*0.05)
    MaxSidearmValue:SetValue(_RDS.Admin.IConfig["Weaponsystem"].Core.MaxSideArm)
    MaxSidearmValue:SetMin(0)
    MaxSidearmValue:SetMax(10)
    MaxSidearmValue:SetPlaceholderText("Number")
    MaxSidearmValue:SetFont("RDSRP.40")
    MaxSidearmValue.OnValueChange = function( self )
            _RDS.Admin.IConfig["Weaponsystem"].Core.MaxSideArm = self:GetValue()
            net.Start("RDSRP.IConfig.Load")
            net.WriteTable(_RDS.Admin.IConfig)
            net.SendToServer()
        end
    local MaxSidearmText = vgui.Create("DLabel", MaxSidearmPanel)
    MaxSidearmText:Dock(LEFT)
    MaxSidearmText:DockMargin(15,0,0,0)
    MaxSidearmText:SetWide(ScrW()*0.3)
    MaxSidearmText:SetText("")
    MaxSidearmText.Paint = function(self,w,h)
            draw.SimpleText("Max. Sidearmslots", "RDSRP.40", 0, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
        end
    local MaxGadetPanel =  _RDS.Adminsuite.UI.AdminSettings.Scroll:Add("DPanel")
    MaxGadetPanel:Dock(TOP)
    MaxGadetPanel:DockMargin(5,5,5,0)
    MaxGadetPanel:SetTall(scrw*0.05)
    MaxGadetPanel.Paint = nil
    local MaxGadetValue = vgui.Create("DNumberWang", MaxGadetPanel)
    MaxGadetValue:Dock(LEFT)
    MaxGadetValue:DockMargin(5,20,0,20)
    MaxGadetValue:SetWide(ScrW()*0.05)
    MaxGadetValue:SetValue(_RDS.Admin.IConfig["Weaponsystem"].Core.MaxGadgets)
    MaxGadetValue:SetMin(0)
    MaxGadetValue:SetMax(10)
    MaxGadetValue:SetPlaceholderText("Number")
    MaxGadetValue:SetFont("RDSRP.40")
    MaxGadetValue.OnValueChange = function( self )
            _RDS.Admin.IConfig["Weaponsystem"].Core.MaxGadgets = self:GetValue()
            net.Start("RDSRP.IConfig.Load")
            net.WriteTable(_RDS.Admin.IConfig)
            net.SendToServer()
        end
    local MaxGadetText = vgui.Create("DLabel", MaxGadetPanel)
    MaxGadetText:Dock(LEFT)
    MaxGadetText:DockMargin(15,0,0,0)
    MaxGadetText:SetWide(ScrW()*0.3)
    MaxGadetText:SetText("")
    MaxGadetText.Paint = function(self,w,h)
            draw.SimpleText("Max. Gadgetslots", "RDSRP.40", 0, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
        end
end
 















/*
function BluesDecals.UI.Elements.CreateSlider(color, minValue, maxValue, parent, onValueChanged)
	local function drawCircle( x, y, radius, seg ) --Credit to wiki
		local cir = {}

		table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
		for i = 0, seg do
			local a = math.rad( ( i / seg ) * -360 )
			table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
		end

		local a = math.rad( 0 ) -- This is needed for non absolute segment counts
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )

		surface.DrawPoly( cir )
	end 

	local p = vgui.Create("DPanel", parent)
	--p:NoClipping(true)
	p.slideAmount = 100 --This is between 0 and 100, regardless of the min and max value as there mapped to it
	p.Paint = function(s, w, h)
		local slideAmountPixel = math.Clamp(w/100 * (s.slideAmount) - h/2, h/2, w - (h/2))

		--Draw background and rounded edges
		draw.RoundedBox(0,h/2,2, w - h, h - 4,Color(40, 40, 45))
		draw.NoTexture()
		surface.SetDrawColor(Color(40, 40, 45))
		drawCircle(w - (h/2), h/2, (h/2) - 2, 16)
		
		--Draw the color section
		draw.RoundedBox(0,h/2,2, slideAmountPixel - (h/2), h - 4,color)
		draw.NoTexture()
		surface.SetDrawColor(color)
		drawCircle((h/2), h/2, (h/2) - 2, 16)

		--Slider end
		surface.SetDrawColor(Color(40, 40, 45))
		drawCircle(slideAmountPixel, h/2, (h/2) + 2, 16)
		surface.SetDrawColor(color)
		drawCircle(slideAmountPixel, h/2, (h/2) - 1, 16)
	end

	p.PerformLayout = function(s, w, h)
		s.sliderButton:SetSize(w, h)
	end

	--Create the slider end button
	local sliderButton = vgui.Create("DButton",p)
	sliderButton:SetText("")
	sliderButton.skipFrames = 0 --Skip frames are used becuase gui uses cached results
	sliderButton.Paint = function() end --Hide button
	sliderButton.OnMousePressed = function(s, keycode)
		if keycode == MOUSE_LEFT then
			s.sliding = true
			s.skipFrames = 1
		end
	end
	sliderButton.Think = function(s)
		if s.skipFrames > 0 then
			s.skipFrames = s.skipFrames - 1
		else
			if not input.IsMouseDown(MOUSE_LEFT) and s.sliding then
				s.sliding = false
				
			end
		end
			
		if s.sliding then
			
			--Work out new slider position
			local x, y = s:ScreenToLocal(gui.MouseX(), gui.MouseY())
			local newSlidePos = (100 / s:GetWide()) * math.Clamp(x + (p:GetTall()/2), 0, p:GetWide()) 

			p.slideAmount = newSlidePos
			onValueChanged(p.slideAmount/100 * maxValue)
		end
	end

	p.sliderButton = sliderButton

	return p
end
*/