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
//** [[   Perksystem | cl_init.lua   ]]** \\

/*

["Title"] = {
    Description = ""
    Perksstages = {
        [1] = {
            name = "Perk 1"
            neededpoints = 2
            getfunction = function() end
        }
    }
}
*/
_RDS.Perksystem.Perks = {
    ["Perkpack1"] = {
        Description = "",
        Perksstages = {
            [1] = {
                name = "Perk 1",
                neededpoints = 2,
                getfunction = function() end
            },
            [2] = {
                name = "Perk 2",
                neededpoints = 2,
                getfunction = function() end
            },
            [3] = {
                name = "Perk 3",
                neededpoints = 2,
                getfunction = function() end
            },
        }
    },
    ["Perkpack2"] = {
        Description = "",
        Perksstages = {
            [1] = {
                name = "Perk 1",
                neededpoints = 2,
                getfunction = function() end
            },
            [2] = {
                name = "Perk 2",
                neededpoints = 2,
                getfunction = function() end
            },
            [3] = {
                name = "Perk 3",
                neededpoints = 2,
                getfunction = function() end
            },
        }
    }
}


local function opentest()
    local frame = vgui.Create("DFrame")
    frame:SetSize(ScrW()*0.6,ScrH()*0.9)
    frame:Center()
    frame:MakePopup()

    for k,v in pairs(_RDS.Perksystem.Perks) do 
        local panel = vgui.Create("DPanel",frame)
        panel:Dock(TOP)
        panel:SetTall(ScrH()*0.3)

        local top = panel:Add("DLabel")
        top:Dock(TOP)
        top:DockMargin(0,0,0,3)
        top:SetTall(ScrH() * 0.05)
        top:SetText("  " .. k)
        top:SetTextColor(Color(0,0,0))
        for id,perk in ipairs(_RDS.Perksystem.Perks[k].Perksstages) do  
            local button = panel:Add("DButton")
            button:Dock(LEFT)
            button:DockMargin(0,0,0,0)
            button:SetWide(ScrW()*0.15)
            button:SetText(perk.name .. " || " .. tostring(perk.neededpoints))

        end

    end


end
concommand.Add("OpenFramee", opentest)










