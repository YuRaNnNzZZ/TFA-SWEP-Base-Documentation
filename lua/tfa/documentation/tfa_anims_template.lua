-- TFA Base Animations reference

-- Example of animation table:
SWEP.Animations = {
	["shoot1"] = {
		-- Еype of the animation entry, either TFA.Enum.ANIMATION_ACT or TFA.Enum.ANIMATION_SEQ
		-- ALL ENTRIES OF THE ANIMATION MUST BE OF THE SAME TYPE!!!
		-- for ANIMATION_ACT, "value" must be one of the enums from https://wiki.facepunch.com/gmod/Enums/ACT
		-- for ANIMATION_SEQ "value" is the sequence name
		["type"] = TFA.Enum.ANIMATION_ACT,

		-- Basic
		["value"] = ACT_VM_PRIMARYATTACK,
		["value_empty"] = ACT_VM_DRYFIRE,
		["value_last"] = ACT_VM_PRIMARYATTACK_EMPTY,

		-- Silenced
		["value_sil"] = ACT_VM_PRIMARYATTACK_SILENCED,
		["value_sil_empty"] = ACT_VM_DRYFIRE_SILENCED,

		-- Ironsights/ADS
		["value_is"] = ACT_VM_PRIMARYATTACK_1,
		["value_is_empty"] = ACT_VM_PRIMARYATTACK_2,
		["value_is_last"] = ACT_VM_PRIMARYATTACK_3,

		-- ADS + Silenced
		["value_is_sil"] = ACT_VM_PRIMARYATTACK_DEPLOYED_1,
		["value_is_sil_empty"] = ACT_VM_PRIMARYATTACK_DEPLOYED_2,
		["value_is_sil_last"] = ACT_VM_PRIMARYATTACK_DEPLOYED_3,

		-- Force enable animation (when it's not autodetected)
		["enabled"] = true
	},
}

-- Uncomment entry and add to SWEP.Animations table of your SWEP. DO NOT COPY THE WHOLE BLOCK!
-- SWEP.Animations = {
	--[[ Gun Base ]]--
	-- ["draw_first"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_DRAW_DEPLOYED,
	-- 	["enabled"] = nil
	-- },
	-- ["draw"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_DRAW
	-- },
	-- ["draw_empty"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_DRAW_EMPTY
	-- },
	-- ["draw_silenced"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_DRAW_SILENCED
	-- },
	-- ["shoot1"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_PRIMARYATTACK
	-- },
	-- ["shoot1_last"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_PRIMARYATTACK_EMPTY
	-- },
	-- ["shoot1_empty"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_DRYFIRE
	-- },
	-- ["shoot1_silenced"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_PRIMARYATTACK_SILENCED
	-- },
	-- ["shoot1_silenced_empty"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_DRYFIRE_SILENCED or 0
	-- },
	-- ["shoot1_is"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_PRIMARYATTACK_1
	-- },
	-- ["shoot2"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_SECONDARYATTACK
	-- },
	-- ["shoot2_last"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_SEQ,
	-- 	["value"] = "shoot2_last"
	-- },
	-- ["shoot2_empty"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_DRYFIRE
	-- },
	-- ["shoot2_silenced"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_SEQ,
	-- 	["value"] = "shoot2_silenced"
	-- },
	-- ["shoot2_is"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_ISHOOT_M203
	-- },
	-- ["idle"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_IDLE
	-- },
	-- ["idle_empty"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_IDLE_EMPTY
	-- },
	-- ["idle_silenced"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_IDLE_SILENCED
	-- },
	-- ["reload"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_RELOAD
	-- },
	-- ["reload_empty"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_RELOAD_EMPTY
	-- },
	-- ["reload_silenced"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_RELOAD_SILENCED
	-- },
	-- ["reload_shotgun_start"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_SHOTGUN_RELOAD_START
	-- },
	-- ["reload_shotgun_finish"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_SHOTGUN_RELOAD_FINISH
	-- },
	-- ["reload_is"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_RELOAD_ADS
	-- },
	-- ["reload_empty_is"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_RELOAD_EMPTY_ADS
	-- },
	-- ["reload_silenced_is"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_RELOAD_SILENCED_ADS
	-- },
	-- ["reload_shotgun_start_is"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_SHOTGUN_RELOAD_START_ADS
	-- },
	-- ["reload_shotgun_finish_is"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_SHOTGUN_RELOAD_FINISH_ADS
	-- },
	-- ["holster"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_HOLSTER
	-- },
	-- ["holster_empty"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_HOLSTER_EMPTY
	-- },
	-- ["holster_silenced"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_HOLSTER_SILENCED
	-- },
	-- ["silencer_attach"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_ATTACH_SILENCER
	-- },
	-- ["silencer_detach"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_DETACH_SILENCER
	-- },
	-- ["rof"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_FIREMODE
	-- },
	-- ["rof_is"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_IFIREMODE
	-- },
	-- ["inspect"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_FIDGET
	-- },
	-- ["inspect_empty"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_FIDGET_EMPTY
	-- },
	-- ["inspect_silenced"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_FIDGET_SILENCED
	-- },

	--[[ Bash Base ]]--
	-- ["bash"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_HITCENTER
	-- },
	-- ["bash_silenced"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_HITCENTER2
	-- },
	-- ["bash_empty"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_MISSCENTER
	-- },
	-- ["bash_empty_silenced"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_ACT,
	-- 	["value"] = ACT_VM_MISSCENTER2
	-- },
-- }


-- Fake ACT enum entries added by the base
-- These values do not exist in the engine, so for those names use the replacement value in the $sequence definition:

-- ACT_VM_FIDGET_EMPTY - ACT_CROSSBOW_FIDGET_UNLOADED
-- ACT_VM_FIDGET_SILENCED - ACT_RPG_FIDGET_UNLOADED
-- ACT_VM_HOLSTER_SILENCED - ACT_CROSSBOW_HOLSTER_UNLOADED
-- ACT_VM_RELOAD_ADS - ACT_IDLE_AIM_RIFLE_STIMULATED
-- ACT_VM_RELOAD_EMPTY_ADS - ACT_WALK_AIM_RIFLE_STIMULATED
-- ACT_VM_RELOAD_SILENCED_ADS - ACT_RUN_AIM_RIFLE_STIMULATED
-- ACT_SHOTGUN_RELOAD_START_ADS - ACT_IDLE_SHOTGUN_RELAXED
-- ACT_SHOTGUN_RELOAD_FINISH_ADS - ACT_IDLE_SHOTGUN_STIMULATED


--[[ Bow Base ]]--
-- SWEP.BowAnimations = {
	-- ["shake"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_SEQ,
	-- 	["value"] = "tiredloop",
	-- 	["enabled"] = true
	-- },
	-- ["shoot"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_SEQ,
	-- 	["value"] = "fire_1",
	-- 	["enabled"] = true
	-- },
	-- ["cancel"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_SEQ,
	-- 	["value"] = "cancelarrow",
	-- 	["enabled"] = true
	-- },
	-- ["draw"] = {
	-- 	["type"] = TFA.Enum.ANIMATION_SEQ,
	-- 	["value"] = "drawarrow",
	-- 	["enabled"] = true
	-- }
-- }
