# Frequently Asked Questions

## Weapons are not making any sounds, is something broken?
If there are no additional errors, this is not related to any TFA addons or any other addon at all. You most likely have pirated CS:S, HL2 EP1/2 content installed, which breaks any custom sounds added by addons. Make sure to uninstall any of it first!
If there are errors produced each time: Make sure the error is produced by the base and not the weapon you are using before reporting the issue.

## How do I lock X attachment on my server?
You can only disable attachments completely (`Q` -> `Utilities` -> `Server` -> `Enable Attachments` or `sv_tfa_attachments_enabled 0`.) There will never be an option for selective attachments blacklist included in the base.

If you are an addon developer, the base is providing a hook that enables to disallow equipping attachments. The documentation on base hooks is available [here](lua/tfa/documentation/tfa_hooks_custom.lua).

## The C-menu (inspection screen) is not working!
Copy the following line and run it in the console:
```
sv_tfa_attachments_enabled 1; sv_tfa_cmenu 1; sv_tfa_cmenu_key -1; cl_tfa_keys_customize 0
```

## What's the console commands list?
If you are using Sandbox or Sandbox-derived gamemode, you can use the `Server` settings menu in the `Utilities` tab to tweak the base to your liking (even on the server, the menu is networked!)

For gamemodes without Sandbox spawnmenu, the console parameters list will be provided ~~soon shortly~~ sometime later. As for now, you can use `cvarlist cl_tfa_` on client and `cvarlist sv_tfa_` on the server to list all registered variables.

## (Screenshot showing a bunch of errors from the base)
You probably have some reupload (or any kind of server content that bundles the code) installed alongside the official version of the base. __Make sure you only have official version of the base installed and enabled first__ (try disabling all addons, enable only the base and weapons you are using then enable addons in halves until you find the one that's causing the issues)

Alternatively, (although highly unlikely) you might have too many addons installed and enabled to actually hit the Lua files limit, which causes parts of the base simply to not load properly.

## Server settings are reset after server restart!
This is a problem with your server host. Base settings use default engine ConVars, which require `garrysmod/cfg/server.vdf` file to be writable to be saved correctly. Raise an issue to your server host if that file is read-only, as it breaks settings from other addons as well, not just TFA Base.

## I have a problem with a Star Wars weapon/pack...
**Contact author(s) of the said pack, not us.** We are unable to help with all kinds of issues coming from third-party weapons/packs. Consult the server rules __before__ posting your issue.

## I can't select any attachment
A. Remove `-tools` parameter from your GMod launch options. Engine tools interfere with `gui.EnableScreenClicker` function which is used by many addons (not just TFA Base and TFA-VOX) and are not needed in normal gameplay.

