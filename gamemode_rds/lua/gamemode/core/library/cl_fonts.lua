
function _RDS:CreateFont(name,font,size)
	if CLIENT then 
		surface.CreateFont( name, {
			font = "Arial",
			extended = false,
			size = size,
			weight = 1000,
			blursize = 0,
			scanlines = 0,
			antialias = true,
			underline = false,
			italic = false,
			strikeout = false,
			symbol = false,
			rotary = false,
			shadow = false,
			additive = false,
			outline = false,
		} )
	end
end



    
    // Admin
    _RDS:CreateFont("RDS.Admin.Title","Arial",ScrH()*0.090)
    _RDS:CreateFont("RDS.Admin.btn","Arial",ScrH()*0.060)
    _RDS:CreateFont("RDS.Admin.btnply","Arial",ScrH()*0.040)
    _RDS:CreateFont("RDS.Admin.Configsmall","Arial",ScrH()*0.020)
    // qsys 
    _RDS:CreateFont("RDSRP.QeSt.MainTitle","Arial",ScrH()*0.070)
    _RDS:CreateFont("RDSRP.QeSt.QuestTitle","Arial",ScrH()*0.040)
    _RDS:CreateFont("RDSRP.QeSt.Quest","Arial",ScrH()*0.035)
    _RDS:CreateFont("RDSRP.QeSt.Ent","Arial",ScrH()*0.5)

	//

    _RDS:CreateFont("RDSRP.Com.MainTitle","Arial",ScrH()*0.070)
	_RDS:CreateFont("RDSRP.Com.ComTitle","Arial",ScrH()*0.040)


