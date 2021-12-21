--

_RDS.Escape = _RDS.Escape or {}




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
                --_RDS:DrawBlurRect(0, 0, w, h, 3, 6)
                surface.SetDrawColor(_RDS:Color("WHITE", 255))
                surface.SetMaterial(mattt)
                surface.DrawTexturedRect(0,0,w,h)
            end
        isOpen = true 
    end

    Gtbl:Btns()
end