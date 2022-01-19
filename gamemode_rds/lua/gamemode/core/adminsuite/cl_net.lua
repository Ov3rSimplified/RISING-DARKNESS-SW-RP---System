--
net.Receive("RDSRP.Adminsuite.GetCharacterID", function(len)
    local get = net.ReadType() 
    _RDS.CharacterID = 0
    _RDS.CharacterID = get
end) 
