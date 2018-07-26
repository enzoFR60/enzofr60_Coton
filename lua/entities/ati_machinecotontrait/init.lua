AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

include("autorun/sh_configcoton.lua")

function ENT:Initialize()
	self:SetModel("models/codeandmodeling_atila_machinetisser/codeandmodeling_atila_machinetisser.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)	
	self:SetUseType(SIMPLE_USE)
	local phys = self:GetPhysicsObject()
	phys:Wake()
	self.damage = 100
	self:SetNWInt("ercoton", "")
	self:SetNWInt("coton", 0)
	self:SetNWInt("besoin_pcoton", enzoFR60.Atila.Coton.Config.BP)
	self:SetNWInt("besoin_jcoton", enzoFR60.Atila.Coton.Config.BJ)
	self:SetNWInt("state", "Eteint")
	self:SetNWInt("width", 60)
	self.CanUse = true
	
	self.jailWall = true
end

function ENT:SpawnFunction(ply, trace)
	local ent = ents.Create("ati_machinecotontrait");
	if not IsValid(ent) then return end
	ent:SetPos(trace.HitPos + trace.HitNormal * 63);
	ent:Spawn();
	ent:Activate();    
	return ent;
end;

function ENT:Use(activator, caller)
	if not IsValid(self) then return end
	if not IsValid(caller) then return end
	local curTime = CurTime();
	if (!self.nextUse or curTime >= self.nextUse) then
		if enzoFR60.Atila.Coton.Config.TeamAcces[ team.GetName( caller:Team() ) ] then
			if SERVER then
				net.Start( "AtilaEnzoFR60Coton:OpenMenu" )
				net.WriteEntity( self )
				net.Send( caller )
			end
		end
	end
end


function ENT:OnTakeDamage(dmg)
	self.damage = self.damage - dmg:GetDamage()
	if (self.damage <= 0) then
		self:Remove()
	end
end

function ENT:Touch(hitEnt)
	if not IsValid(hitEnt) then return end
	
	if self.CanUse then
		if (hitEnt:GetClass() == "ati_bacacoton_1coton") then
			if (hitEnt:GetNWInt("coton") > 0) && (self:GetNWInt("coton") < 10) then
				hitEnt:SetNWInt("coton", hitEnt:GetNWInt("coton")-1)
				hitEnt:Remove();
				self:SetNWInt("coton", 1+self:GetNWInt("coton"))
			end;
		end
	end
end

function ENT:OnTakeDamage(dmg)
	self.damage = self.damage - dmg:GetDamage()
	if (self.damage <= 100) then
		self:Remove()
	end
end

function ENT:OnRemove()
	if not IsValid(self) then return end
end