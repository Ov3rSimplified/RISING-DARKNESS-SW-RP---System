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
//** [[   Specialisation/equipment | cl_net.lua   ]]** \\

net.Receive("RDSRP.Specialisation.GetWeaponFromSQL", function()
    local WeaponTable = _RDS.ReadCTable()
    _RDS.Specialisation.Equipment.PlyHave = WeaponTable
    print("<----------->")
    PrintTable(WeaponTable)
    print("<----------->")

end) 