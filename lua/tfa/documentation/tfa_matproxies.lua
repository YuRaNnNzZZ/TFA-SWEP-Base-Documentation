-- Name: PlayerWeaponColorStatic
-- Description: Static/direct variation of PlayerWeaponColor, without any flickering.
-- Parameters:
--     1. resultvar - Result variable for the color (such as $color2)
-- VMT Example:
--[[
	Proxies
	{
		PlayerWeaponColorStatic
		{
			resultvar	$color2
		}
	}
]]


-- Name: TFALaserColor
-- Description: 
-- Parameters:
--     1. resultvar - Result variable for the color (such as $color2)
-- VMT Example:
--[[
	Proxies
	{
		TFALaserColor
		{
			resultVar	$color2
		}
	}
]]


-- Name: TFAReticuleColor
-- Description: 
-- Parameters:
--     1. resultvar - Result variable for the color (such as $color2)
-- VMT Example:
--[[
	Proxies
	{
		TFAReticuleColor
		{
			resultVar	$color2
		}
	}
]]


-- Name: TFA_RTScope
-- Description: Replaces $basetexture with render target texture of 3D scopes
-- VMT Example:
--[[
	Proxies
	{
		TFA_RTScope
		{
		}
	}
]]


-- Name: TFA_CubemapTint
-- Description: Tints 
-- Parameters:
--     1. resultvar - Variable for resulting envmap tint ($envmaptint)
--     2. multiplier - Variable for base tint multiplier (a vector)
-- VMT Example:
--[[
	$envmapmultiplier	"[1 1 1]" // Lighting will be multiplied by this value

	Proxies
	{
		TFA_CubemapTint
		{
			resultvar	$envmaptint // Write final output to $envmaptint
			multiplier	$envmapmultiplier // Use our value for default envmap tint
		}
	}
]]

