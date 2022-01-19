--
cCharacterID = cCharacterID or {}

net.Receive("RDSRP.Roleplay.Trainings.ReLoad", function(len)
    local read = _RDS.ReadCTable()
  
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

