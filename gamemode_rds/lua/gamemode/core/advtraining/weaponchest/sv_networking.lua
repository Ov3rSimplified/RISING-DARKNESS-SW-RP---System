resource.AddWorkshop( "1917043256" )

local netmessages = {
	"RDSRP.Weaponchest.Menu", 
	"RDSRP.Weaponchest.RetrieveItem",
	"RDSRP.Weaponchest.DepositItem", 
	"RDSRP.Weaponchest.CloseDoor",
}  
for k, v in pairs(netmessages) do    
	util.AddNetworkString(v) 
end  

--print(_RDS.Admin.IConfig["Weaponsystem"].Core.MaxPrimary)

net.Receive( "RDSRP.Weaponchest.RetrieveItem", function( length, ply )
	local OurKey = net.ReadTable()
	local readent = net.ReadEntity()
	local TheItem = _RDS.Advtraining.Trainings[OurKey.weapon].categorys.weaponname
	local tablee = _RDS.Advtraining.Trainings[OurKey.weapon]
	local class = OurKey.weapon
	local locker = readent
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
			_RDS:Notify("error", ply, "Fehler!", "Du hast bereits eine [PRIMÄRE] Waffe!", 2)
			return
		else
			_RDS:Notify("success", ply, "Erfolgreich!", "Du hast dir eine [PRIMÄRE] Waffe herausgenommen", 2)
		end
	end 

	if tablee.categorys.category == "Secondary" then 
		if ply.SecondaryWeapons + 1 > 1 then 
			_RDS:Notify("error", ply, "Fehler!", "Du hast bereits eine [SEKUNDÄRE] Waffe!", 2)
			return
		else
			_RDS:Notify("success", ply, "Erfolgreich!", "Du hast dir eine [SEKUNDÄRE] Waffe herausgenommen", 2)
		end
	end
	if tablee.categorys.category == "Utils" then 
		_RDS:Notify("success", ply, "Erfolgreich!", "Du hast dir Utensil herausgenommen", 2)
	end

	if IsValid( locker ) then
		if ply:GetPos():DistToSqr( locker:GetPos() ) > 10000 then
			_RDS:Notify("error", ply, "Fehler!", "Du bist zu weit weg vom Waffenschrank!", 2)
			return
		end	
	end

		ply:Give( class )
		ply:SelectWeapon( class )
		ply:GetActiveWeapon().IsFromArmory = true
end)

net.Receive( "RDSRP.Weaponchest.DepositItem", function( length, ply )
	local OurKey = net.ReadTable()
	local readent = net.ReadEntity()
	local TheItem = _RDS.Advtraining.Trainings[OurKey.weapon].categorys.weaponname
	local tablee = _RDS.Advtraining.Trainings[OurKey.weapon]
	local class =  OurKey.weapon

	local locker = readent
	if IsValid( locker ) then
		if ply:GetPos():DistToSqr( locker:GetPos() ) > 10000 then
			_RDS:Notify("error", ply, "Fehler!", "Du bist zu weit weg vom Waffenschrank!", 2)
			return
		end	
	end

	if tablee.categorys.category == "Primary" then 
		ply.PrimaryWeapons = ply.PrimaryWeapons - 1	
		_RDS:Notify("success", ply, "Erfolgreich!", "Du hast eine [PRIMÄRE] Waffe hereingelegt", 2)
	end

	if tablee.categorys.category == "Secondary" then 
		--ply.SecondaryWeapons = ply.SecondaryWeapons - 1	
		_RDS:Notify("success", ply, "Erfolgreich!", "Du hast eine [SEKUNDÄRE] Waffe hereingelegt", 2)
	end

	if tablee.categorys.category == "Utils" then 
		_RDS:Notify("success", ply, "Erfolgreich!", "Du hast ein Utensil hereingelegt", 2)
	end
	
	if ply:HasWeapon( class ) then
		ply:StripWeapon( class )
	end

end)

/*
local function CanDropWeapon( ply, wep )
	for k,v in pairs( ply:GetWeapons() ) do 
		if _RDS.Advtraining.Trainings[v:GetClass()] then
			ply:ChatPrint( "You can not drop weapons retrieved from the police armory." )
			return false
		end
	end 
end
hook.Add( "canDropWeapon", "RDSRP_CanDropWeapon", CanDropWeapon )
*/

net.Receive("RDSRP.Weaponchest.CloseDoor", function(len, ply)
	local ent = net.ReadEntity()
	ent:EmitSound( "doors/door_metal_gate_close1.wav" )
	ent:SetBodygroup(1,1)
end)
