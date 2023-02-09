# Frequently Asked Questions/Useful Stuff for Addon Developers

## Changing stats in `SWEP.Primary`/`SWEP.Secondary` tables does not work!
Due to extensive stat caching system, you would need to override the base table values and clear the stat cache:
1. Change value in `Primary_TFA` or `Secondary_TFA` table respectively
```Lua
wep.Primary_TFA.Damage = 123
```
2. Call `SWEP:ClearStatCache` function with the stat name
```Lua
wep:ClearStatCache("Primary.Damage")
```
This example sets base `SWEP.Primary.Damage` value to 123 and applies all necessary modifications to it through attachments/hooks

## How to properly override base functions?
If you are thinking of copying the function and modifying it, don't! This could (and will) break a lot of stuff after base update when said function is modified.
What you should do instead is override with calling functions from base class:
```Lua
-- Example override function with return value
DEFINE_BASECLASS(SWEP.Base) -- required only once before ALL override functions

function SWEP:Think2(...)
    local retVal = BaseClass.Think2(self, ...) -- running base method first

    -- your code here

    return retVal
end
```