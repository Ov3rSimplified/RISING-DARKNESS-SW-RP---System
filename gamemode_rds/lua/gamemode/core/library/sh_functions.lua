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

 