_RDS = _RDS or {}
_RDS.Admin = _RDS.Admin or {}
_RDS.Config = _RDS.Config or {}
Yolo = Yolo or {}
Yolo.Loading = Yolo.Loading or {}
_RDS.job = _RDS.job or {} 
_RDS.GoForwardwithTableload = false



// JOB Config 
     
// Salary  
_RDS.job.s_kd = 90
_RDS.job.s_pvt = 100
_RDS.job.s_pfc = 110
_RDS.job.s_spc = 110
_RDS.job.s_lcpl = 110 
_RDS.job.s_cpl = 120 
_RDS.job.s_sgt = 130 
_RDS.job.s_ssgt = 140 
_RDS.job.s_srsgt = 140 
_RDS.job.s_sgtmjr = 150 
_RDS.job.s_slt = 200  
_RDS.job.s_flt = 250
_RDS.job.s_cpt = 300
_RDS.job.s_mjr = 320 
_RDS.job.s_cmd = 360 


_RDS.job.HP = 150
_RDS.job.AP = 100

// Armory
_RDS.job.kd = 90
_RDS.job.pvt = 100
_RDS.job.pfc = 110
_RDS.job.spc = 110
_RDS.job.lcpl = 110 
_RDS.job.cpl = 120 
_RDS.job.sgt = 130 
_RDS.job.ssgt = 140 
_RDS.job.srsgt = 140 
_RDS.job.sgtmjr = 150 
_RDS.job.slt = 200 
_RDS.job.flt = 250
_RDS.job.cpt = 300
_RDS.job.mjr = 320 
_RDS.job.cmd = 360

local rdsrp = "Test RDS:RP"


MsgC(Color(250,0,0), [[__________.__       .__                 ________                __                                ]], "\n")
MsgC(Color(250,0,0), [[\______   \__| _____|__| ____    ____   \______ \ _____ _______|  | __ ____   ____   ______ ______]], "\n")
MsgC(Color(250,0,0), [[ |       _/  |/  ___/  |/    \  / ___\   |    |  \\__  \\_  __ \  |/ //    \_/ __ \ /  ___//  ___/]], "\n")
MsgC(Color(250,0,0), [[ |    |   \  |\___ \|  |   |  \/ /_/  >  |    `   \/ __ \|  | \/    <|   |  \  ___/ \___ \ \___ \ ]], "\n")
MsgC(Color(250,0,0), [[ |____|_  /__/____  >__|___|  /\___  /  /_______  (____  /__|  |__|_ \___|  /\___  >____  >____  >]], "\n")
MsgC(Color(250,0,0), [[        \/        \/        \//_____/           \/     \/           \/    \/     \/     \/     \/ ]], "\n")
MsgC(Color(250,0,0), [[			___ _  _ ___ _____ ___   _   _    ___ _______ ___  ]], "\n")
MsgC(Color(250,0,0), [[			|_ _| \| |_ _|_   _|_ _| /_\ | |  |_ _|_  / __|   \]], "\n")
MsgC(Color(250,0,0), [[			 | || .` || |  | |  | | / _ \| |__ | | / /| _|| |) |]], "\n")
MsgC(Color(250,0,0), [[			|___|_|\_|___| |_| |___/_/ \_\____|___/___|___|___/]], "\n")
                                                                                                                              
MsgC(Color(250,0,0), [[	 ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ]], "\n")
MsgC(Color(250,0,0), [[	|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|]], "\n")


function _RDS:LoadFile(dir) 
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
 
local function LoadFiles(dir)
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




local core = "gamemode/core/"
local init = "gamemode/init"
local config = "gamemode/config"

_RDS.LoadedModules = {}
_RDS.LoadedCoreFiles = {}
local function LoadModule()
    table.Empty(_RDS.LoadedModules)
	local _,addons = file.Find("gamemode/modules/*", "LUA")
    for k, v in pairs( addons ) do           
		if file.Exists("gamemode/modules/"..v.."/sh_index.lua", "LUA") then
			AddCSLuaFile("gamemode/modules/"..v.."/sh_index.lua")
			table.insert(_RDS.LoadedModules,v)
			include("gamemode/modules/"..v.."/sh_index.lua")
			MsgC(Color(250,0,0), "[RDSRP] ", Color(255,255,255), "Module: ["..v.."] was loaded...\n")
			LoadFiles("gamemode/modules/"..v)
			local _,subaddons = file.Find("gamemode/modules/"..v.."/*", "LUA")
			local localefile = "gamemode/modules/"..v.."/"
			for kim, me in ipairs(subaddons) do   
				LoadFiles(localefile..me)
			end
		end 
    end
end

local function LoadCore() 
    table.Empty(_RDS.LoadedCoreFiles)
	local _,addons = file.Find("gamemode/core/*", "LUA")
    for k, v in pairs( addons ) do           
		if file.Exists("gamemode/core/"..v.."/sh_index.lua", "LUA") then
			AddCSLuaFile("gamemode/core/"..v.."/sh_index.lua")
			include("gamemode/core/"..v.."/sh_index.lua")
			table.insert(_RDS.LoadedModules,v)
			MsgC(Color(250,0,0), "[RDSRP] ", Color(255,255,255), "CoreFile: ["..v.."] was loaded...\n")
			LoadFiles("gamemode/core/"..v)
			local _,subaddons = file.Find("gamemode/core/"..v.."/*", "LUA")
			local localefile = "gamemode/core/"..v.."/"
			for kim, me in ipairs(subaddons) do   
				LoadFiles(localefile..me)
			end
		end 
    end
end

if GAMEMODE then
	include("gamemode/config/sh_hardconfig.lua")
	AddCSLuaFile("gamemode/config/load.lua")
	include("gamemode/config/load.lua")
	LoadFiles("gamemode/config") 
	LoadFiles("gamemode/library")  
	LoadFiles("gamemode/library/vgui")  
	LoadFiles("gamemode/init")  
	LoadCore()
	AddCSLuaFile("gamemode/core/cl_things.lua")
	include("gamemode/core/cl_things.lua")
	LoadModule()
end 
hook.Add("InitPostEntity", "_RDS.Gamemode.File", function()
	include("gamemode/config/sh_hardconfig.lua")
	AddCSLuaFile("gamemode/config/load.lua")
	include("gamemode/config/load.lua")
	LoadFiles("gamemode/config") 
	LoadFiles("gamemode/library")
	LoadFiles("gamemode/library/vgui")  
	LoadFiles("gamemode/init")  
	LoadCore()
	AddCSLuaFile("gamemode/core/cl_things.lua")
	include("gamemode/core/cl_things.lua")
	LoadModule()
end) 
    