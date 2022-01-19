include("shared.lua")

AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")


function ENT:Use(ply)
	
	ply:ConCommand("_RDS.OpenQuestsyquestion")
	--self:EmitSound("doors/door1_move.wav", 100, math.random(75,100))
end