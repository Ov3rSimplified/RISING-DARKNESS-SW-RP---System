--

--
util.AddNetworkString("RDSRP.IConfig.Load") 
util.AddNetworkString("RDSRP.IConfig.ReLoad")

file.CreateDir("rdsrp/iconfig")

net.Receive("RDSRP.IConfig.Load", function(len, ply)
    --if !TDS.library.Config["Libacces"][ply:GetUserGroup()] or ply:IsSuperAdmin() then return end
    
          if file.IsDir("rdsrp/iconfig", "DATA") then 
                local tbl = net.ReadTable()
                file.Write("rdsrp/iconfig/configdata.xml", util.TableToJSON(tbl) )
                net.Start("RDSRP.IConfig.Load")
                      net.WriteTable(tbl) 
                net.Broadcast() 
          else
                file.CreateDir("rdsrp/iconfig")
          end
    end) 
     
    
net.Receive("RDSRP.IConfig.ReLoad", function(len, ply)
        if file.IsDir("rdsrp/iconfig", "DATA") then
            if file.Exists("rdsrp/iconfig/configdata.xml", "DATA") then 
                    local tl = file.Read("rdsrp/iconfig/configdata.xml")
                    net.Start("RDSRP.IConfig.ReLoad")
                    net.WriteTable(util.JSONToTable(tl))
                    net.Send(ply)
            else
                    return
            end
        else
            file.CreateDir("rdsrp/iconfig")
        end
end)
