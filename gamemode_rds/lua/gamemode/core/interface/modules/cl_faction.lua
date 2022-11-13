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
//** [[   Interface | cl_faction.lua   ]]** \\
_RDS.Interface.UI.Faction = {}
local RDSUI = _RDS.Interface.UI.Faction 
 
 
function RDSUI:OpenFactions()
    local scrw, scrh = ScrW(),ScrH()

   -- if _RDS.Admin.IConfig["Factions"].Core["TestFaction1"].Coredata.Leader[LocalPlayer():Team()] then
      local Ppanel = vgui.Create("RDSRP.BPanel")
      Ppanel:Dock(FILL)


      RDSUI.Panel = vgui.Create( "DPanel", Ppanel )
      RDSUI.Panel:Dock( LEFT )
      RDSUI.Panel:DockMargin(0,0,0,0)
      RDSUI.Panel:SetWide(scrw*0.25)
          RDSUI.Panel.Paint = function( self, w, h ) 
            draw.RoundedBox( 0, 0, 0, w, h, _RDS:Color("BLACK",130) )
            surface.SetDrawColor(_RDS:Color("WHITE",255))
            surface.DrawOutlinedRect(0,0,w,h,2)
          end 
      _RDS.Interface.UI.SelectBar:AddSheet( "Fraktion", Ppanel )
   -- else
   --     return 
  --  end

end


/*

ikod = {
  ["CetaForce"] = {
    Leader = {
      ["Colonel"] = true,
      ["Major"] = true
    },
    Units = {
      ["Forceone"] = {
        Leader = {
          ["FirstLieutenant"] = true,
        },
        Ranks = {
          ["Private"] = "JOB_NAME",
          ["PrivateFirstClass"] = "JOB_NAME",
        },
        StandardJob = "JOB_NAME",
      }
    },

    
  }
}





*/