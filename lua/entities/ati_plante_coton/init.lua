AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/codeandmodeling_atila_cotton_champ/codeandmodeling_atila_cotton_champ.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	phys:Wake()
	self.ReplaceSystem = true
	self:SetNWInt("health", 100)
end

function ENT:Think()
	if self.ReplaceSystem == true and (self:GetNWInt("health") <= 0)  then
		if not IsValid(self) then return end
		self.ReplaceSystem = false
		self:SetMaterial("Models/effects/vol_light001");
		self:SetCollisionGroup(10)
		self:SetNWInt("timer_coton", CurTime() + enzoFR60.Atila.Coton.Config.SpawnPlantesCotonTime)
		
		for i= 1, enzoFR60.Atila.Coton.Config.SpawnPlantesCoton do
			if not IsValid(self) then return end
			local baccoton = ents.Create('ati_bacacoton_1coton')
			if not IsValid(baccoton) then return end
			baccoton:SetPos(self:GetPos()+Vector(0,0,30+ i*2 ))
			baccoton:Spawn()
		end
	end
	
	if self.ReplaceSystem == false and (self:GetNWInt("health") <= 0) then
		timer.Simple(enzoFR60.Atila.Coton.Config.SpawnPlantesCotonTime, function()
			if not IsValid(self) then return end
			self.ReplaceSystem = true
			self:SetMaterial()
			self:SetCollisionGroup(0)
			self:SetNWInt("health", 100)
		end)
	end
end

function ENT:OnRemove()
	if not IsValid(self) then return end
end

