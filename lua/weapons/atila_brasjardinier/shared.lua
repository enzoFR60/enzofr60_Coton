if SERVER then
	AddCSLuaFile("shared.lua")
end

if CLIENT then
	SWEP.PrintName 			= "Gants spécial jardinerie"
	SWEP.Slot				= 4
	SWEP.SlotPos 			= 1
	SWEP.DrawAmmo 			= false
	SWEP.DrawCrosshair 		= false
	SWEP.HoldType = 		"pistol"
end

SWEP.Author = "Atila, enzoFR60"
SWEP.Category = "Cultivateur De Coton"
SWEP.Instructions 			= ""

SWEP.Spawnable 				= true
SWEP.AdminSpawnable 		= true

SWEP.Primary.ClipSize 		= -1
SWEP.Primary.DefaultClip 	= 0
SWEP.Primary.Automatic 		= true
SWEP.Primary.Ammo 			= ""

SWEP.Secondary.ClipSize 	= -1
SWEP.Secondary.DefaultClip 	= 0
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo 		= ""

SWEP.DrawAmmo				= false
SWEP.DrawWeaponInfoBox		= false

SWEP.BounceWeaponIcon   	= false
SWEP.DrawCrosshair			= false
SWEP.Weight					= 30

SWEP.HoldType = "pistol"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.UseHands = false
SWEP.ViewModel = "models/weapons/c_pistol.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false
SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_Spine4"] = { scale = Vector(1, 1, 1), pos = Vector(-1, 0, -30), angle = Angle(0, 0, -10) }
}

function SWEP:Initialize()
	self:SetWeaponHoldType("pistol")
	self:SendWeaponAnim(ACT_VM_HOLSTER);
end

function SWEP:PrimaryAttack()
	if not IsValid(self.Owner) then return end
	self:SetNextPrimaryFire( CurTime() + 0.5 )
	if enzoFR60.Atila.Coton.Config.TeamAcces[ team.GetName( self.Owner:Team() ) ]  then
		local trace = self.Owner:GetEyeTrace().Entity
		if trace:GetClass() == "ati_plante_coton" and trace:GetNWInt("health") >= 1 then
			trace:SetNWInt("health", trace:GetNWInt("health")-10)
		end
	end
end