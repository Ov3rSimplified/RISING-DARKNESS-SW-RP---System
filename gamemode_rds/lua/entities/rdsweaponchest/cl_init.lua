include( "shared.lua" )

function ENT:Initialize()
end

function ENT:DrawTranslucent()
	self:DrawModel()
	
	local Dist = self:GetPos():Distance( EyePos() )
	if not LocalPlayer():Alive() then
		return
	end
	if not IsValid( LocalPlayer() ) then
		return
	end
	
	-- Header
	if Dist <= 1000 then 
		local pos = self:GetPos() + Vector( 0, 0, 103 )
		local PlayersAngle = LocalPlayer():GetAngles()
		local ang = Angle( 0, PlayersAngle.y - 180, 0 )
		
		ang:RotateAroundAxis( ang:Right(), -90 )
		ang:RotateAroundAxis( ang:Up(), 90 )
		
		cam.Start3D2D( pos, ang, 0.035 )
				draw.SimpleTextOutlined( _RDS.Config.WeaponchestText or "NULL", "ARMORY_OverheadTitle", 0, -0, Color(255,255,255), 1, 1, 4, Color(0,0,0) )
		cam.End3D2D()
	end
	
	if Dist > 1000 then 
		return 
	end
	
	if not IsValid( LocalPlayer():GetActiveWeapon() ) then
		return
	end
	if LocalPlayer():GetActiveWeapon():GetClass() != "armory_lockpick" then
		return
	end
	
	-- When aiming at it
	local PosEnt = self:GetPos()
	local AngEnt = self:GetAngles()
	
	local tr = self:WorldToLocal( LocalPlayer():GetEyeTrace().HitPos )

	AngEnt:RotateAroundAxis( AngEnt:Up(), 90 )
	AngEnt:RotateAroundAxis( AngEnt:Forward(), 90 )

	if LocalPlayer():GetNWBool( "LockpickCooldown" ) then
		mat_icon = mat_cooldown
	else
		mat_icon = mat_lockpick
	end

end

local LastThink = 0
local SeqSpeed = 200

function ENT:Think()
	local now = CurTime()
	local timepassed = now - LastThink
	LastThink = now
	self:InvalidateBoneCache()
end