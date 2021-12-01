ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Weaponchest"
ENT.Author = "Ov3rSimplified"

ENT.Spawnable			= true
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

ENT.Category = "RDS:RP"


function ENT:Initialize()
	self:SetModel( "models/props_wasteland/kitchen_fridge001a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_NONE )
	self:SetSolid( SOLID_VPHYSICS )

	self.ActiveLockerPlayers = 0
	
end


