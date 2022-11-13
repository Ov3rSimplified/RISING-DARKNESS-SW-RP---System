    util.AddNetworkString("LoadingInfo")
util.AddNetworkString("Packages")
util.AddNetworkString("Package")

local packages = {}
function Yolo.Loading.Add(info)
    table.insert(packages, info)
    if GAMEMODE then
        if timer.Exists("Yolo.Loading.Reload") then return end
        timer.Create("Yolo.Loading.Reload", 10, 1, function()
            for k, ply in pairs(player.GetHumans()) do
                Yolo.Loading.LoadPlayer(ply, true)
            end
        end)
    end
end
/*
--Example for Loading package

Yolo.Loading.Add({
    ["name"] = "Factions and Ranks",
    ["table"] = function(ply)
                    return Yolo.Factions
                end,
    -- serverside function to get the data to load
    ["load"] = [[
                    Yolo.Factions = data
                    print("Loaded Factions")
                    return true
                ]]
})

*/

function Yolo.Loading.LoadPlayer(ply, first)
    /*
    ply -> Player which gets Loading Informations Send to Start Loading
    first -> Show the Loading UI (true loading ui hidden)
    */
    if IsValid(ply) then
        net.Start("LoadingInfo")
        Yolo.Loading.WriteLoading(#packages, packages, first)
        net.Send(ply)
    end
end

-- lua refresh
--hook.Add("Yolo.GM.Loaded", "Loading", function()
--    for k, ply in pairs(player.GetHumans()) do
--        Yolo.Loading.LoadPlayer(ply, true)
--    end
--end)

--normal
net.Receive("LoadingInfo", function(len, ply)
    Yolo.Loading.LoadPlayer(ply, false)
    print(ply:Nick().." startet Loading")
end)

-- Net Receiver for the Loading Process
net.Receive("Packages", function(len, ply)
    local id = net.ReadInt(5)
    if packages[id] then
        print(ply:Name().." asked for Loading Package #"..id.." Name: "..packages[id].name)
        timer.Create(ply:SteamID64().."_Loading", 1, 0, function()
            if ply:IsTimingOut() then return end
            net.Start("Packages")
            net.WriteCompressedTable(packages[id].table(ply))
            net.Send(ply)
            timer.Remove(ply:SteamID64().."_Loading")
        end)
    else
        print(ply:Name().." asked for a Loading Package that doesnt exists!")
    end
end)

-- function to Load Data on one Client at RunTime
/*
Yolo.Loading.SendData(PLAYER, IrgendeinTable, "deintableclienseitig = data")
Yolo.Loading.BroadCastData(IrgendeinTable, "deintableclienseitig = data")

*/
function Yolo.Loading.SendData(ply, data, func)
/*
ply -> Player which should receive the data
data -> table of the data
func -> string which gets compiled to handle the data on the client
*/
    net.Start("Package")
    net.WriteString(func)
    net.WriteCompressedTable(data)
    net.Send(ply)
end

function Yolo.Loading.BroadcastData(data, func)
/*
data -> table of the data
func -> string which gets compiled to handle the data on the client
*/
        net.Start("Package")
        net.WriteString(func)
        net.WriteCompressedTable(data)
        net.Broadcast()
end

net.Receive("Package", function(len, ply)
    local info = net.ReadString()
    print(ply:Name().." send a package of Data to the Server    PackageName: "..info)
    local data = _RDS.ReadCTable()

    /*
    hook to handle the data receive
    ply-> Player who send the data
    info -> the dataname
    data -> the table
    */
    hook.Run("Yolo.Loading.Package", ply, info, data)
end)