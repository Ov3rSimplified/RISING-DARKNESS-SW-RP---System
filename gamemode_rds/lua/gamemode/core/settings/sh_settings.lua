--
/*
for Combobox  
    ["Example"] = {
        what = "CheckBox", -- Checkbox or DComboBox 
        comboitems = {
            ["VALUE"] = "DATA", 
            ["VALUE"] = "DATA",
            ["VALUE"] = "DATA", 
        },
        savefunc = function(self, index, value, data) end
    },

*/  
_RDS.PlayerSettings.Config = { 
    ["Menu2"] = {  
        what = "CheckBox", -- Checkbox or DComboBox
        comboitems = { 
            ["A"] = "aa",   
            ["B"] = "bb",      
            ["C"] = "cc", 
        }, -- when not then nil
        savefunc = function(self, index, value, data) end,
        basevar
 
    }, 
    ["UIBaseColor"] = {  
        what = "ColorPalette", -- Checkbox or DComboBox
        comboitems = {}, -- when not then nil
        savefunc = function( self,  col )
            _RDS.PlayerSettings.Config["UIBaseColor"].basevar = col
            _RDS:SETUserOptions()                
        end, 
        basevar
 
    }, 
}