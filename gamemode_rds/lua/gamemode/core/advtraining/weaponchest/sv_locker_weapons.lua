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
				print("NOT FOUND", v:GetClass())
			end
		end
	end

	if tablee.categorys.category == "Primary" then 
		if ply.PrimaryWeapons + 1 > 1 then 
			DarkRP.notify( ply, 1, 5, "Du hast bereits eine [PRIMÄRE] Waffe!")
			return
		else
			DarkRP.notify( ply, 1, 5, "Du hast dir eine [PRIMÄRE] Waffe herausgenommen")
		end
	end

	if tablee.categorys.category == "Secondary" then 
		if ply.SecondaryWeapons + 1 > 1 then 
			DarkRP.notify( ply, 1, 5, "Du hast bereits eine [SEKUNDÄRE] Waffe!")
			return
		else
			DarkRP.notify( ply, 1, 5, "Du hast dir eine [SEKUNDÄRE] Waffe herausgenommen")
		end
	end

 

--	if ply.WeaponArmoryDelay then
	--	DarkRP.notify( ply, 1, 5, "Please wait ".. string.ToMinutesSeconds( math.Round( ply.WeaponArmoryCooldown - CurTime() ) ) .. " before retrieving another item from the police armory." )
--		return
	--end
	
	if not tablee.restrictions[ ply:Team() ] and tablee.whitelist[ ply:SteamID() ] then
		DarkRP.notify( ply, 1, 5, "You are not allowed to retrieve items as a ".. team.GetName( ply:Team() ) .."!")
		return
	end

	
	local locker = readent
	if IsValid( locker ) then
		if ply:GetPos():DistToSqr( locker:GetPos() ) > 10000 then
			DarkRP.notify( ply, 1, 5, "You are not close enough to the police armory to retrieve items!")
			return
		end	
	end
	if not tablee.restrictions[ ply:Team() ] and tablee.whitelist[ ply:SteamID() ] then
		return 
	else
		ply:Give( class )
		ply:SelectWeapon( class )
			
		--ARMORY_LOCKER_WeaponCooldown( ply )
		
		-- Stop people from being able to drop retrieve weapons from the armory
		ply:GetActiveWeapon().IsFromArmory = true
	end 
end )

net.Receive( "ARMORY_DepositItem", function( length, ply )
	local OurKey = net.ReadTable()
	local TheItem = _RDS.Advtraining.Trainings[OurKey.weapon].categorys.weaponname
	local tablee = _RDS.Advtraining.Trainings[OurKey.weapon]
	local class =  OurKey.weapon

	if not tablee.restrictions[ ply:Team() ] and tablee.whitelist[ ply:SteamID() ] then
		DarkRP.notify( ply, 1, 5, "You are not allowed to deposit weapons as a ".. team.GetName( ply:Team() ) .."!" )
		return
	end 

	local locker = readent
	if IsValid( locker ) then
		if ply:GetPos():DistToSqr( locker:GetPos() ) > 10000 then
			DarkRP.notify( ply, 1, 5, "You are not close enough to the police armory to retrieve items!")
			return
		end	
	end

	if tablee.categorys.category == "Primary" then 
		ply.PrimaryWeapons = ply.PrimaryWeapons - 1	
		DarkRP.notify( ply, 1, 5, "Du hast eine [PRIMÄRE] Waffe hereingelegt")
	end

	if tablee.categorys.category == "Secondary" then 
		ply.SecondaryWeapons = ply.SecondaryWeapons - 1	
		DarkRP.notify( ply, 1, 5, "Du hast eine [PRIMÄRE] Waffe hereingelegt")
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