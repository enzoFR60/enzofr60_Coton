-- Fast DL

-- Png
resource.AddFile( "materials/enzofr60_coton/icon_seau.png" )
resource.AddFile( "materials/enzofr60_coton/icon_money.png" )
resource.AddFile( "materials/enzofr60_coton/icon_coton_machine.png" )
resource.AddFile( "materials/enzofr60_coton/icon_coton.png" )

-- Server

util.AddNetworkString("AtilaEnzoFR60Coton:OpenMenu")

util.AddNetworkString("AtilaEnzoFR60Coton:TraitementPull")
util.AddNetworkString("AtilaEnzoFR60Coton:TraitementJean")

net.Receive("AtilaEnzoFR60Coton:TraitementPull", function( len, Ply )
		local machinecoton = net.ReadEntity()
		if not IsValid(machinecoton) then return end
		if not IsValid(Ply) then return end
		
		if machinecoton.CanUse then
			if (machinecoton:GetNWInt('coton') >= enzoFR60.Atila.Coton.Config.BP) then
				machinecoton:SetNWInt('timer', CurTime() + enzoFR60.Atila.Coton.Config.TP)
				machinecoton:SetNWInt('coton', machinecoton:GetNWInt("coton")- enzoFR60.Atila.Coton.Config.BP )
				machinecoton.CanUse = false
				if not IsValid(Ply) then return end
				DarkRP.notify( Ply, 0, 4, "La machine est en route !" )
				machinecoton:SetNWInt('ercoton', "Pull" )
				machinecoton:SetNWInt("state", "En Route")
				machinecoton.sound = CreateSound(machinecoton, Sound("ambient/machines/machine3.wav"))
				machinecoton.sound:SetSoundLevel(75)
				machinecoton.sound:PlayEx(1, 75)
				timer.Simple(enzoFR60.Atila.Coton.Config.TP, function() 
					if not IsValid(machinecoton) then return end
					if not IsValid(Ply) then return end
					machinecoton.CanUse = true 
					DarkRP.notify( Ply, 0, 4, "Votre pull est fini !" )
					
					local price = math.random(enzoFR60.Atila.Coton.Config.MinP,enzoFR60.Atila.Coton.Config.MaxP);
					
					local ent = ents.Create( "ati_coton_pull" )
					if (  !IsValid( ent ) ) then return end
					ent:SetPos( machinecoton:GetPos()+Vector(85,-60,-30) )
					ent:SetNWInt("price", price)
					ent:Spawn()
					machinecoton:SetNWInt("state", "Eteint")
					machinecoton:SetNWInt('ercoton', "" )
					machinecoton.sound:Stop()
				end)
		else
			if not IsValid(Ply) then return end
			DarkRP.notify( Ply, 0, 4, "Il manque du coton ! Besoins : ".. enzoFR60.Atila.Coton.Config.BP )
		end
		else
			if not IsValid(Ply) then return end
			DarkRP.notify( Ply, 0, 4, "La machine est deja en route!" )
		end
		
end)

net.Receive("AtilaEnzoFR60Coton:TraitementJean", function( len, Ply )
		local machinecoton = net.ReadEntity()
		if not IsValid(machinecoton) then return end
		if not IsValid(Ply) then return end
		
		if machinecoton.CanUse then
		if (machinecoton:GetNWInt('coton') >= enzoFR60.Atila.Coton.Config.BJ) then
			machinecoton:SetNWInt('timer', CurTime() + enzoFR60.Atila.Coton.Config.TJ)
			machinecoton:SetNWInt('coton', machinecoton:GetNWInt("coton")- enzoFR60.Atila.Coton.Config.BJ )
			machinecoton.CanUse = false
			machinecoton:SetNWInt('ercoton', "Jean" )
			if not IsValid(Ply) then return end
			DarkRP.notify( Ply, 0, 4, "La machine est en route !" )
			machinecoton:SetNWInt("state", "En Route")
			machinecoton.sound = CreateSound(machinecoton, Sound("ambient/machines/machine3.wav"))
			machinecoton.sound:SetSoundLevel(75)
			machinecoton.sound:PlayEx(1, 75)
			timer.Simple(enzoFR60.Atila.Coton.Config.TJ, function() 
				if not IsValid(machinecoton) then return end
				if not IsValid(Ply) then return end
				machinecoton.CanUse = true 
				DarkRP.notify( Ply, 0, 4, "Votre jean est fini !" )
				
				local price = math.random(enzoFR60.Atila.Coton.Config.MinJ,enzoFR60.Atila.Coton.Config.MaxJ);
				
				local ent = ents.Create( "ati_coton_jean" )
				if (  !IsValid( ent ) ) then return end
				ent:SetPos( machinecoton:GetPos()+Vector(85,-60,-30) )
				ent:SetNWInt("price", price)
				ent:Spawn()
				machinecoton:SetNWInt("state", "Eteint")
				machinecoton:SetNWInt('ercoton', "" )
				machinecoton.sound:Stop()
			end)
		else
			if not IsValid(Ply) then return end
			DarkRP.notify( Ply, 0, 4, "Il manque du coton ! Besoins : ".. enzoFR60.Atila.Coton.Config.BJ )
		end
		else
			if not IsValid(Ply) then return end
			DarkRP.notify( Ply, 0, 4, "La machine est deja en route!" )
		end
end)
