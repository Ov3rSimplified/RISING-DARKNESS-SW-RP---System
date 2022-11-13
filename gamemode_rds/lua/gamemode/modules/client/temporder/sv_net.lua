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
//** [[   Temporder | sv_net.lua   ]]** \\
util.AddNetworkString("RDSRP.Temporder.Create")
util.AddNetworkString("RDSRP.Temporder.Delete")
util.AddNetworkString("RDSRP.Temporder.Cache")

net.Receive("RDSRP.Temporder.Create", function(len,ply)
    local send = net.ReadTable()
    table.Merge(_RDS.Temporder.Orders, send)

    net.Start("RDSRP.Temporder.Create")
    net.WriteTable(_RDS.Temporder.Orders)
    net.Broadcast()
end) 
PrintTable(_RDS.Temporder.Orders)    


net.Receive("RDSRP.Temporder.Cache", function(len)
    net.Start("RDSRP.Temporder.Cache")
    net.WriteTable(_RDS.Temporder.Orders)
    net.Broadcast()
end)

hook.Add("PlayerSpawn", "RDSRP.Cache.TempOrders", function(ply)
    MsgC(Color(250,0,0), "[RDSRP]", Color(255,255,255), "Cached the Temps" )
    net.Start("RDSRP.Temporder.Cache")
    net.WriteTable(_RDS.Temporder.Orders)
    net.Broadcast()
end)
 
net.Receive("RDSRP.Temporder.Delete", function(len,ply)
    local send = net.ReadString()
    _RDS.Temporder.Orders[send] = nil 
    net.Start("RDSRP.Temporder.Delete")
    net.WriteTable(_RDS.Temporder.Orders)
    net.Broadcast()
end) 

util.AddNetworkString("RDSRP.HUD.Overhead")

net.Receive("RDSRP.HUD.Overhead", function(len,ply)
    net.Start("RDSRP.HUD.Overhead") 
    net.WriteType(ply:GetCharacterID())
    net.Send(ply)
end)