--
concommand.Add("_RDS.Reload", function()
    if _RDS.Config.AdminValue[ LocalPlayer():GetUserGroup() ] then 
        print("MoinMoin") 
    else
        _RDS:Notify("error", "Fehler!", "Du hast nicht die benötigten Berechtigungen, um dies zu tun.", 2)
    end
end)

concommand.Add("FindBodyGroups", function()
    PrintTable(LocalPlayer():GetBodyGroups()) 
end)

concommand.Add("LoadImgur", function(cmd) 
    _RDS:GetImgurImage(cmd)
end)


hook.Add("ContextMenuOpen", "RDSRP.9883824", function()
	if _RDS.Config.AdminValue[ LocalPlayer():GetUserGroup() ] then
        return true
    else
        return false
	end
end)

hook.Add("SpawnMenuOpen", "RDSRP.234982811", function()
	if _RDS.Config.AdminValue[ LocalPlayer():GetUserGroup() ] then
        return true
    else
        return false
	end
end)

if CLIENT then 
    RunConsoleCommand('hud_deathnotice_time', '0')
end

net.Receive("RDSRP.IPlayer.GetCharacterID", function(len)
    local get = net.ReadType()
    cCharacterID = 0
    cCharacterID = get
    print(cCharacterID)
end) 
