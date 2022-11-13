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
//** [[   Adminsuite | cl_specialisation.lua   ]]** \\
local RDSUI = _RDS.Adminsuite.UI.HardSettings



function RDSUI:SpecialisationSettings()
    local scrw,scrh = ScrW(), ScrH()
    RDSUI.Scroll:Clear()
    local top = _RDS.Adminsuite.UI.Select:Add("DPanel")
    top:Dock(TOP)
    top:DockMargin(0,0,0,0)
    top:SetTall(scrh*0.075)
    top:SetText("")
        top.Paint = function(self,w,h)
            draw.RoundedBoxEx(15,0,0,w,h,Color(46,46,46),false,false,false,false)
            draw.SimpleText("⸻ Spezialiserung ⸻", "RDS.Admin.btn", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
    _RDS.Adminsuite.UI:BackButton(function() top:Remove() RDSUI.Scroll:Clear() RDSUI:ConfigItems() end)

    local PANEL =  _RDS.Adminsuite.UI.HardSettings.Scroll:Add("RDSRP.Adminsuite.ConfigSelect")
    PANEL:Dock(TOP)
    PANEL:DockMargin(5,5,5,0) 
    PANEL:SetTall(scrh*0.65)

    self.SpecialisationCFG = vgui.Create("DPanel")
    self.SpecialisationCFG:Dock(FILL)
    self.SpecialisationCFG.Paint = nil
    PANEL:AddSheet( "Specialisation", self.SpecialisationCFG, Color(255,0,0) )

    self.EquipmentCFG = vgui.Create("DPanel")
    self.EquipmentCFG:Dock(FILL)
    self.EquipmentCFG.Paint = nil
    PANEL:AddSheet( "Equipment", self.EquipmentCFG, Color(0,255,34) )

    self.WhitelistCFG = vgui.Create("DPanel")
    self.WhitelistCFG:Dock(FILL)
    self.WhitelistCFG.Paint = nil
    PANEL:AddSheet( "Whitelist", self.WhitelistCFG, Color(0,255,149) )

    self.OtherCFG = vgui.Create("DPanel")
    self.OtherCFG:Dock(FILL)
    self.OtherCFG.Paint = nil
    PANEL:AddSheet( "Other", self.OtherCFG, Color(0,255,242) )






    --[[
        Specialisation Config
    ]]
    local function SpecialisationCFG_()
        
        local s_TOP = self.SpecialisationCFG:Add("DPanel")
        s_TOP:Dock(TOP)
        s_TOP:DockMargin(0,0,0,0)
        s_TOP:SetTall(scrh * 0.07)
            s_TOP.Paint = function(self,w,h)
                draw.RoundedBoxEx(15,0,0,w,h,Color(32,32,32),true,true,false,false)
                draw.SimpleText("Specialisation Config ", "RDSRP.30", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
            end
            local s_add = s_TOP:Add("DButton")
            s_add:Dock(RIGHT)
            s_add:DockMargin(0,0,0,0)
            s_add:SetFont("RDSRP.30")
            s_add:SetTextColor(_RDS:Color("WHITE", 255))
            s_add:SetText("✚")
                s_add.Paint = function(self,w,h)
                    local col = Color(59,59,59)
                    draw.RoundedBoxEx(15,0,0,w,h,Color(21,80,21),false,true,false,false)
                    if self:IsHovered() then 
                        col = Color(21,80,21)
                    else
                        col = Color(46,46,46)
                    end
                    draw.RoundedBoxEx(15,2,2,w-4,h-4,col,false,true,false,false)
                end
                s_add.DoClick = function()
                    local Window = vgui.Create( "RDSRP.BPanel" )
                    Window:SetSize( ScrW() * 0.34, ScrH() * 0.4 )
                    Window:Center()
                    Window:MakePopup()
                 --   Window:DoModal()
                        Window.Paint = function(self,w,h)
                            draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
                            draw.RoundedBox(15,2,2,w-4,h-4,Color(23,22,22,255))
                        end
                    local top = vgui.Create("DPanel", Window)
                    top:Dock(TOP)
                    top:SetTall(ScrH()*0.05)
                        top.Paint = function(self,w,h)
                            draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,false,false)
                            draw.SimpleText("Erstellung", "RDS.Admin.Configsmall", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                        end
                    local text = vgui.Create("DTextEntry", Window)
                    text:Dock( TOP )
                    text:DockMargin(10,5,10,0)
                    text:SetTall(scrh*0.06)
                    text:SetFont("RDS.Admin.btnply")
                    text:SetPlaceholderText("Specialisation")

                    local Shortt = vgui.Create("DTextEntry", Window)
                    Shortt:Dock( TOP )
                    Shortt:DockMargin(10,5,10,0)
                    Shortt:SetTall(scrh*0.06)
                    Shortt:SetFont("RDS.Admin.btnply")
                    Shortt:SetPlaceholderText("Short")
                
                    local close = vgui.Create("DButton", Window)
                    close:Dock(BOTTOM)
                    close:DockMargin(20,0,20,10)
                    close:SetText( "Abbrechen" )
                    close:SetTextColor( _RDS:Color("WHITE", 255))
                    close:SetTall(ScrH() * 0.03 )
                        close.Paint = function(self,w,h)
                            local clr
                            if self:IsHovered() then 
                                draw.RoundedBoxEx(6,0,0,w,h,Color(255,0,0),true,true,true,true)
                            end
                            draw.RoundedBox(6,2,2,w-4,h-4,Color(46,46,46))
                        end
                        close.DoClick = function()
                            Window:Remove()
                        end
                    local enter = vgui.Create("DButton", Window)
                    enter:Dock(BOTTOM)
                    enter:DockMargin(20,0,20,10)
                    enter:SetText( "Absenden" )
                    enter:SetTextColor( _RDS:Color("WHITE", 255))
                    enter:SetTall(ScrH() * 0.03 )
                        enter.Paint = function(self,w,h)
                                local clr
                                if self:IsHovered() then 
                                    draw.RoundedBoxEx(6,0,0,w,h,Color(0,255,13),true,true,true,true)
                                end
                                draw.RoundedBox(6,2,2,w-4,h-4,Color(46,46,46))
                            end
                        enter.DoClick = function()
                            local tbl = {
                                [text:GetText()] = {
                                    whitelist = {},
                                    Short = Shortt:GetText(),
                                    focus = {}
                                }
                            }
                            table.Merge(_RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets, tbl)
                            net.Start("RDSRP.IConfig.Load")
                            _RDS.WriteCTable(_RDS.Admin.IConfig)
                            net.SendToServer()
                            Window:Remove()

                            RDSUI.s_FILL:Clear()
                            s_TOP:Remove()
                            timer.Simple(0.1,function()
                                SpecialisationCFG_()
                            end)     
                        end
                end
        local s_FILL = self.SpecialisationCFG:Add("DScrollPanel")
        s_FILL:Dock(FILL)
        s_FILL:DockMargin(0,0,0,0)
            s_FILL.Paint = function(self,w,h)
                draw.RoundedBoxEx(0,0,0,w,h,Color(46,46,46),false,false,false,false)
            end
        RDSUI.s_FILL = s_FILL

        
        local sbar = s_FILL:GetVBar()
        sbar:SetSize(5,0)
        sbar:SetHideButtons( true )
        function sbar.btnGrip:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(255,0,0),false,false,false,true) end
        function sbar:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),false,false,false,true) end
        function sbar.btnUp:Paint(w, h) return end
        function sbar.btnDown:Paint(w, h) return end


            for k, v in pairs(_RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets) do   
                local s_item = s_FILL:Add("DButton")
                s_item:Dock(TOP)
                s_item:DockMargin(10,6,10,0)
                s_item:SetTall( scrh * 0.1 )
                s_item:SetText("")
                    s_item.Paint = function(self,w,h)
                        local clr = _RDS:Color("WHITE", 255)

                        if self:IsHovered() then 
                            clr = _RDS:Color("PETER RIVER", 255)
                            draw.RoundedBox(5,0,0,w,h,clr) --255,193,7,255
                        end
                        draw.RoundedBox(5,2,2,w-4,h-4,Color(53,52,52))
                        draw.SimpleText(k, "RDS.Admin.btn", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
                    s_item.DoRightClick = function()
                        local Menu = DermaMenu()
                        Menu:AddOption("Delete", function()
                            _RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets[k] = nil
                            RDSUI.s_FILL:Clear()
                            s_TOP:Remove()
                            timer.Simple(0.1,function()
                                SpecialisationCFG_()
                            end) 
                        end)
                        Menu:Open()

                    end

                    local function Page()
                        s_FILL:Clear()

                        local s_edit = s_TOP:Add("DButton")
                        s_edit:Dock(LEFT)
                        s_edit:DockMargin(0,0,0,0)
                        s_edit:SetFont("RDSRP.30")
                        s_edit:SetTextColor(_RDS:Color("WHITE", 255))
                        s_edit:SetText("<")
                            s_edit.Paint = function(self,w,h)
                                local col = Color(59,59,59)
                                draw.RoundedBoxEx(15,0,0,w,h,Color(64,80,21),true,false,false,false)
                                if self:IsHovered() then 
                                    col = Color(64,80,21)
                                else
                                    col = Color(46,46,46)
                                end
                                draw.RoundedBoxEx(15,2,2,w-4,h-4,col,true,false,false,false)
                            end
                            s_edit.DoClick = function()
                                s_FILL:Clear()
                                s_TOP:Remove()
                                SpecialisationCFG_()
                            end


                            local s_e_I = {
                                {
                                    prefix = "Name: ",
                                    suffix = k,
                                },
                                {
                                    prefix = "Short: ",
                                    suffix = v.Short,
                                },
                            }

                            for pre,suf in pairs(s_e_I) do 
                                local s_e_Info = s_FILL:Add("DLabel")
                                s_e_Info:Dock(TOP)
                                s_e_Info:SetTall(scrh*0.04)
                                s_e_Info:SetText("")
                                    s_e_Info.Paint = function(self,w,h)
                                        draw.SimpleText(suf.prefix .. suf.suffix, "RDSRP.30", 2, self:GetTall()/2, clr, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                                    end
                            end

                        --[[ 
                            -- SPECIALISATION --
                                    Focus
                        ]]

                        local s_e_FocusMPanel = s_FILL:Add("DPanel")
                        s_e_FocusMPanel:Dock(TOP)
                        s_e_FocusMPanel:DockMargin(10,10,10,0)
                        s_e_FocusMPanel:SetTall(scrh*0.44)
                        s_e_FocusMPanel.Paint = function(self,w,h)
                            draw.RoundedBoxEx(15,0,0,w,h,Color(32,32,32),true,true,false,false)
                        end

                        local s_e_FocusPanel = s_e_FocusMPanel:Add("DScrollPanel")
                        s_e_FocusPanel:Dock(FILL)

                        local sbar = s_e_FocusPanel:GetVBar()
                        sbar:SetSize(5,0)
                        sbar:SetHideButtons( true )
                        function sbar.btnGrip:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(255,0,0),false,false,false,true) end
                        function sbar:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),false,false,false,true) end
                        function sbar.btnUp:Paint(w, h) return end
                        function sbar.btnDown:Paint(w, h) return end

                        local s_e_FocusTop = s_e_FocusMPanel:Add("DPanel")   
                        s_e_FocusTop:Dock(TOP)
                        s_e_FocusTop:DockMargin(0,0,0,0)
                        s_e_FocusTop:SetTall(scrh*0.06)
                            s_e_FocusTop.Paint = function(self,w,h)
                                draw.SimpleText("Focus", "RDSRP.30",  self:GetWide() / 2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                            end

                            local s_e_FocusAdd = s_e_FocusTop:Add("DButton")
                            s_e_FocusAdd:Dock(RIGHT)
                            s_e_FocusAdd:DockMargin(0,0,0,0)
                            s_e_FocusAdd:SetFont("RDSRP.30")
                            s_e_FocusAdd:SetTextColor(_RDS:Color("WHITE", 255))
                            s_e_FocusAdd:SetText("✚")
                                s_e_FocusAdd.Paint = function(self,w,h)
                                    local col = Color(32,32,32)
                                    draw.RoundedBoxEx(15,0,0,w,h,Color(21,80,21),false,true,false,false)
                                    if self:IsHovered() then 
                                        col = Color(21,80,21)
                                    else
                                        col = Color(32,32,32)
                                    end
                                    draw.RoundedBoxEx(15,2,2,w-4,h-4,col,false,true,false,false)
                                end
                                s_e_FocusAdd.DoClick = function()
                                    local Window = vgui.Create( "RDSRP.BPanel" )
                                    Window:SetSize( ScrW() * 0.34, ScrH() * 0.2 )
                                    Window:Center()
                                    Window:MakePopup()
                                 --   Window:DoModal()
                                        Window.Paint = function(self,w,h)
                                            draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
                                            draw.RoundedBox(15,2,2,w-4,h-4,Color(23,22,22,255))
                                        end
                                    local top = vgui.Create("DPanel", Window)
                                    top:Dock(TOP)
                                    top:SetTall(ScrH()*0.05)
                                        top.Paint = function(self,w,h)
                                            draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,false,false)
                                            draw.SimpleText("Erstellung", "RDS.Admin.Configsmall", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                                        end
                                    local text = vgui.Create("DTextEntry", Window)
                                    text:Dock( TOP )
                                    text:DockMargin(10,5,10,0)
                                    text:SetTall(scrh*0.06)
                                    text:SetFont("RDS.Admin.btnply")
                                    text:SetPlaceholderText("focus")
                                    local close = vgui.Create("DButton", Window)
                                    close:Dock(BOTTOM)
                                    close:DockMargin(20,0,20,10)
                                    close:SetText( "Abbrechen" )
                                    close:SetTextColor( _RDS:Color("WHITE", 255))
                                    close:SetTall(ScrH() * 0.03 )
                                        close.Paint = function(self,w,h)
                                            local clr
                                            if self:IsHovered() then 
                                                draw.RoundedBoxEx(6,0,0,w,h,Color(255,0,0),true,true,true,true)
                                            end
                                            draw.RoundedBox(6,2,2,w-4,h-4,Color(46,46,46))
                                        end
                                        close.DoClick = function()
                                            Window:Remove()
                                        end
                                    local enter = vgui.Create("DButton", Window)
                                    enter:Dock(BOTTOM)
                                    enter:DockMargin(20,0,20,10)
                                    enter:SetText( "Absenden" )
                                    enter:SetTextColor( _RDS:Color("WHITE", 255))
                                    enter:SetTall(ScrH() * 0.03 )
                                        enter.Paint = function(self,w,h)
                                                local clr
                                                if self:IsHovered() then 
                                                    draw.RoundedBoxEx(6,0,0,w,h,Color(0,255,13),true,true,true,true)
                                                end
                                                draw.RoundedBox(6,2,2,w-4,h-4,Color(46,46,46))
                                            end
                                        enter.DoClick = function()
                                            local tbl = {
                                                [text:GetText()] = {}
                                            }
                                            table.Merge(_RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets[k].focus, tbl)
                                            net.Start("RDSRP.IConfig.Load")
                                            _RDS.WriteCTable(_RDS.Admin.IConfig)
                                            net.SendToServer()
                                            Window:Remove()

                                            s_e_FocusPanel:Clear()
                                            s_edit:Remove()
                                            timer.Simple(0.1,function()
                                                Page()
                                            end)     
                                        end
                                end  

                        local function focuspi()

                            for kf, vf in pairs(_RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets[k].focus) do 
                                local s_e_FocusITEM = s_e_FocusPanel:Add("DCollapsibleCategory")
                                s_e_FocusITEM:Dock(TOP)
                                s_e_FocusITEM:DockMargin(10,5,10,0)
                                s_e_FocusITEM:SetHeaderHeight(scrh*0.05)
                                s_e_FocusITEM:SetLabel("")
                                s_e_FocusITEM:SetExpanded(false)
                                     s_e_FocusITEM.Paint = function(self,w,h)
                                        if self:GetExpanded() == true then  
                                            draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
                                        else
                                            draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
                                        end
                                        draw.SimpleText(kf, "RDS.Admin.btnply", self:GetWide()/2, scrh*0.025, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                                    end

                                local FI = {}

                                for k_,v_ in pairs(_RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets[k].focus[kf]) do    
                                    FI.ITEM = s_e_FocusITEM:Add("DPanel")
                                    FI.ITEM:Dock(TOP)
                                    FI.ITEM:DockMargin(20,6,20,10)
                                    FI.ITEM:SetTall( scrh * 0.08 )
                                    FI.ITEM:SetText("")
                                        FI.ITEM.Paint = function(self,w,h)
                                            draw.RoundedBox(5,2,2,w-4,h-4,Color(53,52,52))
                                            draw.SimpleText(k_, "RDSRP.30", 7, self:GetTall()/2, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                                        end
                                    FI.Delete = FI.ITEM:Add("DButton")
                                    FI.Delete:Dock(RIGHT)
                                    FI.Delete:DockMargin(10,10,10,10)
                                    FI.Delete:SetWide(scrw*0.05)
                                    FI.Delete:SetText("")
                                        FI.Delete.Paint = function(self,w,h)
                                            local col = Color(53,52,52)
                                            draw.RoundedBoxEx(15,0,0,w,h,Color(80,21,21),true,true,true,true)
                                            if self:IsHovered() then 
                                                col = Color(80,21,21)
                                            else
                                                col = Color(53,52,52)
                                            end
                                            draw.RoundedBoxEx(15,2,2,w-4,h-4,col,true,true,true,true)
                                            draw.SimpleText("✖", "RDS.Admin.btn", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                                        end
                                        FI.Delete.DoClick = function()
                                            _RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets[k].focus[kf][k_] = nil
                                            net.Start("RDSRP.IConfig.Load")
                                            _RDS.WriteCTable(_RDS.Admin.IConfig)
                                            net.SendToServer()
                                            s_e_FocusPanel:Clear()
                                            timer.Simple(0.1,function()
                                                focuspi()
                                            end)  
                                        end
                                end


                                FI.Bottom = vgui.Create("DPanel",s_e_FocusITEM)
                                FI.Bottom:Dock(TOP)
                                FI.Bottom:DockMargin(scrw*0.145,0,scrw*0.145,0)
                                FI.Bottom:SetTall(scrh*0.04)
                                    FI.Bottom.Paint = function(self,w,h)
                                        draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),false,false,true,true)
                                    end

                                FI.Delete = FI.Bottom:Add("DButton")
                                FI.Delete:Dock(LEFT)
                                FI.Delete:SetText("")
                                FI.Delete:DockMargin(0,0,0,0)
                                FI.Delete:SetWide(scrw*0.12)
                                    FI.Delete.DoClick = function()
                                        _RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets[k].focus[kf] = nil
                                        net.Start("RDSRP.IConfig.Load")
                                        _RDS.WriteCTable(_RDS.Admin.IConfig)
                                        net.SendToServer() 
                                        s_e_FocusPanel:Clear()
                                            timer.Simple(0.1,function()
                                                focuspi()
                                            end)     
                                    end
                                    FI.Delete.Paint = function(self,w,h)
                                        local col = Color(53,52,52)
                                            draw.RoundedBoxEx(15,0,0,w,h,Color(255,0,0),true,true,true,true)
                                            if self:IsHovered() then 
                                                col = Color(255,0,0)
                                            else
                                                col = Color(53,52,52)
                                            end
                                            draw.RoundedBoxEx(15,2,2,w-4,h-4,col,true,true,true,true)
                                            draw.SimpleText("✖", "RDSRP.30", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                                    end


                                FI.AddEquip = FI.Bottom:Add("DButton")
                                FI.AddEquip:Dock(RIGHT)
                                FI.AddEquip:SetText("")
                                FI.AddEquip:DockMargin(0,0,0,0)
                                FI.AddEquip:SetWide(scrw*0.12)
                                    FI.AddEquip.Paint = function(self,w,h)
                                        local col = Color(53,52,52)
                                            draw.RoundedBoxEx(15,0,0,w,h,Color(51,255,0),true,true,true,true)
                                            if self:IsHovered() then 
                                                col = Color(51,255,0)
                                            else
                                                col = Color(53,52,52)
                                            end
                                            draw.RoundedBoxEx(15,2,2,w-4,h-4,col,true,true,true,true)
                                            draw.SimpleText("✚", "RDSRP.30", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                                    end
                                    FI.AddEquip.DoClick = function()
                                        local Window = vgui.Create( "RDSRP.BPanel" )
                                        Window:SetSize( ScrW() * 0.34, ScrH() * 0.2 )
                                        Window:Center()
                                        Window:MakePopup()
                                     --   Window:DoModal()
                                            Window.Paint = function(self,w,h)
                                                draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
                                                draw.RoundedBox(15,2,2,w-4,h-4,Color(23,22,22,255))
                                            end
                                        local top = vgui.Create("DPanel", Window)
                                        top:Dock(TOP)
                                        top:SetTall(ScrH()*0.05)
                                            top.Paint = function(self,w,h)
                                                draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,false,false)
                                                draw.SimpleText("Erstellung", "RDS.Admin.Configsmall", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                                            end
                                        local text = vgui.Create("DTextEntry", Window)
                                        text:Dock( TOP )
                                        text:DockMargin(10,5,10,0)
                                        text:SetTall(scrh*0.06)
                                        text:SetFont("RDS.Admin.btnply")
                                        text:SetPlaceholderText("Equipment Class")
                                        local close = vgui.Create("DButton", Window)
                                        close:Dock(BOTTOM)
                                        close:DockMargin(20,0,20,10)
                                        close:SetText( "Abbrechen" )
                                        close:SetTextColor( _RDS:Color("WHITE", 255))
                                        close:SetTall(ScrH() * 0.03 )
                                            close.Paint = function(self,w,h)
                                                local clr
                                                if self:IsHovered() then 
                                                    draw.RoundedBoxEx(6,0,0,w,h,Color(255,0,0),true,true,true,true)
                                                end
                                                draw.RoundedBox(6,2,2,w-4,h-4,Color(46,46,46))
                                            end
                                            close.DoClick = function()
                                                Window:Remove()
                                            end
                                        local enter = vgui.Create("DButton", Window)
                                        enter:Dock(BOTTOM)
                                        enter:DockMargin(20,0,20,10)
                                        enter:SetText( "Absenden" )
                                        enter:SetTextColor( _RDS:Color("WHITE", 255))
                                        enter:SetTall(ScrH() * 0.03 )
                                            enter.Paint = function(self,w,h)
                                                    local clr
                                                    if self:IsHovered() then 
                                                        draw.RoundedBoxEx(6,0,0,w,h,Color(0,255,13),true,true,true,true)
                                                    end
                                                    draw.RoundedBox(6,2,2,w-4,h-4,Color(46,46,46))
                                                end
                                                enter.DoClick = function()
                                                    if _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[text:GetText()] then 
                                                        local tbl = {
                                                            [text:GetText()] = true 
                                                        }
                                                        table.Merge(_RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets[k].focus[kf], tbl)
                                                        net.Start("RDSRP.IConfig.Load")
                                                        _RDS.WriteCTable(_RDS.Admin.IConfig)
                                                        net.SendToServer()
                                                        Window:Remove()

                                                        s_e_FocusPanel:Clear()
                                                        timer.Simple(0.1,function()
                                                            focuspi()
                                                        end)     
                                                else
                                                    _RDS:Notify("error", "FEHLER", "Dieses Equipmentpaket gibt es nicht!", 2)
                                                end
                                            end
                                    end
                            end
                            
                        end
                        focuspi()
                    end 
                    s_item.DoClick =  function()
                        s_add:Remove()
                        Page()
                    end
            end

    end

    SpecialisationCFG_()



    --[[
        Equipment Config
    ]]

    local e_TOP = self.EquipmentCFG:Add("DPanel")
    e_TOP:Dock(TOP)
    e_TOP:DockMargin(0,0,0,0)
    e_TOP:SetTall(scrh * 0.07)
        e_TOP.Paint = function(self,w,h)
            draw.RoundedBoxEx(15,0,0,w,h,Color(32,32,32),true,true,false,false)
            draw.SimpleText("Equipment Config ", "RDSRP.30", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        local e_add = e_TOP:Add("DButton")
        e_add:Dock(RIGHT)
        e_add:DockMargin(0,0,0,0)
        e_add:SetFont("RDSRP.30")
        e_add:SetTextColor(_RDS:Color("WHITE", 255))
        e_add:SetText("✚")
            e_add.Paint = function(self,w,h)
                local col = Color(59,59,59)
                draw.RoundedBoxEx(15,0,0,w,h,Color(21,80,21),false,true,false,false)
                if self:IsHovered() then 
                    col = Color(21,80,21)
                else
                    col = Color(46,46,46)
                end
                draw.RoundedBoxEx(15,2,2,w-4,h-4,col,false,true,false,false)
            end

    local e_FILL = self.EquipmentCFG:Add("DScrollPanel")
    e_FILL:Dock(FILL)
    e_FILL:DockMargin(0,0,0,0)
        e_FILL.Paint = function(self,w,h)
            draw.RoundedBoxEx(0,0,0,w,h,Color(46,46,46),false,false,false,false)
        end
    local sbar = e_FILL:GetVBar()
    sbar:SetSize(5,0)
    sbar:SetHideButtons( true )
    function sbar.btnGrip:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(255,0,0),false,false,false,true) end
    function sbar:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),false,false,false,true) end
    function sbar.btnUp:Paint(w, h) return end
    function sbar.btnDown:Paint(w, h) return end

        local function e_Page()
            for k,v in pairs(_RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets) do 
                local e_item = e_FILL:Add("DButton")
                e_item:Dock(TOP)
                e_item:DockMargin(10,6,10,0)
                e_item:SetTall( scrh * 0.1 )
                e_item:SetText("")
                    e_item.Paint = function(self,w,h)
                        local clr = _RDS:Color("WHITE", 255)

                        if self:IsHovered() then 
                            clr = _RDS:Color("PETER RIVER", 255)
                            draw.RoundedBox(5,0,0,w,h,clr) --255,193,7,255
                        end
                        draw.RoundedBox(5,2,2,w-4,h-4,Color(53,52,52))
                        draw.SimpleText(k, "RDS.Admin.btn", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
                    e_item.DoRightClick = function()
                        local Menu = DermaMenu()
                        Menu:AddOption("Delete", function()
                            _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k] = nil
                            e_FILL:Clear()
                            timer.Simple(0.1,function()
                                e_Page()
                            end) 
                        end)
                        Menu:AddOption("Copy", function()
                            SetClipboardText( k )
                        end)
                        Menu:Open()
                    end



                    local function e_Cfg()
                        local e_back = e_TOP:Add("DButton")
                        e_back:Dock(LEFT)
                        e_back:DockMargin(0,0,0,0)
                        e_back:SetFont("RDSRP.30")
                        e_back:SetTextColor(_RDS:Color("WHITE", 255))
                        e_back:SetText("<")
                        e_back.Paint = function(self,w,h)
                                local col = Color(59,59,59)
                                draw.RoundedBoxEx(15,0,0,w,h,Color(64,80,21),true,false,false,false)
                                if self:IsHovered() then 
                                    col = Color(64,80,21)
                                else
                                    col = Color(46,46,46)
                                end
                                draw.RoundedBoxEx(15,2,2,w-4,h-4,col,true,false,false,false)
                            end         

                        local e_edit = e_TOP:Add("DButton")
                        e_edit:Dock(RIGHT)
                        e_edit:DockMargin(0,0,0,0)
                        e_edit:SetFont("RDSRP.30")
                        e_edit:SetTextColor(_RDS:Color("WHITE", 255))
                        e_edit:SetText("")
                        local edit = Material("materials/rdsrp/icon/edit3.png")
                        e_edit.Paint = function(self,w,h)
                                local col = Color(59,59,59)
                                draw.RoundedBoxEx(15,0,0,w,h,Color(241,119,6),false,true,false,false)
                                if self:IsHovered() then 
                                    col = Color(241,119,6)
                                else
                                    col = Color(46,46,46)
                                end
                                draw.RoundedBoxEx(15,2,2,w-4,h-4,col,false,true,false,false)

                                surface.SetDrawColor(Color(255,255,255))
                                surface.SetMaterial(edit)
                                surface.DrawTexturedRect(0,0,w,h)

                            end         
                            e_edit.DoClick = function()
                                local Window = vgui.Create( "RDSRP.BPanel" )
                                Window:SetSize( ScrW() * 0.34, ScrH() * 0.45 )
                                Window:Center()
                                Window:MakePopup()
                             --   Window:DoModal()
                                    Window.Paint = function(self,w,h)
                                        draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
                                        draw.RoundedBox(15,2,2,w-4,h-4,Color(23,22,22,255))
                                    end
                                local top = vgui.Create("DPanel", Window)
                                top:Dock(TOP)
                                top:SetTall(ScrH()*0.05)
                                    top.Paint = function(self,w,h)
                                        draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,false,false)
                                        draw.SimpleText("Erstellung", "RDS.Admin.Configsmall", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                                    end

                                local name = vgui.Create("DTextEntry", Window)
                                name:Dock( TOP )
                                name:DockMargin(10,5,10,0)
                                name:SetTall(scrh*0.06)
                                name:SetFont("RDS.Admin.btnply")
                                name:SetPlaceholderText("name")
                                name:SetText(_RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].categorys.weaponname)

                                local Category = vgui.Create("DTextEntry", Window)
                                Category:Dock( TOP )
                                Category:DockMargin(10,5,10,0)
                                Category:SetTall(scrh*0.06)
                                Category:SetFont("RDS.Admin.btnply")
                                Category:SetPlaceholderText("Category")
                                Category:SetText(_RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].categorys.category)

                                local Section = vgui.Create("DTextEntry", Window)
                                Section:Dock( TOP )
                                Section:DockMargin(10,5,10,0)
                                Section:SetTall(scrh*0.06)
                                Section:SetFont("RDS.Admin.btnply")
                                Section:SetPlaceholderText("Section")
                                Section:SetText(_RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].categorys.section)

                                local Picture = vgui.Create("DTextEntry", Window)
                                Picture:Dock( TOP )
                                Picture:DockMargin(10,5,10,0)
                                Picture:SetTall(scrh*0.06)
                                Picture:SetFont("RDS.Admin.btnply")
                                Picture:SetPlaceholderText("PictureID")
                                Picture:SetText(_RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].picture)

                                local correct = vgui.Create( "RDSRP.Switch", Window ) 
                                correct:Dock( TOP )
                                correct:DockMargin(10,5,10,0)
                                correct:SetText("Is TFA?")
                                correct:SetChecked( _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].isTFA )
                                local corract_c = _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].isTFA
                                correct.OnChange = function(self)
                                        if (self:GetChecked() == true) then 
                                            corract_c = true
                                        else
                                            corract_c = false
                                        end
                                    end
                            
                                local close = vgui.Create("DButton", Window)
                                close:Dock(BOTTOM)
                                close:DockMargin(20,0,20,10)
                                close:SetText( "Abbrechen" )
                                close:SetTextColor( _RDS:Color("WHITE", 255))
                                close:SetTall(ScrH() * 0.03 )
                                    close.Paint = function(self,w,h)
                                        local clr
                                        if self:IsHovered() then 
                                            draw.RoundedBoxEx(6,0,0,w,h,Color(255,0,0),true,true,true,true)
                                        end
                                        draw.RoundedBox(6,2,2,w-4,h-4,Color(46,46,46))
                                    end
                                    close.DoClick = function()
                                        Window:Remove()
                                    end
                                local enter = vgui.Create("DButton", Window)
                                enter:Dock(BOTTOM)
                                enter:DockMargin(20,0,20,10)
                                enter:SetText( "Absenden" )
                                enter:SetTextColor( _RDS:Color("WHITE", 255))
                                enter:SetTall(ScrH() * 0.03 )
                                    enter.Paint = function(self,w,h)
                                            local clr
                                            if self:IsHovered() then 
                                                draw.RoundedBoxEx(6,0,0,w,h,Color(0,255,13),true,true,true,true)
                                            end
                                            draw.RoundedBox(6,2,2,w-4,h-4,Color(46,46,46))
                                        end
                                    enter.DoClick = function()
                                    _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].categorys.weaponname = name:GetText() 
                                    _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].categorys.category = Category:GetText() 
                                    _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].categorys.section = Section:GetText() 
                                    _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].picture = Picture:GetText() 
                                    _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].isTFA = corract_c

                                        net.Start("RDSRP.IConfig.Load")
                                        _RDS.WriteCTable(_RDS.Admin.IConfig)
                                        net.SendToServer()
                                        Window:Remove()
                                        e_back:Remove()
                                        e_edit:Remove()
                                        e_FILL:Clear()
                                        timer.Simple(0.1,function()
                                            e_Cfg()
                                        end)     
                                    end
                            end

                            e_back.DoClick = function()
                                e_add:SetVisible(true)
                                e_FILL:Clear()
                                e_back:Remove()
                                e_edit:Remove()
                                e_Page()
                            end

                            local e_e_I = {
                                {
                                    prefix = "Class: ",
                                    suffix = k,
                                },
                                {
                                    prefix = "Name: ",
                                    suffix = _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].categorys.weaponname,
                                },
                                {
                                    prefix = "Category: ",
                                    suffix = _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].categorys.category,
                                },
                                {
                                    prefix = "Section: ",
                                    suffix = _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].categorys.section,
                                },
                                {
                                    prefix = "TFA: ",
                                    suffix = tostring(_RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].isTFA),
                                },
                            }

                            for pre,suf in pairs(e_e_I) do 
                                local e_e_Info = e_FILL:Add("DLabel")
                                e_e_Info:Dock(TOP)
                                e_e_Info:SetTall(scrh*0.04)
                                e_e_Info:SetText("")
                                    e_e_Info.Paint = function(self,w,h)
                                        draw.SimpleText(suf.prefix .. suf.suffix, "RDSRP.30", 2, self:GetTall()/2, clr, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                                    end
                            end



                     
                    









                    end








                    e_item.DoClick = function()
                        e_add:SetVisible(false)
                        e_FILL:Clear()
                        e_Cfg()
                    end
            end
        end

    e_Page()

        e_add.DoClick = function()
            local Window = vgui.Create( "RDSRP.BPanel" )
            Window:SetSize( ScrW() * 0.34, ScrH() * 0.45 )
            Window:Center()
            Window:MakePopup()
         --   Window:DoModal()
                Window.Paint = function(self,w,h)
                    draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
                    draw.RoundedBox(15,2,2,w-4,h-4,Color(23,22,22,255))
                end
            local top = vgui.Create("DPanel", Window)
            top:Dock(TOP)
            top:SetTall(ScrH()*0.05)
                top.Paint = function(self,w,h)
                    draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,false,false)
                    draw.SimpleText("Erstellung", "RDS.Admin.Configsmall", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            local text = vgui.Create("DTextEntry", Window)
            text:Dock( TOP )
            text:DockMargin(10,5,10,0)
            text:SetTall(scrh*0.06)
            text:SetFont("RDS.Admin.btnply")
            text:SetPlaceholderText("Class Name")

            local name = vgui.Create("DTextEntry", Window)
            name:Dock( TOP )
            name:DockMargin(10,5,10,0)
            name:SetTall(scrh*0.06)
            name:SetFont("RDS.Admin.btnply")
            name:SetPlaceholderText("Name")

            local Category = vgui.Create("DTextEntry", Window)
            Category:Dock( TOP )
            Category:DockMargin(10,5,10,0)
            Category:SetTall(scrh*0.06)
            Category:SetFont("RDS.Admin.btnply")
            Category:SetPlaceholderText("Category")
        
            local Section = vgui.Create("DTextEntry", Window)
            Section:Dock( TOP )
            Section:DockMargin(10,5,10,0)
            Section:SetTall(scrh*0.06)
            Section:SetFont("RDS.Admin.btnply")
            Section:SetPlaceholderText("Section")


            local correct = vgui.Create( "RDSRP.Switch", Window ) 
                correct:Dock( TOP )
                correct:DockMargin(10,5,10,0)
                correct:SetText("Is TFA?")
                correct:SetChecked( false )
                local corract_c = false
                correct.OnChange = function(self)
                        if (self:GetChecked() == true) then 
                            corract_c = true
                        else
                            corract_c = false
                        end
                    end
        
            local close = vgui.Create("DButton", Window)
            close:Dock(BOTTOM)
            close:DockMargin(20,0,20,10)
            close:SetText( "Abbrechen" )
            close:SetTextColor( _RDS:Color("WHITE", 255))
            close:SetTall(ScrH() * 0.03 )
                close.Paint = function(self,w,h)
                    local clr
                    if self:IsHovered() then 
                        draw.RoundedBoxEx(6,0,0,w,h,Color(255,0,0),true,true,true,true)
                    end
                    draw.RoundedBox(6,2,2,w-4,h-4,Color(46,46,46))
                end
                close.DoClick = function()
                    Window:Remove()
                end
            local enter = vgui.Create("DButton", Window)
            enter:Dock(BOTTOM)
            enter:DockMargin(20,0,20,10)
            enter:SetText( "Absenden" )
            enter:SetTextColor( _RDS:Color("WHITE", 255))
            enter:SetTall(ScrH() * 0.03 )
                enter.Paint = function(self,w,h)
                        local clr
                        if self:IsHovered() then 
                            draw.RoundedBoxEx(6,0,0,w,h,Color(0,255,13),true,true,true,true)
                        end
                        draw.RoundedBox(6,2,2,w-4,h-4,Color(46,46,46))
                    end
                enter.DoClick = function()
                    local tbl = {
                        [text:GetText()] = {
                            categorys = {
                                weaponname = name:GetText(),
                                category = Category:GetText(),
                                section = Section:GetText()
                            },
                            picture = "",
                            isTFA = corract_c,
                            informations = nil,
                        }
                    }
                    table.Merge(_RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets, tbl)
                    net.Start("RDSRP.IConfig.Load")
                    _RDS.WriteCTable(_RDS.Admin.IConfig)
                    net.SendToServer()
                    Window:Remove()
                    e_FILL:Clear()
                    timer.Simple(0.1,function()
                        e_Page()
                    end)     
                end
            
        end






















        
















   
            --[[
        Other Config
    ]]

    local o_TOP = self.OtherCFG:Add("DPanel")
    o_TOP:Dock(TOP)
    o_TOP:DockMargin(0,0,0,0)
    o_TOP:SetTall(scrh * 0.07)
        o_TOP.Paint = function(self,w,h)
            draw.RoundedBoxEx(15,0,0,w,h,Color(32,32,32),true,true,false,false)
            draw.SimpleText("Other Config ", "RDSRP.30", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
    local o_FILL = self.OtherCFG:Add("DScrollPanel")
    o_FILL:Dock(FILL)
    o_FILL:DockMargin(0,0,0,0)
        o_FILL.Paint = function(self,w,h)
            draw.RoundedBoxEx(0,0,0,w,h,Color(46,46,46),false,false,false,false)
        end
        

    local MaxPrimaryPanel =  o_FILL:Add("DPanel")
    MaxPrimaryPanel:Dock(TOP)
    MaxPrimaryPanel:DockMargin(5,5,5,0)
    MaxPrimaryPanel:SetTall(scrw*0.05)
    MaxPrimaryPanel.Paint = nil
    local MaxPrimaryValue = vgui.Create("DNumberWang", MaxPrimaryPanel)
    MaxPrimaryValue:Dock(LEFT)
    MaxPrimaryValue:DockMargin(5,20,0,20)
    MaxPrimaryValue:SetWide(ScrW()*0.05)
    MaxPrimaryValue:SetValue( _RDS.Admin.IConfig["Specialisation"].Equipmentsettings.MaxPrimary)
    MaxPrimaryValue:SetMin(0)
    MaxPrimaryValue:SetMax(10)
    MaxPrimaryValue:SetPlaceholderText("Number")
    MaxPrimaryValue:SetFont("RDSRP.40")
        MaxPrimaryValue.OnEnter = function( self )
            _RDS.Admin.IConfig["Specialisation"].Equipmentsettings.MaxPrimary = tonumber(self:GetValue())
            net.Start("RDSRP.IConfig.Load")
            _RDS.WriteCTable(_RDS.Admin.IConfig)
            net.SendToServer()
        end
    local MaxPrimaryText = vgui.Create("DLabel", MaxPrimaryPanel)
    MaxPrimaryText:Dock(LEFT)
    MaxPrimaryText:DockMargin(15,0,0,0)
    MaxPrimaryText:SetWide(ScrW()*0.3)
    MaxPrimaryText:SetText("")
        MaxPrimaryText.Paint = function(self,w,h)
            draw.SimpleText("Max. Primaryslots", "RDSRP.40", 0, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
        end
    local MaxSeconaryPanel =  o_FILL:Add("DPanel")
    MaxSeconaryPanel:Dock(TOP)
    MaxSeconaryPanel:DockMargin(5,5,5,0)
    MaxSeconaryPanel:SetTall(scrw*0.05)
    MaxSeconaryPanel.Paint = nil
    local MaxSecondaryValue = vgui.Create("DNumberWang", MaxSeconaryPanel)
    MaxSecondaryValue:Dock(LEFT)
    MaxSecondaryValue:DockMargin(5,20,0,20)
    MaxSecondaryValue:SetWide(ScrW()*0.05)
    MaxSecondaryValue:SetValue(_RDS.Admin.IConfig["Specialisation"].Equipmentsettings.MaxSecondary)
    MaxSecondaryValue:SetMin(0)
    MaxSecondaryValue:SetMax(10)
    MaxSecondaryValue:SetPlaceholderText("Number")
    MaxSecondaryValue:SetFont("RDSRP.40")
    MaxSecondaryValue.OnEnter = function( self )
            _RDS.Admin.IConfig["Specialisation"].Equipmentsettings.MaxSecondary = tonumber(self:GetValue())
            net.Start("RDSRP.IConfig.Load")
            _RDS.WriteCTable(_RDS.Admin.IConfig)
            net.SendToServer()
        end
    local MaxPSecondaryText = vgui.Create("DLabel", MaxSeconaryPanel)
    MaxPSecondaryText:Dock(LEFT)
    MaxPSecondaryText:DockMargin(15,0,0,0)
    MaxPSecondaryText:SetWide(ScrW()*0.3)
    MaxPSecondaryText:SetText("")
    MaxPSecondaryText.Paint = function(self,w,h)
            draw.SimpleText("Max. Secondaryslots", "RDSRP.40", 0, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
        end
    local MaxSidearmPanel = o_FILL:Add("DPanel")
    MaxSidearmPanel:Dock(TOP)
    MaxSidearmPanel:DockMargin(5,5,5,0)
    MaxSidearmPanel:SetTall(scrw*0.05)
    MaxSidearmPanel.Paint = nil
    local MaxSidearmValue = vgui.Create("DNumberWang", MaxSidearmPanel)
    MaxSidearmValue:Dock(LEFT)
    MaxSidearmValue:DockMargin(5,20,0,20)
    MaxSidearmValue:SetWide(ScrW()*0.05)
    MaxSidearmValue:SetValue(_RDS.Admin.IConfig["Specialisation"].Equipmentsettings.MaxSideArm)
    MaxSidearmValue:SetMin(0)
    MaxSidearmValue:SetMax(10)
    MaxSidearmValue:SetPlaceholderText("Number")
    MaxSidearmValue:SetFont("RDSRP.40")
    MaxSidearmValue.OnEnter = function( self )
            _RDS.Admin.IConfig["Specialisation"].Equipmentsettings.MaxSideArm = tonumber(self:GetValue())
            net.Start("RDSRP.IConfig.Load")
            _RDS.WriteCTable(_RDS.Admin.IConfig)
            net.SendToServer()
        end
    local MaxSidearmText = vgui.Create("DLabel", MaxSidearmPanel)
    MaxSidearmText:Dock(LEFT)
    MaxSidearmText:DockMargin(15,0,0,0)
    MaxSidearmText:SetWide(ScrW()*0.3)
    MaxSidearmText:SetText("")
    MaxSidearmText.Paint = function(self,w,h)
            draw.SimpleText("Max. Sidearmslots", "RDSRP.40", 0, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
        end
    local MaxGadetPanel =  o_FILL:Add("DPanel")
    MaxGadetPanel:Dock(TOP)
    MaxGadetPanel:DockMargin(5,5,5,0)
    MaxGadetPanel:SetTall(scrw*0.05)
    MaxGadetPanel.Paint = nil
    local MaxGadetValue = vgui.Create("DNumberWang", MaxGadetPanel)
    MaxGadetValue:Dock(LEFT)
    MaxGadetValue:DockMargin(5,20,0,20)
    MaxGadetValue:SetWide(ScrW()*0.05)
    MaxGadetValue:SetValue(_RDS.Admin.IConfig["Specialisation"].Equipmentsettings.MaxGadgets)
    MaxGadetValue:SetMin(0)
    MaxGadetValue:SetMax(10)
    MaxGadetValue:SetPlaceholderText("Number")
    MaxGadetValue:SetFont("RDSRP.40")
    MaxGadetValue.OnEnter = function( self )
            _RDS.Admin.IConfig["Specialisation"].Equipmentsettings.MaxGadgets = tonumber(self:GetValue())
            net.Start("RDSRP.IConfig.Load")
            _RDS.WriteCTable(_RDS.Admin.IConfig)
            net.SendToServer()
        end
    local MaxGadetText = vgui.Create("DLabel", MaxGadetPanel)
    MaxGadetText:Dock(LEFT)
    MaxGadetText:DockMargin(15,0,0,0)
    MaxGadetText:SetWide(ScrW()*0.3)
    MaxGadetText:SetText("")
    MaxGadetText.Paint = function(self,w,h)
            draw.SimpleText("Max. Gadgetslots", "RDSRP.40", 0, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
        end


--[[
    Whitlist
]]


local w_TOP = self.WhitelistCFG:Add("DPanel")
w_TOP:Dock(TOP)
w_TOP:DockMargin(0,0,0,0)
w_TOP:SetTall(scrh * 0.07)
    w_TOP.Paint = function(self,w,h)
        draw.RoundedBoxEx(15,0,0,w,h,Color(32,32,32),true,true,false,false)
        draw.SimpleText("Whitelist Manager", "RDSRP.30", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
    end
local w_FILL = self.WhitelistCFG:Add("DScrollPanel")
w_FILL:Dock(FILL)
w_FILL:DockMargin(0,0,0,0)
    w_FILL.Paint = function(self,w,h)
        draw.RoundedBoxEx(0,0,0,w,h,Color(46,46,46),false,false,false,false)
    end

    local w_add = w_TOP:Add("DButton")
        w_add:Dock(RIGHT)
        w_add:DockMargin(0,0,0,0)
        w_add:SetFont("RDSRP.30")
        w_add:SetTextColor(_RDS:Color("WHITE", 255))
        w_add:SetText("✚")
            w_add.Paint = function(self,w,h)
                local col = Color(59,59,59)
                draw.RoundedBoxEx(15,0,0,w,h,Color(21,80,21),false,true,false,false)
                if self:IsHovered() then 
                    col = Color(21,80,21)
                else
                    col = Color(46,46,46)
                end
                draw.RoundedBoxEx(15,2,2,w-4,h-4,col,false,true,false,false)
            end
            local mati = Material("materials/rdsrp/icon/reload.png")
        local w_refresh = w_TOP:Add("DButton")
        w_refresh:Dock(RIGHT)
        w_refresh:DockMargin(0,0,5,0)
        w_refresh:SetFont("RDSRP.30")
        w_refresh:SetTextColor(_RDS:Color("WHITE", 255))
        w_refresh:SetText("")
            w_refresh.Paint = function(self,w,h)
                local col = Color(59,59,59)
                draw.RoundedBoxEx(15,0,0,w,h,Color(31,121,182),false,false,false,false)
                if self:IsHovered() then 
                    col = Color(31,121,182)
                else
                    col = Color(46,46,46)
                end
                draw.RoundedBoxEx(15,2,2,w-4,h-4,col,false ,false,false,false)

                surface.SetDrawColor(_RDS:Color("WHITE", 255))
                surface.SetMaterial(mati)
                surface.DrawTexturedRect(scrw*0.008,scrh*0.02,self:GetWide()/2,self:GetTall()/2)
            end
            w_refresh.DoClick = function()
                for k,v in pairs(_RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets) do
                    for k_K, v_V in pairs(_RDS.Admin.IConfig["Specialisation"].Whitelistmanager) do
                        for kKe, vVe in pairs(_RDS.Admin.IConfig["Specialisation"].Whitelistmanager[k_K]) do
                            --print(_RDS.Admin.IConfig["Specialisation"].Whitelistmanager[k_K][k])
                            local tbl = {
                                [k] = _RDS.Admin.IConfig["Specialisation"].Whitelistmanager[k_K][k] or false
                            }
                            table.Merge(_RDS.Admin.IConfig["Specialisation"].Whitelistmanager[k_K], tbl)
                            net.Start("RDSRP.IConfig.Load")
                            _RDS.WriteCTable(_RDS.Admin.IConfig)
                            net.SendToServer()
                        end
                    end
                end
            end

        local function Whitelistmanager()
            for k,v in pairs(_RDS.Admin.IConfig["Specialisation"].Whitelistmanager) do    
                local w_item = w_FILL:Add("DButton")
                w_item:Dock(TOP)
                w_item:DockMargin(10,6,10,0)
                w_item:SetTall( scrh * 0.1 )
                w_item:SetText("")
                w_item.Paint = function(self,w,h)
                        local clr = _RDS:Color("WHITE", 255)

                        if self:IsHovered() then 
                            clr = _RDS:Color("PETER RIVER", 255)
                            draw.RoundedBox(5,0,0,w,h,clr) --255,193,7,255
                        end
                        draw.RoundedBox(5,2,2,w-4,h-4,Color(53,52,52))
                        draw.SimpleText(k, "RDS.Admin.btn", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
                    w_item.DoRightClick = function()
                        local Menu = DermaMenu()
                        Menu:AddOption("Delete", function()
                            _RDS.Admin.IConfig["Specialisation"].Whitelistmanager[k] = nil
                            w_FILL:Clear()
                            timer.Simple(0.1,function()
                                Whitelistmanager()
                            end) 
                        end)
                        Menu:Open()
                    end


                    w_item.DoClick = function()
                        w_FILL:Clear()
                        w_add:SetVisible(false)
                        w_refresh:SetVisible(false)

                        local w_back = w_TOP:Add("DButton")
                        w_back:Dock(LEFT)
                        w_back:DockMargin(0,0,0,0)
                        w_back:SetFont("RDSRP.30")
                        w_back:SetTextColor(_RDS:Color("WHITE", 255))
                        w_back:SetText("<")
                        w_back.Paint = function(self,w,h)
                                local col = Color(59,59,59)
                                draw.RoundedBoxEx(15,0,0,w,h,Color(64,80,21),true,false,false,false)
                                if self:IsHovered() then 
                                    col = Color(64,80,21)
                                else
                                    col = Color(46,46,46)
                                end
                                draw.RoundedBoxEx(15,2,2,w-4,h-4,col,true,false,false,false)
                            end  
                            w_back.DoClick = function()
                                w_FILL:Clear()
                                w_add:SetVisible(true)
                                w_refresh:SetVisible(true)
                                w_back:Remove()
                                Whitelistmanager()
                            end    
                            
                            
                            local function w_CFG()
                                local w_c_Info = w_FILL:Add("DLabel")
                                w_c_Info:Dock(TOP)
                                w_c_Info:SetTall(scrh*0.04)
                                w_c_Info:SetText("")
                                    w_c_Info.Paint = function(self,w,h)
                                        draw.SimpleText(k, "RDSRP.30", 2, self:GetTall()/2, clr, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                                    end

                                for kk,vv in pairs(_RDS.Admin.IConfig["Specialisation"].Whitelistmanager[k]) do  
                                    local correct = vgui.Create( "RDSRP.Switch", w_FILL ) 
                                    correct:Dock( TOP )
                                    correct:DockMargin(5,8,0,0)
                                    correct:SetText(kk)
                                    correct:SetChecked(vv)
                                    correct.OnChange = function(self)
                                        if (self:GetChecked() == true) then 
                                            _RDS.Admin.IConfig["Specialisation"].Whitelistmanager[k][kk] = true
                                        else
                                            _RDS.Admin.IConfig["Specialisation"].Whitelistmanager[k][kk] = false
                                        end
                                        net.Start("RDSRP.IConfig.Load")
                                        _RDS.WriteCTable(_RDS.Admin.IConfig)
                                        net.SendToServer()
                                    end
                                end
                            end


                                w_CFG()

















                    end
            end
        end
        Whitelistmanager()


        w_add.DoClick = function()
            local Window = vgui.Create( "RDSRP.BPanel" )
            Window:SetSize( ScrW() * 0.34, ScrH() * 0.45 )
            Window:Center()
            Window:MakePopup()
         --   Window:DoModal()
                Window.Paint = function(self,w,h)
                    draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
                    draw.RoundedBox(15,2,2,w-4,h-4,Color(23,22,22,255))
                end
            local top = vgui.Create("DPanel", Window)
            top:Dock(TOP)
            top:SetTall(ScrH()*0.05)
                top.Paint = function(self,w,h)
                    draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,false,false)
                    draw.SimpleText("Erstellung", "RDS.Admin.Configsmall", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            local text = vgui.Create("DTextEntry", Window)
            text:Dock( TOP )
            text:DockMargin(10,5,10,0)
            text:SetTall(scrh*0.06)
            text:SetFont("RDS.Admin.btnply")
            text:SetPlaceholderText("TeamName")

            local Category = vgui.Create("DScrollPanel", Window)
            Category:Dock( TOP )
            Category:DockMargin(10,5,10,0)
            Category:SetTall(scrh*0.1)

            local tbl = {}
            for k,v in pairs(_RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets) do  
            local transe = { [k] = false }
            tbl = transe 

                local correct = vgui.Create( "RDSRP.Switch", Category ) 
                correct:Dock( TOP )
                correct:DockMargin(0,5,0,0)
                correct:SetText(k)
                correct:SetChecked( tbl[k] )
                correct.OnChange = function(self)
                    if (self:GetChecked() == true) then 
                        tbl[k] = true
                    else
                        tbl[k] = false
                    end
                end
            end

            local close = vgui.Create("DButton", Window)
            close:Dock(BOTTOM)
            close:DockMargin(20,0,20,10)
            close:SetText( "Abbrechen" )
            close:SetTextColor( _RDS:Color("WHITE", 255))
            close:SetTall(ScrH() * 0.03 )
                close.Paint = function(self,w,h)
                    local clr
                    if self:IsHovered() then 
                        draw.RoundedBoxEx(6,0,0,w,h,Color(255,0,0),true,true,true,true)
                    end
                    draw.RoundedBox(6,2,2,w-4,h-4,Color(46,46,46))
                end
                close.DoClick = function()
                    Window:Remove()
                end
            local enter = vgui.Create("DButton", Window)
            enter:Dock(BOTTOM)
            enter:DockMargin(20,0,20,10)
            enter:SetText( "Absenden" )
            enter:SetTextColor( _RDS:Color("WHITE", 255))
            enter:SetTall(ScrH() * 0.03 )
                enter.Paint = function(self,w,h)
                        local clr
                        if self:IsHovered() then 
                            draw.RoundedBoxEx(6,0,0,w,h,Color(0,255,13),true,true,true,true)
                        end
                        draw.RoundedBox(6,2,2,w-4,h-4,Color(46,46,46))
                    end
                enter.DoClick = function()
                    local stbl = {
                        [text:GetText()] = tbl
                    }
                    PrintTable(stbl)

                    if _RDS.Admin.IConfig["Specialisation"].Whitelistmanager == nil then
                        _RDS.Admin.IConfig["Specialisation"].Whitelistmanager = stbl           
                    else
                        table.Merge(_RDS.Admin.IConfig["Specialisation"].Whitelistmanager, stbl)
                    end
                        net.Start("RDSRP.IConfig.Load")
                        _RDS.WriteCTable(_RDS.Admin.IConfig)
                        net.SendToServer()
                    Window:Remove() 
                    w_FILL:Clear()
                    timer.Simple(0.1,function()
                        Whitelistmanager()
                    end)     
                end
        end
end
