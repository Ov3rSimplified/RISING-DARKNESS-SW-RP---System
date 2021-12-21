--
util.AddNetworkString("RDSRP.ChangeID")

net.Receive("RDSRP.ChangeID", function(lem, ply)

    local pid = math.random( 1, 9 )..math.random( 1,9 )
    local id = math.random( 1000, 9999 )

    ply:setDarkRPVar("rpname", pid .. "-".. id .. " " .. ply:GetName() )

end)