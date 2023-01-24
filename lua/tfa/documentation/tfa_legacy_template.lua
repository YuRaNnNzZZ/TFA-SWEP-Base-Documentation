
-- TFA Base Template by TFA Base Devs

-- To the extent possible under law, the person who associated CC0 with
-- TFA Base Template has waived all copyright and related or neighboring rights
-- to TFA Base Template.

-- You should have received a copy of the CC0 legalcode along with this
-- work.  If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.



-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! --
-- !                                                               ! --
-- !   WARNING! This template is outdated, not supported anymore   ! --
-- !     and is only kept in for reference/comparison reasons.     ! --
-- !                                                               ! --
-- !                Please use the updated template                ! --
-- !      located at lua/weapons/tfa_base_template/shared.lua      ! --
-- !            for future weapon development purposes.            ! --
-- !                                                               ! --
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! --



SWEP.Base               = "tfa_gun_base"
SWEP.Category               = "TFA Template" -- The category.  Please, just choose something generic or something I've already done if you plan on only doing like one swep..
SWEP.Manufacturer = nil -- Gun Manufactrer (e.g. Hoeckler and Koch )
SWEP.Author             = "" -- Author Tooltip
SWEP.Contact                = "" -- Contact Info Tooltip
SWEP.Purpose                = "" -- Purpose Tooltip
SWEP.Instructions               = "" -- Instructions Tooltip
SWEP.Spawnable              = false -- Can you, as a normal user, spawn this?
SWEP.AdminSpawnable         = false -- Can an adminstrator spawn this?  Does not tie into your admin mod necessarily, unless its coded to allow for GMod's default ranks somewhere in its code.  Evolve and ULX should work, but try to use weapon restriction rather than these.
SWEP.DrawCrosshair          = true      -- Draw the crosshair?
SWEP.DrawCrosshairIS = false -- Draw the crosshair in ironsights?
SWEP.PrintName              = "TFA Base Template"       -- Weapon name (Shown on HUD)
SWEP.Slot               = 2             -- Slot in the weapon selection menu.  Subtract 1, as this starts at 0.
SWEP.SlotPos                = 73            -- Position in the slot
SWEP.AutoSwitchTo           = true      -- Auto switch to if we pick it up
SWEP.AutoSwitchFrom         = true      -- Auto switch from if you pick up a better weapon
SWEP.Weight             = 30            -- This controls how "good" the weapon is for autopickup.

-- [[WEAPON HANDLING]] --
SWEP.Primary.Sound = Sound("") -- This is the sound of the weapon, when you shoot.
SWEP.Primary.SilencedSound = nil -- This is the sound of the weapon, when silenced.
SWEP.Primary.PenetrationMultiplier = 1 -- Change the amount of something this gun can penetrate through
-- the LESSER this value is, the BETTER is penetration
-- this is basically multiplier for next values
-- you don't need to uncomment these if you are not going to modify them!
--[[
SWEP.PenetrationMaterials = {
	[MAT_DEFAULT] = 1,
	[MAT_VENT] = 0.4, --Since most is aluminum and stuff
	[MAT_METAL] = 0.6, --Since most is aluminum and stuff
	[MAT_WOOD] = 0.2,
	[MAT_PLASTIC] = 0.23,
	[MAT_FLESH] = 0.48,
	[MAT_CONCRETE] = 0.87,
	[MAT_GLASS] = 0.16,
	[MAT_SAND] = 1,
	[MAT_SLOSH] = 1,
	[MAT_DIRT] = 0.95, --This is plaster, not dirt, in most cases.
	[MAT_FOLIAGE] = 0.9
}
]]

SWEP.Primary.Damage = 0.01 -- Damage, in standard damage points.
SWEP.Primary.DamageTypeHandled = true -- true will handle damagetype in base
SWEP.Primary.DamageType = nil -- See DMG enum.  This might be DMG_SHOCK, DMG_BURN, DMG_BULLET, etc.  Leave nil to autodetect.  DMG_AIRBOAT opens doors.
SWEP.Primary.Force = nil -- Force value, leave nil to autocalc
SWEP.Primary.Knockback = nil -- Autodetected if nil; this is the velocity kickback
SWEP.Primary.HullSize = 0 -- Big bullets, increase this value.  They increase the hull size of the hitscan bullet.
SWEP.Primary.NumShots = 1 -- The number of shots the weapon fires.  SWEP.Shotgun is NOT required for this to be >1.
SWEP.Primary.Automatic = true -- Automatic/Semi Auto
SWEP.Primary.RPM = 600 -- This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Semi = nil -- RPM for semi-automatic or burst fire.  This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Burst = nil -- RPM for burst fire, overrides semi.  This is in Rounds Per Minute / RPM
SWEP.Primary.DryFireDelay = nil -- How long you have to wait after firing your last shot before a dryfire animation can play.  Leave nil for full empty attack length.  Can also use SWEP.StatusLength[ ACT_VM_BLABLA ]
SWEP.Primary.BurstDelay = nil -- Delay between bursts, leave nil to autocalculate

SWEP.Primary.LoopSound = nil -- Looped fire sound, unsilenced
SWEP.Primary.LoopSoundSilenced = nil -- Looped fire sound, silenced
SWEP.Primary.LoopSoundTail = nil -- Loop end/tail sound, unsilenced
SWEP.Primary.LoopSoundTailSilenced = nil -- Loop end/tail sound, silenced
SWEP.Primary.LoopSoundAutoOnly = false -- Play loop sound for full-auto only? Fallbacks to Primary.Sound for semi/burst if true

-- WORLD/THIRDPERSON/NPC FIRING SOUNDS! Fallbacks to first person sound if not defined.

SWEP.Primary.Sound_World = nil -- This is the sound of the weapon, when you shoot.
SWEP.Primary.SilencedSound_World = nil -- This is the sound of the weapon, when silenced.

SWEP.Primary.LoopSound_World = nil -- Looped fire sound, unsilenced
SWEP.Primary.LoopSoundSilenced_World = nil -- Looped fire sound, silenced
SWEP.Primary.LoopSoundTail_World = nil -- Loop end/tail sound, unsilenced
SWEP.Primary.LoopSoundTailSilenced_World = nil -- Loop end/tail sound, silenced

SWEP.ViewModelPunchPitchMultiplier = nil -- Default value is 0.5
SWEP.ViewModelPunchPitchMultiplier_IronSights = nil -- Default value is 0.09

SWEP.ViewModelPunch_MaxVertialOffset = nil -- Default value is 3
SWEP.ViewModelPunch_MaxVertialOffset_IronSights = nil -- Default value is 1.95
SWEP.ViewModelPunch_VertialMultiplier = nil -- Default value is 1
SWEP.ViewModelPunch_VertialMultiplier_IronSights = nil -- Default value is 0.25

SWEP.ViewModelPunchYawMultiplier = nil -- Default value is 0.6
SWEP.ViewModelPunchYawMultiplier_IronSights = nil -- Default value is 0.25

SWEP.CanJam = true -- whenever weapon cam jam
SWEP.JamChance = 0.04 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.
-- Default value is 0.04 (4%)
-- Maxmial value is 1, means weapon will always jam when factor become 100
-- Also remember that there is a minimal factor before weapon can jam
-- This number is not treated "as-is" but as basic value that needs to be concluded as chance
-- You don't really need to cry over it and trying to balance it, TFA Base will do the job for you
-- (TFA Base will calculate the best value between 0 and JamChance based on current JamFactor of the weapon)
SWEP.JamFactor = 0.06 -- How to increase jam factor after each shot.
-- When factor reach 100 it will mean that on each shot there will be SWEP.Primary.JamChance chance to jam
-- When factor reach 50 it will mean that on each shot there will be SWEP.Primary.JamChance / 2 chance to jam
-- and so on
-- Default value is 0.06, means weapon will jam with SWEP.Primary.JamChance chance right after 1666 shots

-- These settings are good for Assault Rifles, however, not good for anything else.
-- Suggested stats:

--[[
-- Pistols
SWEP.JamChance = 0.20
SWEP.JamFactor = 0.14
]]

--[[
-- Revolvers
SWEP.JamChance = 0.17
SWEP.JamFactor = 0.50
]]

--[[
-- Miniguns
SWEP.JamChance = 0.03
SWEP.JamFactor = 0.01
]]

--[[
-- Submachine gun
SWEP.JamChance = 0.04
SWEP.JamFactor = 0.09
]]

--[[
-- Auto shotguns
SWEP.JamChance = 0.15
SWEP.JamFactor = 0.2
]]

--[[
-- Pump-action shotguns
SWEP.JamChance = 0.25
SWEP.JamFactor = 0.3
]]

--[[
-- Sniper rifle
SWEP.JamChance = 0.17
SWEP.JamFactor = 0.35
]]

SWEP.FiresUnderwater = false
-- Miscelaneous Sounds
SWEP.IronInSound = nil -- Sound to play when ironsighting in?  nil for default
SWEP.IronOutSound = nil -- Sound to play when ironsighting out?  nil for default
-- Silencing
SWEP.CanBeSilenced = false -- Can we silence?  Requires animations.
SWEP.Silenced = false -- Silenced by default?
-- Selective Fire Stuff
SWEP.SelectiveFire = false -- Allow selecting your firemode?
SWEP.DisableBurstFire = false -- Only auto/single?
SWEP.OnlyBurstFire = false -- No auto, only burst/single?
SWEP.BurstFireCount = nil -- Burst fire count override (autocalculated by the clip size if nil)
SWEP.DefaultFireMode = "" -- Default to auto or whatev
SWEP.FireModeName = nil -- Change to a text value to override it
SWEP.FireSoundAffectedByClipSize = true -- Whenever adjuct pitch (and proably other properties) of fire sound based on current clip / maxclip
-- This is always false when either:
-- Weapon has no primary clip
-- Weapon's clip is smaller than 4 rounds
-- Weapon is a shotgun
-- Ammo Related
SWEP.Primary.ClipSize = 0 -- This is the size of a clip
SWEP.Primary.DefaultClip = 0 -- This is the number of bullets the gun gives you, counting a clip as defined directly above.
SWEP.Primary.Ammo = "none" -- What kind of ammo.  Options, besides custom, include pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, and AirboatGun.
SWEP.Primary.AmmoConsumption = 1 -- Ammo consumed per shot
-- Pistol, buckshot, and slam like to ricochet. Use AirboatGun for a light metal peircing shotgun pellets
SWEP.DisableChambering = false -- Disable round-in-the-chamber

-- Recoil Related
SWEP.Primary.KickUp = 0 -- This is the maximum upwards recoil (rise)
SWEP.Primary.KickDown = 0 -- This is the maximum downwards recoil (skeet)
SWEP.Primary.KickHorizontal = 0 -- This is the maximum sideways recoil (no real term)
SWEP.Primary.StaticRecoilFactor = 0.5 -- Amount of recoil to directly apply to EyeAngles.  Enter what fraction or percentage (in decimal form) you want.  This is also affected by a convar that defaults to 0.5.

-- Firing Cone Related
SWEP.Primary.Spread = .01 -- This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = .005 -- Ironsight accuracy, should be the same for shotguns

-- Unless you can do this manually, autodetect it.  If you decide to manually do these, uncomment this block and remove this line.
SWEP.Primary.SpreadMultiplierMax = nil -- How far the spread can expand when you shoot. Example val: 2.5
SWEP.Primary.SpreadIncrement = nil -- What percentage of the modifier is added on, per shot.  Example val: 1/3.5
SWEP.Primary.SpreadRecovery = nil -- How much the spread recovers, per second. Example val: 3

-- Range Related

-- DEPRECATED. Automatically converted to RangeFalloffLUT table
SWEP.Primary.Range = -1 -- The distance the bullet can travel in source units.  Set to -1 to autodetect based on damage/rpm.
SWEP.Primary.RangeFalloff = -1 -- The percentage of the range the bullet damage starts to fall off at.  Set to 0.8, for example, to start falling off after 80% of the range.

-- Use these if you don't want/understand how to use LUT below. These values are automatically converted to RangeFalloffLUT table
SWEP.Primary.FalloffMetricBased = false -- Set to true if you set up values below
SWEP.Primary.FalloffByMeter = nil -- How much damage points will bullet loose when travel
SWEP.Primary.MinRangeStartFalloff = nil -- How long will bullet travel in Meters before starting to lose damage?
SWEP.Primary.MaxFalloff = nil -- Maximal amount of damage to be lost

-- Use this for full control over damage dropoff.
--[[
SWEP.Primary.RangeFalloffLUT = {
	bezier = true, -- Whenever to use Bezier or not to interpolate points?
	-- you probably always want it to be set to true
	range_func = "quintic", -- function to spline range
	-- "linear" for linear splining.
	-- Possible values are "quintic", "cubic", "cosine", "sinusine", "linear" or your own function
	units = "meters", -- possible values are "inches", "inch", "hammer", "hu" (are all equal)
	-- everything else is considered to be meters
	lut = { -- providing zero point is not required
		-- without zero point it is considered to be as {range = 0, damage = 1}
		{range = 5, damage = 0.9},
		{range = 12, damage = 0.8},
		{range = 18, damage = 0.5},
		{range = 24, damage = 0.2},
		{range = 30, damage = 0.55},
		{range = 38, damage = 0.76},
		{range = 50, damage = 1},
		{range = 52, damage = 0.96},
		{range = 60, damage = 0.3},
		{range = 70, damage = 0.1},
	}
}
]]

SWEP.DisplayFalloff = nil -- Defaults to true (false for melees)

--[[
SWEP.Primary.RecoilLUT_IronSightsMult = nil -- Defaults to 0.5
-- controls how much effective LUT is when iron sighting
SWEP.Primary.RecoilLUT_AnglePunchMult = nil -- Defaults to 0.25
-- controls how much effective LUT at pushing EyeAngles of shooter
SWEP.Primary.RecoilLUT_ViewPunchMult = nil -- Defaults to 1
-- controls how much effective LUT at viewpunch

SWEP.Primary.RecoilLUT = {
	["in"] = {
		bezier = true,
		func = "quintic", -- function to inerpolate progress when sampling points from table
		-- Possible values are "quintic", "cubic", "cosine", "sinusine", "linear" or your own function
		cooldown_speed = 1, -- how much to loose progress when we are at this stage
		-- 1 means we lose entire progress in a second
		increase = 0.1, -- how much to increase progress after shot
		-- 0.1 means that this stage would be full after 10 shots
		wait = 0.1, -- how much time do we wait in seconds after we stopped shooting
		-- after this time, IN stage begin to cooldown until it reach zero

		-- table is always prepended with an Angle()
		-- only Pitch and Yaw are utilized
		-- sampled point is added to aimvector of player
		-- when they shoot
		points = {
			Angle(-1, 0.4),
			Angle(-4, -2),
			Angle(-6, -4),
			Angle(-10, -6),
		}
	},

	["loop"] = {
		bezier = true,
		func = "quintic",
		-- this stage can not cooldown, so no cooldown_speed is defined
		increase = 0.1, -- when LOOP stage reach 1, it is reset to 0
		wait = 0.1, -- how much time do we wait in seconds after we stopped shooting
		-- after this time, stage switch to OUT

		-- table is NOT prepended with an Angle()
		-- make sure it's starting point match the one from IN stage
		-- last and first points are connected automatically
		points = {
			Angle(-10, -6),
			Angle(-12, -0.4),
			Angle(-8, 9),
			Angle(-11, 12),
			Angle(-13, 2),
			Angle(-8, -4),
		}
	},

	["out"] = {
		bezier = true,
		func = "quintic",
		-- this stage is different
		-- it is only started after LOOP took place
		-- shooting in this stage will actually roll back it's state
		-- until it reach zero and switch back to LOOP
		-- cooling down actually increase stage's progress
		cooldown_speed = 1,
		-- increase act as negative number to reach zero in this stage
		increase = 0.2,

		-- after this stage reach 1, everything reset to IN and wait for next fire
		-- table is always appended with an Angle()

		-- starting point is dynamic
		-- and will always match current LOOP's one
		points = {
			Angle(-7, -2),
			Angle(-4, -1),
			Angle(-2, 0),
		}
	}
}
]]

-- Penetration Related
SWEP.MaxPenetrationCounter = 4 -- The maximum number of ricochets.  To prevent stack overflows.

-- Misc
SWEP.IronRecoilMultiplier = 0.5 -- Multiply recoil by this factor when we're in ironsights.  This is proportional, not inversely.
SWEP.CrouchAccuracyMultiplier = 0.5 -- Less is more.  Accuracy * 0.5 = Twice as accurate, Accuracy * 0.1 = Ten times as accurate

-- Movespeed
SWEP.MoveSpeed = 1 -- Multiply the player's movespeed by this.
SWEP.IronSightsMoveSpeed = 0.8 -- Multiply the player's movespeed by this when sighting.

-- PROJECTILES
SWEP.Primary.Projectile = nil -- Entity to shoot
SWEP.Primary.ProjectileVelocity = 0 -- Entity to shoot's velocity
SWEP.Primary.ProjectileModel = nil -- Entity to shoot's model

-- VIEWMODEL
SWEP.ViewModel          = "models/your/path/here.mdl" -- Viewmodel path
SWEP.ViewModelFOV           = 65        -- This controls how big the viewmodel looks.  Less is more.
SWEP.ViewModelFlip          = false     -- Set this to true for CSS models, or false for everything else (with a righthanded viewmodel.)
SWEP.UseHands = false -- Use gmod c_arms system.
SWEP.VMPos = Vector(0, 0, 0) -- The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position.
SWEP.VMAng = Vector(0, 0, 0) -- The viewmodel angular offset, constantly.   Subtract this from any other modifications to viewmodel angle.
SWEP.VMPos_Additive = true -- Set to false for an easier time using VMPos. If true, VMPos will act as a constant delta ON TOP OF ironsights, run, whateverelse
SWEP.CenteredPos = nil -- The viewmodel positional offset, used for centering.  Leave nil to autodetect using ironsights.
SWEP.CenteredAng = nil -- The viewmodel angular offset, used for centering.  Leave nil to autodetect using ironsights.
SWEP.Bodygroups_V = nil -- {
	-- [0] = 1,
	-- [1] = 4,
	-- [2] = etc.
-- }

SWEP.AllowIronSightsDoF = true -- whenever allow DoF effect on viewmodel when zoomed in with iron sights

SWEP.IronSightsReloadEnabled = nil -- Enable ADS reload animations support (requires animations to be enabled in SWEP.Animations)
SWEP.IronSightsReloadLock = true -- Lock ADS state when reloading

-- WORLDMODEL
SWEP.WorldModel         = "models/your/wmodel/path/here.mdl" -- Weapon world model path
SWEP.Bodygroups_W = nil -- {
-- [0] = 1,
-- [1] = 4,
-- [2] = etc.
-- }

SWEP.HoldType = "" -- This is how others view you carrying the weapon. Options include:
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive
-- You're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.Offset = {
	Pos = {
		Up = 0,
		Right = 0,
		Forward = 0
	},
	Ang = {
		Up = -1,
		Right = -2,
		Forward = 178
	},
	Scale = 1
} -- Procedural world model animation, defaulted for CS:S purposes.

SWEP.ThirdPersonReloadDisable = false -- Disable third person reload?  True disables.

-- SCOPES
SWEP.IronSightsSensitivity = 1 -- Useful for a RT scope.  Change this to 0.25 for 25% sensitivity.  This is if normal FOV compenstaion isn't your thing for whatever reason, so don't change it for normal scopes.
SWEP.BoltAction = false -- Unscope/sight after you shoot?
SWEP.Scoped = false -- Draw a scope overlay?
SWEP.ScopeOverlayThreshold = 0.875 -- Percentage you have to be sighted in to see the scope.
SWEP.BoltTimerOffset = 0.25 -- How long you stay sighted in after shooting, with a bolt action.
SWEP.ScopeScale = 0.5 -- Scale of the scope overlay
SWEP.ReticleScale = 0.7 -- Scale of the reticle overlay
-- GDCW Overlay Options.  Only choose one.
SWEP.Secondary.UseACOG = false -- Overlay option
SWEP.Secondary.UseMilDot = false -- Overlay option
SWEP.Secondary.UseSVD = false -- Overlay option
SWEP.Secondary.UseParabolic = false -- Overlay option
SWEP.Secondary.UseElcan = false -- Overlay option
SWEP.Secondary.UseGreenDuplex = false -- Overlay option
if surface then
	SWEP.Secondary.ScopeTable = nil --[[
		{
			scopetex = surface.GetTextureID("scope/gdcw_closedsight"),
			reticletex = surface.GetTextureID("scope/gdcw_acogchevron"),
			dottex = surface.GetTextureID("scope/gdcw_acogcross")
		}
	]] --
end
-- [[SHOTGUN CODE]] --
SWEP.Shotgun = false -- Enable shotgun style reloading.
SWEP.ShotgunEmptyAnim = false -- Enable emtpy reloads on shotguns?
SWEP.ShotgunEmptyAnim_Shell = true -- Enable insertion of a shell directly into the chamber on empty reload?
SWEP.ShotgunStartAnimShell = false -- shotgun start anim inserts shell
SWEP.ShellTime = .35 -- For shotguns, how long it takes to insert a shell.
-- [[SPRINTING]] --
SWEP.RunSightsPos = Vector(0, 0, 0) -- Change this, using SWEP Creation Kit preferably
SWEP.RunSightsAng = Vector(0, 0, 0) -- Change this, using SWEP Creation Kit preferably
-- [[CROUCHING]] --
-- Viewmodel offset when player is crouched
-- SWEP.CrouchPos = Vector(0, 0, 0)
-- SWEP.CrouchAng = Vector(0, 0, 0)
-- [[IRONSIGHTS]] --
SWEP.data = {}
SWEP.data.ironsights = 1 -- Enable Ironsights
SWEP.Secondary.IronFOV = 70 -- How much you "zoom" in. Less is more!  Don't have this be <= 0.  A good value for ironsights is like 70.
-- SWEP.IronViewModelFOV = 65 -- Target viewmodel FOV when aiming down the sights.
SWEP.IronSightsPos = Vector(0, 0, 0) -- Change this, using SWEP Creation Kit preferably
SWEP.IronSightsAng = Vector(0, 0, 0) -- Change this, using SWEP Creation Kit preferably
-- [[INSPECTION]] --
SWEP.InspectPos = nil -- Vector(0, 0, 0) -- Replace with a vector, in style of ironsights position, to be used for inspection
SWEP.InspectAng = nil -- Vector(0, 0, 0) -- Replace with a vector, in style of ironsights angle, to be used for inspection
-- [[VIEWMODEL BLOWBACK]] --
SWEP.BlowbackEnabled = false -- Enable Blowback?
SWEP.BlowbackVector = Vector(0, -1, 0) -- Vector to move bone <or root> relative to bone <or view> orientation.
SWEP.BlowbackAngle = nil -- Angle(0, 0, 0)
SWEP.BlowbackCurrentRoot = 0 -- Amount of blowback currently, for root
SWEP.BlowbackCurrent = 0 -- Amount of blowback currently, for bones
SWEP.BlowbackBoneMods = nil -- Viewmodel bone mods via SWEP Creation Kit
SWEP.Blowback_Only_Iron = true -- Only do blowback on ironsights
SWEP.Blowback_PistolMode = false -- Do we recover from blowback when empty?
SWEP.Blowback_Shell_Enabled = true -- Shoot shells through blowback animations
SWEP.Blowback_Shell_Effect = "ShellEject" -- Which shell effect to use
SWEP.BlowbackAllowAnimation = nil -- Allow playing shoot animation with blowback?
-- [[VIEWMODEL PROCEDURAL ANIMATION]] --
SWEP.DoProceduralReload = false -- Animate first person reload using lua?
SWEP.ProceduralReloadTime = 1 -- Procedural reload time?
-- [[HOLDTYPES]] --
SWEP.IronSightHoldTypeOverride = "" -- This variable overrides the ironsights holdtype, choosing it instead of something from the above tables.  Change it to "" to disable.
SWEP.SprintHoldTypeOverride = "" -- This variable overrides the sprint holdtype, choosing it instead of something from the above tables.  Change it to "" to disable.
-- [[ANIMATION]] --

SWEP.StatusLengthOverride = {} -- Changes the status delay of a given animation; only used on reloads.  Otherwise, use SequenceLengthOverride or one of the others
SWEP.SequenceLengthOverride = {} -- Changes both the status delay and the nextprimaryfire of a given animation
SWEP.SequenceTimeOverride = {} -- Like above but changes animation length to a target
SWEP.SequenceRateOverride = {} -- Like above but scales animation length rather than being absolute

SWEP.ProceduralHolsterEnabled = nil
SWEP.ProceduralHolsterTime = 0.3
SWEP.ProceduralHolsterPos = Vector(3, 0, -5)
SWEP.ProceduralHolsterAng = Vector(-40, -30, 10)

SWEP.Idle_Mode = TFA.Enum.IDLE_BOTH -- TFA.Enum.IDLE_DISABLED = no idle, TFA.Enum.IDLE_LUA = lua idle, TFA.Enum.IDLE_ANI = mdl idle, TFA.Enum.IDLE_BOTH = TFA.Enum.IDLE_ANI + TFA.Enum.IDLE_LUA
SWEP.Idle_Blend = 0.25 -- Start an idle this far early into the end of a transition
SWEP.Idle_Smooth = 0.05 -- Start an idle this far early into the end of another animation
-- MDL Animations Below

SWEP.Sights_Mode = TFA.Enum.LOCOMOTION_LUA -- LOCOMOTION_ANI = mdl, LOCOMOTION_HYBRID = ani + lua, LOCOMOTION_LUA = lua only
--[[
SWEP.IronAnimation = {
	["in"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "Idle_To_Iron", -- Number for act, String/Number for sequence
		["value_empty"] = "Idle_To_Iron_Dry",
		["transition"] = true
	}, -- Inward transition
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "Idle_Iron", -- Number for act, String/Number for sequence
		["value_empty"] = "Idle_Iron_Dry"
	}, -- Looping Animation
	["out"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "Iron_To_Idle", -- Number for act, String/Number for sequence
		["value_empty"] = "Iron_To_Idle_Dry",
		["transition"] = true
	}, -- Outward transition
	["shoot"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "Fire_Iron", -- Number for act, String/Number for sequence
		["value_last"] = "Fire_Iron_Last",
		["value_empty"] = "Fire_Iron_Dry"
	} -- What do you think
}
]]

SWEP.Sprint_Mode = TFA.Enum.LOCOMOTION_LUA -- LOCOMOTION_ANI = mdl, LOCOMOTION_HYBRID = ani + lua, LOCOMOTION_LUA = lua only
--[[
SWEP.SprintAnimation = {
	["in"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "Idle_to_Sprint", -- Number for act, String/Number for sequence
		["value_empty"] = "Idle_to_Sprint_Empty",
		["transition"] = true
	}, -- Inward transition
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "Sprint_", -- Number for act, String/Number for sequence
		["value_empty"] = "Sprint_Empty_",
		["is_idle"] = true
	}, -- looping animation
	["out"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "Sprint_to_Idle", -- Number for act, String/Number for sequence
		["value_empty"] = "Sprint_to_Idle_Empty",
		["transition"] = true
	} -- Outward transition
}
]]

SWEP.Walk_Mode = TFA.Enum.LOCOMOTION_LUA -- LOCOMOTION_ANI = mdl, LOCOMOTION_HYBRID = ani + lua, LOCOMOTION_LUA = lua only
--[[
SWEP.WalkAnimation = {
	["in"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "Idle_to_Walk", -- Number for act, String/Number for sequence
		["value_empty"] = "Idle_to_Walk_Empty",
		["transition"] = true
	}, -- Inward transition
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "Walk", -- Number for act, String/Number for sequence
		["value_empty"] = "Walk_Empty",
		["is_idle"] = true
	}, -- looping animation
	["out"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "Walk_to_Idle", -- Number for act, String/Number for sequence
		["value_empty"] = "Walk_to_Idle_Empty",
		["transition"] = true
	} -- Outward transition
}
]]

--[[
-- Looping fire animation (full-auto only)
SWEP.ShootAnimation = {
	["in"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "ShootLoop_Start", -- Number for act, String/Number for sequence
		["value_is"] = "ShootLoop_Iron_Start", -- Number for act, String/Number for sequence
		["transition"] = true
	}, -- Looping Start, fallbacks to loop
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "ShootLoop", -- Number for act, String/Number for sequence,
		["value_is"] = "ShootLoop_Iron", -- Number for act, String/Number for sequence,
		["is_idle"] = true,
	}, -- Looping Animation
	["out"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "ShootLoop_End", -- Number for act, String/Number for sequence
		["value_is"] = "ShootLoop_Iron_End", -- Number for act, String/Number for sequence
		["transition"] = true
	}, -- Looping End
}
]]

SWEP.Customize_Mode = TFA.Enum.LOCOMOTION_LUA -- LOCOMOTION_ANI = mdl, LOCOMOTION_HYBRID = ani + lua, LOCOMOTION_LUA = lua only
--[[
SWEP.CustomizeAnimation = {
	["in"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "customization_in", -- Number for act, String/Number for sequence
		["transition"] = true
	},
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "customization_idle", -- Number for act, String/Number for sequence
		["is_idle"] = true
	},
	["out"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "customization_out", -- Number for act, String/Number for sequence
		["transition"] = true
	}
}
]]

--[[
SWEP.PumpAction = { -- Pump/bolt animations
	["type"] = TFA.Enum.ANIMATION_ACT, -- Sequence or act
	["value"] = ACT_VM_PULLBACK_HIGH, -- Number for act, String/Number for sequence
	["value_empty"] = ACT_VM_PULLBACK, -- Last shot pump
	["value_is"] = ACT_VM_PULLBACK_LOW, -- ADS pump
}
]] --

-- [[EFFECTS]] --
-- Attachments
SWEP.MuzzleAttachment           = "1"       -- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellAttachment            = "2"       -- Should be "2" for CSS models or "shell" for hl2 models
SWEP.MuzzleFlashEnabled = true -- Enable muzzle flash
SWEP.MuzzleAttachmentRaw = nil -- This will override whatever string you gave.  This is the raw attachment number.  This is overridden or created when a gun makes a muzzle event.
SWEP.AutoDetectMuzzleAttachment = false -- For multi-barrel weapons, detect the proper attachment?
SWEP.MuzzleFlashEffect = nil -- Change to a string of your muzzle flash effect.  Copy/paste one of the existing from the base.
SWEP.SmokeParticle = nil -- Smoke particle (ID within the PCF), defaults to something else based on holdtype; "" to disable
SWEP.EjectionSmokeEnabled = true -- Disable automatic ejection smoke
-- Shell eject override
SWEP.LuaShellEject = false -- Enable shell ejection through lua?
SWEP.LuaShellEjectDelay = 0 -- The delay to actually eject things
SWEP.LuaShellModel = nil -- The model to use for ejected shells
SWEP.LuaShellScale = nil -- The model scale to use for ejected shells
SWEP.LuaShellYaw = nil -- The model yaw rotation ( relative ) to use for ejected shells
-- Tracer Stuff
SWEP.TracerName         = nil   -- Change to a string of your tracer name.  Can be custom. There is a nice example at https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/base/entities/effects/tooltracer.lua
SWEP.TracerCount        = 3     -- 0 disables, otherwise, 1 in X chance
-- Impact Effects
SWEP.ImpactEffect = nil -- Impact Effect
SWEP.ImpactDecal = nil -- Impact Decal
-- [[EVENT TABLE]] --
SWEP.EventTable = {} -- Event Table, used for custom events when an action is played.  This can even do stuff like playing a pump animation after shooting.
-- example:
-- SWEP.EventTable = {
--  [ACT_VM_RELOAD] = {
--																				-- ifp is IsFirstTimePredicted()
--      { ["time"] = 0.1, ["type"] = "lua", ["value"] = function( wep, viewmodel, ifp ) end, ["client"] = true, ["server"] = true},
--      { ["time"] = 0.1, ["type"] = "sound", ["value"] = Sound("x") }
--  }
-- }
-- [[RENDER TARGET]] --
SWEP.RTMaterialOverride = nil -- Take the material you want out of print(LocalPlayer():GetViewModel():GetMaterials()), subtract 1 from its index, and set it to this.
SWEP.RTOpaque = false -- Do you want your render target to be opaque?
SWEP.RTCode = nil -- function(self) return end -- This is the function to draw onto your rendertarget
SWEP.RTBGBlur = true -- Draw background blur when 3D scope is active?
-- [[AKIMBO]] --
SWEP.Akimbo = false -- Akimbo gun?  Alternates between primary and secondary attacks.
SWEP.AnimCycle = 1 -- Start on the right
SWEP.AkimboHUD = true -- Draw holographic HUD for both weapons?
-- [[ATTACHMENTS]] --
SWEP.VElements = nil -- Export from SWEP Creation Kit.  For each item that can/will be toggled, set active=false in its individual table
SWEP.WElements = nil -- Export from SWEP Creation Kit.  For each item that can/will be toggled, set active=false in its individual table
SWEP.Attachments = {
	-- [ORDER] = = { atts = { "si_eotech" }, sel = 0 }
	-- sel allows you to have an attachment pre-selected, and is used internally by the base to show which attachment is selected in each category.
}
SWEP.AttachmentDependencies = {} -- {["si_acog"] = {"bg_rail", ["type"] = "OR"}} -- type could also be AND to require multiple
SWEP.AttachmentExclusions = {} -- { ["si_iron"] = { [1] = "bg_heatshield"} }
SWEP.AttachmentTableOverride = {} --[[{ -- overrides WeaponTable for attachments
	["ins2_ub_laser"] = { -- attachment id, root of WeaponTable override
		["VElements"] = {
			["laser_rail"] = {
				["active"] = true
			},
		},
	}
}]]

SWEP.DInv2_GridSizeX = nil -- DInventory/2 Specific. Determines weapon's width in grid. This is not TFA Base specific and can be specified to any Scripted SWEP.
SWEP.DInv2_GridSizeY = nil -- DInventory/2 Specific. Determines weapon's height in grid. This is not TFA Base specific and can be specified to any Scripted SWEP.
SWEP.DInv2_Volume = nil -- DInventory/2 Specific. Determines weapon's volume in liters. This is not TFA Base specific and can be specified to any Scripted SWEP.
SWEP.DInv2_Mass = nil -- DInventory/2 Specific. Determines weapon's mass in kilograms. This is not TFA Base specific and can be specified to any Scripted SWEP.

-- [[MISC INFO FOR MODELERS]] --
--[[

Used Animations (for modelers):

ACT_VM_DRAW - Draw
ACT_VM_DRAW_EMPTY - Draw empty
ACT_VM_DRAW_SILENCED - Draw silenced, overrides empty

ACT_VM_IDLE - Idle
ACT_VM_IDLE_SILENCED - Idle empty, overwritten by silenced
ACT_VM_IDLE_SILENCED - Idle silenced

ACT_VM_PRIMARYATTACK - Shoot
ACT_VM_PRIMARYATTACK_EMPTY - Shoot last chambered bullet
ACT_VM_PRIMARYATTACK_SILENCED - Shoot silenced, overrides empty
ACT_VM_PRIMARYATTACK_1 - Shoot ironsights, overriden by everything besides normal shooting
ACT_VM_DRYFIRE - Dryfire

ACT_VM_RELOAD - Reload / Tactical Reload / Insert Shotgun Shell
ACT_SHOTGUN_RELOAD_START - Start shotgun reload, unless ACT_VM_RELOAD_EMPTY is there.
ACT_SHOTGUN_RELOAD_FINISH - End shotgun reload.
ACT_VM_RELOAD_EMPTY - Empty mag reload, chambers the new round.  Works for shotguns too, where applicable.
ACT_VM_RELOAD_SILENCED - Silenced reload, overwrites all


ACT_VM_HOLSTER - Holster
ACT_VM_HOLSTER_SILENCED - Holster empty, overwritten by silenced
ACT_VM_HOLSTER_SILENCED - Holster silenced

]] --
DEFINE_BASECLASS( SWEP.Base )