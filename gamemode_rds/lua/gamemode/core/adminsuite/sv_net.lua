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
//** [[   Adminsuite | sv_net.lua   ]]** \\
 
util.AddNetworkString("RDSRP.Adminsuite.GetCharacterID")
util.AddNetworkString("RDSRP.IConfig.Load") 
util.AddNetworkString("RDSRP.IConfig.ReLoad")
util.AddNetworkString("RDSRP.Roleplay.Trainings.ReLoad")
util.AddNetworkString("RDSRP.Roleplay.Trainings.Load") 
util.AddNetworkString("RDSRP.Roleplay.Trainings.ReLoad.SHARED") 

net.Receive("RDSRP.Adminsuite.GetCharacterID", function(len,ply)
    local read = net.ReadType()
    local char
    if read:IsBot() then char = nil else char = read:GetCharacterID() end
    net.Start("RDSRP.Adminsuite.GetCharacterID")
    net.WriteType(tonumber(char))
    net.Send(ply)
end )  

file.CreateDir("rdsrp/iconfig")

net.Receive("RDSRP.IConfig.Load", function(len, ply)
      local tbl = _RDS.ReadCTable()
          if file.IsDir("rdsrp/iconfig", "DATA") then 
                file.Write("rdsrp/iconfig/configdata.json", util.TableToJSON(tbl) )
                net.Start("RDSRP.IConfig.Load")
                      _RDS.WriteCTable(tbl) 
                net.Broadcast() 
          else
                file.CreateDir("rdsrp/iconfig")
          end
          if istable(tbl) then 
            _RDS.Admin.IConfig = tbl
          end
    end) 
     
    
net.Receive("RDSRP.IConfig.ReLoad", function(len, ply)
        if file.IsDir("rdsrp/iconfig", "DATA") then
            if file.Exists("rdsrp/iconfig/configdata.json", "DATA") then 
                    local tl = file.Read("rdsrp/iconfig/configdata.json")
                    net.Start("RDSRP.IConfig.ReLoad")
                    _RDS.WriteCTable(util.JSONToTable(tl))
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
--net.Receive("RDSRP.Roleplay.Trainings.ReLoad.SHARED", function()
    --  net.Start("RDSRP.Roleplay.Trainings.ReLoad")
      --net.SendToServer()
--end)

hook.Add("VoidChar.CharacterSelected", "RELOADSPECS", function(ply)
      net.Start("RDSRP.Roleplay.Trainings.ReLoad.SHARED")
      net.Send(ply)
end)

