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
//** [[   PlayerConfig | sh_plycfg_iconfig.lua   ]] **\\


--
_RDS.PlayerSettings = _RDS.PlayerSettings or {}

_RDS.PlayerSettings.Category = {
    ["Escapemenu"] = {
        sortorder = 1,
        height = 0.4, 
    },
    ["User Inteface"] = {
        sortorder = 2,
        height = 0.4,
    }
}
_RDS.PlayerSettings.Config = { 
    ["UIBaseColor"] = {
        title = "Basis UI Farbe",  
        category = "User Inteface",
        what = "ColorPalette", -- Checkbox or DComboBox
        comboitems = {}, -- when not then nil
        sortorder = 1,
        buttonheight = 0.08,
        savefunc = function( self,  col )
            _RDS.PlayerConfig.config["UIBaseColor"] = col
            _RDS.PlayerConfig.Core:Load(_RDS.PlayerConfig.config)
            include("gamemode/modules/client/wheel/cl_wheel.lua")     
        end, 
        basevar
    
    },
    ["CompassColor"] = {
        title = "Kompasfarbe",  
        category = "User Inteface",
        what = "ColorPalette", -- Checkbox or DComboBox
        comboitems = {}, -- when not then nil
        sortorder = 2,
        buttonheight = 0.08,
        savefunc = function( self,  col )
            _RDS.PlayerConfig.config["CompassColor"] = col
            _RDS.PlayerConfig.Core:Load(_RDS.PlayerConfig.config) 
        end, 
        basevar
    
    }, 
    ["EnablePicture"] = {
        title = "Hintergrund Aktivieren",  
        category = "Escapemenu",
        what = "CheckBox", -- Checkbox or DComboBox
        comboitems = {}, -- when not then nil
        sortorder = 1,
        buttonheight = 0.08,
        savefunc = function( self ) 
            if (self:GetChecked() == true) then 
                _RDS.PlayerConfig.config["EnablePicture"] = true
            else
                _RDS.PlayerConfig.config["EnablePicture"] = false 
            end
            _RDS.PlayerConfig.Core:Load(_RDS.PlayerConfig.config)
        end, 
        basevar
    }, 
    ["CustomPicEnabled"] = {  
        title = "Eigenes Hintergrundbild Aktivieren",  
        category = "Escapemenu",
        what = "CheckBox", -- Checkbox or DComboBox
        comboitems = {}, -- when not then nil
        sortorder = 2,
        buttonheight = 0.08,
        savefunc = function( self ) 
            if (self:GetChecked() == true) then 
                _RDS.PlayerConfig.config["CustomPicEnabled"] = true
            else
                _RDS.PlayerConfig.config["CustomPicEnabled"] = false 
            end
            _RDS.PlayerConfig.Core:Load(_RDS.PlayerConfig.config)
        end, 
        basevar
    }, 
    ["Custompic"] = { 
        title = "ImgurID",   
        category = "Escapemenu",
        what = "TextEntry", -- Checkbox or DComboBox
        comboitems = {}, -- when not then nil
        sortorder = 3,
        buttonheight = 0.08,
        savefunc = function( self )
            _RDS.PlayerConfig.config["Custompic"] = self:GetText()
            _RDS.PlayerConfig.Core:Load(_RDS.PlayerConfig.config)           
        end, 
        basevar 
    }, 
    ["CustomHoverColor"] = {  
        title = "KonpfHover",   
        category = "Escapemenu", 
        what = "ColorPalette", -- Checkbox or DComboBox
        comboitems = {}, -- when not then nil
        sortorder = 4,
        buttonheight = 0.08,
        savefunc = function( self,  col )
            _RDS.PlayerConfig.config["CustomHoverColor"] = col
            _RDS.PlayerConfig.Core:Load(_RDS.PlayerConfig.config)           
        end, 
        basevar
    },  
}