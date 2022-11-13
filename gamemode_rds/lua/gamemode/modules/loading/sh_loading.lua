
Yolo = Yolo or {}
Yolo.Loading = Yolo.Loading or {}

function Yolo.Loading.WriteLoading(maxpackages, tbl, first)
    net.WriteInt(maxpackages, 5)
    net.WriteCompressedTable(tbl)
    net.WriteBool(first)
end

function Yolo.Loading.ReadLoading()
    return net.ReadInt(5), _RDS.ReadCTable(), net.ReadBool()
end
