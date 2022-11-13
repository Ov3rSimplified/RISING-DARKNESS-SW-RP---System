--
_RDS.MainUI = _RDS.MainUI or {}
local UI = _RDS.MainUI


--[[
    Hide
]]
local hide = {
    ["CHudHealth"] = true,
    ["CHudBattery"] = true,
    ["CHudAmmo"] = true,
    ["CHudEnergy"] = true,
    ["DarkRP_HUD"] = true,
    ["CHudSecondaryAmmo"] = true,
    ["DarkRP_EntityDisplay"] = true
}

hook.Add("HUDShouldDraw", "RDSRP.HideHud", function(name)
    if (hide[name]) then return false end
end)

--[[
    Functions
]]

function UI:Main()
    local scrw, scrh = ScrW(), ScrH()
    local rbox = draw.RoundedBox 
 
    --[[Left-Main Bracket]]
    rbox(0, scrw * 0.16, scrh * 0.0, math.ceil(scrw * 0.11), scrh * 0.0370, Color(0, 0, 0, 50)) 
    rbox(0, scrw * 0.160, scrh * 0.0370, math.ceil(scrw * 0.11), scrh * 0.002, _RDS.PlayerConfig.config["UIBaseColor"])
    
    --[[Right-Main Bracket]]
    rbox(0, scrw * 0.725, scrh * 0.0, math.ceil(scrw * 0.1098), scrh * 0.0370, Color(0, 0, 0, 50)) 
    rbox(0, scrw * 0.725, scrh * 0.0370, math.ceil(scrw * 0.11), scrh * 0.002, _RDS.PlayerConfig.config["UIBaseColor"] )
    surface.SetDrawColor(_RDS:Color("BLACK", 50))
    draw.SimpleText(LocalPlayer():Health(), "RDSRP.HUD.FONT4", w or scrw * 0.726, -5, Vitalcolor, TEXT_ALIGN_LEFT)

    local unten_right_Dreieck = {
        { x = scrw * 0.8349, y = scrh * 0.0 },
        { x = scrw * 0.8660, y = scrh * 0.0 },
        { x = scrw * 0.8349, y = scrh * 0.0367 }
    }
    draw.NoTexture()
    surface.DrawPoly(unten_right_Dreieck)

    local unten_left_Dreieck = { 
        { x = scrw * 0.130, y = scrh * 0.0},
        { x = scrw * 0.1599, y = scrh * 0.0 },
        { x = scrw * 0.1599, y = scrh * 0.036 }
    }
    draw.NoTexture()
    surface.DrawPoly(unten_left_Dreieck)





end

function UI:Compass()
    local scrw, scrh = ScrW(), ScrH()

    if IsValid(LocalPlayer()) then
        local dir = EyeAngles().y

        for i = 0, 360 / 15 - 1 do
            local ang = i * 15
            local dif = math.AngleDifference(ang, dir)
            local offang = (18 * 10) / 2.8

            if math.abs(dif) < offang then
                local dif2 = ScrW() * 0.050
                local pos = dif / 15 * dif2
                local text = tostring(360 - ang) .. "°"
                local font = "RDSRP.HUD.SmallNumbers"
                local clr = _RDS.PlayerConfig.config["CompassColor"]

                if ang == 0 then
                    text = "N"
                    font = "RDSRP.HUD.BigLetters"
                    clr = Color(255, 255, 255, 255)
                elseif ang == 180 then
                    text = "S"
                    font = "RDSRP.HUD.BigLetters"
                    clr = Color(255, 255, 255, 255)
                elseif ang == 90 then
                    text = "W"
                    font = "RDSRP.HUD.BigLetters"
                    clr = Color(255, 255, 255, 255)
                elseif ang == 270 then
                    text = "O"
                    font = "RDSRP.HUD.BigLetters"
                    clr = Color(255, 255, 255, 255)
                elseif ang == 45 then
                    text = "NW"
                    font = "RDSRP.HUD.SmallLetters"
                    clr = Color(255, 255, 255, 255)
                elseif ang == 135 then
                    text = "SW"
                    font = "RDSRP.HUD.SmallLetters"
                    clr = Color(255, 255, 255, 255)
                elseif ang == 225 then
                    text = "SO"
                    font = "RDSRP.HUD.SmallLetters"
                    clr = Color(255, 255, 255, 255)
                elseif ang == 315 then
                    text = "NE"
                    font = "RDSRP.HUD.SmallLetters"
                    clr = Color(255, 255, 255, 255)
                end

                draw.DrawText("╿\n" .. text, font, scrw / 2 - pos, 0, clr, TEXT_ALIGN_CENTER)
            end

            local text = "0"
            dir = math.Round(dir, 0)

            if (dir >= 0) then
                local cust = dir - 180
                cust = 360 - dir
                text = tostring(cust)
            else
                local cust = dir + 180
                cust = dir * -1
                text = tostring(cust)
            end

            draw.SimpleText(text, "RDSRP.HUD.FONT2", scrw / 2, scrh * 0.05, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER)
            draw.DrawText("▼", "RDSRP.HUD.BigLetters", scrw / 2, -10, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
        end
    end
end



function UI:Get()
    self:Main()
    self:Compass()
end

hook.Add("HUDPaint", "RDSRP.PlyHUD", function(ply)
    UI:Get()
end)

hook.Add("InitPostEntity", "RDSRP.HudLoad", function()
    hook.Call("RDSRP.PlyHUD")
end)




























