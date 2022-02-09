--
_RDS.PlayerInitSpawn = false
util.AddNetworkString("RDSRP.SendCLientData")
util.AddNetworkString("RDSRP.IPlayer.GetCharacterID")
util.AddNetworkString("RDSRP.CheckInitialSpawn")

/*
net.Receive("RDSRP.SendCLientData", function(len,ply)
    net.Start("RDSRP.SendCLientData")
    net.Send(ply)
end)

hook.Add("PlayerInitialSpawn", "__RDSRP.SendClientDataHook", function(ply)
    net.Start("RDSRP.SendCLientData")
    net.Send(ply)
end) 

*/



net.Receive("RDSRP.IPlayer.GetCharacterID", function(len,ply)
    local read = net.ReadType()
    local char

    if read:IsBot() then  
          char = nil
    else
          char = read:GetCharacterID() 
    end
    
    net.Start("RDSRP.IPlayer.GetCharacterID")
    net.WriteType(tonumber(char))
    net.Send(ply)
end ) 


local allowed_usergroups = {
    ["superadmin"] = true, 
    ["admin"] = true, 
    ["Event-Team"] = true, 
    ["Eventverwaltung"] = true, 
    ["Administrator"] = true, 
    ["Moderator"] = true, 
    ["Projektleitung"] = true, 
    ["Head-Administrator"] = true
}

hook.Add("PlayerSpawnSENT", "RDSRP.CuttersEntitiyspawningerror", function(ply)
        if not allowed_usergroups[ ply:GetUserGroup() ] then 
            return false  
        else 
            return true
        end
end)

function NokillCanPlayerSuicide(ply)
    return false 
end

hook.Add("CanPlayerSuicide", "tampis", NokillCanPlayerSuicide)



net.Receive("RDSRP.CheckInitialSpawn", function(_,ply)
    net.Start("RDSRP.CheckInitialSpawn")
    net.Send(ply)
end)

hook.Add("VoidChar.CharacterSelected", "RDSRP.UpdateCharacterID", function(ply)
    net.Start("RDSRP.IPlayer.GetCharacterID")
    net.WriteType(ply:GetCharacterID())
    net.Send(ply)
    print("Oxenschwanz")
end)


