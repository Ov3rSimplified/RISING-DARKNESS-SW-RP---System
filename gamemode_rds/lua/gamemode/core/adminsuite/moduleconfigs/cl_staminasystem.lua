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
//** [[   Adminsuite | cl_staminasystem.lua   ]]** \\

/*

_RDS.Adminsuite.UI.Config.SaSys = {}
local RDSC = _RDS.Adminsuite.UI.Config.SaSys
local Scroll = _RDS.Adminsuite.UI.AdminSettings.Scroll

function RDSC:Main()
    local scrw, scrh = ScrW(), ScrH()
    local top = _RDS.Adminsuite.UI.Select:Add("DPanel")
    top:Dock(TOP)
    top:DockMargin(0,0,0,0)
    top:SetTall(scrh*0.075)
    top:SetText("")
        top.Paint = function(self,w,h)
            draw.RoundedBoxEx(15,0,0,w,h,Color(46,46,46),false,false,false,false)
            draw.SimpleText("⸻ StaminaSystem ⸻", "RDS.Admin.btn", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        RDSC.TOP = top
        _RDS.Adminsuite.UI:BackButton(function() top:Remove() _RDS.Adminsuite.UI.AdminSettings.Scroll:Clear() _RDS.Adminsuite.UI.AdminSettings:ServerSettings() end)



    local MaxStaminaPanel = _RDS.Adminsuite.UI.AdminSettings.Scroll:Add("DPanel")
    MaxStaminaPanel:Dock(TOP)
    MaxStaminaPanel:DockMargin(10,10,10,0) 
    MaxStaminaPanel:SetTall(scrh*0.12)
        MaxStaminaPanel.Paint = nil
    local MaxStaminaText = MaxStaminaPanel:Add("DLabel")
    MaxStaminaText:Dock(LEFT)
    MaxStaminaText:DockMargin(0,0,0,0)
    MaxStaminaText:SetWide(scrw*0.2)
    MaxStaminaText:SetText("MaxStamina")
        MaxStaminaText.Paint = function(self,w,h)
            self:SetFont("RDS.Admin.btnply")
        end
    local MaxStaminaNumber = MaxStaminaPanel:Add("DNumberWang")
    MaxStaminaNumber:Dock(LEFT)
    MaxStaminaNumber:DockMargin(0,40,0,40)
    MaxStaminaNumber:SetWide(scrw*0.1)
    MaxStaminaNumber:SetFont("RDSRP.30")
    MaxStaminaNumber:SetText(_RDS.Admin.IConfig["Stamina"].Core.MaxStandardStamina)
        MaxStaminaNumber.Paint = function(self,w,h)
            draw.RoundedBox(7,0,0,w,h,Color(46,46,46))
            self:DrawTextEntryText(_RDS:Color("WHITE", 255), Color(30, 130, 255), _RDS:Color("WHITE", 255) )
            self:SetPlaceholderColor( _RDS:Color("WHITE", 255) )
        end
        MaxStaminaNumber.OnEnter = function(self)
                _RDS.Admin.IConfig["Stamina"].Core.MaxStandardStamina = self:GetValue()
                net.Start("RDSRP.IConfig.Load")
                net.WriteTable(_RDS.Admin.IConfig)
        end 

end
*/