--

if SERVER then
    util.AddNetworkString("_RDS.LoadBaseTable") 
    net.Receive("_RDS.LoadBaseTable", function(len, ply)
        if file.IsDir("rdsrp/iconfig", "DATA") then
            if file.Exists("rdsrp/iconfig/configdata.json", "DATA") then 
                    local tl = file.Read("rdsrp/iconfig/configdata.json")
                    net.Start("_RDS.LoadBaseTable")
                    net.WriteTable(util.JSONToTable(tl))
                    net.Send(ply)
            else
                    return
            end
        else
            file.CreateDir("rdsrp/iconfig")
        end
        if file.Exists("rdsrp/iconfig/configdata.json", "DATA") then 
            local tl = file.Read("rdsrp/iconfig/configdata.json")
            _RDS.Admin.IConfig = util.JSONToTable(tl)
        end
        _RDS.GoForwardwithTableload = true
    end)  
end
if CLIENT then 
    net.Receive("_RDS.LoadBaseTable", function(len)
        local get = net.ReadTable()
        _RDS.Admin.IConfig = get
        _RDS.GoForwardwithTableload = true
    end) 
    PrintTable(_RDS.Admin.IConfig)
end
if CLIENT then 
    net.Start("_RDS.LoadBaseTable")
    net.SendToServer()
end