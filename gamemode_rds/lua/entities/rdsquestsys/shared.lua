ENT.Type = "anim"

ENT.PrintName = "Questsys"
ENT.Purpose = ""

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

ENT.Category = "RDS:RP"

ENT.WorldModel = _RDS.Config.QuestmanModel

function ENT:Initialize()

	
	self:SetModel( _RDS.Config.QuestmanModel )
	self:SetMoveType( MOVETYPE_VPHYSICS )   
	self:SetSolid( SOLID_VPHYSICS )         
 	
	if ( SERVER ) then self:PhysicsInit( SOLID_VPHYSICS ) end

    local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
		phys:SetMass( 50 )
	end

	if SERVER then
		self:SetUseType( SIMPLE_USE )
		self.health = 100
	end

end