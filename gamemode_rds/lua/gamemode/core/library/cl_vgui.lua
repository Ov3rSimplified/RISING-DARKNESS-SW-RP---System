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
