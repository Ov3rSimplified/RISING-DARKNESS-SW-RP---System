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
//** [[   Specialisation/equipment | cl_menu.lua   ]]** \\

_RDS.Specialisation.Equipment.UI = {}
local UI = _RDS.Specialisation.Equipment.UI
LocalPlayer().MaxPrimary = 0
LocalPlayer().MaxSecondary = 0
LocalPlayer().MaxSideArm = 0
LocalPlayer().MaxGadgets = 0

function UI:Startup(tablee)
    self.PlyInfo = tablee
    local ID = tonumber(self.PlyInfo.ID)
    local bg = Material("materials/rdsrp/pictures/imperialbg.jpg")

    local scrw,scrh = ScrW(),ScrH()
    self.Panel = vgui.Create("RDSRP.BPanel")
    self.Panel:SetSize(scrw,scrh)
    self.Panel:Center()
    self.Panel:MakePopup()
        self.Panel.Paint = function(self,w,h)
            surface.SetDrawColor(_RDS:Color("WHITE", 255))
            surface.SetMaterial(bg)
            surface.DrawTexturedRect(0,0,w,h)
        end

    local closepanel = vgui.Create("DPanel", self.Panel)
    closepanel:SetSize(scrw*0.17,scrh*0.08)
    closepanel:SetPos(scrw*0.83,scrh*0.0)
    closepanel.Paint = nil 

        local close = vgui.Create("DButton", closepanel)
        close:Dock(RIGHT)
        close:SetWide(scrw*0.03)
        close:SetText("✖")
        close:SetFont("RDSRP.30")

            close.DoClick = function()
                self.Panel:Remove()
            end

        local closepanelsign = vgui.Create("DLabel", closepanel)
        closepanelsign:Dock(FILL)
        closepanelsign:SetVisible(false)
            closepanelsign.Paint = function(self,w,h)
                surface.SetDrawColor(_RDS:Color("WHITE", 255))
                surface.DrawOutlinedRect(0,0,w,h,2)
            end


        close.Paint = function(self,w,h)
            surface.SetDrawColor(_RDS:Color("WHITE", 255))
            surface.DrawOutlinedRect(0,0,w,h,2)
            
            if self:IsHovered() then  
                closepanelsign:SetVisible(true)
            else
                closepanelsign:SetVisible(false)
            end
        end

    local mat = Material("materials/rdsrp/mat/sideline.png")

    local SidePanel = self.Panel:Add("DLabel")
    SidePanel:Dock(LEFT)
    SidePanel:SetWide(scrw * 0.1)
    SidePanel:SetText("")
    SidePanel.Paint = function(self,w,h)
            surface.SetDrawColor(_RDS:Color("WHITE", 255))
            surface.SetMaterial(mat)
            surface.DrawTexturedRect(0,0,w,h)
        end 

        local SUBte = self.Panel:Add("DPanel")
        SUBte:SetPos(scrw*0.1,scrh*0.05)
        SUBte:SetSize(scrw*0.3,scrh*0.1)
            SUBte.Paint = nil
            local top = SUBte:Add("DLabel")
            top:Dock(TOP)
            top:SetText("Ausrüstung")
            top:SetFont("RDSRP.ESC.Button")
            top:SetTall(SUBte:GetTall()/2)
            top:SetTextColor(_RDS:Color("WHITE",255))
            local top2 = SUBte:Add("DLabel")
            top2:Dock(TOP)
            top2:SetText("Ausruestung")
            top2:SetFont("RDSRP.ESC.Aurebesh")
            top2:SetTall(SUBte:GetTall()/2)
            top2:SetTextColor(Color(117,117,117))

    --[[
        Selection
    ]]  

    self.SelectPanel = vgui.Create("DPanel", self.Panel)
    self.SelectPanel:Dock(LEFT)
    self.SelectPanel:DockMargin(0,scrh*0.27,0,0)
    self.SelectPanel:SetWide(scrw*0.3)
        self.SelectPanel.Paint = nil 
        
        local oopen = cookie.GetString( "RDSRP.WPXCdf22dxddvt90dk" ) or false  

        local Weapon_Search = self.SelectPanel:Add("DPanel")
        Weapon_Search:Dock(TOP)
        Weapon_Search:SetTall(scrh*0.04)
        Weapon_Search:SetWide(self.SelectPanel:GetWide())
        Weapon_Search.Paint = nil

        local Weapon_Searchp = Weapon_Search:Add("DPanel")
        Weapon_Searchp:Dock(LEFT)
        Weapon_Searchp:DockMargin(8,0,0,0)
        Weapon_Searchp:SetTall(scrh*0.04)
        Weapon_Searchp:SetWide(Weapon_Search:GetWide())

        local items = {}
        self.Search = vgui.Create("DTextEntry", Weapon_Searchp)
        self.Search:Dock(FILL)
        self.Search:SetFont("RDSRP.25")
         --   self.Search.Paint = function(self,w,h)
                --surface.SetDrawColor(_RDS:Color("WHITE", 255))
              --  surface.DrawOutlinedRect(0,0,w,h,2)
         -- 	   end

        function self.Search:OnChange()
            local search_text = self:GetText():lower()
            if (#search_text == 0) then
                for _,v in pairs(items) do
                --	v.Button:SetVisible(true)
                    v.Button:SetTall(scrh*0.13)
                end
            else
                for _,v in pairs(items) do
                    if (v.Button:GetText():lower():find(search_text,1,true)) then
                        --v.Button:SetVisible(true)
                        v.Button:SetTall(scrh*0.13)
                    else
                    --	v.Button:SetVisible(false)
                        v.Button:SetTall(0)
                    end
                end
            end
        end

            local WS_Openbutton = Weapon_Searchp:Add("DButton")
            WS_Openbutton:Dock(RIGHT)
            WS_Openbutton:SetWide(scrw*0.01)

            WS_Openbutton.DoClick = function()
                if oopen then
                    oopen = false
                    cookie.Set( "RDSRP.WPXCdf22dxddvt90dk", false )
                else
                    oopen = true
                    cookie.Set( "RDSRP.WPXCdf22dxddvt90dk", true )
                end
                if oopen then 
                    Weapon_Searchp:SetWide(19)
                else
                    Weapon_Searchp:SetWide(self.SelectPanel:GetWide() - 8)
                end
            end

            if oopen then 
                Weapon_Searchp:SetWide(10)
            else
                Weapon_Searchp:SetWide(self.SelectPanel:GetWide()- 8)
            end

        local SelectScroll = self.SelectPanel:Add("DScrollPanel")
        SelectScroll:Dock(FILL)

        local sbar = SelectScroll:GetVBar()
        sbar:SetSize(2,0)
        sbar:SetHideButtons( true )
        function sbar.btnGrip:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(255,255,255),false,false,false,true) end
        function sbar:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),false,false,false,true) end
        function sbar.btnUp:Paint(w, h) return end
        function sbar.btnDown:Paint(w, h) return end

  --  self.GetPanel = vgui.Create("DPanel", self.Panel)
  --  self.GetPanel:Dock(RIGHT)
   -- self.GetPanel:DockMargin(0,scrh*0.27,0,0)
   -- self.GetPanel:SetWide(scrw*0.4)
   --     self.GetPanel.Paint = function(self,w,h)
    --        surface.SetDrawColor(_RDS:Color("WHITE", 255))
     --      surface.DrawOutlinedRect(0,0,w,h,2)
       -- end
     --   local GetTop = self.GetPanel:Add("DLabel")
   --     GetTop:Dock(TOP)
    --    GetTop:SetTall(scrh*0.06)
   --     GetTop:SetText("")
    --    GetTop.Paint = function(self,w,h)
    --            surface.SetDrawColor(_RDS:Color("WHITE", 255))
     --           surface.DrawOutlinedRect(0,0,w,h,2)
     --           draw.SimpleText("Hat", "RDSRP.30", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
     --       end
     --   local GetScroll = self.GetPanel:Add("DScrollPanel")
     --   GetScroll:Dock(FILL)


        local getBottom = self.SelectPanel:Add("DLabel")
        getBottom:Dock(BOTTOM)
        getBottom:SetTall(scrh*0.06)
        getBottom:SetText("")
            getBottom.Paint = function(self,w,h)
                draw.SimpleText("PRI: [" .. LocalPlayer().MaxPrimary .. "/" .. _RDS.Admin.IConfig["Specialisation"].Equipmentsettings.MaxPrimary .. "] SEC: [" .. LocalPlayer().MaxSecondary .. "/" .. _RDS.Admin.IConfig["Specialisation"].Equipmentsettings.MaxSecondary .. "] SA: [" .. LocalPlayer().MaxSideArm .. "/" .. _RDS.Admin.IConfig["Specialisation"].Equipmentsettings.MaxSideArm .. "] GA: [" .. LocalPlayer().MaxGadgets .. "/" .. _RDS.Admin.IConfig["Specialisation"].Equipmentsettings.MaxGadgets .. "]", "RDSRP.30", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end

        self.InfoPanel = vgui.Create("DPanel", self.Panel)
        self.InfoPanel:Dock(RIGHT)
        self.InfoPanel:DockMargin(1,scrh*0.27,10,10)
        self.InfoPanel:SetWide(scrw*0.58)
        self.InfoPanel.Paint = nil

        --[[
            Check access
        ]]
        
        function UI:CheckAccess()
            local Basetbl = _RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets                
                for k,v in pairs(Basetbl) do
                    if Basetbl[k].whitelist[ID] == nil then 
                        print("jee")
                        continue  
                    else
                        for not_K,not_V in pairs(Basetbl[k].focus) do
                            for notfoc_K,notfoc_V in pairs(Basetbl[k].focus[not_K]) do
                                if _RDS.Specialisation.Equipment.PlyHave[notfoc_K] == nil then 
                                    continue 
                                else
                                    print("PanPeter")
                                end
                            end
                        end

                        for fK, fV in pairs( Basetbl[k].whitelist[ID].what ) do    
                            if not Basetbl[k].whitelist[ID].what[fK] then 
                                for wK, wV in pairs(Basetbl[k].focus[fK]) do   
                                    _RDS:DebugPrint( Color(255,255,255), "No Focus " .. wK  .. "\n" )  

                                    _RDS.Specialisation.Equipment.PlyHave[wK] = nil
                                    net.Start("RDSRP.Specialisation.AddWeaponToSQL")
                                    net.WriteTable(_RDS.Specialisation.Equipment.PlyHave)
                                    net.SendToServer()

                                    net.Start("RDSRP.Specialisation.Depositweapon")
                                    net.WriteString(tostring(wK))
                                    net.SendToServer()
                                end
                            end
                        end

                        for LLwK, LLwV in pairs(Basetbl[k].focus) do
                            for wLLk, wLLv in pairs(Basetbl[k].focus[LLwK]) do
                                if _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[wLLk] == nil then 
                                    _RDS.Specialisation.Equipment.PlyHave[wLLk] = nil
                                    net.Start("RDSRP.Specialisation.AddWeaponToSQL")
                                    net.WriteTable(_RDS.Specialisation.Equipment.PlyHave)
                                    net.SendToServer()
                                    

                                    Basetbl[k].focus[LLwK][wLLk] = nil 
                                    net.Start("RDSRP.IConfig.Load")
                                    _RDS.WriteCTable(_RDS.Admin.IConfig)
                                    net.SendToServer()
                                end
                            end
                        end


                        if not Basetbl[k].whitelist[ID].access then 
                            for ffK, ffV in pairs( Basetbl[k].whitelist[ID].what ) do    
                                for FoK, FoV in pairs( Basetbl[k].focus[ffK] ) do   
                                    _RDS:DebugPrint( Color(255,255,255), "no Access " .. FoK .. "\n" )  

                                    _RDS.Specialisation.Equipment.PlyHave[FoK] = nil
                                    net.Start("RDSRP.Specialisation.AddWeaponToSQL")
                                    net.WriteTable(_RDS.Specialisation.Equipment.PlyHave)
                                    net.SendToServer()

                                    net.Start("RDSRP.Specialisation.Depositweapon")
                                    net.WriteString(tostring(FoK))
                                    net.SendToServer()
                                end
                            end
                        end
                    end
                end
        end
        function UI:CheckMax()
            LocalPlayer().MaxPrimary = 0
            LocalPlayer().MaxSecondary = 0
            LocalPlayer().MaxSideArm = 0
            LocalPlayer().MaxGadgets = 0
            local Rasetbl = _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets
            for k,v in pairs(_RDS.Specialisation.Equipment.PlyHave) do     
                if Rasetbl[k].categorys.section == "Primary" then 
                    LocalPlayer().MaxPrimary = LocalPlayer().MaxPrimary + 1
                elseif Rasetbl[k].categorys.section == "Secondary" then 
                    LocalPlayer().MaxSecondary = LocalPlayer().MaxSecondary + 1
                elseif Rasetbl[k].categorys.section == "Sidearm" then 
                    LocalPlayer().MaxSideArm = LocalPlayer().MaxSideArm + 1
                elseif Rasetbl[k].categorys.section == "Gadget" then
                    LocalPlayer().MaxGadgets = LocalPlayer().MaxGadgets + 1
                end
            end
        end

    --[[
        Function to Check
    ]]
        UI:CheckAccess()
        UI:CheckMax()


        print(LocalPlayer().MaxPrimary)
        print(LocalPlayer().MaxSecondary) 
        print(LocalPlayer().MaxSideArm)
        print(LocalPlayer().MaxGadgets)

        function UI:GetItems()
            net.Start("RDSRP.Specialisation.GetWeaponFromSQL")
            net.SendToServer()

            timer.Simple(0.01,function()
            
                if table.IsEmpty(_RDS.Specialisation.Equipment.PlyHave) then 
                    local pnl = GetScroll:Add("DButton")
                    pnl:Dock(TOP)
                    pnl:DockMargin(10,5,10,5)
                    pnl:SetTall(scrh*0.07)
                    pnl:SetText("")
                        pnl.Paint  = function(self,w,h)
                            draw.RoundedBox(5,2,2,w-4,h-4,_RDS:Color("BLACK",130))
                            surface.SetDrawColor( _RDS:Color("WHITE", 255) )
                            surface.DrawOutlinedRect(0,0,w,h,2)
                            draw.SimpleText("Kein Equipment ausgewählt!", "RDSRP.40", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                        end
                else
                    for k,v in pairs(_RDS.Specialisation.Equipment.PlyHave) do 
                        local pnl = GetScroll:Add("DButton")
                        pnl:Dock(TOP)
                        pnl:DockMargin(10,5,10,5)
                        pnl:SetTall(scrh*0.07)
                        pnl:SetText("")
                            pnl.Paint  = function(self,w,h)
                                draw.RoundedBox(5,2,2,w-4,h-4,_RDS:Color("BLACK",130))
                                surface.SetDrawColor( _RDS:Color("WHITE", 255) )
                                surface.DrawOutlinedRect(0,0,w,h,2)
                                draw.SimpleText(k, "RDSRP.40", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                            end   
                            pnl.DoRightClick = function()
                                _RDS.Specialisation.Equipment.PlyHave[k] = nil
                                net.Start("RDSRP.Specialisation.AddWeaponToSQL")
                                net.WriteTable(_RDS.Specialisation.Equipment.PlyHave)
                                net.SendToServer()

                                if _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].categorys.section == "Primary" then 
                                    LocalPlayer().MaxPrimary = LocalPlayer().MaxPrimary - 1
                                    _RDS:Notify("success", "Erfolgreich!", "Du hast Erfolgreich die Waffe " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].categorys.weaponname .. " hereingelegt!", 2)
                                elseif _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].categorys.section == "Secondary" then 
                                    LocalPlayer().MaxSecondary = LocalPlayer().MaxSecondary - 1
                                    _RDS:Notify("success", "Erfolgreich!", "Du hast Erfolgreich die Waffe " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].categorys.weaponname .. " hereingelegt!", 2)
                                elseif _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].categorys.section == "Sidearm" then 
                                    LocalPlayer().MaxSideArm = LocalPlayer().MaxSideArm - 1
                                    _RDS:Notify("success", "Erfolgreich!", "Du hast Erfolgreich die Waffe " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].categorys.weaponname .. " hereingelegt!", 2)
                                elseif _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].categorys.section == "Gadget" then
                                    LocalPlayer().MaxGadgets = LocalPlayer().MaxGadgets - 1
                                    _RDS:Notify("success", "Erfolgreich!", "Du hast Erfolgreich das Gadget " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[k].categorys.weaponname .. " hereingelegt!", 2)
                                end

                                net.Start("RDSRP.Specialisation.Depositweapon")
                                net.WriteString(tostring(k))
                                net.SendToServer()

                                GetScroll:Clear()
                                SelectScroll:Clear()
                                timer.Simple(0.1,function()
                                    UI:GetItems()
                                    UI:SelectableItems()
                                end)
                            end
                    end
                end
            end)
        end

        function UI:SelectableItems()
            net.Start("RDSRP.Specialisation.GetWeaponFromSQL")
            net.SendToServer()

            timer.Simple(0.01,function()
            
                local Basetbl = _RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets
                for k,v in pairs(Basetbl) do  
                    if Basetbl[k].whitelist[ID] == nil then continue end  
                    if Basetbl[k].whitelist[ID].access then do end else continue end
                    for focusK, focusV in pairs(Basetbl[k].focus) do  
                    if Basetbl[k].whitelist[ID].what[focusK] then do end else continue end
                    for tofocusK, tofocusV in pairs(Basetbl[k].focus[focusK]) do   
                       -- if _RDS.Specialisation.Equipment.PlyHave[tofocusK] then continue end
                        local sheet = {}

                            sheet.Button = SelectScroll:Add("DButton")
                            sheet.Button:Dock(TOP)
                            sheet.Button:DockMargin(10,5,10,5)
                            sheet.Button:SetTall(scrh*0.13)
                            sheet.Button:SetTextColor(Color(255, 0, 0, 0.5))
                            sheet.Button:SetText(tostring(_RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.weaponname))
                            table.insert( items, sheet )

                            local open = true 
                                sheet.Button.Paint = function(self,w,h)
                                    draw.RoundedBox(5,2,2,w-4,h-4,_RDS:Color("BLACK",130))

                                    local hovcol = _RDS:Color("WHITE", 130)
                                    if self:IsHovered() then 
                                        draw.RoundedBox(5,2,2,w-4,h-4,_RDS:Color("WHITE",10))
                                    end
                                    surface.SetDrawColor( _RDS:Color("WHITE", 130) )
                                    surface.DrawOutlinedRect(0,0,w,h,3)
                                    draw.SimpleText(tostring(_RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.weaponname), "RDSRP.bsys.bindtitle", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                                    local cala = Color(255,255,255)
                                    local pos = 0.25

                                    if _RDS.Specialisation.Equipment.PlyHave[tofocusK] then 
                                        cala = Color(9,255,0)
                                    end
                                        draw.RoundedBox(100,scrw*pos,scrh*0.01,scrw*0.015,scrh*0.03,cala)
                                end

                                --[[ 
                                    Cringus allabimbus
                                ]]

                                local function Informationaboutarmor(Table)
                                    --[[
                                        {
                                            Kind = "",
                                            
                                        }
                                    ]]
                                    self.InfoPanel:Clear()
                    
                                    if Table.Kind == "TFA.Weapon" then 
                                        local wep = weapons.Get(tofocusK)
                                        local Title = self.InfoPanel:Add("DLabel")
                                        Title:Dock(TOP)
                                        Title:SetText("")
                                        Title:SetTall(scrh*0.06)
                                        Title.Paint = function(self,w,h)
                                            draw.SimpleText(_RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.weaponname .. " / " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.section, "RDSRP.ESC.Button", 5, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT , TEXT_ALIGN_CENTER)
                                        end
                                        local sTitle = self.InfoPanel:Add("DLabel")
                                        sTitle:Dock(TOP)
                                        sTitle:SetText("")
                                        sTitle:SetTall(scrh*0.06)
                                        sTitle.Paint = function(self,w,h)
                                            draw.SimpleText(_RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.weaponname .. " / " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.section, "RDSRP.30", 5, self:GetTall()/2, Color(112,112,112), TEXT_ALIGN_LEFT , TEXT_ALIGN_CENTER)
                                        end

                                        local Sts = {}
                                        Sts.Stats = {
                                            ["Damage"] = {
                                                Var = wep.Primary.Damage,
                                                Image = "materials/rdsrp/icon/damage.png"
                                            },
                                            ["RPM"] = {
                                                Var = wep.Primary.RPM,
                                                Image = "materials/rdsrp/icon/rpm.png"
                                            },
                                            ["Range"] = {
                                                Var = wep.Primary.Range,
                                                Image = "materials/rdsrp/icon/range.png"
                                            },
                                            ["Heat"] = {
                                                Var = wep.maxHeat,
                                                Image = "materials/rdsrp/icon/flame.png"
                                            },
                                        }
                                        --Range
                                        Sts.Panel = self.InfoPanel:Add("DPanel")
                                        Sts.Panel:Dock(TOP)
                                        Sts.Panel:DockMargin(0,0,scrw*0.30,0)
                                        Sts.Panel:SetWide(scrh*0.56)
                                        Sts.Panel:SetTall(scrh*0.36)

                                        Sts.Panel.Paint = function(self,w,h)
                                            surface.SetDrawColor( _RDS:Color("WHITE", 255) )
                                            surface.DrawOutlinedRect(0,0,w,h,3)
                                        end
                                            Sts.Top = Sts.Panel:Add("DLabel")
                                            Sts.Top:Dock(TOP)
                                            Sts.Top:SetTall(scrh*0.03)
                                            Sts.Top:SetText("")
                                            Sts.Top.Paint = function(self,w,h)
                                                draw.SimpleText("Statistik", "RDSRP.40", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER , TEXT_ALIGN_CENTER)
                                            end
                                            Sts.Scroll = Sts.Panel:Add("DScrollPanel")
                                            Sts.Scroll:Dock(FILL)

                                            for KSts,VSts in pairs(Sts.Stats) do
                                                if not wep.isHeatBased then Sts.Stats["Heat"] = nil end  
                                                Sts.SPanel = Sts.Scroll:Add("DPanel")
                                                Sts.SPanel:Dock(TOP)
                                                Sts.SPanel:DockMargin(0,0,0,0)
                                                Sts.SPanel:SetTall(scrh*0.08)
                                                Sts.SPanel.Paint = function(self,w,h)
                                                    surface.SetDrawColor( _RDS:Color("WHITE", 255) )
                                                    surface.DrawOutlinedRect(0,0,w,h,1)
                                                end
                                                    local left = Sts.SPanel:Add("DImage")
                                                    left:Dock(LEFT)
                                                    left:DockMargin(8,5,5,5)
                                                    left:SetWide(scrw*0.05)
                                                    left:SetImage(VSts.Image)

                                                    local bar = Sts.SPanel:Add("DPanel")
                                                    bar:Dock(FILL)
                                                    bar:DockMargin(5,5,5,5)
                                                    bar:SetTooltip(KSts .. " " .. tostring(VSts.Var))
                                                    bar.Paint = function(self,w,h)
                                                        if KSts == "Damage" then 
                                                            local half = VSts.Var * 2
                                                            draw.RoundedBox(5,0,0,half,h,_RDS:Color("WHITE",255))
                                                        end
                                                        if KSts == "RPM" then
                                                            local half = VSts.Var  / 2
                                                            draw.RoundedBox(5,0,0,half,h,_RDS:Color("WHITE",255))
                                                        end
                                                        if KSts == "Range" then 
                                                            local half = VSts.Var  / 100
                                                            draw.RoundedBox(5,0,0,half,h,_RDS:Color("WHITE",255))
                                                        end
                                                        if KSts == "Heat" then 
                                                            if wep.isHeatBased then 
                                                                local half = VSts.Var
                                                                draw.RoundedBox(5,0,0,half * 2 / wep.heatStep * 3,h,_RDS:Color("WHITE",255))
                                                            end
                                                        end
                                                    end
                                            end 

                                            




                                    end
                                    
                                    if Table.Kind == "Information.Weapon" then
                                        local Title = self.InfoPanel:Add("DLabel")
                                        Title:Dock(TOP)
                                        Title:SetText("")
                                        Title:SetTall(scrh*0.06)
                                        Title.Paint = function(self,w,h)
                                            draw.SimpleText(_RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.weaponname .. " / " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.section, "RDSRP.ESC.Button", 5, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT , TEXT_ALIGN_CENTER)
                                        end
                                        local sTitle = self.InfoPanel:Add("DLabel")
                                        sTitle:Dock(TOP)
                                        sTitle:SetText("")
                                        sTitle:SetTall(scrh*0.06)
                                        sTitle.Paint = function(self,w,h)
                                            draw.SimpleText(_RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.weaponname .. " / " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.section, "RDSRP.30", 5, self:GetTall()/2, Color(112,112,112), TEXT_ALIGN_LEFT , TEXT_ALIGN_CENTER)
                                        end
                                    end
                                end

                                sheet.Button.Think = function(self)
                                    if self:IsHovered() then 
                                        _RDS.Specialisation.Equipment.UI.InfoPanel:Clear()
                                        
                                        if _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].isTFA then 
                                            Informationaboutarmor({
                                                Kind = "TFA.Weapon"
                                            })
                                        end
                                        if _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.section == "Gadget" then 
                                            Informationaboutarmor({ 
                                                Kind = "Information.Weapon"
                                            })
                                        end
                                    end
                                end
                                sheet.Button.DoClick = function()
                                    if not _RDS.Specialisation.Equipment.PlyHave[tofocusK] then 
                                        timer.Simple(0.1,function()
                                            local tbl = {
                                                [tofocusK] = true
                                            }
                                            if _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.section == "Primary" then 
                                                if LocalPlayer().MaxPrimary == _RDS.Admin.IConfig["Specialisation"].Equipmentsettings.MaxPrimary then
                                                    print("NOT OK")
                                                    return
                                                else
                                                    LocalPlayer().MaxPrimary = LocalPlayer().MaxPrimary + 1
                                                    print("OK")
                                                    _RDS:Notify("success", "Erfolgreich!", "Du hast dir Erfolgreich die Waffe " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.weaponname .. " herausgenommen!", 2)
                                                end
                                            elseif _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.section == "Secondary" then 
                                                if LocalPlayer().MaxSecondary == _RDS.Admin.IConfig["Specialisation"].Equipmentsettings.MaxSecondary then
                                                    print("NOT OK")
                                                    return
                                                else
                                                    LocalPlayer().MaxSecondary = LocalPlayer().MaxSecondary + 1
                                                    print("OK")
                                                    _RDS:Notify("success", "Erfolgreich!", "Du hast dir Erfolgreich die Waffe " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.weaponname .. " herausgenommen!", 2)
                                                end
                                            elseif _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.section == "Sidearm" then 
                                                if LocalPlayer().MaxSideArm == _RDS.Admin.IConfig["Specialisation"].Equipmentsettings.MaxSideArm then
                                                    print("NOT OK")
                                                    return
                                                else
                                                    LocalPlayer().MaxSideArm = LocalPlayer().MaxSideArm + 1
                                                    print("OK")
                                                    _RDS:Notify("success", "Erfolgreich!", "Du hast dir Erfolgreich die Waffe " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.weaponname .. " herausgenommen!", 2)
                                                end
                                            elseif _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.section == "Gadget" then
                                                if LocalPlayer().MaxGadgets == _RDS.Admin.IConfig["Specialisation"].Equipmentsettings.MaxGadgets then
                                                    print("NOT OK")
                                                    return
                                                else
                                                    LocalPlayer().MaxGadgets = LocalPlayer().MaxGadgets + 1
                                                    print("OK")
                                                    _RDS:Notify("success", "Erfolgreich!", "Du hast dir Erfolgreich das Gadget " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.weaponname .. " herausgenommen!", 2)
                                                end
                                            end

                                            table.Merge(_RDS.Specialisation.Equipment.PlyHave, tbl)
                                            net.Start("RDSRP.Specialisation.AddWeaponToSQL")
                                            net.WriteTable(_RDS.Specialisation.Equipment.PlyHave)
                                            net.SendToServer()

                                            net.Start("RDSRP.Specialisation.Retrieveweapon")
                                            net.WriteString(tostring(tofocusK))
                                            net.SendToServer()

                                            --GetScroll:Clear()
                                            SelectScroll:Clear()
                                            items = {}
                                            timer.Simple(0.1,function()
                                               -- UI:GetItems()
                                                UI:SelectableItems()
                                            end)
                                        end)
                                    else
                                        _RDS.Specialisation.Equipment.PlyHave[tofocusK] = nil
                                        net.Start("RDSRP.Specialisation.AddWeaponToSQL")
                                        net.WriteTable(_RDS.Specialisation.Equipment.PlyHave)
                                        net.SendToServer()

                                        if _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.section == "Primary" then 
                                            LocalPlayer().MaxPrimary = LocalPlayer().MaxPrimary - 1
                                            _RDS:Notify("success", "Erfolgreich!", "Du hast Erfolgreich die Waffe " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.weaponname .. " hereingelegt!", 2)
                                        elseif _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.section == "Secondary" then 
                                            LocalPlayer().MaxSecondary = LocalPlayer().MaxSecondary - 1
                                            _RDS:Notify("success", "Erfolgreich!", "Du hast Erfolgreich die Waffe " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.weaponname .. " hereingelegt!", 2)
                                        elseif _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.section == "Sidearm" then 
                                            LocalPlayer().MaxSideArm = LocalPlayer().MaxSideArm - 1
                                            _RDS:Notify("success", "Erfolgreich!", "Du hast Erfolgreich die Waffe " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.weaponname .. " hereingelegt!", 2)
                                        elseif _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.section == "Gadget" then
                                            LocalPlayer().MaxGadgets = LocalPlayer().MaxGadgets - 1
                                            _RDS:Notify("success", "Erfolgreich!", "Du hast Erfolgreich das Gadget " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.weaponname .. " hereingelegt!", 2)
                                        end

                                        net.Start("RDSRP.Specialisation.Depositweapon")
                                        net.WriteString(tostring(tofocusK))
                                        net.SendToServer()

                                      --  GetScroll:Clear()
                                        SelectScroll:Clear()
                                        items = {}
                                        timer.Simple(0.1,function()
                                         --   UI:GetItems()
                                            UI:SelectableItems()
                                        end)
                                    end
                                end

                                                                    /*
                                        if IsValid(self.SSelectPanel) then 
                                            self.SSelectPanel:Remove()
                                        end
                                        if not open then
                                            open = true
                                        --  _RDS.Specialisation.Equipment.UI.GetPanel:SetWide(scrw*0.4)
                                            _RDS.Specialisation.Equipment.UI.SelectPanel:SetWide(scrw*0.4)
                                            if open then 
                                                self.SSelectPanel:Remove()
                                            end
                                        else
                                            open = false
                                        -- _RDS.Specialisation.Equipment.UI.GetPanel:SetWide(0)
                                            _RDS.Specialisation.Equipment.UI.SelectPanel:SetWide(scrw*0.28)
                                            self.SSelectPanel = vgui.Create("DPanel", self.Panel)
                                            self.SSelectPanel:Dock(RIGHT)
                                            self.SSelectPanel:DockMargin(0,scrh*0.27,10,10)
                                            self.SSelectPanel:SetWide(scrw*0.6)
                                            self.SSelectPanel.Paint = nil

                                            local Title = self.SSelectPanel:Add("DLabel", self.SSelectPanel)
                                            Title:Dock(TOP)
                                            Title:SetText("")
                                            Title:SetTall(scrh*0.06)
                                            Title.Paint = function(self,w,h)
                                                draw.SimpleText(_RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.weaponname .. " / " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.section, "RDSRP.ESC.Button", 5, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_LEFT , TEXT_ALIGN_CENTER)
                                            end

                                            if open then 
                                                self.SSelectPanel:Remove()
                                            end
                                        end
                                    

                            local set = btn:Add("DButton")
                            set:SetText(">")
                            set:Dock(BOTTOM)
                                set.DoClick = function()
                                    net.Start("RDSRP.SQL.CheckPlayerTable")
                                    net.SendToServer()
                                        timer.Simple(0.1,function()
                                            local tbl = {
                                                [tofocusK] = true
                                            }
                                            if _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.section == "Primary" then 
                                                if LocalPlayer().MaxPrimary == _RDS.Admin.IConfig["Specialisation"].Equipmentsettings.MaxPrimary then
                                                    print("NOT OK")
                                                    return
                                                else
                                                    LocalPlayer().MaxPrimary = LocalPlayer().MaxPrimary + 1
                                                    print("OK")
                                                    _RDS:Notify("success", "Erfolgreich!", "Du hast dir Erfolgreich die Waffe " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.weaponname .. " herausgenommen!", 2)
                                                end
                                            elseif _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.section == "Secondary" then 
                                                if LocalPlayer().MaxSecondary == _RDS.Admin.IConfig["Specialisation"].Equipmentsettings.MaxSecondary then
                                                    print("NOT OK")
                                                    return
                                                else
                                                    LocalPlayer().MaxSecondary = LocalPlayer().MaxSecondary + 1
                                                    print("OK")
                                                    _RDS:Notify("success", "Erfolgreich!", "Du hast dir Erfolgreich die Waffe " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.weaponname .. " herausgenommen!", 2)
                                                end
                                            elseif _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.section == "Sidearm" then 
                                                if LocalPlayer().MaxSideArm == _RDS.Admin.IConfig["Specialisation"].Equipmentsettings.MaxSideArm then
                                                    print("NOT OK")
                                                    return
                                                else
                                                    LocalPlayer().MaxSideArm = LocalPlayer().MaxSideArm + 1
                                                    print("OK")
                                                    _RDS:Notify("success", "Erfolgreich!", "Du hast dir Erfolgreich die Waffe " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.weaponname .. " herausgenommen!", 2)
                                                end
                                            elseif _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.section == "Gadget" then
                                                if LocalPlayer().MaxGadgets == _RDS.Admin.IConfig["Specialisation"].Equipmentsettings.MaxGadgets then
                                                    print("NOT OK")
                                                    return
                                                else
                                                    LocalPlayer().MaxGadgets = LocalPlayer().MaxGadgets + 1
                                                    print("OK")
                                                    _RDS:Notify("success", "Erfolgreich!", "Du hast dir Erfolgreich das Gadget " .. _RDS.Admin.IConfig["Specialisation"].Core.Equipmentpakets[tofocusK].categorys.weaponname .. " herausgenommen!", 2)
                                                end
                                            end

                                                table.Merge(_RDS.Specialisation.Equipment.PlyHave, tbl)
                                                net.Start("RDSRP.Specialisation.AddWeaponToSQL")
                                                net.WriteTable(_RDS.Specialisation.Equipment.PlyHave)
                                                net.SendToServer()

                                                net.Start("RDSRP.Specialisation.Retrieveweapon")
                                                net.WriteString(tostring(tofocusK))
                                                net.SendToServer()

                                            GetScroll:Clear()
                                            SelectScroll:Clear()
                                            timer.Simple(0.1,function()
                                                UI:GetItems()
                                                UI:SelectableItems()
                                            end)
                                        end)
                                end
                                */
                        end 
                    end
                end
            end)
        end

        UI:SelectableItems()
      --  UI:GetItems()
end



net.Receive("RDSRP.Specialisation.Menu", function() 
    local send = _RDS.ReadCTable()
    UI:Startup(send) 
end) 
 

concommand.Add("Pai", function() 
    net.Start("RDSRP.Specialisation.Menu")
    net.SendToServer() 
end )

PrintTable(_RDS.Admin.IConfig)