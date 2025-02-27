
-- TFA Base Batch Attachment Registration Template by TFA Base Devs

-- To the extent possible under law, the person who associated CC0 with
-- TFA Base Template has waived all copyright and related or neighboring rights
-- to TFA Base Template.

-- You should have received a copy of the CC0 legalcode along with this
-- work.  If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

-- Place your file in addons/<YOUR ADDON NAME HERE>/lua/tfa/attbatch/<YOUR FILE NAME HERE>.lua
-- These are loaded after regular lua/tfa/att folder, allowing to place base attachments there.

if not TFA_ATTACHMENT_ISUPDATING then TFAUpdateAttachments(false) return end

-- TFA.Attachments.RegisterFromTable(string id, table ATTACHMENT)
TFA.Attachments.RegisterFromTable("your_att_id_here", {
	TFADataVersion = 1, -- If it is undefined, it fallbacks to 0 and WeaponTable gets migrated like SWEPs do

	-- Base = "base", -- Attachment baseclass, defaults to "base" attachment

	Name = "Example Attachment",
	ShortName = nil, -- Abbreviation shown on the bottom left of the icon, generated from name if not defined
	Description = {
		TFA.Attachments.Colors["+"], "Does something good",
		TFA.Attachments.Colors["-"], "Does something bad",
		-- Color(255, 255, 255), "bottom text",
	}, -- all colors are defined in lua/tfa/modules/tfa_attachments.lua
	Icon = nil, -- "entities/tfa_ammo_match.png" -- Full path to the icon, reverts to '?' by default

	WeaponTable = { -- The place where you change the stats (CACHED STATS ONLY!)
		["Primary"] = {
			["Damage"] = 60, -- For example, you want to change SWEP.Primary.Damage value to 60
			["ClipSize"] = function(wep, stat)
				return wep.Primary_TFA.ClipSize_Override or stat * 1.5
			end -- Stat functions support changing value dynamically (which is cached afterwards), SWEP.Primary_TFA contains original unchanged values
		}
	},

	-- DInv2_GridSizeX = nil, -- DInventory/2 Specific. Determines attachment's width in grid.
	-- DInv2_GridSizeY = nil, -- DInventory/2 Specific. Determines attachment's height in grid.
	-- DInv2_Volume = nil, -- DInventory/2 Specific. Determines attachment's volume in liters.
	-- DInv2_Mass = nil, -- DInventory/2 Specific. Determines attachment's mass in kilograms.
	-- DInv2_StackSize = nil, -- DInventory/2 Specific. Determines attachment's maximal stack size.

	--[[
	-- Default behavior is always allow, override to change
	CanAttach = function(self, wep)
		return true
	end,
	]]--

	--[[
	-- These functions are called BEFORE stat cache is rebuilt
	Attach = function(self, wep)
	end,

	Detach = function(self, wep)
	end,
	]]--

	-- Attachment functions called from base
	--[[
	-- Called from render target code if SWEP.RTDrawEnabled is true
	RTCode = function(self, wep, rt_texture, w, h)
	end,
	]]--

	--[[
	-- Called from FireBullets for each bullet trace hit; arguments are passed from bullet callback
	CustomBulletCallback = function(self, wep, attacker, trace, dmginfo)
	end,
	]]--

	--[[
	-- Called before stencil sight reticle is drawn
	PreDrawStencilSight = function(self, wep, vm, ply, sightVElementTable)
		-- 3D rendering context from PostDrawViewModel
		-- https://wiki.facepunch.com/gmod/3D_Rendering_Functions

		-- return true -- to prevent SWEP:PreDrawStencilSight from being called
		-- return false -- to stop reticle from drawing
	end,
	]]--

	--[[
	-- Called right after stencil sight reticle is drawn
	PostDrawStencilSight = function(self, wep, vm, ply, sightVElementTable)
		-- 3D rendering context from PostDrawViewModel
		-- https://wiki.facepunch.com/gmod/3D_Rendering_Functions

		-- return true -- to prevent SWEP:PostDrawStencilSight from being called
	end,
	]]--
})

-- and so on
