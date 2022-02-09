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
//** [[   Core | cl_things.lua  ]]** \\

hook.Add("ContextMenuOpen", "RDSRP.9883824", function()
	if _RDS.Admin.IConfig["Rank"][LocalPlayer():GetUserGroup()].QMenu or _RDS.Admin.IConfig["Rank"][LocalPlayer():GetUserGroup()].fullacces then
        return true
    elseif _RDS.Admin.IConfig["Rank"][LocalPlayer():GetUserGroup()].noaccess then
        return false
    else
        return false
	end
end)
hook.Add("SpawnMenuOpen", "RDSRP.234982811", function()
	if _RDS.Admin.IConfig["Rank"][LocalPlayer():GetUserGroup()].QMenu or _RDS.Admin.IConfig["Rank"][LocalPlayer():GetUserGroup()].fullacces then
        return true
    elseif _RDS.Admin.IConfig["Rank"][LocalPlayer():GetUserGroup()].noaccess then
        return false
    else
        return false
	end
end)

if CLIENT then 
    RunConsoleCommand('hud_deathnotice_time', '0')
end
