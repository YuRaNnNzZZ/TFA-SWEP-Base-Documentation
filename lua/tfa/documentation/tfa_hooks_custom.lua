-- TFA Base custom hooks reference
-- To be used with https://wiki.facepunch.com/gmod/hook.Add in your own code
-- All returns are optional, you can use hooks just to listen for events happening
-- Where state is listed as Shared, hook has to be added both on server and client to avoid any issues!



---------------------------
--                       --
--  BASE INITIALIZATION  --
--                       --
---------------------------

GM:TFABase_PreEarlyInit()
-- Hook name: TFABase_PreEarlyInit
-- Description: Called after base enums has been loaded; preparing to load official modules
-- State: Shared

GM:TFABase_EarlyInit()
-- Hook name: TFABase_EarlyInit
-- Description: Called after official base modules has been loaded
-- State: Shared

GM:TFABase_PreInit()
-- Hook name: TFABase_PreInit
-- Description: Called before unofficial modules has been loaded
-- State: Shared

GM:TFABase_Init()
-- Hook name: TFABase_Init
-- Description: Called after unofficial modules have been found and loaded
-- State: Shared

GM:TFABase_PreFullInit()
-- Hook name: TFABase_PreFullInit
-- Description: Called before loading external files
-- State: Shared

GM:TFABase_FullInit()
-- Hook name: TFABase_FullInit
-- Description: Called after external files have been loaded
-- State: Shared

GM:TFABase_LateInit()
-- Hook name: TFABase_LateInit
-- Description: Called after (re)initializing the attachments
-- State: Shared



----------------------------------
--                              --
--  ATTACHMENTS INITIALIZATION  --
--                              --
----------------------------------

boolean GM:TFABase_ShouldLoadAttachment(string attachmentID, string path)
-- Hook name: TFABase_ShouldLoadAttachment
-- Description: Called to determine if attachment should be registered
-- State: Shared
-- Arguments:
--     1. string attachmentID - Requested attachment ID
--     2. string path - Attachment file path (without extension)
-- Returns:
--     1. boolean - Return false to prevent attachment from loading and registration
-- Example:
hook.Add("TFABase_ShouldLoadAttachment", "TFA_Hooks_Example", function(id, path)
	if id and (id == "ins2_fg_gp25" or id == "ins2_fg_m203") then
		return false -- block INS2 Shared Parts grenade launcher attachments from loading
	end
end)

GM:TFABase_PreBuildAttachment(string attachmentID, string path, table attTbl)
-- Hook name: TFABase_PreBuildAttachment
-- Description: Called before loading attachment file
-- State: Shared
-- Arguments:
--     1. string attachmentID - Requested attachment ID
--     2. string path - Attachment file path (without extension)
--     3. table attTbl - Empty attachment reference table (only containing assigned ID)

GM:TFABase_BuildAttachment(string attachmentID, string path, table attTbl)
-- Hook name: TFABase_BuildAttachment
-- Description: Called after attachment file has been loaded and executed
-- State: Shared
-- Arguments:
--     1. string attachmentID - Requested attachment ID
--     2. string path - Attachment file path (without extension)
--     3. table attTbl - Populated attachment reference table

GM:TFABase_RegisterAttachment(string attachmentID, table attTbl)
-- Hook name: TFABase_RegisterAttachment
-- Description: Called when attachment has been registered
-- State: Shared
-- Arguments:
--     1. string attachmentID - Requested attachment ID
--     2. table attTbl - Attachment reference table

GM:TFAAttachmentsLoaded()
-- Hook name: TFAAttachmentsLoaded
-- Description: Called after all attachments has been loaded and registered
-- State: Shared

GM:TFAAttachmentsInitialized()
-- Hook name: TFAAttachmentsInitialized
-- Description: Called after all attachments has been fully loaded and initialized
-- State: Shared



-------------------------
--                     --
--  WEAPON STAT CACHE  --
--                     --
-------------------------

any GM:TFA_GetStat(Weapon weapon, string stat, any value)
-- Hook name: TFA_GetStat
-- Description: Called when a cached stat value is requested from weapon, allowing to intercept and modify it.
-- State: Shared
-- Arguments:
-- -     1. Weapon weapon
-- -     2. string stat - Cached stat name
-- -     3. any value - Cached stat value that was received from weapon
-- Returns:
-- -     1. any - Return the modified stat to pass it to :GetStat call
-- Example #1:
hook.Add("TFA_GetStat", "TFA_Hooks_Example", function(weapon, stat, value)
	if stat == "Primary.ClipSize" then -- We want to modify SWEP.Primary.ClipSize which is a cached stat
		return value + 10 -- We add 10 to it's current (number) value
	end
end)
-- Example #2:
hook.Add("TFA_GetStat", "TFA_Hooks_Example_2", function(weapon, stat, value)
	if stat == "Primary.AmmoConsumption" or stat == "Secondary.AmmoConsumption" then
		return 0 -- We tell the base that the gun does not consume any ammo - infinite ammo hook!
	end
end)

GM:TFA_ClearStatCache(Weapon weapon)
-- Hook name: TFA_ClearStatCache
-- Description: Called after weapon's stat cache has been cleared
-- State: Shared
-- Arguments:
--     1. Weapon weapon



---------------------------------
--                             --
--  DEPLOY AND INITIALIZATION  --
--                             --
---------------------------------

GM:TFA_SetupDataTables(Weapon weapon)
-- Hook name: TFA_SetupDataTables
-- Description: Called after WEAPON:SetupDataTables, allowing to add custom networked data values
-- State: Shared
-- Arguments:
--     1. Weapon weapon
-- Example:
hook.Add("TFA_SetupDataTables", "TFA_Hooks_Example", function(weapon)
	weapon:NetworkVarTFA("Bool", "TestVar") -- Adding a boolean variable with name TestVar with getter WEAPON:GetTestVar() and setter WEAPON:SetTestVar(true)
	-- Syntax of WEAPON:NetworkVarTFA is quite identical to Entity:NetworkVar ( https://wiki.facepunch.com/gmod/Entity:NetworkVar )
	-- WEAPON:NetworkVarTFA(string type, string name)
end)

GM:TFA_PreInitialize(Weapon weapon)
-- Hook name: TFA_PreInitialize
-- Description: Called from SWEP:Initialize, allowing to do things before weapon is initialized
-- State: Shared
-- Arguments:
--     1. Weapon weapon

GM:TFA_Initialize(Weapon weapon)
-- Hook name: TFA_Initialize
-- Description: Called after weapon has been initialized from SWEP:Initialize
-- State: Shared
-- Arguments:
--     1. Weapon weapon

GM:TFA_PreDeploy(Weapon weapon)
-- Hook name: TFA_PreDeploy
-- Description: Called from SWEP:Deploy before weapon has been deployed
-- State: Shared, Predicted (not called in SP clientside)
-- Arguments:
--     1. Weapon weapon

boolean GM:TFA_Deploy(Weapon weapon)
-- Hook name: TFA_Deploy
-- Description: Called from SWEP:Deploy after weapon has been deployed.
-- State: Shared, Predicted (not called in SP clientside)
-- Arguments:
--     1. Weapon weapon
-- Returns:
--     1. boolean - Return a boolean to override SWEP:Deploy output (default behavior returns true)



---------------------------
--                       --
--  HOLSTER AND REMOVAL  --
--                       --
---------------------------

boolean GM:TFA_PreHolster(Weapon weapon, Entity target)
-- Hook name: TFA_PreHolster
-- Description: Called from SWEP:Holster, enabling to prevent switching from currently equipped weapon
-- State: Shared, Predicted (not called in SP clientside)
-- Arguments:
--     1. Weapon weapon
--     2. Entity target - The weapon that is being switched to
-- Returns:
--     1. boolean - Return true to switch to target weapon instantly

GM:TFA_Holster(Weapon weapon)
-- Hook name: TFA_Holster
-- Description: Called when weapon is finished holstering and ready to switch
-- State: Shared
-- Arguments:
--     1. Weapon weapon

GM:TFA_OnRemove(Weapon weapon)
-- Hook name: TFA_OnRemove
-- Description: Called from SWEP:OnRemove when weapon is being removed
-- State: Shared
-- Arguments:
--     1. Weapon weapon

GM:TFA_OnDrop(Weapon weapon)
-- Hook name: TFA_OnDrop
-- Description: Called from SWEP:OnDrop when weapon is dropped by the player
-- State: Server
-- Arguments:
--     1. Weapon weapon



-------------------------------------
--                                 --
--  PRIMARY AND SECONDARY ATTACKS  --
--                                 --
-------------------------------------

boolean GM:TFA_PreCanPrimaryAttack(Weapon weapon)
-- Hook name: TFA_PreCanPrimaryAttack
-- Description: Called before weapon checks if it can shoot
-- State: Shared, Predicted (not called in SP clientside)
-- Arguments:
--     1. Weapon weapon
-- Returns:
--     1. boolean - Return to override return value of SWEP:CanPrimaryAttack
-- Example:
hook.Add("TFA_PreCanPrimaryAttack", "TFA_Hooks_Example", function(weapon)
	if IsValid(weapon:GetOwner()) and weapon:GetOwner():IsPlayer() and weapon:GetOwner():Crouching() then
		return false -- we are blocking shooting if player that holding the weapon is crouching
	end
end)

boolean GM:TFA_CanPrimaryAttack(Weapon weapon)
-- Hook name: TFA_CanPrimaryAttack
-- Description: Same as above but called after all checks were done (except jamming)
-- State: Shared, Predicted (not called in SP clientside)
-- Arguments:
--     1. Weapon weapon
-- Returns:
--     1. boolean - Return to override return value of SWEP:CanPrimaryAttack

boolean GM:TFA_PrimaryAttack(Weapon weapon)
-- Hook name: TFA_PrimaryAttack
-- Description: Called before weapon shoots
-- State: Shared, Predicted (not called in SP clientside)
-- Arguments:
--     1. Weapon weapon
-- Returns:
--     1. boolean - Return true to prevent weapon shooting

GM:TFA_PostPrimaryAttack(Weapon weapon)
-- Hook name: TFA_PostPrimaryAttack
-- Description: Called after successful weapon attack
-- State: Shared, Predicted (not called in SP clientside)
-- Arguments:
--     1. Weapon weapon

boolean GM:TFA_SecondaryAttack(Weapon weapon)
-- Hook name: TFA_SecondaryAttack
-- Description: Called when weapon is attempting to attack with right click (AltAttack/melee bash)
-- State: Shared, Predicted (not called in SP clientside)
-- Arguments:
--     1. Weapon weapon
-- Returns:
--     1. boolean - Return true to prevent secondary attack



--------------------------
--                      --
--  BULLET PENETRATION  --
--                      --
--------------------------

boolean GM:TFA_Bullet_Penetrate(Weapon weapon, Entity attacker, TraceResult traceres, CTakeDamageInfo dmginfo, table penetrated, Vector previousStartPos)
-- Hook name: TFA_Bullet_Penetrate
-- Description: Called before bullet is allowed to penetrate next surface
-- State: Shared
-- Arguments:
--     1. Weapon weapon
--     2. Entity attacker - The entity (player or NPC) who used the weapon
--     3. TraceResult traceres - Bullet trace result
--     4. CTakeDamageInfo dmginfo - Bullet callback damage info structure
--     5. table penetrated - Table of entities bullet has gone through already
--     6. Vector previousStartPos - Either previous penetration hit position or nil
-- Returns:
--     1. boolean - Return false to block penetration

GM:TFA_BulletPenetration(Bullet bullet, Entity attacker, TraceResult traceres, CTakeDamageInfo dmginfo)
-- Hook name: TFA_BulletPenetration
-- Description: Called when bullet hits/penetrates surface
-- State: Shared
-- Arguments:
--     1. Bullet bullet - The bullet (to access weapon which fired the bullet use bullet.Wep)
--     2. Entity attacker - The entity (player or NPC) who used the weapon
--     3. TraceResult traceres - Bullet trace result
--     4. CTakeDamageInfo dmginfo - Bullet callback damage info structure



-----------------
--             --
--  RELOADING  --
--             --
-----------------

boolean GM:TFA_PreReload(Weapon weapon, boolean released)
-- Hook name: TFA_PreReload
-- Description: Called when reload key is pressed/released (before any checks done)
-- State: Shared, Predicted (not called in SP clientside)
-- Arguments:
--     1. Weapon weapon
--     2. boolean released - If legacy reloads are enabled, reload happens when reload key is pressed, otherwise when it's released (allowing for stuff like inspect)
-- Returns:
--     1. boolean - Return true to prevent weapon from reloading

boolean GM:TFA_Reload(Weapon weapon)
-- Hook name: TFA_Reload
-- Description: Called when weapon is attempting to enter reload status
-- State: Shared, Predicted (not called in SP clientside)
-- Arguments:
--     1. Weapon weapon
-- Returns:
--     1. boolean - Return true to prevent weapon from reloading

GM:TFA_PostReload(Weapon weapon)
-- Hook name: TFA_PostReload
-- Description: Called after reload status checks
-- State: Shared, Predicted (not called in SP clientside)
-- Arguments:
--     1. Weapon weapon

boolean GM:TFA_LoadShell(Weapon weapon)
-- Hook name: TFA_LoadShell
-- Description: Called when shotgun reload type weapons attempt to enter looped reload status and play animation
-- State: Shared
-- Arguments:
--     1. Weapon weapon
-- Returns:
--     1. boolean - Return true to prevent default logic

boolean GM:TFA_Pump(Weapon weapon)
-- Hook name: TFA_Pump
-- Description: Called when weapon is attempting to play pump/bolt animation
-- State: Shared
-- Arguments:
--     1. Weapon weapon
-- Returns:
--     1. boolean - Return true to prevent default logic

boolean GM:TFA_CompleteReload(Weapon weapon)
-- Hook name: TFA_CompleteReload
-- Description: Called when weapon is exiting reloading status and trying to take ammo (and clear jamming status)
-- State: Shared
-- Arguments:
--     1. Weapon weapon
-- Returns:
--     1. boolean - Return true to prevent default logic
-- Example:
hook.Add("TFA_CompleteReload", "TFA_Hooks_Example", function(weapon)
	weapon:SetClip1(weapon:GetPrimaryClipSizeForReload(true)) -- We set weapon's primary clip to max clipsize without taking ammo from the player
	weapon:SetJammed(false) -- Force clear jammed status (since default logic does that)

	return true -- Suppressing default logic
end)

boolean GM:TFA_CheckAmmo(Weapon weapon)
-- Hook name: TFA_CheckAmmo
-- Description: Called when player is holding Reload key to play inspect animation (called even if player has bound inspection keybind)
-- State: Shared
-- Arguments:
--     1. Weapon weapon
-- Returns:
--     1. boolean - Return true to prevent default logic



-------------------
--               --
--  ATTACHMENTS  --
--               --
-------------------

GM:TFA_PreInitAttachments(Weapon weapon)
-- Hook name: TFA_PreInitAttachments
-- Description: Called before attachments are initialized
-- State: Shared
-- Arguments:
--     1. Weapon weapon

GM:TFA_PostInitAttachments(Weapon weapon)
-- Hook name: TFA_PostInitAttachments
-- Description: Called after attachments sorting and initial setup but before cleanup and attachment cache build
-- State: Shared
-- Arguments:
--     1. Weapon weapon

GM:TFA_FinalInitAttachments(Weapon weapon)
-- Hook name: TFA_FinalInitAttachments
-- Description: Called after full attachments setup/initialization
-- State: Shared
-- Arguments:
--     1. Weapon weapon

boolean GM:TFA_PreCanAttach(Weapon weapon, string attachmentID)
-- Hook name: TFA_PreCanAttach
-- Description: Called before weapon checks to determine if attachment can be attached
-- State: Shared
-- Arguments:
--     1. Weapon weapon
--     2. string attachmentID - The ID of the attachment
-- Returns:
--     1. boolean - Return a boolean to prevent checks and override

boolean GM:TFA_CanAttach(Weapon weapon, string attachmentID)
-- Hook name: TFA_CanAttach
-- Description: Called after default checks to determine if attachment can be attached
-- State: Shared
-- Arguments:
--     1. Weapon weapon
--     2. string attachmentID - The ID of the attachment
-- Returns:
--     1. boolean - Return a boolean to override the return value

GM:TFA_Attachment_Attached(Weapon weapon, string attachmentID, table attTable, number category, number index, boolean forced)
-- Hook name: TFA_Attachment_Attached
-- Description: Called after attachment has been attached to the weapon
-- State: Shared
-- Arguments:
--     1. Weapon weapon
--     2. string attachmentID - The ID of the attachment
--     3. table attTable - The ATTACHMENT reference table of the attachment
--     4. number category - The category of the attachment in SWEP.Attachments
--     5. number index - The index of the attachment in the category's attachments table
--     6. boolean forced - If attachment was applied forcefully (bypassing any checks)

boolean GM:TFA_PreCanDetach(Weapon weapon, string attachmentID)
-- Hook name: TFA_PreCanDetach
-- Description: Equivalent of TFA_PreCanAttach but for detaching
-- State: Shared
-- Arguments:
--     1. Weapon weapon
--     2. string attachmentID - The ID of the attachment
-- Returns:
--     1. boolean - Return a boolean to prevent checks and override

boolean GM:TFA_CanDetach(Weapon weapon, string attachmentID)
-- Hook name: TFA_CanDetach
-- Description: Equivalent of TFA_CanAttach but for detaching
-- State: Shared
-- Arguments:
--     1. Weapon weapon
--     2. string attachmentID - The ID of the attachment
-- Returns:
--     1. boolean - Return a boolean to override the return value

GM:TFA_Attachment_Detached(Weapon weapon, string attachmentID, table attTable, number category, number index, boolean forced)
-- Hook name: TFA_Attachment_Detached
-- Description: Equivalent of TFA_Attachment_Attached but for detaching
-- State: Shared
-- Arguments:
--     1. Weapon weapon
--     2. string attachmentID - The ID of the attachment that was detached
--     3. table attTable - The ATTACHMENT reference table of the attachment
--     4. number category - The category of the attachment in SWEP.Attachments
--     5. number index - The index of the attachment in the category's attachments table that's going to be selected
--     6. boolean forced - If attachment was applied forcefully (bypassing any checks)



-----------
--       --
--  FOV  --
--       --
-----------

number GM:TFA_PreTranslateFOV(Weapon weapon, number fov)
-- Hook name: TFA_PreTranslateFOV
-- Description: Called before weapon modifies player's FOV
-- State: Shared
-- Arguments:
--     1. Weapon weapon
--     2. number fov - Reference FOV received by weapon
-- Returns:
--     1. number - Return a number to override FOV and prevent default logic

number GM:TFA_TranslateFOV(Weapon weapon, number fov)
-- Hook name: TFA_TranslateFOV
-- Description: Called after weapon calculated modified FOV
-- State: Shared
-- Arguments:
--     1. Weapon weapon
--     2. number fov - Modified FOV value returned by weapon
-- Returns:
--     1. number - Return to override modified FOV



------------------
--              --
--  ANIMATIONS  --
--              --
------------------

number GM:TFA_AnimationRate(Weapon weapon, number sequence, number rate)
-- Hook name: TFA_AnimationRate
-- Description: Called
-- State: Shared
-- Arguments:
--     1. Weapon weapon
--     2. number sequence - Index of sequence from viewmodel animations
--     3. number rate - Playback speed multiplier calculated by weapon
-- Returns:
--     1. number - Return modified playback speed multiplier to override



---------------
--           --
--  EFFECTS  --
--           --
---------------

any GM:TFA_MakeShell(Weapon weapon)
-- Hook name: TFA_MakeShell
-- Description: Called when weapon is trying to emit a shell casing effect
-- State: Shared
-- Arguments:
--     1. Weapon weapon
-- Returns:
--     1. any - Return anything to cancel

any GM:TFA_EjectionSmoke(Weapon weapon)
-- Hook name: TFA_EjectionSmoke
-- Description: Called when weapon is trying to emit smoke from shell ejection port
-- State: Shared
-- Arguments:
--     1. Weapon weapon
-- Returns:
--     1. any - Return anything to cancel

any GM:TFA_MuzzleFlash(Weapon weapon)
-- Hook name: TFA_MuzzleFlash
-- Description: Called when weapon is trying to emit muzzle flash effect
-- State: Shared
-- Arguments:
--     1. Weapon weapon
-- Returns:
--     1. any - Return anything to cancel

any GM:TFA_MuzzleSmoke(Weapon weapon)
-- Hook name: TFA_MuzzleSmoke
-- Description: Called when weapon is trying to emit smoke from muzzle
-- State: Shared
-- Arguments:
--     1. Weapon weapon
-- Returns:
--     1. any - Return anything to cancel



------------------
--              --
--  IRONSIGHTS  --
--              --
------------------

any GM:TFA_IronSightSounds(Weapon weapon)
-- Hook name: TFA_IronSightSounds
-- Description: Called when weapon tries to play ironsights enter/exit sound
-- State: Shared
-- Arguments:
--     1. Weapon weapon
-- Returns:
--     1. any - Return anything to cancel



-----------------------
--                   --
--  MELEE / BASHING  --
--                   --
-----------------------

boolean GM:TFA_CanBash(Weapon weapon)
-- Hook name: TFA_CanBash
-- Description: Called when player is attempting to use melee bash attack (after initial checks)
-- State: Shared
-- Arguments:
--     1. Weapon weapon
-- Returns:
--     1. boolean - Return false to disallow melee attack

GM:TFA_Bash(Weapon weapon)
-- Hook name: TFA_Bash
-- Description: Called when weapon is about to perform a melee attack
-- State: Shared
-- Arguments:
--     1. Weapon weapon

GM:TFA_PostBash(Weapon weapon)
-- Hook name: TFA_PostBash
-- Description: Called after weapon has entered melee attack status
-- State: Shared
-- Arguments:
--     1. Weapon weapon

boolean GM:TFA_MeleeCanBlockDamage(Weapon weapon, Player player, CTakeDamageInfo dmginfo, boolean canblock)
-- Hook name: TFA_MeleeCanBlockDamage
-- Description: Callen when melee weapon is asked to block the incoming damage
-- State: Shared (only for bullet damage), Server (for any other type)
-- Arguments:
--     1. Weapon weapon
--     2. Player player - The player that is receiving the damage that's about to be blocked
--     3. CTakeDamageInfo dmginfo - Incoming damage
--     4. boolean canblock - Original decision of weapon if it's allowed to block or not
-- Returns:
--     1. boolean - Return to override the decision



----------------------------
--                        --
--  HUD / USER INTERFACE  --
--                        --
----------------------------

boolean GM:TFA_DrawCrosshair(Weapon weapon, number x, number y)
-- Hook name: TFA_DrawCrosshair
-- Description: Called from SWEP:DoDrawCrosshair when weapon is about to draw crosshair
-- State: Client
-- Arguments:
--     1. Weapon weapon
--     2. number x
--     3. number y
-- Returns:
--     1. boolean - Return false to draw only engine crosshair, true to block both

boolean, number, number, number GM:TFA_DrawHUDAmmo(Weapon weapon, number x, number y, number alpha)
-- Hook name: TFA_DrawHUDAmmo
-- Description: Called before drawing holographic ammo indicator on screen
-- State: Client
-- Arguments:
--     1. Weapon weapon
--     2. number x - left position
--     3. number y - top position
--     4. number alpha
-- Returns:
--     1. boolean - Return false to prevent drawing (next returns ignored), true to modify following values:
--     2. number - modified X position
--     3. number - modified Y position
--     4. number - modified alpha

boolean GM:TFA_DrawScopeOverlay(Weapon weapon)
-- Hook name: TFA_DrawScopeOverlay
-- Description: Called before drawing 2D scope overlay
-- State: Client
-- Arguments:
--     1. Weapon weapon
-- Returns:
--     1. boolean - Return true to prevent drawing the overlay

table GM:TFA_PopulateKeyBindHints(Weapon weapon, table rawKeysTable)
-- Hook name: TFA_PopulateKeyBindHints
-- Description: Allows to populate keybinds table prior to drawing (called from SWEP:PopulateKeyBindHints() function)
-- State: Client
-- Arguments:
--     1. Weapon weapon
--     2. table rawKeysTable - Raw keybindings table
-- Returns:
--     1. table rawKeysTableResult - Return the table to stop further processing
-- Example:
hook.Add("TFA_PopulateKeyBindHints", "TFA_Hooks_Example", function(wep, keys)
	-- self:GetKeyBind({"+use", "+reload"}, "firemode")
	-- First argument is a table of commands
	-- Second argument is an ID of keybind registered through TFA.RegisterKeyBind, replaces all keys from first argument if key is bound (optional)

	table.insert(keys, {
		label = "Open Spawnmenu", -- it is recommended to use a localized string with language.GetPhrase
		keys = {wep:GetKeyBind({"+menu"})} -- can have multiple keys; GetKeyBind args: first is table of commands (they will be chained with +), the second (optional) is keybind identifier added with TFA.RegisterKeyBind and will be displayed instead of first
	}) -- this will add "[Q] - Open Spawnmenu" at the end of the keys table (before the TAB one, it always comes the last)

	table.insert(keys, 1, {
		label = "Sprint Forward",
		keys = {wep:GetKeyBind({"+speed", "+forward"})}
	}) -- this will add "[SHIFT + W] - Sprint Forward" at the start of the keys table

	-- table.insert(keys, {
	-- 	label = language.GetPhrase("tfa.hint.keys.safety"),
	-- 	keys = {self:GetKeyBind({"+speed"}), self:GetKeyBind({"+use", "+reload"}, "firemode")}
	-- }) -- example from the base, will display SHIFT+E+R or SHIFT+<firemode bind override key>
end)

boolean GM:TFA_PreDrawKeyBindHint(Weapon weapon, number x, number y, number alpha, table rawKeysTable, table keyStrings)
-- Hook name: TFA_PreDrawKeyBindHint
-- Description: Called before keybinds hint is drawn (only if alpha > 0)
-- State: Client
-- Arguments:
--     1. Weapon weapon
--     2. number x
--     3. number y
--     4. number alpha
--     5. table rawKeysTable
--     6. table keyStrings - Processed keybinds in format "[KEY(S)] - Label"
-- Returns:
--     1. boolean - Return true to prevent drawing

GM:TFA_PostDrawKeyBindHint(Weapon weapon, number x, number y, number alpha, table rawKeysTable, table keyStrings)
-- Hook name: TFA_PostDrawKeyBindHint
-- Description: Called after keybinds hint is drawn
-- State: Client
-- Arguments:
--     1. Weapon weapon
--     2. number x
--     3. number y
--     4. number alpha
--     5. table rawKeysTable
--     6. table keyStrings

boolean GM:TFA_ShouldDrawStencilSight(Weapon weapon)
-- Hook name: TFA_ShouldDrawStencilSight
-- Description: Called when weapon is trying to draw stencil sight reticle
-- State: Client
-- Arguments:
--     1. Weapon weapon
-- Returns:
--     1. boolean - Return false to prevent reticle from drawing



---------------------------------------
--                                   --
--  CUSTOMIZATION / INSPECTION MENU  --
--                                   --
---------------------------------------

boolean GM:TFA_InspectVGUI_Start(Weapon weapon)
-- Hook name: TFA_InspectVGUI_Start
-- Description: Called before main customization screen panel is generated
-- State: Client
-- Arguments:
--     1. Weapon weapon
-- Returns:
--     1. boolean - Return false to prevent creation

GM:TFA_InspectVGUI_Finish(Weapon weapon, Panel mainpanel, Panel contentpanel)
-- Hook name: TFA_InspectVGUI_Finish
-- Description: Called after every panel has been initialized
-- State: Client
-- Arguments:
--     1. Weapon weapon
--     2. Panel mainpanel - The parent inspection screen panel
--     3. Panel contentpanel - The padded panel that contains all elements

boolean GM:TFA_InspectVGUI_InfoStart(Weapon weapon, Panel contentpanel)
-- Hook name: TFA_InspectVGUI_InfoStart
-- Description: Called before populating screen with weapon info elements
-- State: Client
-- Arguments:
--     1. Weapon weapon
--     2. Panel contentpanel - The padded panel that contains all elements
-- Returns:
--     1. boolean - Return false to prevent creation

GM:TFA_InspectVGUI_InfoFinish(Weapon weapon, Panel contentpanel, Panel infopanel)
-- Hook name: TFA_InspectVGUI_InfoFinish
-- Description: Called when weapon info elements are added
-- State: Client
-- Arguments:
--     1. Weapon weapon
--     2. Panel contentpanel - The padded panel that contains all elements
--     3. Panel infopanel - The container panel for all displayed info elements

boolean GM:TFA_InspectVGUI_StatsStart(Weapon weapon, Panel contentpanel)
-- Hook name: TFA_InspectVGUI_StatsStart
-- Description: Called before adding weapon stats panel
-- State: Client
-- Arguments:
--     1. Weapon weapon
--     2. Panel contentpanel - The padded panel that contains all elements
-- Returns:
--     1. boolean - Return false to prevent creation

GM:TFA_InspectVGUI_StatsFinish(Weapon weapon, Panel contentpanel, Panel statspanel)
-- Hook name: TFA_InspectVGUI_StatsFinish
-- Description: Called when weapon stats are added
-- State: Client
-- Arguments:
--     1. Weapon weapon
--     2. Panel contentpanel - The padded panel that contains all elements
--     3. Panel statspanel - The container panel for all displayed stats

boolean GM:TFA_InspectVGUI_AttachmentsStart(Weapon weapon, Panel contentpanel)
-- Hook name: TFA_InspectVGUI_AttachmentsStart
-- Description: Called before adding attachments selector panel
-- State: Client
-- Arguments:
--     1. Weapon weapon
--     2. Panel contentpanel - The padded panel that contains all elements
-- Returns:
--     1. boolean - Return false to prevent creation (also blocks damage falloff graph)

GM:TFA_InspectVGUI_AttachmentsFinish(Weapon weapon, Panel contentpanel, Panel attachmentspanel)
-- Hook name: TFA_InspectVGUI_AttachmentsFinish
-- Description: Called after attachments selector panel is generated
-- State: Client
-- Arguments:
--     1. Weapon weapon
--     2. Panel contentpanel - The padded panel that contains all elements
--     3. Panel attachmentspanel - The resulting attachments selector panel

boolean GM:TFA_InspectVGUI_FalloffStart(Weapon weapon, Panel contentpanel)
-- Hook name: TFA_InspectVGUI_FalloffStart
-- Description: Called before damage falloff graph is initialized
-- State: Client
-- Arguments:
--     1. Weapon weapon
--     2. Panel contentpanel - The padded panel that contains all elements
-- Returns:
--     1. boolean - Return false to prevent creation

GM:TFA_InspectVGUI_FalloffFinish(Weapon weapon, Panel contentpanel, Panel falloffpanel)
-- Hook name: TFA_InspectVGUI_FalloffFinish
-- Description: Called after damage falloff graph panel is initialized
-- State: Client
-- Arguments:
--     1. Weapon weapon
--     2. Panel contentpanel - The padded panel that contains all elements
--     3. Panel falloffpanel - The resulting damage falloff graph panel



----------------------
--                  --
--  DEPTH OF FIELD  --
--                  --
----------------------

boolean GM:TFA_AllowDoFDraw(Weapon weapon, Player player, Entity viewmodel)
-- Hook name: TFA_AllowDoFDraw
-- Description: Called before drawing aim DoF effect on viewmodel
-- State: Client
-- Arguments:
--     1. Weapon weapon
--     2. Player player - The player that is currently holding the weapon
--     3. Entity viewmodel - Weapon's viewmodel
-- Returns:
--     1. boolean - Return false to prevent effect from drawing

number GM:TFA_GetDoFMuzzleAttachmentID(Weapon weapon, Player player, Entity viewmodel)
-- Hook name: TFA_GetDoFMuzzleAttachmentID
-- Description: Called when deciding reference attachment for DoF effect focus
-- State: Client.
-- Arguments:
--     1. Weapon weapon
--     2. Player player - The player that is currently holding the weapon
--     3. Entity viewmodel - Weapon's viewmodel
-- Returns:
--     1. number - Return viewmodel's attachment point index to override


