--
print("kdfkkd")
_RDS.HUD = _RDS.HUD or {}

surface.CreateFont("RDSRP.HUD.BigLetters", {
    font = "Lato",
    size = ScrH() * 0.028,
    weight = 600,
    shadow = true,
    extended = true
})

surface.CreateFont("RDSRP.HUD.SmallLetters", {
    font = "Montserrat",
    size = ScrH() * 0.020,
    weight = 400,
    shadow = true,
    extended = true
})

surface.CreateFont("RDSRP.HUD.SmallNumbers", {
    font = "Montserrat",
    size = ScrH() * 0.020,
    weight = 400,
    shadow = true,
    extended = true
})

surface.CreateFont("RDSRP.HUD.FONT1", {
    font = "Segoe UI Black",
    size = ScrH() * 0.020,
    weight = 100,
    antialias = true,
    bold = true
})

surface.CreateFont("RDSRP.HUD.OVERHEAD", {
    font = "Montserrat",
    size = 40,
    weight = 100,
    antialias = true,
    bold = true
})

surface.CreateFont("RDSRP.HUD.FONT2", {
    font = "Montserrat",
    size = ScrH() * 0.025,
    weight = 100,
    antialias = true,
    bold = true
})

surface.CreateFont("RDSRP.HUD.FONT3", {
    font = "Montserrat",
    size = ScrH() * 0.015,
    weight = 100,
    antialias = true,
    bold = true
})

surface.CreateFont("RDSRP.HUD.FONT4", {
    font = "Montserrat",
    size = ScrH() * 0.040,
    weight = 100,
    antialias = true,
    bold = true
})


surface.CreateFont("RDSRP.HUD.FONT5", {
    font = "Montserrat",
    size = ScrH() * 0.080,
    weight = 100,
    antialias = true,
    bold = true
})

surface.CreateFont("FONT_HUD_WEAPONTITLE", {
    font = "Montserrat",
    size = ScrH() * 0.030,
    weight = 100,
    antialias = true,
    underline = false,
    bold = true
})

surface.CreateFont("FONT_HUD_INFOTITLE", {
    font = "Montserrat",
    size = ScrH() * 0.045,
    weight = 100,
    antialias = true,
    underline = false,
    bold = true
})

/*
if CLIENT then
    surface.CreateFont("RDSRP.HUD.BigLetters", {
        font = "Lato",
        size = ScrH() * 0.028,
        weight = 600,
        shadow = true,
        extended = true
    })

    surface.CreateFont("RDSRP.HUD.SmallLetters", {
        font = "Montserrat",
        size = ScrH() * 0.020,
        weight = 400,
        shadow = true,
        extended = true
    })

    surface.CreateFont("RDSRP.HUD.SmallNumbers", {
        font = "Montserrat",
        size = ScrH() * 0.020,
        weight = 400,
        shadow = true,
        extended = true
    })

    surface.CreateFont("RDSRP.HUD.FONT1", {
        font = "Segoe UI Black",
        size = ScrH() * 0.020,
        weight = 100,
        antialias = true,
        bold = true
    })

    surface.CreateFont("RDSRP.HUD.OVERHEAD", {
        font = "Montserrat",
        size = 40,
        weight = 100,
        antialias = true,
        bold = true
    })

    surface.CreateFont("RDSRP.HUD.FONT2", {
        font = "Montserrat",
        size = ScrH() * 0.025,
        weight = 100,
        antialias = true,
        bold = true
    })

    surface.CreateFont("RDSRP.HUD.FONT3", {
        font = "Montserrat",
        size = ScrH() * 0.015,
        weight = 100,
        antialias = true,
        bold = true
    })

    surface.CreateFont("RDSRP.HUD.FONT4", {
        font = "Montserrat",
        size = ScrH() * 0.040,
        weight = 100,
        antialias = true,
        bold = true
    })

    
    surface.CreateFont("RDSRP.HUD.FONT5", {
        font = "Montserrat",
        size = ScrH() * 0.080,
        weight = 100,
        antialias = true,
        bold = true
    })

    surface.CreateFont("FONT_HUD_WEAPONTITLE", {
        font = "Montserrat",
        size = ScrH() * 0.030,
        weight = 100,
        antialias = true,
        underline = false,
        bold = true
    })

    surface.CreateFont("FONT_HUD_INFOTITLE", {
        font = "Montserrat",
        size = ScrH() * 0.045,
        weight = 100,
        antialias = true,
        underline = false,
        bold = true
    })
end

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

local function Brackets() 
    local scrw, scrh = ScrW(), ScrH()
    local rbox = draw.RoundedBox 
    local Logo = Material("materials/rdsrp/logos/image7.png")

    rbox(0, scrw * 0.16, scrh * 0.0, math.ceil(scrw * 0.11), scrh * 0.0370, Color(0, 0, 0, 130)) -- LEFT(Base)
    rbox(0, scrw * 0.725, scrh * 0.0, math.ceil(scrw * 0.1098), scrh * 0.0370, Color(0, 0, 0, 130)) --RIGHT(BASE)
    rbox(0, scrw * 0.160, scrh * 0.0370, math.ceil(scrw * 0.11), scrh * 0.002, _RDS.PlayerConfig.config["UIBaseColor"]) -- LEFT(LINE)
    rbox(0, scrw * 0.725, scrh * 0.0370, math.ceil(scrw * 0.11), scrh * 0.002, _RDS.PlayerConfig.config["UIBaseColor"] )-- RIGHT(LINE)
         draw.DrawText("⸻ I N F O ⸻", "FONT_HUD_INFOTITLE", scrw * 0.83, scrh * 0.13, Color(255,255,255), TEXT_ALIGN_LEFT)
   -- draw.DrawText(LocalPlayer():GetTalkMode(), "FONT_HUD_INFOTITLE", scrw * 0.83, scrh * 0.26, Color(255, 255, 255), TEXT_ALIGN_LEFT)
    surface.SetDrawColor(_RDS:Color("BLACK", 130))



    local w = scrw * 0.025
    local h = scrh * 0.040


    local unten_right_Dreieck = {
        {
            x = scrw * 0.8349,
            y = scrh * 0.0
        },
        {
            x = scrw * 0.8660,
            y = scrh * 0.0
        },
        {
            x = scrw * 0.8349,
            y = scrh * 0.0367
        }
    }

    draw.NoTexture()
    surface.DrawPoly(unten_right_Dreieck)

    local unten_left_Dreieck = {
        {
            x = scrw * 0.130,
            y = scrh * 0.0
        },
        {
            x = scrw * 0.1599,
            y = scrh * 0.0
        },
        {
            x = scrw * 0.1599,
            y = scrh * 0.036
        }
    }

    draw.NoTexture()
    surface.DrawPoly(unten_left_Dreieck)
    draw.SimpleText(LocalPlayer():Armor().."%", "RDSRP.HUD.FONT4", scrw * 0.19, -5, _RDS:Color("PETER RIVER", 255), TEXT_ALIGN_LEFT)
    local lp = LocalPlayer()
    local Vitalstatus = ""
    local Vitalcolor = Color(255, 255, 255)
    local w

    if lp:Health() > 95 then
        Vitalstatus = "SEHR GUT"
        Vitalcolor = _RDS:Color("EMERALD", 255)
        w = scrw * 0.736
    end

    if lp:Health() <= 95 then
        Vitalstatus = "SEHR GUT"
        Vitalcolor = _RDS:Color("EMERALD", 255)
        w = scrw * 0.736
    end

    if lp:Health() <= 81 then
        Vitalstatus = "GUT"
        Vitalcolor = _RDS:Color("NEPHRITIS", 255)
        w = scrw * 0.766
    end

    if lp:Health() <= 71 then
        Vitalstatus = "STABIL"
        Vitalcolor = _RDS:Color("NEPHRITIS", 255)
        w = scrw * 0.766
    end

    if lp:Health() <= 51 then
        Vitalstatus = "INSTABIL"
        Vitalcolor = _RDS:Color("CARROT", 255)
        w = scrw * 0.746
    end

    if lp:Health() <= 39 then
        Vitalstatus = "SCHWÄCHER"
        Vitalcolor = _RDS:Color("ALIZARIN", 255)
        w = scrw * 0.727
    end

    if lp:Health() <= 20 then
        Vitalstatus = "SCHWACH"
        Vitalcolor = _RDS:Color("POMEGRANATE", 255)
        w = scrw * 0.740
    end

    if Vitalstatus == nil then
        Vitalstatus = "NULL"
    end

    draw.SimpleText(LocalPlayer():Health(), "RDSRP.HUD.FONT4", w or scrw * 0.726, -5, Vitalcolor, TEXT_ALIGN_LEFT)

    surface.SetDrawColor(_RDS:Color("WHITE", 130))
    surface.SetMaterial( Logo )
    local w = scrw * 0.035
    local h = scrh * 0.050
    surface.DrawTexturedRect( scrw * 0.96, scrh * 0.0, w, h)
end

local function Compass()
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

local function Weapons()
    local scrw, scrh = ScrW(), ScrH()
    local ply = LocalPlayer()

    if (ply:GetActiveWeapon():IsValid()) then
        local scrw, scrh = ScrW(), ScrH()
        local text = "Unbewaffnet"
        local set = "--------"
        local v = LocalPlayer():GetActiveWeapon()
        local curWeapon = ply:GetActiveWeapon():GetClass()

        if v.isHeatBased == true then 
            text = ply:GetActiveWeapon():GetPrintName()
            set = v:GetFireModeName()
        elseif curWeapon == "weapon_fists" then 
            text = "Fäuste"
        end 


                local ho = 0.260 or 0
                local wo = 0.02 or 0 
                draw.RoundedBox(0, scrw * .78 + scrw * wo, scrh * .015 + scrh * ho, scrw * .2, scrh * .04, Color(0,0,0,130))
                draw.OutlinedBox(scrw * .78 + scrw * wo, scrh * .015 + scrh * ho, scrw * .2, scrh * .04, 1,_RDS.PlayerConfig.config["UIBaseColor"] or Color(255,255,255,130))
                draw.RoundedBox(0, scrw * .875 + scrw * wo, scrh * .015 + scrh * ho, scrw * .001, scrh * .04, _RDS.PlayerConfig.config["UIBaseColor"] or Color(255,255,255,130))
               -- draw.DrawText(tostring(text), "Comlink.Title", scrw * .825 + scrw * wo, scrh * .020 + scrh * ho, Color(255, 255, 255), TEXT_ALIGN_CENTER)
               -- draw.DrawText(set, "Comlink.Title", scrw * .925 + scrw * wo, scrh * .020 + scrh * ho, Color(255, 255, 255), TEXT_ALIGN_CENTER)

            end

    local v = LocalPlayer():GetActiveWeapon()

    if v:GetNWFloat("currentHeat") > 1 then
        local ho = 0.305 or 0
        local wo = 0.02 or 0 
        draw.RoundedBox(0, scrw * .78 + scrw * wo, scrh * .015 + scrh * ho, scrw * .2, scrh * .01, Color(0,0,0,130))
        draw.RoundedBox(0, scrw * .78 + scrw * wo, scrh * .015 + scrh * ho, scrw * .2 * math.abs(v:GetNWFloat("currentHeat") / v.maxHeat), scrh * .01, Color(255 * math.abs(v:GetNWFloat("currentHeat") / v.maxHeat), 255 * math.abs(v:GetNWFloat("currentHeat") / v.maxHeat - 1), 0, 255))
    end
/*
    if v:GetNWFloat("currentHeat") > 1 then
        local MSW, MSH = ScrW(), ScrH()
        local fuelbarwidth, fuelbarheigth = 256, 48
        draw.RoundedBox(6, MSW / 2 - fuelbarwidth / 2 + 4, ScrH() * 0.9500, ScrW() * 0.099, ScrH() * 0.015, Color(0, 0, 0, 130))
        draw.RoundedBox(6, MSW / 2 - fuelbarwidth / 2 + 4, ScrH() * 0.9500, ScrW() * 0.099 * math.abs(v:GetNWFloat("currentHeat") / v.maxHeat), ScrH() * 0.015, Color(255 * math.abs(v:GetNWFloat("currentHeat") / v.maxHeat), 255 * math.abs(v:GetNWFloat("currentHeat") / v.maxHeat - 1), 0, 255))
    end
*/
--end



/*
        local curWeapon = ply:GetActiveWeapon():GetClass()
        if (not IsValid(LocalPlayer():GetActiveWeapon())) then return end

        if (ply:GetActiveWeapon():GetPrintName() ~= nil) then
            if (LocalPlayer():GetActiveWeapon():Clip1() == -1) then return end
            if (LocalPlayer():GetActiveWeapon():Clip1() == -1) then return end
            if (LocalPlayer():GetActiveWeapon():GetMaxClip1() == 0) then return end
            local v = LocalPlayer():GetActiveWeapon()

            

                local scrw, scrh = ScrW(), ScrH()
                local ho = 0.260 or 0
                local wo = 0.02 or 0 
                draw.RoundedBox(0, scrw * .78 + scrw * wo, scrh * .015 + scrh * ho, scrw * .2, scrh * .04, Color(0,0,0,130))
                draw.OutlinedBox(scrw * .78 + scrw * wo, scrh * .015 + scrh * ho, scrw * .2, scrh * .04, 1,_RDS.PlayerConfig.config["UIBaseColor"] or Color(255,255,255,130))
                draw.RoundedBox(0, scrw * .875 + scrw * wo, scrh * .015 + scrh * ho, scrw * .001, scrh * .04, _RDS.PlayerConfig.config["UIBaseColor"] or Color(255,255,255,130))
                draw.DrawText(ply:GetActiveWeapon():GetPrintName(), "Comlink.Title", scrw * .825 + scrw * wo, scrh * .020 + scrh * ho, Color(255, 255, 255), TEXT_ALIGN_CENTER)

                if v.isHeatBased == true then

                --\n " .. v:GetFireModeName()

               -- draw.RoundedBox(0, scrw * 0.8995, scrh * 0.23, scrw * 0.10, scrh * 0.05, Color(0, 0, 0, 130))
              --  surface.SetDrawColor(Color(255, 255, 255))
            --    surface.DrawOutlinedRect(scrw * 0.8995, scrh * 0.23, scrw * 0.10, scrh * ( 0.05 ), 1)
               -- draw.DrawText(ply:GetActiveWeapon():GetPrintName() .. " \n " .. v:GetFireModeName(), "RDSRP.HUD.FONT1", scrw * 0.95, scrh * 0.234, Color(255, 255, 255), TEXT_ALIGN_CENTER)
            else
                draw.RoundedBox(6, scrw * 0.88, scrh * 0.93, scrw * 0.3, scrh * 0.05, Color(0, 0, 0, 130))
                draw.SimpleText(ply:GetActiveWeapon():GetPrintName(), "RDSRP.HUD.FONT1", scrw * 0.94, scrh * 0.93, Color(255, 255, 255), TEXT_ALIGN_CENTER)
                draw.SimpleText(ply:GetActiveWeapon():Clip1() .. " / " .. ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType()), "RDSRP.HUD.FONT1", scrw * 0.94, scrh * 0.95, Color(255, 255, 255), TEXT_ALIGN_CENTER)
            end
*/

/*

hook.Add("HUDPaint", "RDSRP.HudPaint", function(ply)
    Brackets()
    Compass()
    Weapons()
end)

hook.Add("InitPostEntity", "RDSRP.HudLoad", function()
    hook.Call("RDSRP.HudPaint")
end)

local function blurrect(x, y, w, h, amount, density)
    local blur = Material("pp/blurscreen")
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(blur)

    for i = 1, density do
        blur:SetFloat("$blur", (i / 3) * (amount or 6))
        blur:Recompute()
        render.UpdateScreenEffectTexture()
        render.SetScissorRect(x, y, x + w, y + h, true)
        surface.DrawTexturedRect(0 * -1, 0 * -1, ScrW(), ScrH())
        render.SetScissorRect(0, 0, 0, 0, false)
    end
end





function Toverhead( ply )
    if (!IsValid(ply)) then return end 
    if ( ply == LocalPlayer()) then return end
    if (!ply:Alive()) then return end
    local Distance = LocalPlayer():GetPos():Distance( ply:GetPos() ) 
    
    if ( Distance < 250 ) then 

        local offset = Vector( 0, 0, 85 )
        local ang = LocalPlayer():EyeAngles()
        local pos = ply:GetPos() + offset + ang:Up()
        ang:RotateAroundAxis( ang:Forward(), 90 )
        ang:RotateAroundAxis( ang:Right(), 90 )
		surface.SetFont("DermaDefault")
		local width, height = surface.GetTextSize( ply:GetName() )
		
        cam.Start3D2D( pos, Angle( 0, ang.y, 90 ), 0.05 )
			draw.DrawText("ID: ", "RDSRP.HUD.FONT5", 0, 0, team.GetColor( LocalPlayer():Team() ) , TEXT_ALIGN_CENTER ) 
        
        cam.End3D2D()
    end
end 
hook.Add( "PostPlayerDraw", "DrawName", Toverhead)















*/





























--[[

    
    
    //Basic Function
    local hide = {
        ["CHudHealth"] = true,
        ["CHudBattery"] = true,
        ["CHudAmmo"] = true,
        ["CHudEnergy"] = true,
        ["DarkRP_HUD"] = true,
        ["CHudSecondaryAmmo"] = true,
        ["DarkRP_EntityDisplay"] = true
    }
    
    local dhide = {
        ["CHudHealth"] = true,
        ["CHudBattery"] = true,
        ["CHudAmmo"] = true,
        ["CHudEnergy"] = true,
        ["DarkRP_HUD"] = true,
        ["CHudSecondaryAmmo"] = true,
        ["DarkRP_EntityDisplay"] = true,
        ["THUDPaint"] = true,
    }
    
    hook.Add( "HUDShouldDraw", "HideHUD", function( name )
        if ( hide[ name ] ) then return false end
    end )
    
    function GetAmmoForCurrentWeapon( ply )
       if ( !IsValid( ply ) ) then return -1 end
    
       local wep = ply:GetActiveWeapon()
       if ( !IsValid( wep ) ) then return -1 end
    
       return ply:GetAmmoCount( wep:GetPrimaryAmmoType() )
    end
    
    
    
    hook.Add( "HUDPaint", "THUDPaint", function()
    
        local lp = LocalPlayer()
        local moneyy = DarkRP.formatMoney((LocalPlayer():getDarkRPVar("money") || 0))
        local salaryy = DarkRP.formatMoney((LocalPlayer():getDarkRPVar("salary") || 0))
        local hp, maxhp = math.Clamp(lp:Health(), 0, lp:GetMaxHealth()), lp:GetMaxHealth()
        local armor = math.Clamp(lp:Armor(), 0, 999999999)
        local Logo = Material("materials/logos/halloween.png")
        local holo = Material("materials/bild/holo.png")
        local scrw, scrh = ScrW(), ScrH() 
    
        if IsValid(LocalPlayer() ) then
    
    
        local dir = EyeAngles().y 
           
        for i=0, 360 / 15 - 1 do
            local ang = i * 15
           
            local dif = math.AngleDifference(ang, dir)
                      
            local offang = ( 18*10 )/2.8
           
            if math.abs(dif) < offang then
               
                local dif2 = ScrW()*0.89  / 18
               
                local pos = dif/15 * dif2
               
                local text = tostring(360 - ang).."°"
               
                local font = "RDSRP.HUD.SmallNumbers"
            
                local clr = Color(250,0,0)
               
                if ang == 0 then
                    text = "N"
                    font = "RDSRP.HUD.BigLetters"
                    clr = Color(255,255,255,255)
                elseif ang == 180 then
                    text = "S"
                    font = "RDSRP.HUD.BigLetters"
                    clr = Color(255,255,255,255)
                elseif ang == 90 then
                    text = "W"
                    font = "RDSRP.HUD.BigLetters"
                    clr = Color(255,255,255,255)
                elseif ang == 270 then
                    text = "O"
                    font = "RDSRP.HUD.BigLetters"
                    clr = Color(255,255,255,255)
                elseif ang == 45 then
                    text = "NW"
                    font = "RDSRP.HUD.SmallLetters"
                    clr = Color(255,255,255,255)
                elseif ang == 135 then
                    text = "SW"
                    font = "RDSRP.HUD.SmallLetters"
                    clr = Color(255,255,255,255)
                elseif ang == 225 then
                    text = "SO"
                    font = "RDSRP.HUD.SmallLetters"
                    clr = Color(255,255,255,255)
                elseif ang == 315 then
                    text = "NE"
                    font = "RDSRP.HUD.SmallLetters"
                    clr = Color(255,255,255,255)
                end
               
                draw.DrawText("╿\n"..text, font, ScrW()/2 - pos, 0, clr, TEXT_ALIGN_CENTER )
        
    
               
            end
                draw.DrawText("▼", "RDSRP.HUD.BigLetters", ScrW()/2, -10, Color(255,255,255,255), TEXT_ALIGN_CENTER )
    
        end
    
    
             draw.RoundedBox(0, scrw * 0.16, scrh * 0.0, math.ceil( scrw * 0.11), scrh * 0.0370, Color(0,0,0,130))  // LEFT
             
             draw.RoundedBox(0, scrw * 0.725, scrh * 0.0, math.ceil( scrw * 0.1101), scrh * 0.0370,  Color(0,0,0,130)) //RIGHT
        
         
        
             draw.RoundedBox(0, scrw * 0.16, scrh * 0.0370, math.ceil( scrw * 0.11), scrh * 0.002, _RDS.Config.UIColor) // LEFT
        
             draw.RoundedBox(0, scrw * 0.725, scrh * 0.0370, math.ceil( scrw * 0.11), scrh * 0.002, _RDS.Config.UIColor)  // RIGHT
        
        
             surface.SetDrawColor(  Color(0,0,0,130) )   
        
             local unten_right_Dreieck = { 
                 { x = scrw * 0.8353, y = scrh * 0.0},
                 { x = scrw * 0.8660, y = scrh * 0.0},
                 { x = scrw * 0.8353, y = scrh * 0.0370}
                 }
               draw.NoTexture()
               surface.DrawPoly(unten_right_Dreieck)
              
                 local unten_left_Dreieck = {
                     { x = scrw * 0.130, y = scrh * 0.0},
                     { x = scrw * 0.160, y = scrh * 0.0},
                     { x = scrw * 0.160, y = scrh * 0.0372}
                     } 
                 draw.NoTexture()
                 surface.DrawPoly(unten_left_Dreieck)
        
        

        
        
        
                 surface.SetDrawColor(  Color(255,255,255) )
                 surface.SetMaterial( Logo )
                 local w = scrw * 0.025
                 local h = scrh * 0.040
                 surface.DrawTexturedRect( scrw * 0.0, scrh * 0.0, w, h)

                 if _RDS.Config.SelectUIMode == "Halloween" then  
                    w = scrw * 0.090
                    h = scrh * 0.090
                 end
                 surface.DrawTexturedRect( scrw * 0.0, scrh * 0.0, w, h)
                 
    

        
        draw.DrawText("⸻ I N F O ⸻", "FONT_HUD_INFOTITLE", scrw * 0.83, scrh * 0.13, Color(255,255,255), TEXT_ALIGN_LEFT)
        
        local Lply = Entity(1)
        if LocalPlayer():IsSpeaking() then 
            local volume = Lerp(LocalPlayer():VoiceVolume() / 0.5, 85, 255)
                    draw.RoundedBox(0, scrw * 0.7995, scrh * 0.338, scrw * 0.20, scrh * 0.05,  Color(0,0,0,130) )
                    surface.SetDrawColor(_RDS.Config.UIColor, volume ) 
                    surface.DrawOutlinedRect(scrw * 0.7995, scrh * 0.338, scrw * 0.20, scrh * 0.05, 1)
                    draw.DrawText("Du sprichts!","Defcon.Font",scrw * 0.9000, math.ceil( scrh * 0.346),Color(255,255,255),TEXT_ALIGN_CENTER)
        end
    
    
    
    
    
        local Vitalstatus = ""
        local Vitalcolor = Color(255,255,255)
        
         if lp:Health() > 95 then 
             Vitalstatus = "SEHR GUT"
             Vitalcolor = _RDS:Color("EMERALD", 255)
         end
         if lp:Health() <= 95 then 
            Vitalstatus = "SEHR GUT"
            Vitalcolor = _RDS:Color("EMERALD", 255)
         end
         if lp:Health() <= 81 then 
             Vitalstatus = "GUT"
             Vitalcolor = _RDS:Color("NEPHRITIS", 255)
         end
         if lp:Health() <= 71 then 
             Vitalstatus = "STABIL"
             Vitalcolor = _RDS:Color("NEPHRITIS", 255)
         end
         if lp:Health() <= 51 then 
            Vitalstatus = "INSTABIL"
         end
         if lp:Health() <= 39 then  
             Vitalstatus = "SCHWÄCHER"
             Vitalcolor = _RDS:Color("NEPHRITIS", 255)
         end
         if lp:Health() <= 20 then 
             Vitalstatus = "SCHWACH"
             Vitalcolor = _RDS:Color("NEPHRITIS", 255)
         end 
         if Vitalstatus == nil then
            Vitalstatus = "NULL"
         end
        
         _RDS:MCTXT("RDSRP.HUD.FONT1", scrw * 0.728, scrh * 0.01, TEXT_ALIGN_LEFT, Color(255,255,255), "Vitalwert: ",  Vitalcolor, Vitalstatus )
         _RDS:MCTXT("RDSRP.HUD.FONT1", scrw * 0.16, scrh * 0.01, TEXT_ALIGN_LEFT, Color(255,255,255), "Schildstatus: ", _RDS:Color("PETER RIVER", 255), armor.."%" )
        
        
        local ply = LocalPlayer()
        
         if (ply:GetActiveWeapon():IsValid()) then
             local curWeapon = ply:GetActiveWeapon():GetClass()
                 if(!IsValid(LocalPlayer():GetActiveWeapon())) then return end
                     if (ply:GetActiveWeapon():GetPrintName() != nil) then
                         if(LocalPlayer():GetActiveWeapon():Clip1() == -1) then return end
                             if(LocalPlayer():GetActiveWeapon():Clip1() == -1) then return end
                                 if(LocalPlayer():GetActiveWeapon():GetMaxClip1() == 0) then return end
                                     local v = LocalPlayer():GetActiveWeapon();
                                         if v.isHeatBased == true then
                                             draw.RoundedBox(0, scrw * 0.8995, scrh * 0.23, scrw * 0.10, scrh * 0.05,  Color(0,0,0,130) )
                                             surface.SetDrawColor(_RDS.Config.UIColor ) 
                                             surface.DrawOutlinedRect(scrw * 0.8995, scrh * 0.23, scrw * 0.10, scrh * 0.05, 1)
                                                draw.DrawText( ply:GetActiveWeapon():GetPrintName().." \n "..v:GetFireModeName(), "RDSRP.HUD.FONT1", scrw * 0.95, scrh * 0.234, Color(255, 255, 255), TEXT_ALIGN_CENTER)
                                         else
                                            draw.RoundedBox(6, scrw * 0.88, scrh * 0.93, scrw * 0.3, scrh * 0.05,  Color(0,0,0,130) )
                                                draw.SimpleText(ply:GetActiveWeapon():GetPrintName(), "RDSRP.HUD.FONT1", scrw * 0.94, scrh * 0.93, Color(255, 255, 255), TEXT_ALIGN_CENTER)
                                                    draw.SimpleText(ply:GetActiveWeapon():Clip1().." / "..ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType()), "RDSRP.HUD.FONT1", scrw * 0.94, scrh * 0.95, Color(255, 255, 255), TEXT_ALIGN_CENTER)
                                         end 
                                     end
                                 end
                         local v = LocalPlayer():GetActiveWeapon(); 
                             if v:GetNWFloat("currentHeat") > 1 then
                                     local MSW, MSH = ScrW(), ScrH()
                                     local fuelbarwidth, fuelbarheigth = 256, 48
                                         draw.RoundedBox(6, MSW/2-fuelbarwidth/2+4, ScrH() * 0.9500, ScrW() * 0.099, ScrH() * 0.015, Color(0,0,0,130))
                                         draw.RoundedBox(6, MSW/2-fuelbarwidth/2+4, ScrH() * 0.9500, ScrW() * 0.099 * math.abs(v:GetNWFloat("currentHeat") / v.maxHeat), ScrH() * 0.015, Color(255 * math.abs(v:GetNWFloat("currentHeat") / v.maxHeat), 255 * math.abs(v:GetNWFloat("currentHeat") / v.maxHeat - 1), 0, 255))
                                 end
        end
    
    end)
    
    ]]