include( "shared.lua" )

function ENT:Initialize()
end

local color_gray = Color( 125, 125, 125, 255 )

local mat_cooldown = Material( "craphead_scripts/lockpick/icon_cooldown.png" )
local mat_lockpick = Material( "craphead_scripts/lockpick/icon_lockpick.png")
local mat_icon

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
	if Dist <= CH_Armory_Locker.Config.DistanceToHeader then 
		local pos = self:GetPos() + Vector( 0, 0, 103 )
		local PlayersAngle = LocalPlayer():GetAngles()
		local ang = Angle( 0, PlayersAngle.y - 180, 0 )
		
		ang:RotateAroundAxis( ang:Right(), -90 )
		ang:RotateAroundAxis( ang:Up(), 90 )
		
		cam.Start3D2D( pos, ang, 0.035 )
			if CH_Armory_Locker.Config.DisplayHeaderText then
				draw.SimpleTextOutlined( CH_Armory_Locker.Config.HeaderText, "ARMORY_OverheadTitle", 0, -0, CH_Armory_Locker.Design.ArmoryHeaderColor, 1, 1, 4, CH_Armory_Locker.Design.ArmoryHeaderBoarder )
			end
		cam.End3D2D()
	end
	
	if Dist > CH_Armory_Locker.Config.DistanceToIcons then 
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

net.Receive( "ARM_LOCKER_DoorOpenSeq", function( length, ply )
end )

function ENT:Think()
	local now = CurTime()
	local timepassed = now - LastThink
	LastThink = now
	self:InvalidateBoneCache()
end