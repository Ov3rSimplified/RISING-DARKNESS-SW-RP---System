// RISING DARKNESS!
// Copyright (c) 2022 RISING DARKNESS
//--------------------------------------------\\
// Code written for RDS:RP[RISING DARKNESS], 
// they only have the permission to use,
// edit or own the codeline/gamemode. 
//
// Code Written by:
//     - Ov3rSimplified
//     - Rooki
//     - 
//     - 
//     -
//** [[   roleplay | sv_damage.lua  ]]** \\

local tabl = {
    [TEAM_Jane] = false
}

hook.Add("ScalePlayerDamage", "RDSRP.ScaleFireDamageBlocker", function(ply, _, dmginfo)
    if tabl[ply:Team()] and dmginfo:IsDamageType(DMG_BURN) then
        dmginfo:ScaleDamage(0) -- no dmg
    end
end)

hook.Add("EntityTakeDamage", "RDSRP.CheckFireDamageBlocker", function(target, dmginfo)
   -- print(dmginfo:GetDamage())
    if not target or not IsValid(target) or not target:IsPlayer() then return end

    if tabl[target:Team()] and dmginfo:IsDamageType(DMG_BURN) then -- check its fire dmg.
        dmginfo:ScaleDamage(0) -- no dm
    end
    
end)

local tabl2 = {
    [TEAM_Jane] = false
}
hook.Add("GetFallDamage", "RDSRP.JumppackUser", function(ply, speed)
    if ply:IsPlayer() and tabl2[ply:Team()] then
        return ( speed / 90 )
    end
end)


--
util.AddNetworkString("RDSRP.PlayerDeadCheck")

hook.Add( "PlayerDisconnected", "RDSRP.CheckPlayerDeadWhenLeave", function(ply)
    if not ply:Alive() then 
        file.Write(ply:Name() .. "NotGood.txt", "hurensohn")
      --    if cookie.GetString("RDSRP_".. ply:SteamID() .. "_FailRPDead") then 
      --      cookie.Delete("RDSRP_".. ply:SteamID() .. "_FailRPDead")
      --      cookie.Set("RDSRP_".. ply:SteamID() .. "_FailRPDead", ply:GetCharacterID() )
      --  end
        cookie.Set("RDSRP_".. ply:SteamID() .. "_FailRPDead", ply:GetCharacterID() )
    else
        file.Delete(ply:Name() .. "NotGood.txt")
      --  cookie.Delete("RDSRP_".. ply:SteamID() .. "_FailRPDead")
    end
end ) 

hook.Add( "PlayerInitialSpawn", "RDSRP.ManagePlayerDeath", function(ply)
    if cookie.GetString("RDSRP_".. ply:SteamID() .. "_FailRPDead") == 4 then
        net.Start("RDSRP.PlayerDeadCheck")
        net.Send(ply)
        print("ddd")
    else
        print("\n Kein dumm dumm")
    end
end)

hook.Add( "PlayerSpawn", "RDSRP.ManagePlayerDeat2h", function(ply)
    if cookie.GetString("RDSRP_".. ply:SteamID() .. "_FailRPDead") then
        net.Start("RDSRP.PlayerDeadCheck")
        net.Send(ply)
        print("ddd")
     --   print(ply:getJobTable().model[1])
    else
        print("\n Kein dumm dumm")
    end
end) 


--VoidChar.Ply.SelectCharacter(self.char.id)*/