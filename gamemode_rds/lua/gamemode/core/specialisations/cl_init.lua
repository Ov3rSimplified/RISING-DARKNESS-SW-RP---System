--

concommand.Add("AddSWhitelist", function(ply, cmd, args)
    local basetbl = _RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets

    local tbl = {
        [tonumber(args[1])] = {
            access = true,
            what = {
                [tostring(args[3])] = true
            }
        }
    }
    table.Merge(_RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets[tostring(args[2])].whitelist, tbl )
    net.Start("RDSRP.IConfig.Load")
    _RDS.WriteCTable(_RDS.Admin.IConfig)
    net.SendToServer()
end)

concommand.Add("DeleteSWhitelist", function(ply, cmd, args)
    local basetbl = _RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets

    _RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets[args[2]].whitelist[tonumber(args[1])].access = false
    net.Start("RDSRP.IConfig.Load")
    _RDS.WriteCTable(_RDS.Admin.IConfig)
    net.SendToServer()

end)


concommand.Add("AddSFocus", function(ply, cmd, args)
    local basetbl = _RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets

    local tbl = {
        [args[3]] = true,
    } 

    table.Merge(_RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets[args[2]].whitelist[tonumber(args[1])].what, tbl )
    net.Start("RDSRP.IConfig.Load")
    _RDS.WriteCTable(_RDS.Admin.IConfig)
    net.SendToServer()
end)


concommand.Add("DeleteSFocus", function(ply, cmd, args)
    local basetbl = _RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets

    _RDS.Admin.IConfig["Specialisation"].Core.Specialisationpakets[args[2]].whitelist[tonumber(args[1])].what[args[3]] = nil
    net.Start("RDSRP.IConfig.Load")
    _RDS.WriteCTable(_RDS.Admin.IConfig)
    net.SendToServer()
end)

  
PrintTable(_RDS.Admin.IConfig["Specialisation"].Core)  