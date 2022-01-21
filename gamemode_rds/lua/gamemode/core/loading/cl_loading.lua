function Yolo.Loading.GetPackage()
    if Yolo.Loading.UI then
        Yolo.Loading.UI.Label:SetText("Loading "..Yolo.Loading.Infos[Yolo.Loading.CurrentPackage].name)
    end
    timer.Simple(0, function()
        net.Start("Packages")
        net.WriteInt(Yolo.Loading.CurrentPackage, 5)
        net.SendToServer()
    end)
end

function Yolo.Loading.Finish()
    print(LocalPlayer():Name().." finished Loading.")
    print("Took "..SysTime() - LocalPlayer().LoadTime.." seconds to load")
    LocalPlayer().loading = false
    -- the loading ui is not Valid so we probably loaded at runtime and not at the first join...
    timer.Simple(1, function()
        if !Yolo.Loading.UI then return end
        Yolo.Loading.UI.Main:Remove()
        Yolo.Loading.UI = nil
    end)
end

net.Receive("LoadingInfo", function()
    LocalPlayer().loading = true
    LocalPlayer().LoadTime = SysTime()
    local max, packages, first = Yolo.Loading.ReadLoading()
    Yolo.Loading.Max = max
    Yolo.Loading.Infos = packages
    Yolo.Loading.CurrentPackage = 1
    print("Got Loading Informations")

    if Yolo.Loading.Max < 1 then
        Yolo.Loading.Finish()
        return
    end

    if Yolo.Loading.UI then return end
    if first then return end
    Yolo.Loading.UI = {}
    local scrw, scrh = ScrW(), ScrH()
    Yolo.Loading.UI.Main = vgui.Create("DFrame")
    Yolo.Loading.UI.Main:SetPos(0, 0)
    Yolo.Loading.UI.Main:SetSize(scrw, scrh)
    Yolo.Loading.UI.Main:SetTitle("Loading")
    Yolo.Loading.UI.Main:Remove()

    Yolo.Loading.UI.Progress = vgui.Create("DProgress", Yolo.Loading.UI.Main)
    Yolo.Loading.UI.Progress:Dock(BOTTOM)
    Yolo.Loading.UI.Progress:SetTall(scrh*0.1)
    Yolo.Loading.UI.Progress:DockMargin(scrw*0.1, 0, scrw*0.1, scrh*0.05)
    Yolo.Loading.UI.Progress:SetFraction(0)

    Yolo.Loading.UI.Label = vgui.Create("DLabel", Yolo.Loading.UI.Main)
    Yolo.Loading.UI.Label:SetFont("CloseCaption_Bold")
    Yolo.Loading.UI.Label:SetSize(scrw/4, scrh/4)
    Yolo.Loading.UI.Label:Center()
    Yolo.Loading.UI.Label:SetColor(color_white)
    Yolo.Loading.UI.Label:SetText("Got Loading Informations from the Server")
end)

net.Receive("Packages", function()
    local data = _RDS.ReadCTable()
    if Yolo.Loading.Infos[Yolo.Loading.CurrentPackage].load then
        local func = CompileString("local data = ... " .. Yolo.Loading.Infos[Yolo.Loading.CurrentPackage].load, Yolo.Loading.Infos[Yolo.Loading.CurrentPackage].name, false)

        if isfunction(func) and func(data) then
            if Yolo.Loading.UI then
                Yolo.Loading.UI.Progress:SetFraction(Yolo.Loading.CurrentPackage  / Yolo.Loading.Max)
                Yolo.Loading.UI.Label:SetText("Loaded "..Yolo.Loading.Infos[Yolo.Loading.CurrentPackage].name)
            end
            if Yolo.Loading.CurrentPackage == Yolo.Loading.Max then
                Yolo.Loading.Finish()
                return
            end

            Yolo.Loading.CurrentPackage = Yolo.Loading.CurrentPackage + 1
            timer.Simple(1, function()
                Yolo.Loading.GetPackage()
            end)
        else
            func = "Error in Loading Package #"..Yolo.Loading.CurrentPackage.." printing Error Message: "..func
            print("There was an Error Executing the Loading Package")
            print("Send this to the Server Management!")
            print(func)
            MsgC(color_red, "There was an Error Executing the Loading Package")
            MsgC(color_red, "Send this to the Server Management")
            MsgC(color_red, func)
        end
    else
        print("Got No Loading Informations for a received Loading Package!")
    end
end)

net.Receive("Package", function(len, ply)
    local funcinfo = net.ReadString()
    local data = _RDS.ReadCTable()
    local func = CompileString("local data = ... ".. funcinfo, "PackageLoad", false)
    if isfunction(func) then
        func(data)
    else
        func = "Error in Loading Single Package printing Error Message: "..func
        print("There was an Error Executing a Single Loading Package")
        print("Send this to the Server Management!")
        print(func)
        MsgC(color_red, "There was an Error Executing a Single Loading Package")
        MsgC(color_red, "Send this to the Server Management")
        MsgC(color_red, func)
    end
end)

hook.Add("InitPostEntity", "Start Loading", function()
    net.Start("LoadingInfo")
    net.SendToServer() 
end)

