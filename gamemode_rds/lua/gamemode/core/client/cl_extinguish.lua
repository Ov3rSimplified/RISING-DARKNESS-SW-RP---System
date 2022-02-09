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
//** [[   Temporder | cl_extinguish.lua  ]]** \\


local tabl = {
    [TEAM_Jane] = true
}
if LocalPlayer():IsOnFire() then
    LocalPlayer():Extinguish()
    print(LocalPlayer():GetDamage())
    LocalPlayer():SetHealth( LocalPlayer():Health() + LocalPlayer():GetDamage() ) 
end
