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
//** [[   sql | sv_sql.lua   ]]** \\

util.AddNetworkString("RDSRP.SQL.CheckPlayerTable")

function _RDS.SQL:CreateTable()
    sql.Query( "CREATE TABLE IF NOT EXISTS RDSRP_CharacterTable ( ID TEXT, SID TEXT, SID64 TEXT, SpecWeap TEXT, other TEXT )" )
end
function _RDS.SQL:DropTable()
    sql.Query( "DROP TABLE RDSRP_CharacterTable" )
end 
 
function _RDS.SQL:InsertPlayerTable(ply)
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
end net.Receive("RDSRP.SQL.CheckPlayerTable", function(len,ply) _RDS.SQL:InsertPlayerTable(ply) end)

_RDS.SQL:CreateTable()

hook.Add("VoidChar.CharacterSelected", "RDSRP.SQL.CheckInitPlayer", function(ply)
 /*
    local sqltbl = sql.Query( "SELECT * FROM RDSRP_CharacterTable" )
    local voidtbl = sql.Query( "SELECT * FROM VoidChar_characters" )

    if sqltbl == nil then 
        if _RDS.Config.Debug then 
            _RDS:DebugPrint( Color(0,250,0), "Playerdata First Inserted" )
        end
        sql.Query("INSERT INTO RDSRP_CharacterTable( ID , SID, SID64 ) VALUES( '" .. tostring(ply:GetCharacterID()) .. "' , '" .. tostring(ply:SteamID()) .."' , '" .. tostring(ply:SteamID64()) .. "') ")
    else
        for k,v in pairs(sqltbl) do
            for vK, vV in pairs(voidtbl) do     
                if sqltbl[k].ID == v.id then
                    if _RDS.Config.Debug then 
                        _RDS:DebugPrint( Color(250,0,0), "Cant Insert Date, because the play have it already" )  
                    end
                    return
                else
                    if _RDS.Config.Debug then 
                        _RDS:DebugPrint( Color(0,250,0), "Playerdata Inserted" )
                    end
                    sql.Query("INSERT INTO RDSRP_CharacterTable( ID , SID, SID64 ) VALUES( '" .. tostring(ply:GetCharacterID()) .. "' , '" .. tostring(ply:SteamID()) .."' , '" .. tostring(ply:SteamID64()) .. "') ")
                end 
            end
        end
    end
    */
end)

hook.Add("VoidChar.CharacterSelected", "RDSRP.SQL.InitPlayer", function(ply)
end)
