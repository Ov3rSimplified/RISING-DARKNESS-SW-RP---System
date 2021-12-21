--
derma.DefineControl("RDSRP.BPanel", nil, {}, "EditablePanel")


local PANEL = {}
local cos, sin, rad = math.cos, math.sin, math.rad

AccessorFunc( PANEL, "m_masksize", "MaskSize", FORCE_NUMBER )

function PANEL:Init()
    self.Avatar = vgui.Create( "AvatarImage", self )
    self.Avatar:SetPaintedManually( true )
	self:SetMaskSize( self:GetWide() / 2 )
end

function PANEL:PerformLayout()
    self.Avatar:SetSize( self:GetWide(), self:GetTall() )
end

function PANEL:SetPlayer( id )
	self.Avatar:SetPlayer( id, self:GetWide() )
end

function PANEL:Paint( w, h )
    render.ClearStencil()
    render.SetStencilEnable( true )

    render.SetStencilWriteMask( 1 )
    render.SetStencilTestMask( 1 )

    render.SetStencilFailOperation( STENCILOPERATION_REPLACE )
    render.SetStencilPassOperation( STENCILOPERATION_ZERO )
    render.SetStencilZFailOperation( STENCILOPERATION_ZERO )
    render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_NEVER )
    render.SetStencilReferenceValue( 1 )

	local _m = self.m_masksize

	local circle, t = {}, 0
    for i = 1, 360 do
        t = rad(i*720)/720
        circle[i] = { x = w/2 + cos(t)*_m, y = h/2 + sin(t)*_m }
    end
	draw.NoTexture()
	surface.SetDrawColor( color_white )
	surface.DrawPoly( circle )

    render.SetStencilFailOperation( STENCILOPERATION_ZERO )
    render.SetStencilPassOperation( STENCILOPERATION_REPLACE )
    render.SetStencilZFailOperation( STENCILOPERATION_ZERO )
    render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_EQUAL )
    render.SetStencilReferenceValue( 1 )

    self.Avatar:SetPaintedManually( false )
    self.Avatar:PaintManual()
    self.Avatar:SetPaintedManually( true )

    render.SetStencilEnable( false )
    render.ClearStencil()
end

vgui.Register( "RDSRP.CircleAvatar", PANEL )




local blur = Material("pp/blurscreen")

function _RDS:DrawBlurRect(x, y, w, h, amount, density)
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(blur)

    for i = 1, density do
		blur:SetFloat("$blur", (i / 3) * (amount or 6))
        blur:Recompute()
        render.UpdateScreenEffectTexture()
        render.SetScissorRect(x, y, x + w, y + h, true)
        surface.DrawTexturedRect(0 * -1, 0 * -1, ScrW(), ScrH())
        render.SetScissorRect(0, 0, 0, 0, false)
    end
end


function _RDS:StringRequest( strTitle, strDefaultText, strDefaultText2, fnEnter, fnEnter2, fnCancel, fnCancel2, strButtonText, strButtonCancelText )

	local Window = vgui.Create( "DFrame" )
--	Window:SetTitle( "" )
	--Window:SetDraggable( false )
	Window:ShowCloseButton( false )
	Window:SetBackgroundBlur( true )
	Window:SetDrawOnTop( true )
    Window:SetSize( ScrW() * 0.34, ScrW() * 0.2 )
    Window:Center()

    local top = vgui.Create("DPanel", Window)
    top:Dock(TOP)
    top:SetTall(ScrH()*0.1)


    local close = vgui.Create("DButton", Window)
    close:Dock(BOTTOM)

    close.DoClick = function()
        
        Window:Remove()
    end



	Window:MakePopup()
	Window:DoModal()

	return Window

end


file.CreateDir("rdsrp")
file.CreateDir("rdsrp/imgur")
 
_RDS.CachedImages = _RDS.CachedImages or {}

function _RDS:GetImgurImage(ImgurID)
    if _RDS.CachedImages[ImgurID] then
        return _RDS.CachedImages[ImgurID]
    elseif file.Exists("rdsrp/imgur/"..ImgurID..".png", "DATA") then
        _RDS.CachedImages[ImgurID] = Material("data/rdsrp/imgur/"..ImgurID..".png", "noclamp smooth")
    else
        http.Fetch("https://i.imgur.com/"..ImgurID..".png",function(Body, Len, Headers)
            file.Write("rdsrp/imgur/"..ImgurID..".png", Body)
            _RDS.CachedImages[ImgurID] = Material("data/rdsrp/imgur/"..ImgurID..".png", "noclamp smooth")
        end)
    end

    return _RDS.CachedImages[ImgurID]
end
 
PrintTable(_RDS.CachedImages)



local PANEL = {}

AccessorFunc( PANEL, "ActiveButton", "ActiveButton" )

function PANEL:Init()

	self.Navigation = vgui.Create( "DScrollPanel", self )
	self.Navigation:Dock( LEFT )
	self.Navigation:DockMargin( 0,0,0,0 )
	self.Navigation:SetWidth( 140 )

	self.Navigation.Paint = function(self, w, h)
		draw.RoundedBoxEx(15,0, 0, w, h, Color(46,46,46),false,false,true,false)
	end

    self.Content = vgui.Create( "Panel", self )
	self.Content:Dock( FILL )
	self.Content:DockMargin(0,0,0,0)

	self.Items = {}

	PANEL.ITEMS = self.Items

end


/*


function PANEL:CreateSearch()
	self.Container = vgui.Create("DPanel", self.Navigation)
	self.Container:Dock(TOP)
	self.Container:SetTall(50)
	self.Search = vgui.Create("DTextEntry", self.Container)
	self.Search:Dock(FILL)
	self.Search:SetPlaceholderText( "Suchen" )
	function self.Search:OnChange()
		local search_text = self:GetText():lower()
		if (#search_text == 0) then
			for _,v in pairs(PANEL.ITEMS) do
				v.Button:SetVisible(true)
			end
		else
			for _,v in pairs(PANEL.ITEMS) do
				if v.IsButton then
					if (v.Button:GetText():lower():find(search_text,1,true)) then
						v.Button:SetVisible(true)
					else
						v.Button:SetVisible(false)
					end
				else
					v.Button:SetVisisble(false)
				end
			end
		end

	end
end
*/

function PANEL:AddSheet( label, panel, color, material)




	if ( !IsValid( panel ) ) then return end

	local Sheet = {}


    Sheet.Button = vgui.Create( "DButton", self.Navigation )
	

	--Sheet.Button:SetImage( material )
	Sheet.Button.Target = panel
	Sheet.Button:Dock( TOP )
	Sheet.Button:SetText( "" ) 
    Sheet.Button:SetTall( 100 )
    Sheet.Button:SetFont( "RDSRP.25" )
	Sheet.Button:DockMargin( 0, 10, 0, 0 )
	Sheet.Button:SetColor( Color( 255, 255, 255) )


    Sheet.Button.Paint = function(self, w, h)
		draw.RoundedBoxEx(15,0, 0, w, h, Color(46,46,46))
	end

	Sheet.Button.DoClick = function()
		self:SetActiveButton( Sheet.Button )
	end

    Sheet.Material =  vgui.Create("DImage", Sheet.Button)
    Sheet.Material:Dock(FILL)
    Sheet.Material:SetImage(material)
    Sheet.Material:DockMargin(2,2,2,2)
    Sheet.Material:SetImageColor( Color(250,255,255) )

	Sheet.Panel = panel
	Sheet.Panel:SetParent( self.Content )
	Sheet.Panel:SetVisible( false )

	Sheet.IsButton = true
	table.insert( self.Items, Sheet )

	if ( !IsValid( self.ActiveButton ) ) then
		self:SetActiveButton( Sheet.Button )
	end
	
	return Sheet
end

function PANEL:AddSpacer( label, color)
	local Sheet = {}
    Sheet.Button = vgui.Create( "DPanel", self.Navigation )
	Sheet.Button:Dock( TOP )
    Sheet.Button:SetSize(200, 40)
	Sheet.Button:DockMargin( 0, 0, 0, 0 )
    Sheet.Button.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, 200, 40, color)
		draw.SimpleText(label, "DermaDefault", 50, 13, Color(255, 255, 255))
	end
	table.insert( self.Items, Sheet )	
	return Sheet
end

function PANEL:AddSP(size, color)
	local scale = size or 1
	local Sheet = {}
    Sheet.Button = vgui.Create( "DPanel", self.Navigation )
	Sheet.Button:Dock( TOP )
    Sheet.Button:SetSize(200, 40 * scale)
	Sheet.Button:DockMargin( 0, 0, 0, 0 )
    Sheet.Button.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, 200, 40 * scale, color or Color(255, 255, 255, 0))
	end
	table.insert( self.Items, Sheet )	
	return Sheet
end
function PANEL:ClearItems()
	self.Items = nil
	self.Items = {}
	self.Navigation:Clear() 
	self:CreateSearch()
end


local start = SysTime()
function PANEL:SetActiveButton( active )

	if ( self.ActiveButton == active ) then return end

	if ( self.ActiveButton && self.ActiveButton.Target ) then
		self.ActiveButton.Target:SetVisible( false )
		self.ActiveButton:SetSelected( false )
		self.ActiveButton:SetToggle( false )
		self.ActiveButton.Paint = function(self, w, h)
            draw.RoundedBoxEx(15,0, 0, w, h, Color(46,46,46),true,true,true,true)
        end

	end

	self.ActiveButton = active
	active.Target:SetVisible( true )
	active:SetSelected( true )
	active:SetToggle( true )
	local speed = 3
	local barStatus = 0   
	active.Paint = function(self, w, h)
        draw.RoundedBox(0,0,0,w,h,Color(255,0,0))
	end

	self.Content:InvalidateLayout()

end

/*
local speed = 5
local barStatus = 0   
_RDSD.Menu.Defcon_Send.Paint = function(self,w,h)
       if barStatus then 
            barStatus = math.Clamp(barStatus + speed * FrameTime(), 0, 1)
       else
            barStatus = math.Clamp(barStatus - speed * FrameTime(), 0, 1)
       end
*/

derma.DefineControl( "RDSRP.SideSelect", "", PANEL, "Panel" )











_RDS.LerpColor = function(from, to, time)
	local interpolation_data = {
		current_color = table.Copy(from),
		from = table.Copy(from),
		to = table.Copy(to),

		ceil_r = to.r > from.r,
		ceil_g = to.g > from.g,
		ceil_b = to.b > from.b,

		curtime = SysTime()
	}

function interpolation_data:DoLerp()
   if (
      self.current_color.r == self.to.r and
      self.current_color.g == self.to.g and
      self.current_color.b == self.to.b
   ) then
      return
   end
   local time_fraction = math.min(math.TimeFraction(self.curtime, self.curtime + time, SysTime()), 1)
   time_fraction = time_fraction ^ (1.0 - ((time_fraction - 0.5)))
   self.current_color.r = Lerp(time_fraction, self.from.r, self.to.r)
   self.current_color.g = Lerp(time_fraction, self.from.g, self.to.g)
   self.current_color.b = Lerp(time_fraction, self.from.b, self.to.b)
   if (self.ceil_r) then
      self.current_color.r = math.ceil(self.current_color.r)
   else
      self.current_color.r = math.floor(self.current_color.r)
   end
   if (self.ceil_g) then
      self.current_color.g = math.ceil(self.current_color.g)
   else
      self.current_color.g = math.floor(self.current_color.g)
   end
   if (self.ceil_b) then
      self.current_color.b = math.ceil(self.current_color.b)
   else
      self.current_color.b = math.floor(self.current_color.b)
   end
end
function interpolation_data:GetColor()
   return self.current_color
end
function interpolation_data:SetColor(col)
   self.current_color = table.Copy(col)
   self.from = table.Copy(col)
   self.to = table.Copy(col)
   self.curtime = SysTime()
end
function interpolation_data:SetTo(to)
   self.curtime = SysTime()
   
   self.from = table.Copy(self.current_color)
   self.to = table.Copy(to)

   self.ceil_r = self.to.r > self.from.r
   self.ceil_g = self.to.g > self.from.g
   self.ceil_b = self.to.b > self.from.b
end
   return interpolation_data

end


_RDS.Lerp = function(from, to, time)
	local interpolation_data = {
		current_val = from,
		from = from,
		to = to,

		ceil = to > from,

		curtime = SysTime(),
	}
	function interpolation_data:DoLerp()
		if (self.current_val == self.to) then return end
		local time_fraction = math.min(math.TimeFraction(self.curtime, self.curtime + time, SysTime()), 1)
		time_fraction = time_fraction ^ (1.0 - ((time_fraction - 0.5)))
		self.current_val = Lerp(time_fraction, self.from, self.to)
		if (self.ceil) then
			self.current_val = math.ceil(self.current_val)
		else
			self.current_val = math.floor(self.current_val)
		end
	end
	function interpolation_data:GetValue()
		return self.current_val
	end
	function interpolation_data:SetValue(val)
		self.current_val = val
		self.to = val
		self.from = val
		self.curtime = SysTime()
	end
	function interpolation_data:SetTo(to)
		self.curtime = SysTime()
		
		self.from = self.current_val
		self.to = to

		self.ceil = self.to > self.from
	end
	return interpolation_data
end












local PANEL = {}

local on_color  = Color(70,168,53)
local off_color = Color(216,75,75)
local switch_width = 40
local switch_height = 20
local label_margin = 7

local function Circle( x, y, radius, seg )
	local cir = {}

	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, seg do
		local a = math.rad( ( i / seg ) * -360 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end

	local a = math.rad( 0 )
	table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )

	return cir 
end

function PANEL:Init()
	self.LeftCircle = false
	self.RightCircle = false

	self.Active = false
	self.ColorInterpolation = _RDS.LerpColor(off_color, off_color, .25)
	self.SwitchInterpolation = _RDS.Lerp(switch_height / 2, switch_height / 2, .25)

	self.Label = vgui.Create("DLabel", self)
	self.Label:SetContentAlignment(4)
	self.Label:SetFont("RDSRP.25")
	self.Label:SetTextColor(Color(255,255,255))
	self:SetText("Switch")

	self.ClickableArea = vgui.Create("DPanel", self)
	self.ClickableArea:SetMouseInputEnabled(true)
	self.ClickableArea:SetCursor("hand")
	function self.ClickableArea.Paint(self,w,h)
		return 		
	end
	function self.ClickableArea:OnMouseReleased(m)
		if (m ~= MOUSE_LEFT) then return end
		local checked = not self:GetParent().Active
		self:GetParent():SetChecked(checked, true)
		--	if (checked) then
		--		surface.PlaySound("UI/buttonclick.wav")
		--	else
		--		surface.PlaySound("UI/buttonclick.wav")

		--	end
		if (self:GetParent().OnChange) then
			self:GetParent():OnChange()
		end
	end
end

function PANEL:PerformLayout()
	self.ClickableArea:SetSize(switch_width + label_margin + self.Label:GetWide() + label_margin, switch_height)
end

function PANEL:SetText(text)
	self.Text = text
 
	self.Label:SetText(text)
	self.Label:SizeToContents()
	self.Label:AlignLeft(switch_width + label_margin)
	self.Label:SizeToContents()

	self:SetSize(switch_width + label_margin + self.Label:GetWide(), switch_height)

	self.Label:CenterVertical()
end
function PANEL:GetText(text)
	return self.Text
end

function PANEL:Paint(w)
	if !self.LeftCircle or !self.RightCircle then
		self.LeftCircle = Circle(switch_height / 2, switch_height / 2, switch_height / 2,20)
		self.RightCircle = Circle(switch_width - switch_height / 2, switch_height / 2, switch_height / 2,20)
	end

	self.ColorInterpolation:DoLerp()
	self.SwitchInterpolation:DoLerp()

	surface.SetDrawColor(self.ColorInterpolation:GetColor())
	draw.NoTexture()
	surface.DrawPoly(self.LeftCircle)
	surface.DrawPoly(self.RightCircle)

	surface.DrawRect(switch_height / 2, 0, switch_width - switch_height, switch_height)

	surface.SetDrawColor(255, 255, 255)
	surface.DrawPoly(Circle(self.SwitchInterpolation:GetValue(), switch_height / 2, switch_height / 2 - 2,20))


	local ww, hh, txtt, clr = 0, 0, "", nil
	if (self:GetChecked()) then 
		ww = switch_height / 2 - 5
		hh = switch_height / 2 -11
		txtt = "✓"
		clr = Color(255,255,255)
	else 
		ww = switch_width / 2 + 3
		hh = switch_height / 2 -11
		txtt = "X"
		clr = Color(255,255,255)
	end

	draw.SimpleText(txtt, "RDSRP.20", ww, hh, clr, TEXT_ALIGN_LEFT )

end

function PANEL:SetChecked(active, animate)
	if (self.Disabled) then return end
	self.Active = active
	local from
	local to
	if (active) then
		from = switch_height / 2
		to = switch_width - (switch_height / 2)
	else
		from = switch_width - (switch_height / 2)
		to = switch_height / 2
	end
	if (animate) then
		self.SwitchInterpolation:SetTo(to)
		self.ColorInterpolation:SetTo(active and on_color or off_color)
	else
		self.SwitchInterpolation = _RDS.Lerp(to, to, .25)
		if (active) then
			self.ColorInterpolation = _RDS.LerpColor(on_color, on_color, .25)
		else
			self.ColorInterpolation = _RDS.LerpColor(off_color, off_color, .25)
		end
	end
end
function PANEL:GetChecked()
	return self.Active
end

function PANEL:SetHelpText(text)
	self.HelpLabel = vgui.Create("DLabel", self)
	self.HelpLabel:SetTextColor(Color(200,200,200))
	self.HelpLabel:SetAutoStretchVertical(true)
	self.HelpLabel:SetWrap(true)
	self.HelpLabel:SetFont("_RDS.Text.15")
	self.HelpLabel:AlignTop(switch_height + 10)
	self.HelpLabel:SetText(text)
	function self.HelpLabel:PerformLayout()
		local w = math.min(500, self:GetParent():GetWide())
		if (self:GetWide() ~= w) then
			self:SetWide(w)
		end
		self:GetParent():SetSize(switch_width + label_margin + self:GetParent().Label:GetWide(), switch_height + 10 + self:GetTall())
	end
end

function PANEL:SetDisabled(disabled)
	self.Disabled = disabled
	if (self.Disabled) then
		self.ColorInterpolation:SetColor(Color(165,165,165))
		self.Label:SetTextColor(Color(180,180,180))
		self.ClickableArea:SetCursor("no")
	else
		self.ClickableArea:SetCursor("hand")
		self.Label:SetTextColor(Color(255,255,255))
		if (self:GetChecked()) then
			self.ColorInterpolation:SetColor(on_color)
		else
			self.ColorInterpolation:SetColor(off_color)
		end
	end
end
function PANEL:GetDisabled()
	return self.Disabled
end

derma.DefineControl("RDSRP.Switch", nil, PANEL, "DPanel")