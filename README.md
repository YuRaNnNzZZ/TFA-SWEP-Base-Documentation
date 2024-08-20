# This is the official [TFA SWEP Base](https://steamcommunity.com/sharedfiles/filedetails/?id=2840031720) documentation.

### Before going through anything from here, make sure you have read through [Lua basics guide for GMod here](https://wiki.facepunch.com/gmod/Beginner_Tutorial_Intro) first!

## List of contents:
- [Frequently Asked Questions](faq/FOR_USERS.md) - Answers to common base users questions
- [Weapon Template](lua/tfa/documentation/tfa_base_template.lua) - reference for the main weapon Lua file with all values ([legacy template](lua/tfa/documentation/tfa_legacy_template.lua) is available for backwards compatibility reference)
- [Melee Weapon Template](lua/tfa/documentation/tfa_melee_template.lua) - reference for melee-type weapons
- [Attachment Template](lua/tfa/documentation/tfa_attachment_template.lua) - file name is the ID of attachment that goes into `SWEP.Attachments` table, place to `<your addon>/lua/tfa/att` folder
- [Animations Reference](lua/tfa/documentation/tfa_anims_template.lua) - list of animations that are used by the base
- [Custom Hooks](lua/tfa/documentation/tfa_hooks_custom.lua) - list of [hooks](https://wiki.facepunch.com/gmod/hook.Add) added by the base for the addons intercompatibility
- [Material Proxies](lua/tfa/documentation/tfa_matproxies.lua) - list of [material proxies](https://developer.valvesoftware.com/wiki/Material_proxies) added by the base
- [Developer FAQ](faq/FOR_DEVELOPERS.md) - Common code stuff relevant to developing TFA Base addons

## Paths that are loaded by the base automatically (in load order):
- `lua/tfa/enums/` - Early enums initialization (only recommended for early global variables declaration)
- `lua/tfa/modules/` - Base modules (official modules are loaded first; custom modules loading is only kept for backwards compatibility and is unsupported!)
- `lua/tfa/external/` - External modules (code loaded in there is guaranteed to have `TFA` global variable initalized)
- `lua/tfa/att/` - Attachments (files with `base` in their name are loaded first)
### All paths (except attachments) support client and server-side separation by prepending `cl_` or `sv_` to the file name.

### If you want to translate the base to your language, take a look at the [localization reference](LOCALIZATION.md)!