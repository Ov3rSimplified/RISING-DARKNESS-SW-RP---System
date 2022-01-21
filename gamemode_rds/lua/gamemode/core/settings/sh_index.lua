--
_RDS.PlayerSettings = _RDS.PlayerSettings or {}
_RDS.PlayerSettings.Category = {
    ["Escapemenu"] = {
        sortorder = 1,
        height = 0.6, 
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
        savefunc = function( self,  col )
            _RDS.PlayerSettings.Config["UIBaseColor"].basevar = col
            _RDS:SETUserOptions()                
        end, 
        basevar
    
    },
    ["CompassColor"] = {
        title = "Kompasfarbe",  
        category = "User Inteface",
        what = "ColorPalette", -- Checkbox or DComboBox
        comboitems = {}, -- when not then nil
        sortorder = 2,
        savefunc = function( self,  col )
            _RDS.PlayerSettings.Config["CompassColor"].basevar = col
            _RDS:SETUserOptions()                
        end, 
        basevar
    
    }, 
    ["EnablePicture"] = {
        title = "Hintergrund Aktivieren",  
        category = "Escapemenu",
        what = "CheckBox", -- Checkbox or DComboBox
        comboitems = {}, -- when not then nil
        sortorder = 1,
        savefunc = function( self ) 
            if (self:GetChecked() == true) then 
                _RDS.PlayerSettings.Config["EnablePicture"].basevar = true
            else
                _RDS.PlayerSettings.Config["EnablePicture"].basevar = false 
            end
            _RDS:SETUserOptions()                
        end, 
        basevar
    }, 
    ["CustomPicEnabled"] = {  
        title = "Eigenes Hintergrundbild Aktivieren",  
        category = "Escapemenu",
        what = "CheckBox", -- Checkbox or DComboBox
        comboitems = {}, -- when not then nil
        sortorder = 2,
        savefunc = function( self ) 
            if (self:GetChecked() == true) then 
                _RDS.PlayerSettings.Config["CustomPicEnabled"].basevar = true
            else
                _RDS.PlayerSettings.Config["CustomPicEnabled"].basevar = false 
            end

            _RDS:SETUserOptions()                
        end, 
        basevar
    }, 
    ["Custompic"] = { 
        title = "ImgurID",   
        category = "Escapemenu",
        what = "TextEntry", -- Checkbox or DComboBox
        comboitems = {}, -- when not then nil
        sortorder = 3,
        savefunc = function( self )
            _RDS.PlayerSettings.Config["Custompic"].basevar = self:GetText()
            _RDS:SETUserOptions()                
        end, 
        basevar
    }, 
    ["CustomHoverColor"] = {  
        title = "KonpfHover",   
        category = "Escapemenu", 
        what = "ColorPalette", -- Checkbox or DComboBox
        comboitems = {}, -- when not then nil
        sortorder = 4,
        savefunc = function( self,  col )
            _RDS.PlayerSettings.Config["CustomHoverColor"].basevar = col
            _RDS:SETUserOptions()                
        end, 
        basevar
    }, 
}
