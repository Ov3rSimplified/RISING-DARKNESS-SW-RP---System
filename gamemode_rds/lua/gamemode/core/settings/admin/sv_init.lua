--

--
util.AddNetworkString("RDSRP.IConfig.Load") 
util.AddNetworkString("RDSRP.IConfig.ReLoad")
util.AddNetworkString("RDSRP.Roleplay.Trainings.ReLoad")
util.AddNetworkString("RDSRP.Roleplay.Trainings.Load") 

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


net.Receive("RDSRP.Roleplay.Trainings.Load", function(len,ply)
      local read = _RDS.ReadCTable() 

            if not file.IsDir("rdsrp/iconfig", "DATA") then 
                  file.CreateDir("rdsrp/iconfig")
            end 

            file.Write("rdsrp/iconfig/trainingvalues.json", util.TableToJSON(read))
            net.Start("RDSRP.Roleplay.Trainings.Load")
            _RDS.WriteCTable(read) 
            net.Broadcast()
end)



net.Receive("RDSRP.Roleplay.Trainings.ReLoad", function(len,ply)

      if not file.IsDir("rdsrp/iconfig", "DATA") then  
            file.CreateDir("rdsrp/iconfig")
      end

      if not file.Exists("rdsrp/iconfig/trainingvalues.json", "DATA") then 
            file.Write("rdsrp/iconfig/trainingvalues.json", util.TableToJSON({}))
      end
 
      if file.Exists("rdsrp/iconfig/trainingvalues.json", "DATA") then 
            local tl = file.Read("rdsrp/iconfig/trainingvalues.json")
            net.Start("RDSRP.Roleplay.Trainings.ReLoad")
            _RDS.WriteCTable(util.JSONToTable(tl))
            net.Send(ply)
      else
            return
      end
end)


/**   **/

Yolo.Loading.Add({
      ["name"] = "Usersettings",
      ["table"] = function(ply)
            return _RDS.PlayerSettings.Menu
      end,
      -- serverside function to get the data to load
      ["load"] = [[
            _RDS.PlayerSettings.Menu = data
                  print("Loaded Factions")
                  return true
      ]]
})

Yolo.Loading.Add({
      ["name"] = "Weaponchest",
      ["table"] = function(ply)
            return _RDS.Advtraining
      end,
      -- serverside function to get the data to load
      ["load"] = [[
      _RDS.Advtraining = data
            print("Loaded Factions")
            return true
      ]]
})


Yolo.Loading.Add({
      ["name"] = "Userrights",
      ["table"] = function(ply)
                        return _RDS.Config.ExtraUserOptions
                  end,
      -- serverside function to get the data to load
      ["load"] = [[
            _RDS.Config.ExtraUserOptions = data
                        print("Loaded Factions")
                        return true
                  ]]
}) 

Yolo.Loading.Add({
      ["name"] = "Adminsuite",
      ["table"] = function(ply)
                        return _RDS.Adminsuite.UI
                  end,
      -- serverside function to get the data to load
      ["load"] = [[
            _RDS.Adminsuite.UI = data
            print("Loaded Factions")
            return true
            ]]
})