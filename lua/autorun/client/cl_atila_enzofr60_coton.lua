--[[-------------------------------------------------------------------------
	Blur
---------------------------------------------------------------------------]]

local blur = Material("pp/blurscreen")
local function DrawBlur( p, a, d )
	local x, y = p:LocalToScreen( 0, 0 )
	
	surface.SetDrawColor( 255, 255, 255 )
	surface.SetMaterial( blur )
	
	for i = 1, d do
		blur:SetFloat( "$blur", (i / d ) * ( a ) )
		blur:Recompute()
		
		render.UpdateScreenEffectTexture()
		
		surface.DrawTexturedRect( x * -1, y * -1, ScrW(), ScrH() )
	end
end

--[[-------------------------------------------------------------------------
	Menu Coton
---------------------------------------------------------------------------]]

net.Receive( "AtilaEnzoFR60Coton:OpenMenu", function()
	Timestampv = os.time()
	TimeStringp = os.date( "%H Heures %M Minutes" , Timestampv )
	
	local machinecoton = net.ReadEntity()
	
	local ply = LocalPlayer()
	
	if ( !IsValid( ply ) ) then return -1 end
	
	local Base = vgui.Create( "DFrame" )
	Base:SetSize( 500, 220 )
	Base:Center()
	Base:SetTitle( "Bonjour "..LocalPlayer():GetName()..", Il est "..TimeStringp )
	Base:SetDraggable( true )
	Base:ShowCloseButton( false )
	Base:MakePopup()
	Base.Paint = function( self, w, h )
		DrawBlur( self, 6, 30 )
		draw.RoundedBox( 6, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
		draw.RoundedBox( 1, 0, 0, w, 25, Color( 0, 0, 0, 80 ) )   
		draw.RoundedBox( 1, 0, 25, w, 1, Color( 0, 0, 0, 80 ) ) 
	end
	
	local BaseTemps = vgui.Create( "DForm", Base )
		BaseTemps:SetPos( 25, 50 )
		BaseTemps:SetSize( 450, 0 )
		BaseTemps:SetSpacing( 2 )
		if machinecoton:GetNWInt("coton") == 0 or machinecoton:GetNWInt("coton") == 1 then
		BaseTemps:SetName( "Machine A Tissu, Coton : "..machinecoton:GetNWInt("coton") )
		elseif machinecoton:GetNWInt("coton") > 1 then
		BaseTemps:SetName( "Machine A Tissu, Cotons : "..machinecoton:GetNWInt("coton") )
		end
		BaseTemps.Paint = function()
		end
	
	local btn1 = vgui.Create( "DButton", Base )
	btn1:SetSize( 240, 25 )
	btn1:SetPos( 125, Base:GetTall() - 60 )
	btn1:SetText( "Fabriquer Un pull, Besoins : "..enzoFR60.Atila.Coton.Config.BP )
	btn1:SetFont( 'Trebuchet24' )
	btn1:SetTextColor(  Color( 255, 255, 255, 200 ) )
	btn1.OnCursorEntered = function( self ) self.hover = true surface.PlaySound("UI/buttonrollover.wav") end
	btn1.OnCursorExited = function( self ) self.hover = false end
	btn1.Slide = 0
	btn1.Paint = function( self, w, h )
		if self.hover then
			self.Slide = Lerp( 0.05, self.Slide, w )

			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 0, 255, 250, 200 ) )
		else
			self.Slide = Lerp( 0.05, self.Slide, 0 )
			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 0, 255, 250, 200 ) )
		end
		
		surface.SetDrawColor( 0, 255, 250, 200 )
		surface.DrawOutlinedRect( 0, 0, btn1:GetWide(), btn1:GetTall() ) 
	end	
	btn1.DoClick = function()
		net.Start( "AtilaEnzoFR60Coton:TraitementPull" )
		net.WriteEntity( machinecoton )
		net.SendToServer()
		Base:Remove()
	end
	
	local btn3 = vgui.Create( "DButton", Base )
	btn3:SetSize( 240, 25 )
	btn3:SetPos( 125, Base:GetTall() - 60 )
	btn3:SetText( "Fabriquer Un Jean, Besoins : "..enzoFR60.Atila.Coton.Config.BJ)
	btn3:SetFont( 'Trebuchet24' )
	btn3:SetTextColor(  Color( 255, 255, 255, 200 ) )
	btn3.OnCursorEntered = function( self ) self.hover = true surface.PlaySound("UI/buttonrollover.wav") end
	btn3.OnCursorExited = function( self ) self.hover = false end
	btn3.Slide = 0
	btn3.Paint = function( self, w, h )
		if self.hover then
			self.Slide = Lerp( 0.05, self.Slide, w )

			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 0, 255, 250, 200 ) )
		else
			self.Slide = Lerp( 0.05, self.Slide, 0 )
			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 0, 255, 250, 200 ) )
		end
		
		surface.SetDrawColor( 0, 255, 250, 200 )
		surface.DrawOutlinedRect( 0, 0, btn3:GetWide(), btn3:GetTall() ) 
	end	
	btn3.DoClick = function()
		net.Start( "AtilaEnzoFR60Coton:TraitementJean" )
		net.WriteEntity( machinecoton )
		net.SendToServer()
		Base:Remove()
	end
 
	BaseTemps:AddItem( btn1 )
	BaseTemps:AddItem( btn3 )
	
	local closeButton = vgui.Create("DButton", Base)
		closeButton:SetPos(Base:GetSize() -30, 2)
		closeButton:SetSize(23, 20)
		closeButton:SetText("")
		closeButton.Colors = Color(0,0,0)
		closeButton.Paint = function(w , h)
			draw.SimpleText("x", "Trebuchet24", closeButton:GetWide()/2, -3, color_white, TEXT_ALIGN_CENTER)
		end
		closeButton.DoClick = function()
			Base:Remove()
	end  
end)
