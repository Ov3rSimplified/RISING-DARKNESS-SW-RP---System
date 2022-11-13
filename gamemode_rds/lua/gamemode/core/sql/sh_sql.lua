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
//** [[   sql | sh_sql.lua   ]]** \\
 
if CLIENT then 
    concommand.Add("Loaaad", function() 
        net.Start("RDSRP.Specialisation.GetWeaponFromSQL")
     --   net.WriteTable(_RDS.Specialisation.Equipment.PlyHave)
        net.SendToServer()
    end)
    concommand.Add("Loaaad2", function() 
        net.Start("RDSRP.SQL.CheckPlayerTable")
     --   net.WriteTable(_RDS.Specialisation.Equipment.PlyHave)
        net.SendToServer()
    end)
end