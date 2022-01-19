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
                if _RDS.PlayerSettings.Config["EnablePicture"].basevar or _RDS.PlayerSettings.Config["EnablePicture"].basevar == nil then 
                    surface.SetDrawColor(_RDS:Color("WHITE", 255))
                    surface.SetMaterial(mattt)
                    surface.DrawTexturedRect(0,0,w,h)
                elseif not _RDS.PlayerSettings.Config["EnablePicture"].basevar then 
                    _RDS:DrawBlurRect(0, 0, w, h, 3, 6)
                else
                    surface.SetDrawColor(_RDS:Color("WHITE", 255))
                    surface.SetMaterial(mattt)
                    surface.DrawTexturedRect(0,0,w,h)
                end

                if _RDS.PlayerSettings.Config["CustomPicEnabled"].basevar then
                    if not _RDS.PlayerSettings.Config["EnablePicture"].basevar then 
                        return
                    end
                    local bg = Material("materials/rdsrp/mat/bg.png")
                    if _RDS.PlayerSettings.Config["Custompic"].basevar == "" or bg:IsError() or _RDS:GetImgurImage(_RDS.PlayerSettings.Config["Custompic"].basevar) == nil then 
                        bg = Material("materials/rdsrp/mat/bg.png")
                    else
                        bg = _RDS:GetImgurImage(_RDS.PlayerSettings.Config["Custompic"].basevar)
                    end
                    surface.SetDrawColor(_RDS:Color("WHITE", 255))
                    surface.SetMaterial(bg)
                    surface.DrawTexturedRect(0,0,w,h)
                end
            end
        isOpen = true 
    end

    Gtbl:Btns()
    Gtbl:PlayerInformation()
end