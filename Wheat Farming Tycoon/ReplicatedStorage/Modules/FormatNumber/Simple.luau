-- Configuration
-- The suffixes for abbreviation in every power of thousands.
local COMPACT_SUFFIX = {
	"K+",   -- 10^3 (Thousand)
	"M+",   -- 10^6 (Million)
	"B+",   -- 10^9 (Billion)
	"T+",   -- 10^12 (Trillion)
	"Qa+",  -- 10^15 (Quadrillion)
	"Qi+",  -- 10^18 (Quintillion)
	"Sx+",  -- 10^21 (Sextillion)
	"Sp+",  -- 10^24 (Septillion)
	"Oc+",  -- 10^27 (Octillion)
	"No+",  -- 10^30 (Nonillion)
	"Dc+",  -- 10^33 (Decillion)
	"Ud+",  -- 10^36 (Undecillion)
	"Dd+",  -- 10^39 (Duodecillion)
	"Td+",  -- 10^42 (Tredecillion)
	"Qad+", -- 10^45 (Quattuordecillion)
	"Qid+", -- 10^48 (Quindecillion)
	"Sxd+", -- 10^51 (Sexdecillion)
	"Spd+", -- 10^54 (Septendecillion)
	"Ocd+", -- 10^57 (Octodecillion)
	"Nod+", -- 10^60 (Novemdecillion)
	"Vg+"   -- 10^63 (Vigintillion)
}

local CACHED_SKELETON_SETTINGS = true
--

local MainAPI = require(script.Parent.Main)
local FormatNumberSimpleAPI = { }

local SKELETON_CACHE = if CACHED_SKELETON_SETTINGS then { } else nil
local COMPACT_SKELETON_CACHE = if CACHED_SKELETON_SETTINGS then { } else nil

function FormatNumberSimpleAPI.Format(value: number, skeleton: string?): string
	local success
	local formatter = nil

	assert(type(value) == "number", "Value provided must be a number")

	if skeleton == nil then
		skeleton = ""
	end
	assert(type(skeleton) == "string", "Skeleton provided must be a string")

	if CACHED_SKELETON_SETTINGS then
		formatter = SKELETON_CACHE[skeleton]
	end

	if not formatter then
		success, formatter =
			MainAPI.NumberFormatter.forSkeleton(skeleton)
		assert(success, formatter :: string)

		if CACHED_SKELETON_SETTINGS then
			SKELETON_CACHE[skeleton] = formatter
		end
	end

	return (formatter :: MainAPI.NumberFormatter):Format(value)
end

function FormatNumberSimpleAPI.FormatCompact(value: number, skeleton: string?): string
	local success
	local formatter = nil

	assert(type(value) == "number", "Value provided must be a number")

	if skeleton == nil then
		skeleton = ""
	end
	assert(type(skeleton) == "string", "Skeleton provided must be a string")

	if CACHED_SKELETON_SETTINGS then
		formatter = COMPACT_SKELETON_CACHE[skeleton]
	end

	if not formatter then
		success, formatter =
			MainAPI.NumberFormatter.forSkeleton(skeleton)
		assert(success, formatter :: string)

		formatter = (formatter :: MainAPI.NumberFormatter)
			:Notation(MainAPI.Notation.compactWithSuffixThousands(COMPACT_SUFFIX))

		if CACHED_SKELETON_SETTINGS then
			COMPACT_SKELETON_CACHE[skeleton] = formatter
		end
	end

	assert(#COMPACT_SUFFIX ~= 0, "Please provide the suffix abbreviations for FormatCompact at the top of the Simple ModuleScript")

	return formatter:Format(value)
end

return table.freeze(FormatNumberSimpleAPI)