AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( "shared.lua" )


function ENT:AcceptInput( ply, caller )
	if caller:IsPlayer() then
		if ( self.lastUsed or CurTime() ) <= CurTime() then

			self.lastUsed = CurTime() + 2

			if IsValid( caller ) then
				net.Start( "ARMORY_Weapon_Menu" ) -- Call Menu!
				net.WriteEntity(self)
				net.Send( caller )
					self:SetBodygroup(1,0)
					self:EmitSound( "doors/door_metal_thin_open1.wav" )
			end
		end
	end
end


function ENT:Think()
	self:NextThink( CurTime() + 0.05 )
	return true
end

function ENT:OnRemove()
	if IsValid( self ) then
		CH_Armory_Locker.PoliceLockerEntity = nil
	end
end