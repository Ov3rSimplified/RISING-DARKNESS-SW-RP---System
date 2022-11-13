--
 
 
sql.Query("CREATE TABLE RDSRP_Questsytem( player TEXT , var TEXT )" ) 
--sql.Query("DROP TABLE RDSRP_Questsytem")
 
util.AddNetworkString("RDS.Questsystem.system")
util.AddNetworkString("RDS.Questsystem.Readall")

net.Receive("RDS.Questsystem.Readall", function(len,ply)
    local read = sql.Query("SELECT * FROM RDSRP_Questsytem")
 
    net.Start("RDS.Questsystem.Readall")
    net.WriteType(read)
    --net.Send(ply)
    net.Broadcast() 
end)


net.Receive("RDS.Questsystem.system", function(len,ply)
    local read = net.ReadTable()

    net.Start("RDS.Questsystem.system")
    net.WriteTable(read)
    net.Broadcast() 
 
    if read.what == "Create" then 
        if sql.Query("SELECT * FROM RDSRP_Questsytem WHERE player='"..read.ply.."'") then 
            return 
         else
            sql.Query("INSERT INTO RDSRP_Questsytem( player, var ) VALUES( '"..read.ply.."' , 'new' ) ")
        end
    end
    if read.what == "passed" then
        sql.Query("UPDATE RDSRP_Questsytem SET var = '"..read.var.."' WHERE player = '"..read.ply.."'" )
    end
    if read.what == "next_try" then 
        sql.Query("UPDATE RDSRP_Questsytem SET var = '"..read.var.."' WHERE player = '"..read.ply.."'" )
    end
    if read.what == "notpassed" then 
        sql.Query("UPDATE RDSRP_Questsytem SET var = '"..read.var.."' WHERE player = '"..read.ply.."'" )
    end
    if read.what == "reset" then 
        sql.Query("UPDATE RDSRP_Questsytem SET var = '"..read.var.."' WHERE player = '"..read.ply.."'" )
        include("gamemode/core/qsys/sh_init.lua")
    end
end)
