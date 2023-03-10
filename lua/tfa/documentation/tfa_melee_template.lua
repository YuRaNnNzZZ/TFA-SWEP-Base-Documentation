
-- TFA Base Melee Template by TFA Base Devs

-- To the extent possible under law, the person who associated CC0 with
-- TFA Base Template has waived all copyright and related or neighboring rights
-- to TFA Base Template.

-- You should have received a copy of the CC0 legalcode along with this
-- work.  If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

-- M9K compatible version is dated as 0 (and 0 is also fallback if TFADataVersion not present)
-- as well as everything made for TFA Base before 4.7
SWEP.TFADataVersion             = 1

----------------- Basic Garry's Mod SWEP structure stats / TFA Base properties
SWEP.Base                       = "tfa_melee_base"
SWEP.Category                   = "TFA Template" -- The category.
-- Please, just choose something generic or something I've already done if you plan on only doing like one (or two or three) swep(s).
SWEP.Manufacturer               = nil -- Gun Manufactrer (e.g. Hoeckler and Koch)
SWEP.Author                     = "" -- Author Tooltip
SWEP.Contact                    = "" -- Contact Info Tooltip
SWEP.Purpose                    = "" -- Purpose Tooltip
SWEP.Instructions               = "" -- Instructions Tooltip
SWEP.Spawnable                  = false -- Can you, as a normal user, spawn this?
SWEP.AdminSpawnable             = false -- Can an adminstrator spawn this?  Does not tie into your admin mod necessarily, unless its coded to allow for GMod's default ranks somewhere in its code.  Evolve and ULX should work, but try to use weapon restriction rather than these.
SWEP.DrawCrosshair              = true      -- Draw the crosshair?

SWEP.PrintName                  = "TFA Base Melee Template"       -- Weapon name (Shown on HUD)
SWEP.Slot                       = 0             -- Slot in the weapon selection menu.  Subtract 1, as this starts at 0.
SWEP.SlotPos                    = 73            -- Position in the slot
SWEP.AutoSwitchTo               = true      -- Auto switch to if we pick it up
SWEP.AutoSwitchFrom             = true      -- Auto switch from if you pick up a better weapon
SWEP.Weight                     = 30            -- This controls how "good" the weapon is for autopickup.
-- For base values please refer to the base template at lua/weapons/tfa_base_template/shared.lua

-- Display values (inspection screen etc.)
SWEP.Primary.Damage             = 0.01 -- Damage, in standard damage points.
SWEP.Primary.RPM                = 600 -- This is in Rounds Per Minute / RPM

----------------- ViewModel related
SWEP.ViewModel                  = "models/your/path/here.mdl" -- Viewmodel path
SWEP.ViewModelFOV               = 65        -- This controls how big the viewmodel looks.  Less is more.
SWEP.ViewModelFlip              = false     -- Set this to true for CSS models, or false for everything else (with a righthanded viewmodel.)
SWEP.UseHands                   = false -- Use gmod c_arms system.

----------------- Worldmodel related
SWEP.WorldModel                 = "models/your/wmodel/path/here.mdl" -- Weapon world model path
SWEP.HoldType                   = "" -- This is how others view you carrying the weapon. Options include:
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive

-- Attacks - Primary
SWEP.Primary.Attacks            = { -- main attacks table, the values are selected randomly
	{
		["act"] = ACT_VM_HITLEFT, -- Animation acvitity to use (ACT_ enum value)
		["len"] = 8 * 4.5, -- Trace distance
		["src"] = Vector(20, 10, 0), -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		["dir"] = Vector(-40, 30, 0), -- Trace direction/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		["dmg"] = 60, -- Damage
		["dmgtype"] = DMG_SLASH, -- Damage type (DMG_ enum value)
		["delay"] = 0.2, -- Delay (in seconds) before attack trace
		["force"] = 12, -- Damage force
		["hull"] = 10, -- Trace hull size
		["spr"] = true, -- Allow attack while sprinting?
		["snd"] = "Swing.Sound", -- Soundscript name for swing sound
		["hitflesh"] = "TFA.BashFlesh", -- Soundscript name for flesh hit
		["hitworld"] = "TFA.BashWall", -- Soundscript name for non-flesh hit
		["snd_delay"] = 0.1, -- Delay before swing sound
		["viewpunch"] = Angle(1, -10, 0), -- Viewpunch angle
		["end"] = 0.5, -- Time (from attack start) until next attack is allowed
		["direction"] = "L", -- Swing direction (for directional preference); L,R,F,B
	},
}
SWEP.Primary.MaxCombo           = -1 -- How many attacks are allowed on single attack key hold
SWEP.Primary.Directional        = false -- Prefer attacks with player's movement direction first
SWEP.Primary.SplitDamage        = true -- Use the "dmg" value of the attack table? If false, SWEP.Primary.Damage will be used instead.

-- Attacks - Secondary
-- If secondary attacks table is empty or not defined, it falls back to primary table
SWEP.Secondary.Attacks          = {} -- same as SWEP.Primary.Attacks
SWEP.Secondary.MaxCombo         = -1
SWEP.Secondary.Directional      = false
SWEP.Secondary.SplitDamage      = true -- Use the "dmg" value of the attack table? If false, SWEP.Secondary.Damage will be used instead.
SWEP.Secondary.PrimaryFallback  = true -- Allow falling back to primary attacks if secondary attacks table is empty/unavailable

-- Attacks - Alternative (melee bash)
SWEP.Secondary.CanBash            = true -- set to false to disable bashing
SWEP.Secondary.BashDamage         = 25 -- Melee bash damage
SWEP.Secondary.BashSound          = "TFA.Bash" -- Soundscript name for bash swing sound
SWEP.Secondary.BashHitSound       = "TFA.BashWall" -- Soundscript name for non-flesh hit sound
SWEP.Secondary.BashHitSound_Flesh = "TFA.BashFlesh" -- Soundscript name for flesh hit sound
SWEP.Secondary.BashLength         = 54 -- Length of bash melee trace in units
SWEP.Secondary.BashDelay          = 0.2 -- Delay (in seconds) from bash start to bash attack trace
SWEP.Secondary.BashDamageType     = DMG_SLASH -- Damage type (DMG_ enum value)
SWEP.Secondary.BashEnd            = nil -- Bash end time (in seconds), defaults to animation end if undefined
SWEP.Secondary.BashInterrupt      = false -- Bash attack interrupts everything (reload, draw, whatever)