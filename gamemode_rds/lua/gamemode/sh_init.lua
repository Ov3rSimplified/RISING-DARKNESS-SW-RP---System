_RDS = _RDS or {}
_RDS.QuestSystem = _RDS.QuestSystem or {}
_RDS.Admin = _RDS.Admin or {}
_RDS.Config = _RDS.Config or {}

local rdsrp = "Test RDS:RP"
MsgC(Color(250,0,0), "["..rdsrp.."] ", Color(255,255,255), "WAS INITIALIZED....\n")
  
 
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
local init = "gamemode/init/"
local config = "gamemode/config/"


if GAMEMODE then 
    LoadFiles(init)
    LoadFiles(core)
	LoadFiles(core.."settings")
	LoadFiles(core.."settings/admin")
	LoadFiles(core.."settings/bindsys")
	LoadFiles(core.."player")
	LoadFiles(core.."player/identification")
	LoadFiles(core.."bindsys")
	LoadFiles(core.."advtraining")
	LoadFiles(core.."advtraining/weaponchest")
    LoadFiles(core.."comlink")
	LoadFiles(core.."scoreboard")
	LoadFiles(core.."escape")
	LoadFiles(core.."hud")
    LoadFiles(core.."library") 
	LoadFiles(core.."qsys")
    LoadFiles("gamemode/config")
end 
  
hook.Add("InitPostEntity", "_RDS.Gamemode.File", function()
	LoadFiles(init) 
    LoadFiles(core)
    LoadFiles(core.."settings")
	LoadFiles(core.."settings/admin")
	LoadFiles(core.."settings/bindsys")
	LoadFiles(core.."player")
	LoadFiles(core.."player/identification")
	LoadFiles(core.."advtraining")
	LoadFiles(core.."advtraining/weaponchest")
	LoadFiles(core.."advtraining/factionmenu")
    LoadFiles(core.."comlink")
	LoadFiles(core.."scoreboard")
	LoadFiles(core.."escape")
	LoadFiles(core.."hud") 
    LoadFiles(core.."library")
	LoadFiles(core.."qsys")
	LoadFiles(core.."admin") 
    LoadFiles("gamemode/config") 
end)
    

// Print for Load
  
//Temporary load for Comlink