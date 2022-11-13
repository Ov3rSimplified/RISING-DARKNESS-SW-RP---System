MVPPerfectHands = MVPPerfectHands or {}

MVPPerfectHands.WheelMenu = {
    New = function(self)
        return setmetatable({options = {}}, {__index = MVPPerfectHands.WheelMenu})
    end,

    AddOption = function(self, title, description, icon, click)
        local newOption = MVPPerfectHands.WheelMenuOption:New()

        newOption:SetTitle(title or '')
        newOption:SetDescription(description or '')
        newOption:SetIcon(icon or 'error')
        newOption:SetClick(click or function()
            
        end)

        self.options[#self.options + 1] = newOption

        return newOption
    end,

    Open = function(self)
        if #self.options == 0 then return end
        MVPPerfectHands.ShowRadialMenu(self.options) 
    end
} 

MVPPerfectHands.WheelMenuOption = {
    New = function(self)
        return setmetatable({subMenu = nil}, {__index = MVPPerfectHands.WheelMenuOption})
    end,

    AddSubOption = function(self, title, description, icon, click) 
        if self.subMenu then
            return self.subMenu:AddOption(title, description, icon, click)
        end

        self.subMenu = MVPPerfectHands.WheelMenu:New() 

        self.click = function()
            self.subMenu:Open()
        end

        return self.subMenu:AddOption(title, description, icon, click)
    end, 

    SetTitle = function(self, value)
        self.title = value

        return self
    end,
    SetDescription = function(self, value)
        self.description = value

        return self
    end,
    SetIcon = function(self, value)
        
        if type(value) ~= 'IMaterial' then
            value = Material(value or 'error', 'smooth mips')
        end

        self.icon = value

        return self
    end ,
    SetClick = function(self, value)
        self.click = value

        return self
    end 
}

function MVPPerfectHands.Menu()
    return MVPPerfectHands.WheelMenu:New()
end