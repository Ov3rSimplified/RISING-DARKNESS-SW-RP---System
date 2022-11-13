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
//** [[   Specialisation/equipment | sv_net.lua   ]]** \\
util.AddNetworkString("RDSRP.Specialisation.Menu")
util.AddNetworkString("RDSRP.Specialisation.Retrieveweapon")
util.AddNetworkString("RDSRP.Specialisation.Depositweapon")
util.AddNetworkString("RDSRP.Specialisation.AddWeaponToSQL")
util.AddNetworkString("RDSRP.Specialisation.GetWeaponFromSQL")

net.Receive("RDSRP.Specialisation.Menu", function(len, ply)

    local sqltbl = sql.Query( "SELECT * FROM RDSRP_CharacterTable" )
    local vartbl = {}
    local tbl = {}

    if sqltbl == nil then 
        if _RDS.Config.Debug then 
            _RDS:DebugPrint( Color(0,250,0), "Playerdata Inserted" )
        end
        sql.Query("INSERT INTO RDSRP_CharacterTable( ID , SID, SID64, SpecWeap ) VALUES( '" .. tostring(ply:GetCharacterID()) .. "' , '" .. tostring(ply:SteamID()) .."' , '" .. tostring(ply:SteamID64()) .. "', '" .. util.TableToJSON({}) .."') ")
        return
    end
        for k,v in pairs(sqltbl) do    
            tbl = {
                [v.ID] = true 
            }
            table.Merge(vartbl,tbl)
        end 
             PrintTable(vartbl)  
        if vartbl[ply:GetCharacterID()] then
            if _RDS.Config.Debug then 
                _RDS:DebugPrint( Color(250,0,0), "Cant Insert Date, because the play have it already" )  
            end
        else
            if _RDS.Config.Debug then 
                _RDS:DebugPrint( Color(0,250,0), "Playerdata Inserted" )
            end
            sql.Query("INSERT INTO RDSRP_CharacterTable( ID , SID, SID64, SpecWeap ) VALUES( '" .. tostring(ply:GetCharacterID()) .. "' , '" .. tostring(ply:SteamID()) .."' , '" .. tostring(ply:SteamID64()) .. "', '" .. util.TableToJSON({}) .."') ")
        end
        
    local tbl = {
        ID = ply:GetCharacterID()
    }
    net.Start("RDSRP.Specialisation.Menu")
    _RDS.WriteCTable(tbl)
    net.Broadcast()
end) 
  

net.Receive("RDSRP.Specialisation.AddWeaponToSQL", function(len,ply)
    local sqltbl = sql.Query( "SELECT * FROM RDSRP_CharacterTable" )
    local WeaponTable = net.ReadTable()
    local vartbl = {}
    local tbl = {}
    /*
    for k,v in pairs(sqltbl) do    
        tbl = {
            [v.ID] = {
                spectbl = v.SpecWeap,
            } 
        }
        table.Merge(vartbl,tbl)
    end
    */
      --  if vartbl[ply:GetCharacterID()].spectbl == nil or vartbl[ply:GetCharacterID()].spectbl == "NULL" then
          --  sql.Query("INSERT INTO RDSRP_CharacterTable( SpecWeap ) VALUES( '" .. tostring(util.TableToJSON(WeaponTable)) .. "' ) WHERE ID = '" .. ply:GetCharacterID() .. "' ;")
     --   else
            sql.Query( "UPDATE RDSRP_CharacterTable SET SpecWeap = '" .. tostring(util.TableToJSON(WeaponTable)) .. "' WHERE ID = '" .. ply:GetCharacterID() .. "' ;" )
       -- end

    --net.Start("RDSRP.Specialisation.AddWeaponToSQL")
    --_RDS.WriteCTable(sqltbl)
    --net.WriteTable(WeaponTable)
    --net.WriteType(ply:GetCharacterID())
    --net.Broadcast()
end)
 

net.Receive("RDSRP.Specialisation.GetWeaponFromSQL", function(len,ply)
    local sqltbl = sql.Query( "SELECT * FROM RDSRP_CharacterTable" )
    
    local vartbl = {}
    local tbl = {}
    for k,v in pairs(sqltbl) do    
        tbl = {
            [v.ID] = {
                spectbl = v.SpecWeap,
            } 
        }
        table.Merge(vartbl,tbl)
    end
  --  PrintTable(util.JSONToTable(vartbl[ply:GetCharacterID()].spectbl))

    net.Start("RDSRP.Specialisation.GetWeaponFromSQL")
        _RDS.WriteCTable(util.JSONToTable(vartbl[ply:GetCharacterID()].spectbl))
    net.Broadcast()
end)



net.Receive("RDSRP.Specialisation.Retrieveweapon", function(len,ply)
    local read = net.ReadString()
    ply:Give(read)
    ply:SelectWeapon( read )
end)
net.Receive("RDSRP.Specialisation.Depositweapon", function(len,ply)
    local read = net.ReadString()
    if ply:HasWeapon( read ) then
		ply:StripWeapon( read )
	end
end)



--[[
    INITHOOK
]]

hook.Add("PlayerSpawn", "RDSRP.Specialisation.PlayerSpawnInit", function(ply)
    local sqltbl = sql.Query( "SELECT * FROM RDSRP_CharacterTable" )
    
    local vartbl = {}
    local tbl = {}
    for k,v in pairs(sqltbl) do    
        tbl = {
            [v.ID] = {
                spectbl = v.SpecWeap,
            } 
        }
        table.Merge(vartbl,tbl)
    end

    if ply:GetCharacterID() then 
        MsgC(Color(255,255,255), "Give Player Specialisation Equipment:\n")
        for k,v in pairs(util.JSONToTable(vartbl[ply:GetCharacterID()].spectbl)) do    
            MsgC(Color(250,0,0), "Give {"..ply:GetCharacterID().."} ", Color(255,255,255), k, "\n" )
            ply:Give(k)
        end
    end


    local sqltbl = sql.Query( "SELECT * FROM RDSRP_CharacterTable" )
    
    local vartbl = {}
    local tbl = {}

    if ply:GetCharacterID() then 
        for k,v in pairs(sqltbl) do    
            tbl = {
                [v.ID] = {
                    spectbl = v.SpecWeap,
                } 
            }
            table.Merge(vartbl,tbl)
        end

        net.Start("RDSRP.Specialisation.GetWeaponFromSQL")
            _RDS.WriteCTable(util.JSONToTable(vartbl[ply:GetCharacterID()].spectbl))
        net.Broadcast()
    end
end)
