--

util.AddNetworkString("RDSRP.Adminsuite.GetCharacterID")

net.Receive("RDSRP.Adminsuite.GetCharacterID", function(len,ply)
    local read = net.ReadType()
    local char
    if read:IsBot() then char = nil else char = read:GetCharacterID() end
    net.Start("RDSRP.Adminsuite.GetCharacterID")
    net.WriteType(tonumber(char))
    net.Send(ply)
end )  