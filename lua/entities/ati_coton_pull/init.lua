AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");
include("shared.lua");

function ENT:Initialize()
	self:SetModel("models/codeandmodeling_atila_pull/codeandmodeling_atila_pull.mdl");
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)	
	self:SetUseType(SIMPLE_USE)
	local phys = self:GetPhysicsObject()
	phys:Wake()
end;

function ENT:Use(activator, caller)
	local curTime = CurTime();
		if (!self.nextUse or curTime >= self.nextUse) then
				if not IsValid(self) then return end
				if not IsValid(caller) then return end
				activator:addMoney(self:GetNWInt("price"))
				activator:SendLua("local tab = {Color(255,255,255), [[Voici ton pull]],  Color(255,255,255), [[,]], Color(255,255,255),[[ Tu à reçu "..math.Round(self:GetNWInt("price")).."€ ]], Color(128, 255, 128) } chat.AddText(unpack(tab))");
				self:Remove();
			self.nextUse = curTime + 1;
		end;
end;


function ENT:OnTakeDamage(dmginfo)
	self:Remove();
end;

