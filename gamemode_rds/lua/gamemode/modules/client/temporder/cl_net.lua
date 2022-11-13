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
//** [[   Temporder | cl_net.lua   ]]** \\
_RDS.Temporder.ClientOrders = {}

net.Receive("RDSRP.Temporder.Create", function(len)
    local read = net.ReadTable()
    _RDS.Temporder.ClientOrders = read
    if not IsValid(_RDS.Temporder.UI.panel) then 
        return 
    else
        _RDS.Temporder.UI.scroll:Clear()
    end
    timer.Simple(0.1,function()
        _RDS.Temporder.UI:Content()
    end)
end)
net.Receive("RDSRP.Temporder.Delete", function(len)
    local read = net.ReadTable()
    _RDS.Temporder.ClientOrders = read
    if not IsValid(_RDS.Temporder.UI.panel) then 
        return 
    else
        _RDS.Temporder.UI.scroll:Clear()
    end
    timer.Simple(0.1,function()
        _RDS.Temporder.UI:Content()
    end)
end)
net.Receive("RDSRP.Temporder.Cache", function(len)
    local read = net.ReadTable()
    _RDS.Temporder.ClientOrders = read
end)
--[[concommand.Add("refreshcacheee", function()
    net.Start("RDSRP.Temporder.Cache")
    net.SendToServer()
end)]]

