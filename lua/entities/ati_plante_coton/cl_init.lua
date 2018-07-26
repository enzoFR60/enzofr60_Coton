include("shared.lua")

surface.CreateFont("AtilaCotonEnzo", {
	font      = "Tahoma",
	size      = 30,
	weight    = 800,
	blursize  = 0,
	scanlines = 0,
	antialias = false,
	underline = false,
	italic    = false,
	strikeout = false,
	symbol    = false,
	rotary    = false,
	shadow    = false,
	additive  = false,
	outline   = false
})

function ENT:Draw()
	self:DrawModel()
	
	local alpha = (LocalPlayer():GetPos():Distance(self:GetPos()) / 300)

	alpha = math.Clamp(1.75 - alpha, 0 ,1)
	
	local eye = LocalPlayer():EyeAngles()
	local Pos = self:LocalToWorld( self:OBBCenter() )+Vector( 0, 0, 55 )
	local Ang = Angle( 0, eye.y - 90, 90 )

	if LocalPlayer():GetPos():Distance(self:GetPos()) < enzoFR60.Atila.Coton.Config.DistanceAffichage then
	
		cam.Start3D2D(Pos + Vector( 0, 0, math.sin( CurTime() ) * 2 ), Ang, 0.12)

				surface.SetDrawColor( 255, 255, 255, 255 * alpha )
			
				surface.SetMaterial( Material( "enzofr60_coton/icon_coton.png" ) )
			
				surface.DrawTexturedRect( -40, 90, 90, 90 )
				
				if self:GetNWInt("health") >= 1 then
					draw.SimpleTextOutlined( "Vie : "..self:GetNWInt("health") .."%", "AtilaCotonEnzo", -70, 180, Color(255,255,255,255* alpha), 0, 0, 1, Color(0,0,0,255* alpha) )
				elseif self:GetNWInt("health") <= 0 then
					local TIMER;
					if (self:GetNWInt("timer_coton") < CurTime()) then
						TIMER = 0
					else 
						TIMER = self:GetNWInt("timer_coton")-CurTime()
					end
					draw.SimpleTextOutlined( "Respawn dans "..string.ToMinutesSeconds(TIMER), "AtilaCotonEnzo", -140, 180, Color(255,255,255,255* alpha), 0, 0, 1, Color(0,0,0,255* alpha) )
				end
	
		cam.End3D2D()
	end
end
