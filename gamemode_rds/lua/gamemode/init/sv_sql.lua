--

_RDS.SQL = _RDS.SQL or {}


function _RDS.SQL:CreateTable()
    sql.Query("CREATE TABLE _RDS_PlayerTable( ID NUMBER , Name TEXT , Steamid TEXT , Steamid64 TEXT, QSysVAR TEXT, LvlSys TEXT )" )
end
function _RDS.SQL:DeleteTable()
    sql.Query("DROP TABLE _RDS_PlayerTable" )
end

_RDS.SQL:CreateTable()