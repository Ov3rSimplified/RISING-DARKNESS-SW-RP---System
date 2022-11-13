--
local Gtbl = _RDS.Escape


hook.Add("PreRender", "TDS.SWBFIIESC.PreRenderHook", function()
	if input.IsKeyDown(KEY_ESCAPE) && gui.IsGameUIVisible() then
        if IsValid( Gtbl.Frame ) then 
                gui.HideGameUI()
                Gtbl.Init()
            else
                gui.HideGameUI()
                Gtbl.Init()
        end
	end
end)  


function Gtbl.Init()
    local isOpen
    local scrw, scrh = ScrW(), ScrH()

    if (IsValid(Gtbl.Frame)) then
        Gtbl.Frame:Remove()
        isOpen = false
    else
        Gtbl.Frame = vgui.Create("RDSRP.BPanel")
        Gtbl.Frame:SetSize(scrw,scrh)
        Gtbl.Frame:Center()
        Gtbl.Frame:MakePopup()

        local mattt = Material("materials/rdsrp/mat/bg.png")

            Gtbl.Frame.Paint = function(self,w,h)
                if _RDS.PlayerConfig.config["EnablePicture"] or _RDS.PlayerConfig.config["EnablePicture"] == nil then 
                    surface.SetDrawColor(_RDS:Color("WHITE", 255))
                    surface.SetMaterial(mattt)
                    surface.DrawTexturedRect(0,0,w,h)
                elseif not _RDS.PlayerConfig.config["EnablePicture"] then 
                    _RDS:DrawBlurRect(0, 0, w, h, 3, 6)
                else
                    surface.SetDrawColor(_RDS:Color("WHITE", 255))
                    surface.SetMaterial(mattt)
                    surface.DrawTexturedRect(0,0,w,h)
                end

                if _RDS.PlayerConfig.config["CustomPicEnabled"] then
                    if not _RDS.PlayerConfig.config["EnablePicture"] then 
                        return
                    end
                    local bg = Material("materials/rdsrp/mat/bg.png")
                    if _RDS.PlayerConfig.config["Custompic"] == "" or bg:IsError() or _RDS:GetImgurImage(_RDS.PlayerConfig.config["Custompic"]) == nil then 
                        bg = Material("materials/rdsrp/mat/bg.png")
                    else
                        bg = _RDS:GetImgurImage(_RDS.PlayerConfig.config["Custompic"])
                    end
                    surface.SetDrawColor(_RDS:Color("WHITE", 255))
                    surface.SetMaterial(bg)
                    surface.DrawTexturedRect(0,0,w,h)
                end
            end
        isOpen = true 
    end 
    Gtbl:Title()
    Gtbl:Sidline()
    Gtbl:Btns()
    Gtbl:PlayerInformation()
end