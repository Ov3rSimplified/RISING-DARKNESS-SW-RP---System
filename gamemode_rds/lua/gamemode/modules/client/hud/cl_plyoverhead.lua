--

function _RDS.HUD:Overhead( ply, ID )
   // self.ID = tonumber(ID)
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
net.Receive("RDSRP.HUD.Overhead", function()
    local read = net.ReadType()
    _RDS.HUD:Overhead( LocalPlayer(), read )
end)
local function df()
    _RDS.HUD:Overhead( ply, ID )
end
hook.Add( "PostPlayerDraw", "DrawName", df)