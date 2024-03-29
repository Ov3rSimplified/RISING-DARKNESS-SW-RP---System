include("shared.lua")


function ENT:Draw()
	self:DrawModel()

	local alpha = 255
	local viewdist = 200

	-- calculate alpha
	local max = viewdist
	local min = viewdist*0.75

	local dist = LocalPlayer():EyePos():Distance( self:GetPos() )

	if dist > min and dist < max then
		local frac = InverseLerp( dist, max, min )
		alpha = alpha * frac
	elseif dist > max then
		alpha = 0
	end

	local oang = self:GetAngles()
	local opos = self:GetPos()

	local ang = self:GetAngles()
	local pos = self:GetPos()

	ang:RotateAroundAxis( oang:Up(), 90 )
	ang:RotateAroundAxis( oang:Right(), -90 )
	ang:RotateAroundAxis( oang:Up(), -4)

	pos = pos + oang:Forward()*2 + oang:Up() * 80 + oang:Right() * _RDS.Config.QuestmanVertical

	if alpha > 0 then
		cam.Start3D2D( pos, ang, 0.025 )
			draw.SimpleText( _RDS.Config.QuestmanText, "RDSRP.QeSt.Ent", 0, 0, Color(255,255,255, alpha) )
		cam.End3D2D()
	end
end