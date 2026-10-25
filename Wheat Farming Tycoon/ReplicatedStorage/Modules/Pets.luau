local pets = {
	--[[EXCLUSIVE PETS]]--
	["Chuu"] = {6, 6, "OOMF", 14428482488, 9999, Color3.fromRGB(120, 203, 255), "Exclusive"},
	["Nayeon"] = {2, 2, "Developer", 129385224312016, 1334, Color3.fromRGB(255, 196, 252), "Exclusive"},
	["Mocha Big-Eared Dog"] = {6, 6, "Early Supporter", 91723424906548, 1334, Color3.fromRGB(255, 85, 0), "Exclusive"},
	["Pink & White Bunny"] = {10, 10, "Bug Reporting", 13540689347, 1334, Color3.fromRGB(170, 170, 255), "Exclusive"},
	["Bertram"] = {4.9, 4.9, "Nepotism Pet", 4878846563, 49, Color3.fromRGB(85, 170, 255), "Exclusive"},

	--[[BADGE PETS]]--
	["Big-Eared Dog"] = {5, 5, "Badge", 10667819043, 9999, Color3.fromRGB(255, 246, 117), "Exclusive"},
	
	--[[EVENT PETS]]--
	-- Winter
	["Snowman"] = {1.5, 1.5, "Winter 2025", 116445343528761, 9999, Color3.fromRGB(0, 170, 255), "Exclusive"},
	["Spirit of the Snowfall"] = {16, 16, "Winter 2025", 129548560562071, 1, Color3.fromRGB(85, 170, 255), "Exclusive"},
	
	-- Valentine
	["Teddy Bear"] = {1.5, 1.5, "Valentine's Day 2025", 94677744941297, 9999, Color3.fromRGB(255, 85, 127), "Exclusive"},
	["Spirit of the Valentine"] = {15, 15, "Valentine's Day 2025", 135680297364792, 1, Color3.fromRGB(255, 85, 127), "Exclusive"},
	
	-- Fazbear
	["Freddy Fazbear"] = {1.5, 1.5, "Not Golden", 179446619, 9999, Color3.fromRGB(161, 161, 161), "Exclusive"},
	["Golden Freddy"] = {15, 15, "Golden", 184251171, 1, Color3.fromRGB(255, 255, 0), "Exclusive"},
	
	--[[ETHEREAL PETS]]--
	["Spectral Hen"] = {7, 7, "Ethereal", 101397709716932, 3, Color3.fromRGB(170, 85, 255), "Ethereal"},
	["Phantom Oinker"] = {9, 9, "Ethereal", 101397709716932, 3, Color3.fromRGB(170, 85, 255), "Ethereal"},
	["Moonlit Bovine"] = {7, 7, "Ethereal", 101397709716932, 3, Color3.fromRGB(170, 85, 255), "Ethereal"},
	["Donpen of Don Quijote"] = {17, 17, "Ethereal", 101397709716932, 3, Color3.fromRGB(170, 85, 255), "Ethereal"},

	--[[CLASSIC EGG PETS]]--
	-- Cash Egg
	-- Normal Tier
	["Chicken"] = {1.1, 1.1, "Common", 82219110840956, 50, Color3.fromRGB(197,197,197), "Normal"},
	["Choco Chicken"] = {1.2, 1.1, "Uncommon", 121620839173763, 30, Color3.fromRGB(85, 255, 127), "Normal"},
	["Strawberry Chicken"] = {1.2, 1.2, "Rare", 111387762981612, 10, Color3.fromRGB(0, 255, 255), "Normal"},
	["Banana Chicken"] = {1.3, 1.2, "Legendary", 118221970579685, 7, Color3.fromRGB(255, 170, 0), "Normal"},
	["Cool Chicken"] = {1.3, 1.3, "OP", 101397709716932, 3, Color3.fromRGB(255, 85, 255), "Normal"},
	
	-- Golden Tier
	["Golden Chicken"] = {1.4, 1.3, "Common", 82219110840956, 50, Color3.fromRGB(197,197,197), "Golden"},
	["Golden Choco Chicken"] = {1.4, 1.4, "Uncommon", 121620839173763, 30, Color3.fromRGB(85, 255, 127), "Golden"},
	["Golden Strawberry Chicken"] = {1.5, 1.4, "Rare", 111387762981612, 10, Color3.fromRGB(0, 255, 255), "Golden"},
	["Golden Banana Chicken"] = {1.5, 1.5, "Legendary", 118221970579685, 7, Color3.fromRGB(255, 170, 0), "Golden"},
	["Golden Cool Chicken"] = {1.6, 1.6, "OP", 101397709716932, 3, Color3.fromRGB(255, 85, 255), "Golden"},
	
	-- Rainbow Tier
	["Rainbow Chicken"] = {1.7, 1.6, "Common", 82219110840956, 50, Color3.fromRGB(197,197,197), "Rainbow"},
	["Rainbow Choco Chicken"] = {1.7, 1.7, "Uncommon", 121620839173763, 30, Color3.fromRGB(85, 255, 127), "Rainbow"},
	["Rainbow Strawberry Chicken"] = {1.8, 1.8, "Rare", 111387762981612, 10, Color3.fromRGB(0, 255, 255), "Rainbow"},
	["Rainbow Banana Chicken"] = {1.9, 1.8, "Legendary", 118221970579685, 7, Color3.fromRGB(255, 170, 0), "Rainbow"},
	["Rainbow Cool Chicken"] = {2, 2, "OP", 101397709716932, 3, Color3.fromRGB(255, 85, 255), "Rainbow"},
	
	
	
	-- Robux
	["Chicken Girl"] = {5.5, 5.5, "Transcendant", 118892659798416, 100, Color3.fromRGB(255, 238, 238), "Normal"},
	["Golden Chicken Girl"] = {9.5, 9.5, "Transcendant", 118892659798416, 100, Color3.fromRGB(255, 238, 238), "Golden"},
	["Rainbow Chicken Girl"] = {18, 18, "Transcendant", 118892659798416, 100, Color3.fromRGB(255, 238, 238), "Rainbow"},
	
	["Robot Singer"] = {5.5, 5.5, "Transcendant", 89167523674484, 100, Color3.fromRGB(255, 238, 238), "Normal"},
	["Golden Robot Singer"] = {9.5, 9.5, "Transcendant", 89167523674484, 100, Color3.fromRGB(255, 238, 238), "Golden"},
	["Rainbow Robot Singer"] = {18, 18, "Transcendant", 89167523674484, 100, Color3.fromRGB(255, 238, 238), "Rainbow"},
	
	["Cow Girl"] = {5.5, 5.5, "Transcendant", 102662521622296, 100, Color3.fromRGB(255, 238, 238), "Normal"},
	["Golden Cow Girl"] = {9.5, 9.5, "Transcendant", 102662521622296, 100, Color3.fromRGB(255, 238, 238), "Golden"},
	["Rainbow Cow Girl"] = {18, 18, "Transcendant", 102662521622296, 100, Color3.fromRGB(255, 238, 238), "Rainbow"},
	
	["Bunny Girl"] = {5.5, 5.5, "Transcendant", 121167743445296, 100, Color3.fromRGB(255, 238, 238), "Normal"},
	["Golden Bunny Girl"] = {9.5, 9.5, "Transcendant", 121167743445296, 100, Color3.fromRGB(255, 238, 238), "Golden"},
	["Rainbow Bunny Girl"] = {18, 18, "Transcendant", 121167743445296, 100, Color3.fromRGB(255, 238, 238), "Rainbow"},
	
	
	
	--[[CATTLE EGG PETS]]--
	-- Cash Egg
	-- Normal Tier
	["Cow"] = {1.3, 1.3, "Common", 124694258304926, 60, Color3.fromRGB(197,197,197), "Normal"},
	["Sand Cow"] = {1.4, 1.4, "Uncommon", 77607253763817, 30, Color3.fromRGB(85, 255, 127), "Normal"},
	["Cheese Cow"] = {1.5, 1.5, "Rare", 96371846232996, 20, Color3.fromRGB(0, 255, 255), "Normal"},
	["Sleepy Cow"] = {1.6, 1.7, "Legendary", 83047067338698, 9, Color3.fromRGB(255, 170, 0), "Normal"},
	["Awoken Cow"] = {1.7, 1.8, "OP", 72375745871143, 1, Color3.fromRGB(255, 85, 255), "Normal"},
	
	-- Golden Tier
	["Golden Cow"] = {1.5, 1.5, "Common", 124694258304926, 50, Color3.fromRGB(197,197,197), "Golden"},
	["Golden Sand Cow"] = {1.7, 1.7, "Uncommon", 77607253763817, 30, Color3.fromRGB(85, 255, 127), "Golden"},
	["Golden Cheese Cow"] = {1.8, 1.8, "Rare", 96371846232996, 10, Color3.fromRGB(0, 255, 255), "Golden"},
	["Golden Sleepy Cow"] = {1.9, 1.9, "Legendary", 83047067338698, 7, Color3.fromRGB(255, 170, 0), "Golden"},
	["Golden Awoken Cow"] = {2.2, 2.2, "OP", 72375745871143, 3, Color3.fromRGB(255, 85, 255), "Golden"},
	
	-- Rainbow Tier
	["Rainbow Cow"] = {2.1, 2, "Common", 124694258304926, 50, Color3.fromRGB(197,197,197), "Rainbow"},
	["Rainbow Sand Cow"] = {2.1, 2.3, "Uncommon", 77607253763817, 30, Color3.fromRGB(85, 255, 127), "Rainbow"},
	["Rainbow Cheese Cow"] = {2.5, 2.5, "Rare", 96371846232996, 10, Color3.fromRGB(0, 255, 255), "Rainbow"},
	["Rainbow Sleepy Cow"] = {3, 3, "Legendary", 83047067338698, 7, Color3.fromRGB(255, 170, 0), "Rainbow"},
	["Rainbow Awoken Cow"] = {3.5, 3.5, "OP", 72375745871143, 3, Color3.fromRGB(255, 85, 255), "Rainbow"},
	
	--[[BACON EGG PETS]]--
	-- Cash Egg
	-- Normal Tier
	["Pig"] = {1.5, 1.5, "Common", 133334826525395, 70, Color3.fromRGB(197,197,197), "Normal"},
	["Messy Pig"] = {1.6, 1.6, "Uncommon", 78377341484102, 15, Color3.fromRGB(85, 255, 127), "Normal"},
	["Pickle Pig"] = {1.7, 1.7, "Rare", 138175620132805, 9, Color3.fromRGB(0, 255, 255), "Normal"},
	["Primitive Pig"] = {1.8, 1.8, "Legendary", 104821342148217, 5, Color3.fromRGB(255, 170, 0), "Normal"},
	["Rich Pig"] = {2, 2, "OP", 121839670140777, 1, Color3.fromRGB(255, 85, 255), "Normal"},

	-- Golden Tier
	["Golden Pig"] = {2.2, 2.2, "Common", 133334826525395, 50, Color3.fromRGB(197,197,197), "Golden"},
	["Golden Messy Pig"] = {2.4, 2.4, "Uncommon", 78377341484102, 30, Color3.fromRGB(85, 255, 127), "Golden"},
	["Golden Pickle Pig"] = {2.5, 2.5, "Rare", 138175620132805, 10, Color3.fromRGB(0, 255, 255), "Golden"},
	["Golden Primitive Pig"] = {2.7, 2.7, "Legendary", 104821342148217, 0, Color3.fromRGB(255, 170, 0), "Golden"},
	["Golden Rich Pig"] = {3, 3, "OP", 121839670140777, 3, Color3.fromRGB(255, 85, 255), "Golden"},

	-- Rainbow Tier
	["Rainbow Pig"] = {3.1, 3.1, "Common", 133334826525395, 50, Color3.fromRGB(197,197,197), "Rainbow"},
	["Rainbow Messy Pig"] = {3.3, 3.3, "Uncommon", 78377341484102, 30, Color3.fromRGB(85, 255, 127), "Rainbow"},
	["Rainbow Pickle Pig"] = {3.5, 3.5, "Rare", 138175620132805, 10, Color3.fromRGB(0, 255, 255), "Rainbow"},
	["Rainbow Primitive Pig"] = {4, 3.5, "Legendary", 104821342148217, 7, Color3.fromRGB(255, 170, 0), "Rainbow"},
	["Rainbow Rich Pig"] = {4.5, 4.5, "OP", 121839670140777, 3, Color3.fromRGB(255, 85, 255), "Rainbow"},
	
	--[[SKI-BEE-DI EGG PETS]]--
	-- Cash Egg
	-- Normal Tier
	["Toilet Bee"] = {1.7, 1.7, "Common", 80221272603337, 750, Color3.fromRGB(197,197,197), "Normal"},
	["Fire Toilet Bee"] = {1.9, 2, "Uncommon", 91169471863188, 150, Color3.fromRGB(85, 255, 127), "Normal"},
	["6ix Toilet Bee"] = {2, 2.2, "Rare", 111151279780194, 76, Color3.fromRGB(0, 255, 255), "Normal"},
	["Candy Toilet Bee"] = {2.2, 2.2, "Legendary", 130715067240956, 15, Color3.fromRGB(255, 170, 0), "Normal"},
	["Crystal Toilet Bee"] = {3.5, 3.5, "OP", 131899893870765, 9, Color3.fromRGB(255, 85, 255), "Normal"},

	-- Golden Tier
	["Golden Toilet Bee"] = {2.6, 2.6, "Common", 80221272603337, 50, Color3.fromRGB(197,197,197), "Golden"},
	["Golden Fire Toilet Bee"] = {2.8, 2.8, "Uncommon", 91169471863188, 30, Color3.fromRGB(85, 255, 127), "Golden"},
	["Golden 6ix Toilet Bee"] = {3, 3, "Rare", 111151279780194, 10, Color3.fromRGB(0, 255, 255), "Golden"},
	["Golden Candy Toilet Bee"] = {3.5, 3.5, "Legendary", 130715067240956, 7, Color3.fromRGB(255, 170, 0), "Golden"},
	["Golden Crystal Toilet Bee"] = {5.5, 5.5, "OP", 131899893870765, 3, Color3.fromRGB(255, 85, 255), "Golden"},

	-- Rainbow Tier
	["Rainbow Toilet Bee"] = {4.7, 4.9, "Common", 80221272603337, 50, Color3.fromRGB(197,197,197), "Rainbow"},
	["Rainbow Fire Toilet Bee"] = {5.2, 5, "Uncommon", 91169471863188, 30, Color3.fromRGB(85, 255, 127), "Rainbow"},
	["Rainbow 6ix Toilet Bee"] = {5.4, 5.4, "Rare", 111151279780194, 10, Color3.fromRGB(0, 255, 255), "Rainbow"},
	["Rainbow Candy Toilet Bee"] = {5.7, 5.7, "Legendary", 130715067240956, 7, Color3.fromRGB(255, 170, 0), "Rainbow"},
	["Rainbow Crystal Toilet Bee"] = {7, 7, "OP", 131899893870765, 3, Color3.fromRGB(255, 85, 255), "Rainbow"},
	
	--[[PLATYPUS EGG]]--
	-- Cash Egg
	-- Normal Tier
	["Platypus"] = {1.9, 1.9, "Common", 109366963558887, 750, Color3.fromRGB(197,197,197), "Normal"},
	["Cloudy Platypus"] = {2.1, 2.1, "Uncommon", 129297595871219, 150, Color3.fromRGB(85, 255, 127), "Normal"},
	["Hot Sauce Platypus"] = {2.3, 2.1, "Rare", 121381081123051, 76, Color3.fromRGB(0, 255, 255), "Normal"},
	["Summer Platypus"] = {2.3, 2.3, "Legendary", 80175043411259, 15, Color3.fromRGB(255, 170, 0), "Normal"},
	["Secret Agent Platypus"] = {3.7, 3.7, "OP", 89713610033794, 9, Color3.fromRGB(255, 85, 255), "Normal"},

	-- Golden Tier
	["Golden Platypus"] = {2.8, 2.8, "Common", 109366963558887, 50, Color3.fromRGB(197,197,197), "Golden"},
	["Golden Cloudy Platypus"] = {3, 3, "Uncommon", 129297595871219, 30, Color3.fromRGB(85, 255, 127), "Golden"},
	["Golden Hot Sauce Platypus"] = {3.8, 3.8, "Rare", 121381081123051, 10, Color3.fromRGB(0, 255, 255), "Golden"},
	["Golden Summer Platypus"] = {5.1, 5.1, "Legendary", 80175043411259, 7, Color3.fromRGB(255, 170, 0), "Golden"},
	["Golden Secret Agent Platypus"] = {6.5, 6.5, "OP", 89713610033794, 3, Color3.fromRGB(255, 85, 255), "Golden"},

	-- Rainbow Tier
	["Rainbow Platypus"] = {4.8, 5, "Common", 109366963558887, 50, Color3.fromRGB(197,197,197), "Rainbow"},
	["Rainbow Cloudy Platypus"] = {5.4, 5.5, "Uncommon", 129297595871219, 30, Color3.fromRGB(85, 255, 127), "Rainbow"},
	["Rainbow Hot Sauce Platypus"] = {5.7, 6, "Rare", 121381081123051, 10, Color3.fromRGB(0, 255, 255), "Rainbow"},
	["Rainbow Summer Platypus"] = {6.5, 6.5, "Legendary", 80175043411259, 7, Color3.fromRGB(255, 170, 0), "Rainbow"},
	["Rainbow Secret Agent Platypus"] = {8, 8, "OP", 89713610033794, 3, Color3.fromRGB(255, 85, 255), "Rainbow"},

	--[[CRUSTATEAN EGG]]--
	-- Cash Egg
	-- Normal Tier
	["Lobster"] = {2, 2, "Common", 129126573066786, 750, Color3.fromRGB(197,197,197), "Normal"},
	["Blue Lobster"] = {2.2, 2.2, "Uncommon", 88417690049366, 150, Color3.fromRGB(85, 255, 127), "Normal"},
	["Industrial Lobster"] = {2.4, 2.2, "Rare", 136032809345331, 76, Color3.fromRGB(0, 255, 255), "Normal"},
	["Volcanic Lobster"] = {2.4, 2.4, "Legendary", 91214026892255, 15, Color3.fromRGB(255, 170, 0), "Normal"},
	["Chrome Lobster"] = {3.8, 3.8, "OP", 112987353231543, 9, Color3.fromRGB(255, 85, 255), "Normal"},
	
	-- Golden Tier
	["Golden Lobster"] = {3, 3, "Common", 129126573066786, 50, Color3.fromRGB(197,197,197), "Golden"},
	["Golden Blue Lobster"] = {3.4, 3.4, "Uncommon", 88417690049366, 30, Color3.fromRGB(85, 255, 127), "Golden"},
	["Golden Industrial Lobster"] = {3.9, 3.9, "Rare", 136032809345331, 10, Color3.fromRGB(0, 255, 255), "Golden"},
	["Golden Volcanic Lobster"] = {5.5, 5.5, "Legendary", 91214026892255, 7, Color3.fromRGB(255, 170, 0), "Golden"},
	["Golden Chrome Lobster"] = {7, 7, "OP", 112987353231543, 3, Color3.fromRGB(255, 85, 255), "Golden"},

	-- Rainbow Tier
	["Rainbow Lobster"] = {5, 5, "Common", 129126573066786, 50, Color3.fromRGB(197,197,197), "Rainbow"},
	["Rainbow Blue Lobster"] = {5.4, 5.4, "Uncommon", 88417690049366, 30, Color3.fromRGB(85, 255, 127), "Rainbow"},
	["Rainbow Industrial Lobster"] = {5.9, 6, "Rare", 136032809345331, 10, Color3.fromRGB(0, 255, 255), "Rainbow"},
	["Rainbow Volcanic Lobster"] = {7, 7, "Legendary", 91214026892255, 7, Color3.fromRGB(255, 170, 0), "Rainbow"},
	["Rainbow Chrome Lobster"] = {9, 9, "OP", 112987353231543, 3, Color3.fromRGB(255, 85, 255), "Rainbow"},
	
	--[[BUNNY EGG]]--
	-- Cash Egg
	-- Normal Tier
	["Bunny"] = {2.4, 2.4, "Common", 109458194811812, 750, Color3.fromRGB(197,197,197), "Normal"},
	["Mocha Bunny"] = {2.7, 2.8, "Uncommon", 87260986281699, 150, Color3.fromRGB(85, 255, 127), "Normal"},
	["Musical Bunny"] = {3, 3.5, "Rare", 70848157948268, 76, Color3.fromRGB(0, 255, 255), "Normal"},
	["Employed Bunny"] = {3.5, 3.5, "Legendary", 124213822586782, 20, Color3.fromRGB(255, 170, 0), "Normal"},
	["King Bunny"] = {4, 4, "OP", 92546509297519, 4, Color3.fromRGB(255, 85, 255), "Normal"},

	-- Golden Tier
	["Golden Bunny"] = {4, 4, "Common", 109458194811812, 50, Color3.fromRGB(197,197,197), "Golden"},
	["Golden Mocha Bunny"] = {4.2, 4.3, "Uncommon", 87260986281699, 30, Color3.fromRGB(85, 255, 127), "Golden"},
	["Golden Musical Bunny"] = {4.5, 4.5, "Rare", 70848157948268, 10, Color3.fromRGB(0, 255, 255), "Golden"},
	["Golden Employed Bunny"] = {6.5, 6.5, "Legendary", 124213822586782, 7, Color3.fromRGB(255, 170, 0), "Golden"},
	["Golden King Bunny"] = {7.5, 7.5, "OP", 92546509297519, 3, Color3.fromRGB(255, 85, 255), "Golden"},

	-- Rainbow Tier
	["Rainbow Bunny"] = {5.3, 5.3, "Common", 109458194811812, 50, Color3.fromRGB(197,197,197), "Rainbow"},
	["Rainbow Mocha Bunny"] = {5.7, 5.9, "Uncommon", 87260986281699, 30, Color3.fromRGB(85, 255, 127), "Rainbow"},
	["Rainbow Musical Bunny"] = {6.3, 6.5, "Rare", 70848157948268, 10, Color3.fromRGB(0, 255, 255), "Rainbow"},
	["Rainbow Employed Bunny"] = {7.5, 7.5, "Legendary", 124213822586782, 7, Color3.fromRGB(255, 170, 0), "Rainbow"},
	["Rainbow King Bunny"] = {12, 12, "OP", 92546509297519, 3, Color3.fromRGB(255, 85, 255), "Rainbow"},
	
	--[[RETRO EGG PETS]]--
	-- Cash Egg
	-- Normal Tier
	["Gubby"] = {3.5, 3.5, "Common", 72822349092704, 750, Color3.fromRGB(197,197,197), "Normal"},
	["Frosted Gubby"] = {3.8, 3.8, "Uncommon", 133072800986857, 150, Color3.fromRGB(85, 255, 127), "Normal"},
	["Lunar Gubby"] = {4.2, 4.2, "Rare", 111604410394082, 76, Color3.fromRGB(0, 255, 255), "Normal"},
	["c00l Gubby"] = {4.6, 4.6, "Legendary", 74575305959514, 15, Color3.fromRGB(255, 170, 0), "Normal"},
	["Pancake Gubby"] = {5.5, 5.5, "OP", 94731728303906, 9, Color3.fromRGB(255, 85, 255), "Normal"},

	-- Golden Tier
	["Golden Gubby"] = {7, 7, "Common", 72822349092704, 50, Color3.fromRGB(197,197,197), "Golden"},
	["Golden Frosted Gubby"] = {7.6, 7.6, "Uncommon", 133072800986857, 30, Color3.fromRGB(85, 255, 127), "Golden"},
	["Golden Lunar Gubby"] = {8.4, 8.4, "Rare", 111604410394082, 10, Color3.fromRGB(0, 255, 255), "Golden"},
	["Golden c00l Gubby"] = {9.2, 9.2, "Legendary", 74575305959514, 7, Color3.fromRGB(255, 170, 0), "Golden"},
	["Golden Pancake Gubby"] = {11, 11, "OP", 94731728303906, 3, Color3.fromRGB(255, 85, 255), "Golden"},

	-- Rainbow Tier
	["Rainbow Gubby"] = {9, 9, "Common", 72822349092704, 50, Color3.fromRGB(197,197,197), "Rainbow"},
	["Rainbow Frosted Gubby"] = {10, 10, "Uncommon", 133072800986857, 30, Color3.fromRGB(85, 255, 127), "Rainbow"},
	["Rainbow Lunar Gubby"] = {11, 11, "Rare", 111604410394082, 10, Color3.fromRGB(0, 255, 255), "Rainbow"},
	["Rainbow c00l Gubby"] = {12.5, 12.5, "Legendary", 74575305959514, 7, Color3.fromRGB(255, 170, 0), "Rainbow"},
	["Rainbow Unicorn Gubby"] = {15, 15, "OP", 94731728303906, 3, Color3.fromRGB(255, 85, 255), "Rainbow"},
	
	--[[SLIMEBIDI EGG]]--
	-- Cash Egg
	-- Normal Tier
	["Toilet Slime"] = {4, 4, "Common", 106986050701052, 750, Color3.fromRGB(197,197,197), "Normal"},
	["Pink Toilet Slime"] = {4.2, 4.2, "Uncommon", 122297035541216, 150, Color3.fromRGB(85, 255, 127), "Normal"},
	["Fancy Toilet Slime"] = {4.5, 4.5, "Rare", 75613731106564, 76, Color3.fromRGB(0, 255, 255), "Normal"},
	["Queen's Guard Toilet Slime"] = {5, 5, "Legendary", 106745058149001, 15, Color3.fromRGB(255, 170, 0), "Normal"},
	["Pink White & Blue Toilet Slime"] = {6, 6, "OP", 119305197693368, 9, Color3.fromRGB(255, 85, 255), "Normal"},

	-- Golden Tier
	["Golden Toilet Slime"] = {8, 8, "Common", 106986050701052, 50, Color3.fromRGB(197,197,197), "Golden"},
	["Golden Pink Toilet Slime"] = {9, 9, "Uncommon", 122297035541216, 30, Color3.fromRGB(85, 255, 127), "Golden"},
	["Golden Fancy Toilet Slime"] = {9.5, 9.5, "Rare", 75613731106564, 10, Color3.fromRGB(0, 255, 255), "Golden"},
	["Golden Queen's Guard Toilet Slime"] = {10, 10, "Legendary", 106745058149001, 7, Color3.fromRGB(255, 170, 0), "Golden"},
	["Golden Pink White & Blue Toilet Slime"] = {12, 12, "OP", 119305197693368, 3, Color3.fromRGB(255, 85, 255), "Golden"},

	-- Rainbow Tier
	["Rainbow Toilet Slime"] = {13, 12.5, "Common", 106986050701052, 50, Color3.fromRGB(197,197,197), "Rainbow"},
	["Rainbow Pink Toilet Slime"] = {13.5, 13, "Uncommon", 122297035541216, 30, Color3.fromRGB(85, 255, 127), "Rainbow"},
	["Rainbow Fancy Toilet Slime"] = {14, 14, "Rare", 75613731106564, 10, Color3.fromRGB(0, 255, 255), "Rainbow"},
	["Rainbow Queen's Guard Toilet Slime"] = {15, 15, "Legendary", 106745058149001, 7, Color3.fromRGB(255, 170, 0), "Rainbow"},
	["Rainbow Pink White & Blue Toilet Slime"] = {16, 16, "OP", 119305197693368, 3, Color3.fromRGB(255, 85, 255), "Rainbow"},


	----[[AVIAN EGG PETS]]--
	---- Cash Egg
	---- Normal Tier
	["Griffin"] = {4, 4, "Common", 80221272603337, 750, Color3.fromRGB(197,197,197), "Normal"},
	["Birthday Griffin"] = {4.3, 4.3, "Uncommon", 91169471863188, 150, Color3.fromRGB(85, 255, 127), "Normal"},
	["Stainless Steel Griffin"] = {4.7, 4.7, "Rare", 111151279780194, 76, Color3.fromRGB(0, 255, 255), "Normal"},
	["Solar Griffin"] = {5, 5, "Legendary", 130715067240956, 15, Color3.fromRGB(255, 170, 0), "Normal"},
	["Starstruck Griffin"] = {6.5, 6.5, "OP", 131899893870765, 9, Color3.fromRGB(255, 85, 255), "Normal"},

	---- Golden Tier
	["Golden Griffin"] = {8, 8, "Common", 80221272603337, 50, Color3.fromRGB(197,197,197), "Golden"},
	["Golden Birthday Griffin"] = {8.6, 8.6, "Uncommon", 91169471863188, 30, Color3.fromRGB(85, 255, 127), "Golden"},
	["Golden Stainless Steel Griffin"] = {9.4, 9.4, "Rare", 111151279780194, 10, Color3.fromRGB(0, 255, 255), "Golden"},
	["Golden Solar Griffin"] = {10, 10, "Legendary", 130715067240956, 7, Color3.fromRGB(255, 170, 0), "Golden"},
	["Golden Starstruck Griffin"] = {12.5, 12.5, "OP", 131899893870765, 3, Color3.fromRGB(255, 85, 255), "Golden"},

	---- Rainbow Tier
	["Rainbow Griffin"] = {10.5, 10.5, "Common", 80221272603337, 50, Color3.fromRGB(197,197,197), "Rainbow"},
	["Rainbow Birthday Griffin"] = {11.5, 11.5, "Uncommon", 91169471863188, 30, Color3.fromRGB(85, 255, 127), "Rainbow"},
	["Rainbow Stainless Steel Griffin"] = {13, 13, "Rare", 111151279780194, 10, Color3.fromRGB(0, 255, 255), "Rainbow"},
	["Rainbow Solar Griffin"] = {15, 15, "Legendary", 130715067240956, 7, Color3.fromRGB(255, 170, 0), "Rainbow"},
	["Rainbow Starstruck Griffin"] = {18, 18, "OP", 131899893870765, 3, Color3.fromRGB(255, 85, 255), "Rainbow"},
}

return pets


--[[
Pet Structure is as follows:
1: Cash Multiplier
2: WheatCoin Multiplier
3: Rarity
4: Image ID
5: Weight (Chance out of 100)
6: Rarity Colour
7: Tier
]]