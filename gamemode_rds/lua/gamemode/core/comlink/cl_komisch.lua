--
/*
_RDS.Comlink = _RDS.Comlink or {}

local Gtbl = _RDS.Comlink 
 
local function OpenMenu()
    local scrw, scrh = ScrW(), ScrH()
    
    Gtbl.Frame = vgui.Create("RDSRP.BPanel") --"RDSRP.BPanel
    Gtbl.Frame:SetSize(scrw*0.23,scrh*0.6)
    Gtbl.Frame:Center()
    Gtbl.Frame:MakePopup()

        Gtbl.Frame.Paint = function(self,w,h)
            draw.RoundedBox(15,0,0,w,h,Color(23,22,22,255))
        end


    local top = Gtbl.Frame:Add("DPanel")
    top:Dock( TOP )
    top:DockMargin( 0,0,0,0 )
    top:SetTall(scrh*0.08)
    
        top.Paint = function(self,w,h)
            draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,false,false)
            draw.SimpleText("C O M L I N K", "RDSRP.Com.MainTitle", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end


    local close = Gtbl.Frame:Add("DButton")
    close:Dock (BOTTOM )
    close:DockMargin( scrw*0.050,0,scrw*0.050,scrh*0.018 )
    close:SetTall(scrh*0.050)
    close:SetText("")

        close.Paint = function(self,w,h)
            if self:IsHovered() then 
                draw.RoundedBox(5,0,0,w,h,Color(255,123,0)) --255,193,7,255
            end
                
            draw.RoundedBox(5,2,2,w-4 , h-4,Color(47,47,47))
            draw.SimpleText("C L O S E", "RDSRP.Com.ComTitle", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

        close.DoClick = function()
            Gtbl.Frame:Remove()
        end
end


local function Elements()

    local scrw, scrh = ScrW(), ScrH()

    local fill = Gtbl.Frame:Add("DScrollPanel")
    fill:Dock( FILL )
    fill:DockMargin( 0,scrh*0.02,0,scrh*0.02 )



    for k,v in pairs(_RDS.Config.CommChannel) do     

        local btn = fill:Add("DButton")
        btn:Dock( TOP )
        btn:DockMargin( 5,0,5,0 )
        btn:SetTall( scrh * 0.075)
        btn:SetText( "" )

            btn.Paint = function(self,w,h)
                if self:IsHovered() then 
                    draw.RoundedBox(5,0,0,w,h,v.Color) --255,193,7,255
                end
                    
                draw.RoundedBox(5,2,2,w-4 , h-4,Color(47,47,47))
                draw.SimpleText(k, "RDSRP.Com.ComTitle", self:GetWide()/2, self:GetTall()/2, _RDS:Color("WHITE", 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end

    end
    
end

function Gtbl.Init()
    OpenMenu()
    Elements()
end 

concommand.Add("open-c", Gtbl.Init)

*/

