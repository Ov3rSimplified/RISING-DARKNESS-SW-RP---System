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
_RDS.Interface.UI.Inventory = {}
local RDSUI = _RDS.Interface.UI.Inventory


function RDSUI:OpenInventory()
    local scrw, scrh = ScrW(),ScrH()

    RDSUI.Panel = vgui.Create( "DPanel", panel )
    RDSUI.Panel:Dock( FILL )
        RDSUI.Panel.Paint = function( self, w, h ) 
          draw.RoundedBox( 0, 0, 0, w, h, _RDS:Color("BLACK",130) )
          surface.SetDrawColor(_RDS:Color("WHITE",255))
          surface.DrawOutlinedRect(0,0,w,h,2)
        end 
    
    _RDS.Interface.UI.SelectBar:AddSheet( "Dashboard", RDSUI.Panel )
    RDSUI:GetItems()
end


function RDSUI:GetItems()
    self:PlayerPanel()
    self:SpecialisationPanel()
end

function RDSUI:PlayerPanel()
    local scrw, scrh = ScrW(),ScrH()
    local localplayer = LocalPlayer()

    local Panel = RDSUI.Panel:Add("DPanel")
    Panel:Dock( LEFT )
    Panel:DockMargin(10,10,10,10)
    Panel:SetWide(scrw*0.29)
       Panel.Paint = function( self, w, h ) 
       --   draw.RoundedBox( 0, 0, 0, w, h, _RDS:Color("BLACK",130) )
          surface.SetDrawColor(_RDS:Color("WHITE",255))
          surface.DrawOutlinedRect(0,0,w,h,2)
        end 
    local Top = Panel:Add("DLabel")
    Top:Dock(TOP)
    Top:DockMargin(0,0,0,0)
    Top:SetTall(scrh*0.05)
    Top:SetText("")
        Top.Paint = function(self,w,h)
            draw.SimpleText("Informationen", "RDSRP.40", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE",255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    local ScrollPanel = Panel:Add("DScrollPanel")
    ScrollPanel:Dock(FILL)

    local PlayerInformations = ScrollPanel:Add("DPanel")
    PlayerInformations:Dock(TOP)
    PlayerInformations:DockMargin(0,0,0,0)
    PlayerInformations:SetTall(scrh*0.25)
    PlayerInformations.Paint = nil
    
    local lp = LocalPlayer()
    local primweap = primweap or 0
    local secweap = secweap or 0
    local utils = utils or 0

    for k,v in pairs( lp:GetWeapons() ) do 
        if _RDS.Advtraining.Trainings[v:GetClass()] then 

            if v:GetClass() and _RDS.Advtraining.Trainings[v:GetClass()].categorys.category == "Primary" then
                primweap = primweap + 1
            end
            if v:GetClass() and _RDS.Advtraining.Trainings[v:GetClass()].categorys.category == "Secondary" then
                secweap = secweap + 1
            end
            if v:GetClass() and _RDS.Advtraining.Trainings[v:GetClass()].categorys.category == "Utils" then
                utils = utils + 1
            end
        end
    end


    local Informations_Player = {
        {
            Prefix = "Name",
            Suffix = lp:GetName(),
            font = "RDSRP.35"
        },
        {
            Prefix = "Rang",
            Suffix = lp:getJobTable().rankprefix,
            font = "RDSRP.35"
        },
        {
            Prefix = "Fraktion",
            Suffix = lp:getJobTable().category,
            font = "RDSRP.35"
        },
        {
            Prefix = "Unterfraktion",
            Suffix = lp:getJobTable().subfaction,
            font = "RDSRP.25"
        },
        {
            Prefix = "Ausrüstung",
            Suffix = "Pri. " .. primweap .. " Sek. " .. secweap .. " Ute. " .. utils,
            font = "RDSRP.35"

        }
    }
    for _,v in pairs(Informations_Player) do    
        local dl = PlayerInformations:Add("DLabel")
        dl:Dock(TOP)
        dl:DockMargin(5,5,5,0)
        dl:SetTall(scrh*0.040)
        dl:SetText(" " .. v.Prefix .. ": " .. tostring(v.Suffix) )
        dl:SetFont(v.font)
        dl:SetTextColor(_RDS:Color("WHITE",255))
        dl.Paint = function(self,w,h)
            surface.SetDrawColor(_RDS:Color("WHITE",255))
            surface.DrawOutlinedRect(0,0,w,h,2)
        end
    end
end
/*
 local PlayerModelPanel = vgui.Create( "DModelPanel",ScrollPanel )
    PlayerModelPanel:Dock(TOP)
    PlayerModelPanel:SetTall( scrh * 0.59 )
    PlayerModelPanel:SetFOV(20)
    PlayerModelPanel:SetModel( localplayer:GetModel() )      
    PlayerModelPanel.Entity:SetSkin( localplayer:GetSkin() )
    
    local curgroups = localplayer:GetBodyGroups() 

    PlayerModelPanel:SetAmbientLight(Color(217, 115, 52, 200))
    PlayerModelPanel:SetDirectionalLight(BOX_BOTTOM, Color(255,255,255))

    PlayerModelPanel.rot = 110
	PlayerModelPanel.fov = 20
    PlayerModelPanel.dragging = false -- left click
	PlayerModelPanel.dragging2 = false -- right click
	PlayerModelPanel.ux = 0
	PlayerModelPanel.uy = 0
	PlayerModelPanel.spinmul = 0.4
	PlayerModelPanel.zoommul = 0.09

	PlayerModelPanel.xmod = 0
	PlayerModelPanel.ymod = 0

    for k,v in pairs( curgroups ) do
        local ent = PlayerModelPanel.Entity
        local cur_bgid = localplayer:GetBodygroup( v.id )
            ent:SetBodygroup( v.id, cur_bgid )
    end

    self.selectedSequence = nil
    local sequence = "pose_standing_02"

    function PlayerModelPanel:LayoutEntity( Entity )
        if ( self.bAnimated ) then self:RunAnimation() end

        if sequence == false then
            Entity:SetAngles(Angle(0, 45, 0))
        else
            Entity:SetAngles(Angle(0, 45, 0))
            if !self.selectedSequence then
            self.selectedSequence = sequence
        end
            Entity:SetSequence(Entity:LookupSequence(self.selectedSequence))
        end

        local newrot = self.rot
		local newfov = self:GetFOV()

		if self.dragging == true then
			newrot = self.rot + (gui.MouseX() - self.ux)*self.spinmul
			newfov = self.fov + (self.uy - gui.MouseY()) * self.zoommul
			if newfov < 20 then newfov = 20 end
			if newfov > 75 then newfov = 75 end
		end

		local newxmod, newymod = self.xmod, self.ymod

		if self.dragging2 == true then
			newxmod = self.xmod + (self.ux - gui.MouseX())*0.02
			newymod = self.ymod + (self.uy - gui.MouseY())*0.02
		end

		newxmod = math.Clamp( newxmod, -16, 16 )
		newymod = math.Clamp( newymod, -16, 16 )

		Entity:SetAngles( Angle(0,0,0) )
		self:SetFOV( newfov )

		-- calculate if we should look at the face
		local height = 72/2
		-- fov between 20 and 75,
		-- height between 72/2 and 72
		local frac = InverseLerp( newfov, 75, 20 )
		height = Lerp( frac, 72/2, 64 )

		-- calculate look ang
		local norm = (self:GetCamPos() - Vector(0,0,64))
		norm:Normalize()
		local lookAng = norm:Angle()

		self:SetLookAt( Vector(0,0,height-(2*frac) ) - Vector( 0, 0, newymod*2*(1-frac) ) - lookAng:Right()*newxmod*2*(1-frac) )
		self:SetCamPos( Vector( 64*math.sin( newrot * (math.pi/180)), 64*math.cos( newrot * (math.pi/180)), height + 4*(1-frac)) - Vector( 0, 0, newymod*2*(1-frac) ) - lookAng:Right()*newxmod*2*(1-frac) )
    end

	function PlayerModelPanel:OnMousePressed( k )
		self.ux = gui.MouseX()
		self.uy = gui.MouseY()
		self.dragging = (k == MOUSE_LEFT) or false 
		self.dragging2 = (k == MOUSE_RIGHT) or false 
	end

	function PlayerModelPanel:OnMouseReleased( k )
		if self.dragging == true then
			self.rot = self.rot + (gui.MouseX() - self.ux)*self.spinmul
			self.fov = self.fov + (self.uy - gui.MouseY()) * self.zoommul
			self.fov = math.Clamp( self.fov, 20, 75 )
		end

		if self.dragging2 == true then
			self.xmod = self.xmod + (self.ux - gui.MouseX())*0.02
			self.ymod = self.ymod + (self.uy - gui.MouseY())*0.02

			self.xmod = math.Clamp( self.xmod, -16, 16 )
			self.ymod = math.Clamp( self.ymod, -16, 16 )
		end

		self.dragging = false 
		self.dragging2 = false
	end

	function PlayerModelPanel:OnCursorExited()
		if self.dragging == true or self.dragging2 == true then
			self:OnMouseReleased()
		end
	end
*/

function RDSUI:SpecialisationPanel()
    local scrw, scrh = ScrW(),ScrH()

    local localplayer = LocalPlayer()

    local Panel = RDSUI.Panel:Add("DPanel")
    Panel:Dock( LEFT )
    Panel:DockMargin(10,10,10,10)
    Panel:SetWide(scrw*0.29)
       Panel.Paint = function( self, w, h ) 
          surface.SetDrawColor(_RDS:Color("WHITE",255))
          surface.DrawOutlinedRect(0,0,w,h,2)
        end 
    local Top = Panel:Add("DLabel")
    Top:Dock(TOP)
    Top:DockMargin(0,0,0,0)
    Top:SetTall(scrh*0.05)
    Top:SetText("")
        Top.Paint = function(self,w,h)
            draw.SimpleText("Spezialisierungen", "RDSRP.40", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE",255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    local ScrollPanel = Panel:Add("DScrollPanel")
    ScrollPanel:Dock(FILL)
    local sbar = ScrollPanel:GetVBar()
   sbar:SetSize(2,0)
    sbar:SetHideButtons( true )
    function sbar.btnGrip:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(255,255,255),false,false,false,true) end
    function sbar:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),false,false,false,true) end
    function sbar.btnUp:Paint(w, h) return end
    function sbar.btnDown:Paint(w, h) return end

local function Specis()
    for k,v in pairs(_RDS.Advtraining.Trainings) do
        if not _RDS.Advtraining.Whitelist[k][cCharacterID] then  
            continue
        end
        local item = ScrollPanel:Add("DButton")
        item:Dock(TOP)
        item:DockMargin(10,6,10,0)
        item:SetTall( scrh * 0.1 )
        item:SetText("")
            item.Paint = function(self,w,h)
                local clr = _RDS:Color("WHITE", 255)
                if self:IsHovered() then clr = _RDS:Color("PETER RIVER", 255) else clr = _RDS:Color("WHITE",255) end
                draw.RoundedBox(5,2,2,w-4,h-4,_RDS:Color("BLACK",130))
                surface.SetDrawColor( clr )
                surface.DrawOutlinedRect(0,0,w,h,2)
                draw.SimpleText(v.categorys.weaponname, "RDS.Admin.btn", self:GetWide()/2, self:GetTall()/2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
    end
end
Specis()
    net.Start("RDSRP.IPlayer.GetCharacterID")
    net.WriteType(LocalPlayer())
    net.SendToServer()
    
    timer.Simple(0.2, function( )
        ScrollPanel:Clear()
        Specis()
    end)
end