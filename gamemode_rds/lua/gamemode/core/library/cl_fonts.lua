
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
	_RDS:CreateFont("RDS.UI.Closebutton","Arial",ScrH()*0.035)
    _RDS:CreateFont("RDS.Admin.Title","Arial",ScrH()*0.090)
    _RDS:CreateFont("RDS.Admin.btn","Arial",ScrH()*0.060)
    _RDS:CreateFont("RDS.Admin.btnply","Arial",ScrH()*0.040)
    _RDS:CreateFont("RDS.Admin.Configsmall","Arial",ScrH()*0.020)
    // qsys 
    _RDS:CreateFont("RDSRP.QeSt.MainTitle","Arial",ScrH()*0.070)
    _RDS:CreateFont("RDSRP.QeSt.QuestTitle","Arial",ScrH()*0.040)
    _RDS:CreateFont("RDSRP.QeSt.Quest","Arial",ScrH()*0.035)
    _RDS:CreateFont("RDSRP.QeSt.Ent","Arial",ScrH()*0.5)

	// ADVTrain
	_RDS:CreateFont("RDS.AdvTrain.Title","Arial",ScrH()*0.035)
	_RDS:CreateFont("RDS.AdvTrain.informations","Arial",ScrH()*0.035)
	_RDS:CreateFont("RDS.AdvTrain.Weapontitle","Arial",ScrH()*0.065)

	// Escape
	_RDS:CreateFont("RDS.ESCmenu.Title","SF Theramin Gothic",ScrH()*0.055)
	--_RDS:CreateFont("RDS.ESCmenu.graytitle","Aurebesh",ScrH()*0.025)

	// bindsys
	_RDS:CreateFont("RDSRP.bsys.bindtitle","Arial",ScrH()*0.070)
	_RDS:CreateFont("RDSRP.bsys.bindertitle","Arial",ScrH()*0.030)



	// Normaly
	_RDS:CreateFont("RDSRP.15","Arial",ScrH()*0.015)
	_RDS:CreateFont("RDSRP.20","Arial",ScrH()*0.020)
	_RDS:CreateFont("RDSRP.25","Arial",ScrH()*0.025)


	// Settings
	_RDS:CreateFont("RDSRP.Settings.Title","Arial",ScrH()*0.055)

	surface.CreateFont( "RDS.ESCmenu.graytitle", { 
		font = "Aurebesh", 
		size = ScrH() * 0.025, 
		weight = 100, 
		antialias = true, 
		bold = true 
	 } )
	