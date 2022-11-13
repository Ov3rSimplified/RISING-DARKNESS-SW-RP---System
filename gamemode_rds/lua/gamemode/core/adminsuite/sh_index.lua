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
//** [[   Adminsuite | sh_index.lua   ]]** \\
_RDS.Adminsuite = _RDS.Adminsuite or {}
_RDS.Adminsuite.UI = _RDS.Adminsuite.UI or {}
_RDS.Adminsuite.UI.AdminSettings = _RDS.Adminsuite.UI.AdminSettings or {}
_RDS.Adminsuite.UI.HardSettings = _RDS.Adminsuite.UI.HardSettings or {}
_RDS.Adminsuite.UI.ServerConfigModules = {}
_RDS.Adminsuite.UI.Config = _RDS.Adminsuite.UI.Config or {}
 
  
/*
_RDS.Adminsuite.UI:ServerModuleAdd({
    id = 1 // Sort order
    name = "EXAMPLE" // Title
    description = "..." // Module Description
    image = "" // Image
    func = func // execute function 
})
*/

function _RDS.Adminsuite.UI:ServerModuleAdd(data)
    data.id = data.id or {}
    data.name = data.name or "N/A"
    data.description = data.description or {}
    data.image = data.image or "N/A"
    data.func = data.func or nil 

    _RDS.Adminsuite.UI.ServerConfigModules[data.id] = data
end


// Create the Module
_RDS.Adminsuite.UI:ServerModuleAdd({
    id = 1, 
    name = "Questsystem",
    description = "Mein Wunderschönes Questsystem", 
    image = "...",
    func = function()
        _RDS.Adminsuite.UI.Config.QSys:Main()
    end
})
/*
_RDS.Adminsuite.UI:ServerModuleAdd({
    id = 100, 
    name = "Stamina",
    description = "das Stamina System", 
    image = "...",
    func = function()
        _RDS.Adminsuite.UI.Config.SaSys:Main() 
    end
})
*/

--PrintTable(_RDS.Adminsuite.UI.ServerConfigModules) 