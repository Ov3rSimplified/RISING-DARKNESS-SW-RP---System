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
//** [[   Interface | cl_dashboard.lua   ]]** \\
_RDS.Interface.UI.Binds = {}
local RDSUI = _RDS.Interface.UI.Binds

function RDSUI:OpenBinds()
    local scrw, scrh = ScrW(),ScrH()

    local Ppanel = vgui.Create("RDSRP.BPanel")
    Ppanel:Dock(FILL)


    RDSUI.StaticPanel = vgui.Create( "DPanel", Ppanel )
    RDSUI.StaticPanel:Dock( LEFT )
    RDSUI.StaticPanel:DockMargin(scrw*0.09,0,0,0)
    RDSUI.StaticPanel:SetWide(scrw*0.4)
        RDSUI.StaticPanel.Paint = function( self, w, h ) 
          draw.RoundedBox( 0, 0, 0, w, h, _RDS:Color("BLACK",130) )
          surface.SetDrawColor(_RDS:Color("WHITE",255))
          surface.DrawOutlinedRect(0,0,w,h,2)
        end 

    RDSUI.SelfPanel = vgui.Create( "DPanel", Ppanel )
    RDSUI.SelfPanel:Dock( RIGHT )
    RDSUI.SelfPanel:DockMargin(0,0,scrw*0.09,0)
    RDSUI.SelfPanel:SetWide(scrw*0.4)
        RDSUI.SelfPanel.Paint = function( self, w, h ) 
          draw.RoundedBox( 0, 0, 0, w, h, _RDS:Color("BLACK",130) )
          surface.SetDrawColor(_RDS:Color("WHITE",255))
          surface.DrawOutlinedRect(0,0,w,h,2)
        end 
    
    _RDS.Interface.UI.SelectBar:AddSheet( "Belegungen", Ppanel )
    RDSUI:StaticBindMenu()
    RDSUI:SelfBindMenu()
end

function RDSUI:StaticBindMenu()
    local scrw, scrh = ScrW(),ScrH()

    local Top = self.StaticPanel:Add("DLabel")
    Top:Dock(TOP)
    Top:DockMargin(0,0,0,0)
    Top:SetTall(scrh*0.05)
    Top:SetText("")
        Top.Paint = function(self,w,h)
            draw.SimpleText("Festgelegte", "RDSRP.40", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE",255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    
    local ScrollPanel = self.StaticPanel:Add("DScrollPanel")
    ScrollPanel:Dock(FILL)

    for k, v in pairs(_RDS.Admin.IConfig["Binds"]) do   
        local pnl = ScrollPanel:Add("DPanel")
        pnl:Dock(TOP)
        pnl:DockMargin(10,5,10,5)
        pnl:SetTall(scrh*0.07)
            pnl.Paint  = function(self,w,h)
                draw.RoundedBox(5,2,2,w-4,h-4,_RDS:Color("BLACK",130))
                surface.SetDrawColor( _RDS:Color("WHITE", 255) )
                surface.DrawOutlinedRect(0,0,w,h,2)
            end
        local title = vgui.Create("DLabel", pnl)
        title:Dock(LEFT)
        title:DockMargin(5,0,0,0)
        title:SetWide(scrw*0.5)
        title:SetText( "" )
            title.Paint = function(self,w,h)
                draw.SimpleText(k, "RDSRP.bsys.bindtitle", 0, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            end
        local binder = vgui.Create("DBinder", pnl)
        binder:Dock(RIGHT)
        binder:DockMargin(0,0,0,0)
        binder:SetWide(scrw*0.07)
        binder:SetFont("RDSRP.bsys.bindertitle")
        binder:SetValue( v.key )
        
            binder.Paint = function(self,w,h)
                local clr = _RDS:Color("WHITE", 255)
                if self:IsHovered() then clr = _RDS:Color("PETER RIVER", 255) else clr = _RDS:Color("WHITE",255) end
                binder:SetTextColor(clr)
                draw.RoundedBox(5,2,2,w-4,h-4,_RDS:Color("BLACK",130))
                surface.SetDrawColor( clr )
                surface.DrawOutlinedRect(0,0,w,h,2)
            end
            function binder:OnChange( Key )
                cookie.Set("RDSRP.Bind."..k, Key) 
                v.Key = binder:GetValue()
            end
    end

end

function RDSUI:SelfBindMenu()
    local scrw, scrh = ScrW(),ScrH()

    local Top = self.SelfPanel:Add("DLabel")
    Top:Dock(TOP)
    Top:DockMargin(0,0,0,0)
    Top:SetTall(scrh*0.05)
    Top:SetText("")
        Top.Paint = function(self,w,h)
            draw.SimpleText("Eigene", "RDSRP.40", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE",255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    local SScrollPanel = self.SelfPanel:Add("DScrollPanel")
    SScrollPanel:Dock(FILL)

    local function selfbinds()
        if table.IsEmpty(_RDS.PlayerConfig.plybind.binds) then 
            local pnl = SScrollPanel:Add("DButton")
            pnl:Dock(TOP)
            pnl:DockMargin(10,5,10,5)
            pnl:SetTall(scrh*0.07)
            pnl:SetText("")
                pnl.Paint  = function(self,w,h)
                    draw.RoundedBox(5,2,2,w-4,h-4,_RDS:Color("BLACK",130))
                    surface.SetDrawColor( _RDS:Color("WHITE", 255) )
                    surface.DrawOutlinedRect(0,0,w,h,2)
                    draw.SimpleText("KEINE BELEGUNGEN GEFUNDEN!", "RDSRP.40", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            else
            for k, v in pairs(_RDS.PlayerConfig.plybind.binds) do   
                local pnl = SScrollPanel:Add("DButton")
                pnl:Dock(TOP)
                pnl:DockMargin(10,5,10,5)
                pnl:SetTall(scrh*0.07)
                pnl:SetText("")
                    pnl.Paint  = function(self,w,h)
                        draw.RoundedBox(5,2,2,w-4,h-4,_RDS:Color("BLACK",130))
                        surface.SetDrawColor( _RDS:Color("WHITE", 255) )
                        surface.DrawOutlinedRect(0,0,w,h,2)
                    end
                    pnl.DoRightClick = function()
                        local Menu = DermaMenu()
                        Menu:AddOption( "Delete", function()
                            _RDS.PlayerConfig.plybind.binds[k] = nil
                            _RDS.PlayerConfig.plybind:Load(_RDS.PlayerConfig.plybind.binds)
                            SScrollPanel:Clear()
                            timer.Simple(0.1,function()
                                selfbinds()
                            end)
                        end)
                        Menu:Open()
                    end
                local title = vgui.Create("DLabel", pnl)
                title:Dock(LEFT)
                title:DockMargin(5,0,0,0)
                title:SetWide(scrw*0.5)
                title:SetText( "" )
                    title.Paint = function(self,w,h)
                        draw.SimpleText(k, "RDSRP.bsys.bindtitle", 0, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                    end
                local binder = vgui.Create("DBinder", pnl)
                binder:Dock(RIGHT)
                binder:DockMargin(0,0,0,0)
                binder:SetWide(scrw*0.07)
                binder:SetFont("RDSRP.bsys.bindertitle")
                binder:SetValue( v.key )
                
                    binder.Paint = function(self,w,h)
                        local clr = _RDS:Color("WHITE", 255)
                        if self:IsHovered() then clr = _RDS:Color("PETER RIVER", 255) else clr = _RDS:Color("WHITE",255) end
                        binder:SetTextColor(clr)
                        draw.RoundedBox(5,2,2,w-4,h-4,_RDS:Color("BLACK",130))
                        surface.SetDrawColor( clr )
                        surface.DrawOutlinedRect(0,0,w,h,2)
                    end
                    function binder:OnChange( Key )
                        _RDS.PlayerConfig.plybind.binds[k].key = binder:GetValue()
                        _RDS.PlayerConfig.plybind:Load(_RDS.PlayerConfig.plybind.binds)
                        SScrollPanel:Clear()
                        timer.Simple(0.1,function()
                            selfbinds()
                        end)
                    end

            end
        end
    end
    selfbinds()
    local add = self.SelfPanel:Add("DButton")
    add:Dock(BOTTOM)
    add:DockMargin(5,5,5,5)
    add:SetTall(scrh*0.05)
    add:SetText("Hinzufügen")
    add:SetTextColor(Color(255,255,255))
    add:SetFont("RDSRP.30")
        add.Paint = function(self,w,h)
            local clr = _RDS:Color("WHITE", 255)
            draw.RoundedBox(0,0,0,w,h, _RDS:Color("BLACK", 130))
            surface.SetDrawColor(_RDS:Color("WHITE", 255))
            surface.DrawOutlinedRect(0,0,w,h,2)

            if self:IsHovered() then 
                clr = Color(51,255,0)
            surface.SetDrawColor(clr)
            surface.DrawOutlinedRect(0,0,w,h,2)
            end
            self:SetTextColor(clr)
        end
        add.DoClick = function()
            local blur = vgui.Create("DPanel")
            blur:SetSize(scrw,scrh)
            blur:Center()
            blur:MakePopup()
            
            local mat = Material( "pp/blurscreen" )
                blur.Paint = function(self,w,h)
                    surface.SetMaterial( mat )
                    surface.SetDrawColor( 255, 255, 255 )
                    mat:SetInt( "$blur", 1 )
                    mat:SetFloat( "$blur", 5.0 )
                    mat:Recompute( "$blur" )
                    if render then render.UpdateScreenEffectTexture() end
                    surface.DrawTexturedRect( 0, 0, ScrW(), ScrH() )
                end
            local Window = vgui.Create( "RDSRP.BPanel", blur )
            Window:SetSize( ScrW() * 0.34, ScrH() * 0.4 )
            Window:Center()
            Window:MakePopup()
            Window:DoModal()
                Window.Paint = function(self,w,h)
                    draw.RoundedBox(0,0,0,w,h, _RDS:Color("BLACK", 240))

                    surface.SetDrawColor(_RDS:Color("WHITE", 255))
                    surface.DrawOutlinedRect(0,0,w,h,2)
                end
            local top = vgui.Create("DPanel", Window)
            top:Dock(TOP)
            top:SetTall(ScrH()*0.05)
                top.Paint = function(self,w,h)
                    surface.SetDrawColor(_RDS:Color("WHITE", 255))
                    surface.DrawOutlinedRect(0,0,w,h,2)
                    draw.SimpleText("Tastenbelegung Erstellen", "RDSRP.30", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            local title = vgui.Create("DTextEntry", Window)
            title:Dock( TOP )
            title:DockMargin(10,5,10,0)
            title:SetTall(scrh*0.06)
            title:SetFont("RDS.Admin.btnply")
            title:SetPlaceholderText("Titel")

            local desc = vgui.Create("DTextEntry", Window)
            desc:Dock( TOP )
            desc:DockMargin(10,5,10,0)
            desc:SetTall(scrh*0.06)
            desc:SetFont("RDS.Admin.btnply")
            desc:SetPlaceholderText("Beschreibung")

            local bind = vgui.Create("DBinder", Window)
            bind:Dock( TOP )
            bind:DockMargin(10,5,10,0)
            bind:SetTall(scrh*0.06)
            bind:SetFont("RDS.Admin.btnply")

            local command = vgui.Create("DTextEntry", Window)
            command:Dock( TOP )
            command:DockMargin(10,5,10,0)
            command:SetTall(scrh*0.06)
            command:SetFont("RDS.Admin.btnply")
            command:SetPlaceholderText("Befehl")
        
            local close = vgui.Create("DButton", Window)
            close:Dock(BOTTOM)
            close:DockMargin(20,0,20,10)
            close:SetText( "Abbrechen" )
            close:SetTextColor( _RDS:Color("WHITE", 255))
            close:SetTall(ScrH() * 0.03 )
                close.Paint = function(self,w,h)
                    local clr = _RDS:Color("WHITE", 255)
                    draw.RoundedBox(0,0,0,w,h, _RDS:Color("BLACK", 130))
                    surface.SetDrawColor(_RDS:Color("WHITE", 255))
                    surface.DrawOutlinedRect(0,0,w,h,2)
                    if self:IsHovered() then 
                        clr = Color(255,0,0)
                    surface.SetDrawColor(clr)
                    surface.DrawOutlinedRect(0,0,w,h,2)
                    end
                    self:SetTextColor(clr)
                end
                close.DoClick = function()
                    Window:Remove()
                    blur:Remove()
                end
            local enter = vgui.Create("DButton", Window)
            enter:Dock(BOTTOM)
            enter:DockMargin(20,0,20,10)
            enter:SetText( "Absenden" )
            enter:SetTextColor( _RDS:Color("WHITE", 255))
            enter:SetTall(ScrH() * 0.03 )
                enter.Paint = function(self,w,h)
                        local clr = _RDS:Color("WHITE", 255)
                        draw.RoundedBox(0,0,0,w,h, _RDS:Color("BLACK", 130))
                        surface.SetDrawColor(_RDS:Color("WHITE", 255))
                        surface.DrawOutlinedRect(0,0,w,h,2)
        
                        if self:IsHovered() then 
                            clr = Color(51,255,0)
                        surface.SetDrawColor(clr)
                        surface.DrawOutlinedRect(0,0,w,h,2)
                        end
                        self:SetTextColor(clr)
                    end
                enter.DoClick = function()  
                    if title:GetText() == "" or title:GetText() == " " then 
                        _RDS:Notify("error", "Fehler", "Du hast den Titel vergessen auszufüllen!", 2)
                        return
                    elseif desc:GetText() == "" or desc:GetText() == " " then 
                        _RDS:Notify("error", "Fehler", "Du hast die Beschreibung vergessen auszufüllen!", 2)
                        return
                    elseif bind:GetValue() == nil or bind:GetValue() == KEY_NONE then 
                        _RDS:Notify("error", "Fehler", "Du hast vergessen die Belegung festzulegen!", 2)
                        return
                    elseif command:GetText() == "" or command:GetText() == " " then 
                        _RDS:Notify("error", "Fehler", "Du hast den Befehl vergessen auszufüllen!", 2)
                        return
                    end
                    local tbl = {
                        [title:GetText()] = {
                            txt = desc:GetText(),
                            key = bind:GetValue(),
                            cmd = command:GetText()
                        }
                    }
                    table.Merge(_RDS.PlayerConfig.plybind.binds, tbl)
                    _RDS.PlayerConfig.plybind:Load(_RDS.PlayerConfig.plybind.binds)
                    
                    Window:Remove()
                    blur:Remove()
                    SScrollPanel:Clear()
                    timer.Simple(0.1,function()
                        selfbinds()
                    end)
                end       
        end

end