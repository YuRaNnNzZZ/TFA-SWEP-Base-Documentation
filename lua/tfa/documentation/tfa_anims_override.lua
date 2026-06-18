--[[ Animation lookup/playback functions for override ]]--
-- SWEP:ChooseDrawAnim -- weapon draw, handles first draw
-- SWEP:ChooseInspectAnim -- fidget/inspect
-- SWEP:ChooseHolsterAnim -- weapon holster, return false to fallback to procedural holster
-- SWEP:ChooseProceduralReloadAnim -- idle anim during procedural reload
-- SWEP:ChooseReloadAnim -- reload and empty reload, shotgun shell insert
-- SWEP:ChooseShotgunReloadAnim -- shotgun reload start
-- SWEP:ChooseShotgunPumpAnim
-- SWEP:ChooseIdleAnim -- main idle animation
-- SWEP:ChooseFlatAnim -- frozen idle animation for SWEP.Sights_Mode = TFA.Enum.LOCOMOTION_LUA
-- SWEP:ChooseADSAnim -- non-flat ADS idle (called from SWEP:ChooseIdleAnim)
-- SWEP:ChooseSprintAnim -- sprint loop (called from SWEP:ChooseIdleAnim)
-- SWEP:ChooseWalkAnim -- walk loop (called from SWEP:ChooseIdleAnim)
-- SWEP:ChooseLoopShootAnim -- looped shoot animation idle (called from SWEP:ChooseIdleAnim)
-- SWEP:ChooseCustomizeAnim -- customize (c-menu) idle (called from SWEP:ChooseIdleAnim)
-- SWEP:ChooseShootAnim -- shoot, ads shoot, blowback (procedural ads shoot), looped shoot in/out. Has an argumment (which equates to IsFirstTimePredicted()) for predicted shell casing eject
-- SWEP:ChooseSilenceAnim -- silencer toggle
-- SWEP:ChooseDryFireAnim -- dryfire, return false to play default empty click sound with no anim
-- SWEP:ChooseROFAnim -- firemode change, ads firemode change; played AFTER firemode is changed

-- bash base
-- SWEP:ChooseBashAnim -- bash animation

-- melee base
-- SWEP:ChooseBlockAnimation -- played on taking damage when blocking with a shield



-- Override example #1 - Swapping bash animation
-- first, we add a custom animation to the table:
SWEP.Animations = {
	["bayonet"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ,
		["value"] = "bayonet_melee_01"
	}
}
-- this override is without baseclass call, we're discarding empty and silenced bash animations and don't have any checks or fallbacks
-- all checks are done in the ChooseAnimation instead, value_is, value_empty and so on
function SWEP:ChooseBashAnim()
	if not self:VMIV() then return end

	local hasBayonet = self:GetStatL("Bayonet", false) -- ATTACHMENT.WeaponTable.Bayonet = true
	local typev, tanim = self:ChooseAnimation(hasBayonet and "bayonet" or "bash")

	return self:PlayChosenAnimation(typev, tanim)
end



-- Override example #2
-- Dynamically changing sprint animation speed
-- Only works for sequences (ANIMATION_SEQ)
DEFINE_BASECLASS(SWEP.Base) -- important if you want to call base/parent function

function SWEP:ChooseSprintAnim()
	local rate = 1

	if IsValid(self:GetOwner()) and self:GetOwner():IsPlayer() then
		rate = self:GetOwner():GetRunSpeed() / 400 -- player's sprint speed, default is 500 which means 125% speed
	end

	local anim = self:GetStatL("SprintAnimation.loop")

	self.SequenceRateOverride[anim.value] = rate
	self:ClearStatCacheL("SequenceRateOverride." .. anim.value) -- important

	return self:PlayAnimation(anim) -- ONLY sequences
end