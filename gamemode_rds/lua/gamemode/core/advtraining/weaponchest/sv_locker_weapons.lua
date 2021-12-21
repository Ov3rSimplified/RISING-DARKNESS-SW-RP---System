util.AddNetworkString("ARMORY_CloseDoor")

net.Receive( "ARMORY_RetrieveItem", function( length, ply )
	local OurKey = net.ReadTable()
	local readent = net.ReadEntity()
	local TheItem = _RDS.Advtraining.Trainings[OurKey.weapon].categorys.weaponname
	local tablee = _RDS.Advtraining.Trainings[OurKey.weapon]
	local class = OurKey.weapon
	ply.PrimaryWeapons = 0
	ply.SecondaryWeapons = 0

	for k,v in pairs( ply:GetWeapons() ) do 
		if _RDS.Advtraining.Trainings[v:GetClass()] then  

			if v:GetClass() and _RDS.Advtraining.Trainings[v:GetClass()].categorys.category == "Primary" then
				ply.PrimaryWeapons = ply.PrimaryWeapons + 1
			end
			if v:GetClass() and _RDS.Advtraining.Trainings[v:GetClass()].categorys.category == "Secondary" then
				ply.SecondaryWeapons = ply.SecondaryWeapons + 1

			end
		else
			if _RDS.Config.Debug then 
				_RDS:DebugPrint( Color(17,0,255), "WEAPON NOT FOUND (> "..v:GetClass().." <)" )
			end
		end
	end

	if tablee.categorys.category == "Primary" then 
		if ply.PrimaryWeapons + 1 > 1 then 
			--DarkRP.notify( ply, 1, 5, "Du hast bereits eine [PRIMÄRE] Waffe!")
			_RDS:Notify("error", ply, "Fehler!", "Du hast bereits eine [PRIMÄRE] Waffe!", 2)
			return
		else
		--	DarkRP.notify( ply, 1, 5, "Du hast dir eine [PRIMÄRE] Waffe herausgenommen")
			_RDS:Notify("success", ply, "Erfolgreich!", "Du hast dir eine [PRIMÄRE] Waffe herausgenommen", 2)
		end
	end

	if tablee.categorys.category == "Secondary" then 
		if ply.SecondaryWeapons + 1 > 1 then 
			--DarkRP.notify( ply, 1, 5, "Du hast bereits eine [SEKUNDÄRE] Waffe!")
			_RDS:Notify("error", ply, "Fehler!", "Du hast bereits eine [SEKUNDÄRE] Waffe!", 2)
			return
		else
		--	DarkRP.notify( ply, 1, 5, "Du hast dir eine [SEKUNDÄRE] Waffe herausgenommen")
			_RDS:Notify("success", ply, "Erfolgreich!", "Du hast dir eine [SEKUNDÄRE] Waffe herausgenommen", 2)
		end
	end


	local locker = readent
	if IsValid( locker ) then
		if ply:GetPos():DistToSqr( locker:GetPos() ) > 10000 then
			DarkRP.notify( ply, 1, 5, "You are not close enough to the police armory to retrieve items!")
			return
		end	
	end
		ply:Give( class )
		ply:SelectWeapon( class )
			
		ply:GetActiveWeapon().IsFromArmory = true

end)

net.Receive( "ARMORY_DepositItem", function( length, ply )
	local OurKey = net.ReadTable()
	local TheItem = _RDS.Advtraining.Trainings[OurKey.weapon].categorys.weaponname
	local tablee = _RDS.Advtraining.Trainings[OurKey.weapon]
	local class =  OurKey.weapon

	local locker = readent
	if IsValid( locker ) then
		if ply:GetPos():DistToSqr( locker:GetPos() ) > 10000 then
			DarkRP.notify( ply, 1, 5, "You are not close enough to the police armory to retrieve items!")
			return
		end	
	end

	if tablee.categorys.category == "Primary" then 
		ply.PrimaryWeapons = ply.PrimaryWeapons - 1	
	--	DarkRP.notify( ply, 1, 5, "Du hast eine [PRIMÄRE] Waffe hereingelegt")
		_RDS:Notify("success", ply, "Erfolgreich!", "Du hast eine [PRIMÄRE] Waffe hereingelegt", 2)
	end

	if tablee.categorys.category == "Secondary" then 
		ply.SecondaryWeapons = ply.SecondaryWeapons - 1	
		--DarkRP.notify( ply, 1, 5, "Du hast eine [PRIMÄRE] Waffe hereingelegt")
		_RDS:Notify("success", ply, "Erfolgreich!", "Du hast eine [SEKUNDÄRE] Waffe hereingelegt", 2)
	end
	
	
		if ply:HasWeapon( class ) then
			ply:StripWeapon( class )
		--	DarkRP.notify( ply, 1, 5, "You have deposited your ".. OurKey.name )
			
			if ply:HasWeapon( "weapon_physgun" ) then
				ply:SelectWeapon( "weapon_physgun" )
			elseif ply:HasWeapon( "weapon_physcannon" ) then
				ply:SelectWeapon( "weapon_physcannon" )
			end
		else
			DarkRP.notify( ply, 1, 5, "You have no weapons from the police armory to deposit!" )
		end
end)

local function ARMORY_CanDropWeapon( ply, wep )
	if wep.IsFromArmory then
		for k, v in pairs( CH_Armory_Locker.Weapons ) do
			if wep:GetClass() == v.Weapon then
				ply:ChatPrint( "You can not drop weapons retrieved from the police armory." )
				return false
			end
		end
	end
end
hook.Add( "canDropWeapon", "ARMORY_CanDropWeapon", ARMORY_CanDropWeapon )



net.Receive("ARMORY_CloseDoor", function(len, ply)
	local ent = net.ReadEntity()
	ent:EmitSound( "doors/door_metal_gate_close1.wav" )
	ent:SetBodygroup(1,1)
end)


/*
local function ARMORY_LOCKER_WeaponCooldown( ply )
	ply.WeaponArmoryDelay = true
	ply.WeaponArmoryCooldown = CurTime() + ( CH_Armory_Locker.Config.RetrieveCooldown * 60 )
	
	timer.Simple( CH_Armory_Locker.Config.RetrieveCooldown * 60, function()
		if IsValid( ply ) then
			ply.WeaponArmoryDelay = false
			ply.WeaponArmoryCooldown = 0
		end
	end )
end
*/