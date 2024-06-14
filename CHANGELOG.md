# This is an archive of changelog messages from `tfa_loader.lua`.
## 4.7.8.5
* Fixed error when both base weapon and it's descendant has an event table
* Fixed spread with forced bullet ballistics enabled
* Updated the localization files

## 4.7.8.4
* Fixed akimbo shoot animations order breaking (and HUD mismatch)

## 4.7.8.3
* Fixed melee attack direction selection not working
* Added stat name translator to development menu (along with a command)

## 4.7.8.2
* Stencil reticle types can now be combined
* Added a slight delay for subcategories population hook to make sure it runs after default weapons population

## 4.7.8.1
* Added spawnmenu subcategories support (SWEP.SubCategory)

## 4.7.8.0
* Added simple fallback HUD that displays when main 3D2D HUD is disabled (for stuff like firemode)
* Changed default font used across the base
* Added a hook that runs after base (re)registers all its fonts

## 4.7.7.0
* Added missing viewmodel checks
* Added toggle for TTT weapons list auto-population

## 4.7.6.8
* Added better checks for fire loop animation and sound
* Fixed sprinting animation not playing after exiting fire loop

## 4.7.6.7
* Fixed flat stat bars options breaking text display
* Split up interface settings into groups

## 4.7.6.6
* Fixed unsight on bolt/pump after shooting not working properly
* Fixed hard error when attachment depends on another attachment which is unavailable/not registered
* Added console warning for the case above

## 4.7.6.5
* Fixed doors not respawning after getting broken off hinges with melee weapons

## 4.7.6.4
* Fixed attachments reload command not working from server console
* Fixed attachments ID resolving for related hooks

## 4.7.6.3
* Fixed sprint offset being applied with melee bashing
* Procedural camera bobbing is now inverted for inspect animations
* Empty RTCode function (very old template weapons) is now patched out, removing unnecessary screen blur

## 4.7.6.2
* Fixed procedural blowback spamming errors on client

## 4.7.6.1
* Restored old secondary melee fallback behavior (only fallback to primary if there are no secondary attacks available)
* Melee weapons can now use SWEP.Primary/Secondary.Damage instead of split per-attack value
* Added random damage multiplier controls to server settings menu

## 4.7.6.0
* Keybind tooltips are now less annoying (do not force display when picking up props)
* Fixed safety holster not working for bow-based weapons
* Added ability to change amount of rounds appended for shotgun/round-insert reload type
* Added override for melee weapon attack selection (old behavior/random attack is default)
* Redone stats display: slight optimization and ability to add custom stats
* Fixed tooltip panels not getting removed with inspection screen (slight memory leak)

## 4.7.5.3
* Stencil sight reticle fixes (viewmodel redraw now skips the sight model, flat reticle now draws properly over everything)
* Fixed some animations cutting off early (mostly noticeable with foregrip-like attachments which change animations)

## 4.7.5.2
* Expanded stencil sights with pre and post draw functions (with attachments support and hook to stop reticles from drawing)
* Fixed missing thirdperson animations/sounds in singleplayer
* Fixed unscoping on rechamber when weapon doesn't require it

## 4.7.5.1
* Fixed keys from keybinds tab not being capitalized properly in the hint
* Melee damage now follows the global damage multiplier and randomization rules
* Fixed damage randomization not being synced with client
* Player melee damage modifier is now applied correctly

## 4.7.5.0
* Added keybind hints - shown on weapon draw, after changing attachments and with scoreboard (with hooks for mods to add custom hints)
* Fixed NPCs and players flying away on headshots with bullet penetration enabled
* Сamera bobbing fixes (framerate consistency, broken fade in/out, not working on inspect)
* Added melee damage blocking hook
* Looped fire sound now gets paused with the game
* 3D scopes zoom and sensitivity are now calculated properly for weapons relied on removed autodetection system
* Fixed console spam with custom shell casing models without correct setup
* Debug crosshair is now corrected for the camera movement

## 4.7.4.2
* Addressed even more 3D scopes issues

## 4.7.4.1
* Fixed 3D scope failing to work in certain cases

## 4.7.4.0
* Ironsights DoF focus attachment can be changed properly now
* Various improvements to tfa_3dscoped_base (fixed mouse sensitivity compensation, angle transforms no longer require QC attachment)
* Removed option to disable 3D scopes
* Updated contributor credits

## 4.7.3.0
* New default melee bash sounds
* Fix for bone modifying addons not working with weapons that don't have viewmodel elements (mostly affecting melee weapons)
* Keybind for silencer toggle

## 4.7.2.0
* Attachments selection now persists across sessions (save/restore)
* Gun sway direction can now be inverted (instead of using inverted gun bob value)
* Added menu options for disabling attachments and randomized attachments selection for NPCs
* Crosshair team highlight colors can now be customized
* Base settings will use improved color selector when DLib is installed
* Slight adjustments to About tab (removed broken links, added latest changes display, names of all contributors and support Discord server link)

## 4.7.1.3
* Hotfix for broken 3D scopes and non-enforced VM options

## 4.7.1.2
* Fixed friendly NPCs not highlighted by crosshair color
* Added min/max values to many console variables. Yes, this is probably why your weapon was "invisible" (it's a good idea to check the FOV multiplier in viewmodel settings and make sure it's set at 1)

## 4.7.1.1
* Knife-based weapons are now properly lag-compensated
* Crosshair team color rework: now shows proper team for NPCs and can be turned off for players (default for TTT)
* Fixed weapon carry slowdown not being able to be disabled properly
* Added hook for attachment detaching

## 4.7.1.0
* Fixed bullet force value being completely ignored in favor of autocalculated one
* Various inspection menu improvements (localized weapon type, multiline description with word wrap)
* Fixed attachments not syncing properly from NPCs and other players
* Fixed skins not updating on worldmodels

## 4.7.0.5
* Fixed attachments not being synchronized properly from server in multiplayer

## 4.7.0.4
* Updated low and last ammo sounds, added more types (including unused ones, examples are in the weapon template) and improved autodection.

## 4.7.0.3
* Fixed legacy weapons patcher giving an error when weapon's code couldn't be read

## 4.7.0.2
* Fixed ironsights position evaluator generating errors in some cases
* Fixed flat reticle not being scaled by screen height when it's not scaled by aim progress
* Added chat reminder to clueless users who only installed the base without any weapons

## 4.7.0.1
* Added TFA_Bullet_Penetrate hook
* Fixed 3D scoped weapons being zoomed in too much
* Fixed ironsights toggle convar not working properly

## 4.7.0.0
* Semi-Breaking change: Implemented gun revision tracking (but should be backward compatible)
* Tickrate independent RPM (for all your roleplaying at 10 ticks needs)
* Stencil sights native support (with 2D, model and quad reticles)
* Ironsights position resolver (WIP)
* Additional SCK features (translucency workaround toggle and attachment parent point)
* Weapons now emit sound hints (for engine NPCs)
* Primary.DisplaySpread / Primary.DisplayIronSpread toggle
* Spread recovery delay (per weapon, not present by default)
* Default attachments option (equipped on deselect)
* Various fixes, QoL changes and improvements (check commit history on GitLab)
* Expanded documentation (lua/tfa/documentation and template)

## 4.6.1.1
* Fixed idle animation not updating correctly for ironsights
* Fixed inspection screen not appearing in some circumstances
* Improved flashlight toggle prediction
* Fixed some grenades throwing an error if "ready" animation is missing

## 4.6.1.0
* BaseClass tables are now unpacked to current weapon class (fixes TFA NMRIH Chainsaw)
* Reorganized weapon base files
* Added responsive ironsights mode (click to toggle, hold to hold)
* Fixed being unable to reload if timescale value is too high
* Fixed centering of triangular crosshair
* Range is now converted to LUT automatically, removed legacy range option
* Fixed damage falloff range display

## 4.6.0.7
* Fixed crouching state not being recognized without holding a key
* Fixed bullet ballistics. Again.

## 4.6.0.6
* Added viewmodel viewpunch toggle settings
* Fixed crashing when addons call SWEP:Initialize out of order
* Fixed bullet ballistics for NPCs not working
* Fixed procedural reloads
* Sped up ironsights/scope FOV change

## 4.6.0.5
* Added a workaround for old weapons that override SWEP:Think function without baseclass call

## 4.6.0.4
* Fixed nZombies weapons sharing ammo types

## 4.6.0.3
* Fixed viewmodel snapping to idle position on procedural holster end

## 4.6.0.2
* Fixed nZombies compatibility (only original nZ version was tested)

## 4.6.0.1
* Fixed shotgun spread not working properly with ballistics enabled
* Fixed some weapons failing to initialize missing attachments table
* Fixed DoAmmoCheck error when weapon stripping is enabled

## 4.6.0.0
* HUGE optimization and prediction improvements
* Better recoil and viewpunch, all configurable
* New nearly-empty (and empty) magazine click sounds
* Proper NPC support (custom tracers/projectiles, random attachments)
* Redone Inspection GUI (scaled fonts and elements, hooks, overrides)
* Improved damage falloff (LUT falloff with variable calculation methods)
* ADS reload animation support (like in CAWODOOTY! favorite gaem!!!)
* Hybrid blowback animation (allowing model animation to play)
* Crouched viewmodel offset position
* Full sequence-based weapons support
* Silenced empty/last fire animation support
* Each animation can contain values for each case (like in SWEP.PumpAction, etc)
* New viewmodel position/angles interpolation techniques

## 4.5.8.0
* Added material proxy for tinting envmaps with ambient lighting (TFA_CubemapTint)
* Added option to debug currently playing anination (Admin-only)

## 4.5.7.1
* Fixed networked menu not working in Local/P2P servers

## 4.5.7.0
* Added localization support. English and Russian locales are bundled by default.
* Fixed weapons not spawning in TTT (by Anairkoen Schno)
* Blocked new ammo pickups (SMG grenades) from being pocketed in DarkRP

## 4.5.6.0
* Added ammo entities for SMG grenades (1 and 5 grenades for small and large pickups)
* Server settings menu now work in multiplayer (rewritten to use networked controls)

## 4.5.5.1
* Fixed non-ballistics bullet tracers for akimbo weapons
* Added bash damage display to inspection screen (when available)

## 4.5.5.0
* Added TFA_BulletPenetration hook, called when bullet hits/penetrates a surface
* Reverted ironsights FOV compensation changes - new compensation only applies to viewmodels now
* Exposed more variables to stat cache (various sounds, sck elements bodygroups)
* Fixed performance degradation when player holds a non-TFA weapon in singleplayer
* Added muzzleflash smoke toggle convar (Q -> Options -> Performance -> Use Muzzle Flash Smoke)

## 4.5.4.0
* Started work on new RT scope attachment base
* Fixed silenced weapon shaking when Siminov's SWEP packs are installed
* Added toggle for melee door destruction
* Fixed customization keybind not opening the menu
* Fixed viewmodel floating away with low MoveSpeed values
* Fixed ironsights FOV compensation to be more consistent on all FOV values
* Added SWEP.IronViewModelFOV parameter - SWEP.ViewModelFOV will be set to this when aiming down the sights

## 4.5.3.1
* Added icons for ammo entities

## 4.5.3.0
* Fixed presets in settings menu not working
* Various Lua animation fixes
* Added customization menu idle animation (and transitions) support

## 4.5.2.0
* Added keybinds! (Menu can be found at Q -> Options -> Keybinds)
* Added looping fire support
* Fixed shell casings scrape sounds (huge thanks to gmod_silent material for not working properly!)

## 4.5.1.1
* Fixed bugs with level transition and for bullets fired after player's death
* Fixed looped fire sounds not working properly in P2P/listen servers

## 4.5.1.0
* Flashlights rework: added support for QC attachments of SCK elements and custom on/off sounds
* Added TFA.AddSound function (simple wrapper for sound.Add)
* Looping fire sound now updates correctly if changed while playing

## 4.5.0.3
* Fixed resetting viewmodel skin after switching weapon
* Fixed Ironsights DoF blurring whole screen for 2D-scoped weapons
* Fixed ballistics ConVars (dev branch is now safe to use again)

## 4.5.0.2
* Fixed the bug with first spawned weapon after map load not working

## 4.5.0.1
* Inspection VGUI now doesn't block the screen with mat_dxlevel < 90
* Ironsights convar now works properly again
* Base explosives now can have custom bounce sound (ENT.BounceSound)
* Crysis-like triangular crosshair, can be enabled in the "HUD / Crosshair" section

## 4.5.0.0
* Weapons can now have a working flashlight
* Changed laser dot to appear as projected texture
* Added attachment callbacks
* Safety position is now separated from sprint one
* Melee blocking works again
* Base explosives now properly damage helicopters and gunships
* Added jamming mechanics
* Added CS:GO-like low ammo sound effect
* Added bodygroup names support
* Attachments can now have their own attach/detach sound
* Added walk animations support (similar to sprint animations)
* Bonemods are now working properly with blowback enabled
* Fixed laser drawing behing worldmodel
* Looped gunfire sound support added (Experimental)

## 4.4.2.1
* Changelog can be toggled off with sv_tfa_changelog

## 4.4.2.0
* New laser dots
* Better ejection effects
* AI melee support

## 4.4.1.0
* Patch: New smoke effects on muzzles and shells, which should hopefully eat less fps and look better

## 4.4.0.0
* Entire base linted
* Fewer global variables
* TFA attachment table moved to TFA.Attachments.Atts -- this will need an update to autopatching mods

## 4.3.8.1
* PATCH - Exploit regarding new C-Menu fix, viewmodel viewpunch made into a cvar ( it'll go down with recoil if disabled )

## 4.3.8.0
* Reticules/lasers now colorable in context menu
* Hold E as you hit your inspection key to access the context menu as normal

## 4.3.7.0
* Attachment UI now allows rows to affect the same category, and will break apart exceedingly large rows
* Legacy attachment UI removed

## 4.3.6.0
* Muzzles + smoke updated, the latter taken from CS:GO

## 4.3.5.2
* Fixed shells networking
* Fixed RT scope resolution autodetect
* Added RT scope material proxy

## 4.3.5.1
* Fixed weapon bounce in new viewbob, increased intensity, smooth eye focus

## 4.3.5.0
* Cancelling an empty reload on a closed bolt weapon will play the first deploy and cock the gun upon next draw

## 4.3.4.1
* Fixed console spam with dropped weapons
* Added ability to disable door destruction (thanks to Ralph)

## 4.3.4.0
* Viewbob tweaks

## 4.3.2.3
* More violent shell ejection; shell angle determined by eye angles

## 4.3.2.2
* Shells resized AGAIN and double-checked for accuracy this time using OBBMaxs()-OBBMins()

## 4.3.2.1
* SWEP.LuaShellEffect = "" disables the new tfa_shell stuff
* Shells resized using actual math

## 4.3.2.0
* Added ability to override new shell effects
* Fixed serverside modules/external files loader
* Fixed LookupAttachment error for externally registered weapons
* Fixed scope background blur working in thirdperson

## 4.3.1.0
* Shell hotfixes
* Weapons no longer have airboat damage type, finally fixing ragdolls

## 4.3.0.0
* New shell ejection effects
* New shell models (Soldier11's)
* RT Scope Blur
* New clientside options on the performance and scope panels

## 4.2.8.0
* Numerous bugfixes
* Notably: FOV fixed in overlay-style scopes + shotgun timing fixes

## 4.2.7.9
* Inspection panel tweaks and performance fixes
* New font for ammo hud and inspection panel
* Fixed ironsight sway direction for flipped viewmodels

## 4.2.7.8
* Unload functions added

## 4.2.7.4
* ERROR SPAM HOTFIX

## 4.2.7.3
* Silenced inspection added ( ACT_VM_FIDGET_SILENCED = ACT_VM_FIDGET_SILENCED or ACT_RPG_FIDGET_UNLOADED )
* Have a one-time invitation to my Discord: https://discord.gg/Gxqx67n

## 4.2.6.5
* Added laser-dot trail convar ( thanks Yura )

## 4.2.6.4
* Fixed Yura's crosshair nitpick

## 4.2.6.2
* Melee base prediction fixes

## 4.2.6.1
* Knife prediction improvements ( general melee to follow )

## 4.1.7.0
* Bind detection system added

## 4.0.1.0
* TFA Base Rewrite
* Numerous hotfixes, including ADS, sprint anims, etc.
* DarkRP "fp" table no longer overwritten
* External status support added
* Reload sounds added

## 3.05.2.0
* Doors fixed for DarkRP ( probably )
* Silenced weapon inspection fixed
* Idle animation timing improved
* C-Key inspection fixed
* Weapon stripping fixed
* CVAR sv_tfa_door_respawn added

## 3.05.0.0
* Basic GMDUSK integration
* Shotgun door-bust tweaked, improved, and fixed for DarkRP (hopefully)
* Scopes fixed for DarkRP ( hopefully )

## 3.01.2.0
* New group prompt added
* Introduced bare-basics multilanguage support
* Migrated global functions to a table
* Miscelaneous quality of life improvements

## 3.01.1.0
* Added new cvars of mp_tfa_precach.  Enable these to increase loading times but reduce lag and weapon spawn time.
* Use console autocomplete instead of bothering me for the exact names!
* Bugfix in setupmove fixed
* Conflict message improved, displaying exact filepath for a conflicting tfa_loader
* Lua particle handling fixed on invalid viewmodels
* Other misc. bugfixes

## 3.0.0.1
* Shock damage no longer removes props
* Fixed rendertargets
* Further improved performance

## 3.0.0.0
* Entire TFA Base linted and micro-optimized
* Performance holding a TFA Base gun is better compared to a HL2 gun

## 2.88.0.0
* Added SWEP.Primary.AmmoConsumption
* Added extra revolver ejecteffect
* Misc. bugfixes