include("shared.lua")

surface.CreateFont("AtiCotonMachine", {
	font = "Arial",
	size = 30,
	weight = 600,
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
});

surface.CreateFont("AtiCotonMachine2", {
	font = "Arial",
	size = 20,
	weight = 600,
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
});

function ENT:Initialize ()

end

function ENT:Draw()
	self:DrawModel()
	
	local alpha = (LocalPlayer():GetPos():Distance(self:GetPos()) / 300)

	alpha = math.Clamp(1.75 - alpha, 0 ,1)
	
	local eye = LocalPlayer():EyeAngles()
	local Pos = self:LocalToWorld( self:OBBCenter() )+Vector( 0, 0, 20 )
	local Ang = Angle( 0, eye.y - 90, 90 )

	if LocalPlayer():GetPos():Distance(self:GetPos()) < enzoFR60.Atila.Coton.Config.DistanceAffichage then
	
		cam.Start3D2D(Pos + Vector( 0, 0, math.sin( CurTime() ) * 2 ), Ang, 0.12)

				surface.SetDrawColor( 255, 255, 255, 255 * alpha )
			
				surface.SetMaterial( Material( "enzofr60_coton/icon_coton_machine.png" ) )
			
				surface.DrawTexturedRect( -40, 90, 90, 90 )
				
		cam.End3D2D()
	end

	local Pos = self:GetPos()
	local Ang = self:GetAngles()

	local TIMER;
	local width = self:GetNWInt("width");
	if (self:GetNWInt('timer') < CurTime()) then
		TIMER = 0
	else 
		TIMER = self:GetNWInt('timer')-CurTime()
	end
	
	
	

	surface.SetFont("AtiCotonMachine2")
	local text4 = "Fabrication en cours:"
	local text5 = self:GetNWInt("ercoton")
	local TextWidth4 = surface.GetTextSize(text4)
	local TextWidth5 = surface.GetTextSize(text5)
	Ang:RotateAroundAxis(Ang:Up(), 90)
	Ang:RotateAroundAxis(Ang:Forward(), 90)
	local TextAng = Ang
	
	local color
	if (TIMER > 0) then
		color = {150, 50}
	else
		color = {0 ,150}
	end
	
	if LocalPlayer():GetPos():Distance(self:GetPos()) < enzoFR60.Atila.Coton.Config.DistanceAffichage then
	
		cam.Start3D2D(Pos+Ang:Right()*-60+Ang:Up()*59+Ang:Forward()*-28, Ang, 0.08)
			draw.RoundedBox( 10, 270, 1130, 180, 30, Color(0,0,0,color[2]) )
			draw.SimpleTextOutlined( "Temps: "..string.ToMinutesSeconds(TIMER), "AtiCotonMachine", 275, 1130, Color(255,255,255,255* alpha), 0, 0, 1, Color(0,0,0,150* alpha) )
		cam.End3D2D()
	
	
		cam.Start3D2D(Pos+Ang:Right()*-60+Ang:Up()*60.6+Ang:Forward()*-35, Ang, 0.08)
			draw.RoundedBox( 10, -450, 1100, TextWidth4+60, 150, Color(0,0,0,150) )
			draw.SimpleTextOutlined( text4, "AtiCotonMachine2", -410, 1100, Color(30,183,25,118* alpha), 0, 0, 1, Color(0,0,0, 118* alpha) )
			draw.SimpleTextOutlined( text5, "AtiCotonMachine", -370, 1130, Color(255,255,255,255* alpha), 0, 0, 1, Color(0,0,0, 255* alpha) )
		
			draw.SimpleTextOutlined( "Etat :", "AtiCotonMachine", -360, 1170, Color(30,183,25,118* alpha), 0, 0, 1, Color(0,0,0) )
			if self:GetNWInt("state") == "Eteint" then
			draw.SimpleTextOutlined( self:GetNWInt("state"), "AtiCotonMachine", -430, 1200, Color(255,0,0,255* alpha), 0, 0, 1, Color(0,0,0, 255* alpha) )
			elseif self:GetNWInt("state") == "En Route" then
			draw.SimpleTextOutlined( self:GetNWInt("state"), "AtiCotonMachine", -430, 1200, Color(0,219,18,255* alpha), 0, 0, 1, Color(0,0,0, 255* alpha) )
			end
		cam.End3D2D()
	end
end
