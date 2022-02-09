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

net.Receive("RDSRP.IPlayer.GetCharacterID", function(len)
    local get = net.ReadType()
    cCharacterID = 0
    cCharacterID = get
    print(cCharacterID)
end) 


concommand.Add("test234", function(cmd) 
    local m = MVPPerfectHands.Menu()

    m:AddOption("Heil", nil)
    m:AddOption("Hitler", nil)

    m:Open()
end)

