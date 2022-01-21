function _RDS:Color(key, alpha)
    if _RDS.Colors[key] then 
        return ColorAlpha(_RDS.Colors[key], alpha or 255)
    end
end
 
_RDS.Colors = {
        
    //FLAT UI COLORS
    ["TERQUOISE"] = Color(26, 188, 156),
    ["GREEN SEA"] = Color(22, 160, 133),
    ["SUN FLOWER"] = Color(241, 196, 15),
    ["ORANGE"] = Color(243, 156, 18),
    ["EMERALD"] = Color(46, 204, 113),
    ["NEPHRITIS"] = Color(39, 174, 96),
    ["CARROT"] = Color(230, 126, 34),
    ["PUMPKIN"] = Color(211, 84, 0),
    ["PETER RIVER"] = Color(52, 152, 219),
    ["BELIZE HOLE"] = Color(41, 128, 185),
	["BELIZE DARK"] = Color(0, 101, 168),
    ["ALIZARIN"] = Color(231, 76, 60),
    ["POMEGRANATE"] = Color(192, 57, 43),
    ["AMETHYST"] = Color(155, 89, 182),
    ["WISTERIA"] = Color(142, 68, 173),
    ["CLOUDS"] = Color(236, 240, 241),
    ["SILVER"] = Color(189, 195, 199),
    ["WET ASPHALT"] = Color(52, 73, 94),
    ["MIDNIGHT BLUE"] = Color(44, 62, 80),
    ["CONCRETE"] = Color(149, 165, 166),
    ["ASBESTOS"] = Color(127, 140, 141),
    ["WHITE"] = Color(255,255,255),
    ["BLACK"] = Color(0,0,0)
}

 
local Color_White = Color(255, 255, 255)
function _RDS:MCTXT(Font, x, y, xAlign, yAlign, ...)
	surface.SetFont(Font)
	local CurX = x
	local CurColor = nil
	local AllText = ""
	for k, v in pairs{...} do
		if not IsColor(v) then
			AllText = AllText .. tostring(v)
		end
	end
	local w, h = surface.GetTextSize(AllText)
	if xAlign == TEXT_ALIGN_CENTER then
		CurX = x - w/2
	elseif xAlign == TEXT_ALIGN_RIGHT then
		CurX = x - w
	end

	if yAlign == TEXT_ALIGN_CENTER then
		y = y - h/2
	elseif yAlign == TEXT_ALIGN_BOTTOM then
		y = y - h
	end

	for k, v in pairs{...} do
		if IsColor(v) then
			CurColor = v
			continue
		elseif CurColor == nil then
			CurColor = Color_White
		end
		local Text = tostring(v)
		surface.SetTextColor(CurColor)
		surface.SetTextPos(CurX, y)
		surface.DrawText(Text)
		CurX = CurX + surface.GetTextSize(Text)
	end
end


function _RDS:LoadFiles(dir)
    local files = file.Find(dir.. "/".. "*", "LUA")

	for k, v in pairs(files) do
		if string.StartWith(v, "cl") then
			if CLIENT then
				local load = include(dir.. "/".. v)
				if load then load() end
			end

			AddCSLuaFile(dir.. "/".. v)
		end

		if string.StartWith(v, "sv") then
			if SERVER then
				local load = include(dir.. "/".. v)
				if load then load() end
			end
		end

		if string.StartWith(v, "sh") then
			local load = include(dir.. "/".. v)
			if load then load() end

			AddCSLuaFile(dir.. "/".. v)
		end
	end
end

function _RDS:DebugPrint( col, txt )
MsgC( Color(255,255,255), "Debug |> ", col, txt.."\n")
end
 


function _RDS.WriteCTable(table)
	local data = util.TableToJSON(table)
	data = util.Compress(data)
	net.WriteInt(#data, 32)
	net.WriteData(data, #data)
 end
 
 function _RDS.ReadCTable()
	local num = net.ReadInt(32)
	local data = net.ReadData(num)
	return util.JSONToTable(util.Decompress(data)) 
 end
 
local PLAYER = FindMetaTable("Player")


function PLAYER:GetCharID(ID)
	local plya = self

	net.Start("RDSRP.IPlayer.GetCharacterID")
	net.WriteType(plya)
	net.SendToServer()

	net.Receive("RDSRP.IPlayer.GetCharacterID", function(len)
		local get = net.ReadType()
		ID = get 
	end) 
end

if CLIENT then

function _RDS:Notify(mode, title, body, duration)
    mode = mode or "info"
    title = title or ""
    body = body or ""
    duration = duration or 4


    surface.PlaySound("rdsrp/ui/notify.wav")

    if IsValid(self.Current) then
        self.Current:Remove()
    end

    self.Current = vgui.Create("DPanel")
    self.Current:SetPos(ScrW() * 0.74, ScrH() * 0.1)
    self.Current:SetSize(ScrW() * 0.25, ScrH() * 0.14)
    self.Current:SetDrawOnTop(true)
    self.Current:SetAlpha(0)

    -- Need to set this outside the paint func to use it in the rich text.
    if mode == "success" then
        self.Current.headlineColor = Color(0,255,34)
        self.Current.titleColor = Color(0,255,34)
        self.Current.textColor = Color(255,255,255)
    elseif mode == "error" then
        self.Current.headlineColor = Color(255,0,0)
        self.Current.titleColor = Color(255,0,0)
        self.Current.textColor = Color(255,255,255)
    elseif mode == "warning" then
        self.Current.headlineColor = Color(255,187,0)
        self.Current.titleColor = Color(255,187,0)
        self.Current.textColor = Color(255,255,255)
    elseif mode == "info" then
        self.Current.headlineColor = Color(0,150,250)
        self.Current.titleColor = Color(0,150,250)
        self.Current.textColor = Color(255,255,255)
    end

		function self.Current:Paint(width, height)
			if vgui.GetKeyboardFocus() then
				draw.RoundedBox(5,0,0,width,height,Color(46,46,46)) --255,193,7,255
				draw.RoundedBox(5, 2, 2, width - 4, height -4, Color(23,22,22))
			else
				draw.RoundedBox(5,0,0,width,height,Color(46,46,46)) --255,193,7,255
				draw.RoundedBox(5, 2, 2, width - 4, height -4, Color(23,22,22))
			end
			draw.RoundedBox(0, 0, ScrH() * 0.040, width, height * 0.05, self.headlineColor)
		end

		local w, h = self.Current:GetWide(), self.Current:GetTall()


	local top = vgui.Create("DLabel", self.Current)
	top:Dock(TOP)
	top:SetTall(ScrH() * 0.040)
	top:SetText("")
		top.Paint = function(self,w,h)
			if vgui.GetKeyboardFocus() then
				draw.RoundedBoxEx(9, 0, 0, w, h, Color(46,46,46),true,true,false,false)
			else
				draw.RoundedBoxEx(9, 0, 0, w, h, Color(46,46,46),true,true,false,false)
			end

			draw.DrawText(title, "RDSRP.25", self:GetWide() / 2, 10, self.titleColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

    local bodyText = vgui.Create("RichText", self.Current)
    bodyText:Dock(FILL)
    bodyText:DockMargin(w * 0.01, h * 0.15, w * 0.01, h * 0.05)
    bodyText:AppendText(body)
    bodyText:SetVerticalScrollbarEnabled(false)
		function bodyText:PerformLayout()
			self:SetFontInternal("RDSRP.25")
		end

		self.Current:AlphaTo(255, 0.75, 0)
		self.Current:AlphaTo(0, 0.75, duration + 0.75, function()
			if IsValid(self.Current) then
				self.Current:Remove()
			end
		end)

end

net.Receive("RDSRP.Notifyer", function()
    local mode = net.ReadString()
    local title = net.ReadString()
    local body = net.ReadString()
    local duration = net.ReadInt(8)
    _RDS:Notify(mode, title, body, duration)
end)

end 

if SERVER then 
	util.AddNetworkString("RDSRP.Notifyer")

	function _RDS:Notify(mode, ply, title, body, duration)
	
		net.Start("RDSRP.Notifyer")
			net.WriteString(mode)
			net.WriteString(title)
			net.WriteString(body)
			net.WriteInt(duration, 8)
		net.Send(ply)
	end
end


function _RDS:W(p)
	local s = ScrW()
	return s * p
end

function _RDS:H(p)
	local s = ScrH()
	return s * p
end