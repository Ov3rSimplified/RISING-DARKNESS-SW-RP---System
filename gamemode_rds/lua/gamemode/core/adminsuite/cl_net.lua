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
//** [[   Adminsuite | cl_net.lua   ]]** \\

net.Receive("RDSRP.Adminsuite.GetCharacterID", function(len)
    local get = net.ReadType() 
    _RDS.CharacterID = 0
    _RDS.CharacterID = get
end) 

net.Receive("RDSRP.Roleplay.Trainings.ReLoad", function(len)
    local read = _RDS.ReadCTable()
  
    if _RDS.PlayerInitSpawn == false then return end 

    if table.IsEmpty(read) then 
        for k,v in pairs(_RDS.Advtraining.Trainings) do    
            _RDS.Advtraining.Whitelist[k] = {}
                net.Start("RDSRP.Roleplay.Trainings.Load") 
                _RDS.WriteCTable(_RDS.Advtraining.Whitelist)
                net.SendToServer()
        end 
    else
        for k,v in pairs(_RDS.Advtraining.Trainings) do    
            _RDS.Advtraining.Whitelist[k] = {}
        end
        timer.Simple(0.1,function()
            table.Merge( _RDS.Advtraining.Whitelist, read )
        end)
    end
end)    

net.Receive("RDSRP.IConfig.ReLoad", function(len)
    local get = _RDS.ReadCTable()
    _RDS.Admin.IConfig = get
end) 
 

concommand.Add("opo",function() 
    /*
        _RDS.PlayerInitSpawn = true 
        net.Start("RDSRP.CheckInitialSpawn")
        net.WriteBool(_RDS.PlayerInitSpawn)
        net.SendToServer()
    */
    print(_RDS.PlayerInitSpawn)  
end)


hook.Add("InitPostEntity", "RDSRP.CheckPlayer", function()
    _RDS.PlayerInitSpawn = true 
    net.Start("RDSRP.CheckInitialSpawn")
    net.WriteBool(_RDS.PlayerInitSpawn)
    net.SendToServer() 
end)

net.Receive("RDSRP.Roleplay.Trainings.ReLoad.SHARED", function()
    net.Start("RDSRP.Roleplay.Trainings.ReLoad")
    net.SendToServer()
end)