_RDS.Advtraining.Factionsystem = _RDS.Advtraining.Factionsystem or {}

local Gtbl = _RDS.Advtraining.Factionsystem


local delay = 0
local open = false
hook.Add( "Think", "openthink", function()
	if open and !input.IsKeyDown( KEY_F2 ) then
		open = false
	end
	if input.IsKeyDown( KEY_F2 ) and !open and delay < CurTime() then
		delay = CurTime() + 0.2
		open = true
		Gtbl:Init()
	end
end )

function Gtbl:Init()

    local scrw, scrh = ScrW(), ScrH()
    
    if IsValid(Gtbl.Frame) then 

        Gtbl.Frame:Remove()
        open = false

    else

        Gtbl.Frame = vgui.Create("RDSRP.BPanel")
        Gtbl.Frame:SetSize(scrw, scrh) 
        Gtbl.Frame:Center()
        Gtbl.Frame:MakePopup()
 
            Gtbl.Frame.Paint = function(self,w,h)
                draw.RoundedBox(0,0,0,w,h,Color(0,0,0,130))
            end

        Gtbl:TOP()

        open = true 

    end

end


function Gtbl:TOP()

    local scrw, scrh = ScrW(), ScrH()


    local top = vgui.Create("DPanel", self.Frame) // NEW Metode für UI Coding
    top:Dock(TOP)
    top:DockMargin(0,0,scrw * 0.6,0)
    top:SetTall(scrh * 0.2)
    
        top.Paint = function(self,w,h)
        -- draw.RoundedBox(0,0,0,w,h,Color(0,0,0))
        end


end