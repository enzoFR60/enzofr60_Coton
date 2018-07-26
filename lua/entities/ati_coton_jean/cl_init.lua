include("shared.lua");

function ENT:Initialize()	

end;


function ENT:Draw()
    self.Entity:DrawModel()

	local alpha = (LocalPlayer():GetPos():Distance(self:GetPos()) / 300)

	alpha = math.Clamp(1.75 - alpha, 0 ,1)
	
	local eye = LocalPlayer():EyeAngles()
	local Pos = self:LocalToWorld( self:OBBCenter() )+Vector( 0, 0, 55 )
	local Ang = Angle( 0, eye.y - 90, 90 )

	if LocalPlayer():GetPos():Distance(self:GetPos()) < enzoFR60.Atila.Coton.Config.DistanceAffichage then
	
		cam.Start3D2D(Pos + Vector( 0, 0, math.sin( CurTime() ) * 2 ), Ang, 0.12)

				surface.SetDrawColor( 255, 255, 255, 255 * alpha )
			
				surface.SetMaterial( Material( "enzofr60_coton/icon_money.png" ) )
			
				surface.DrawTexturedRect( -40, 90, 90, 90 )
				
				draw.SimpleTextOutlined( "Prix : "..self:GetNWInt("price").."€", "AtilaCotonEnzo", -50, 180, Color(255,255,255,255* alpha), 0, 0, 1, Color(0,0,0,255* alpha) )
	
		cam.End3D2D()
	end

end

