local numFormat = {}

local FormatNumber = require(game:GetService("ReplicatedStorage").Modules.FormatNumber.Main)

local abbreviations = FormatNumber.Notation.compactWithSuffixThousands({
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
	"Vg+"    -- 10^63 (Vigintillion)
})

function numFormat.new()
	local formatter = FormatNumber.NumberFormatter.with()
		:Notation(abbreviations)
		:Precision(FormatNumber.Precision.integer():WithMinDigits(3))

	return formatter
end

return numFormat
