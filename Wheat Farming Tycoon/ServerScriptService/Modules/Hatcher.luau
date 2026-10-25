local hatcher = {}

local RS = game:GetService("ReplicatedStorage")
local pets = require(RS.Modules.Pets)

local randomGenerator = Random.new()

local function randomPet(betterChance)
	-- Filter only Earth Pets
	local earthPets = {
		["Chicken"] = pets["Chicken"],
		["Choco Chicken"] = pets["Choco Chicken"],
		["Strawberry Chicken"] = pets["Strawberry Chicken"],
		["Banana Chicken"] = pets["Banana Chicken"],
		["Cool Chicken"] = pets["Cool Chicken"]
	}

	local totalWeight = 0
	for _, petData in pairs(earthPets) do
		-- Adjust weight for "OP" pets if betterChance is true
		if betterChance and (petData[7] == "OP" or petData[7] == "Legendary" or petData[7] == "Rare") then
			totalWeight += petData[5] * 2
		else
			totalWeight += petData[5]
		end
	end

	local randomNumber = randomGenerator:NextInteger(1, totalWeight)
	local cumulativeWeight = 0

	-- Determine which Earth Pet corresponds to the random number
	for petName, petData in pairs(earthPets) do
		if betterChance and petData[7] == "OP" then
			cumulativeWeight += petData[5] * 2
		else
			cumulativeWeight += petData[5]
		end

		if randomNumber <= cumulativeWeight then
			return petName
		end
	end
end


local function randomCattlePet(betterChance)
	local earthPets = {
		["Cow"] = pets["Cow"],
		["Sand Cow"] = pets["Sand Cow"],
		["Cheese Cow"] = pets["Cheese Cow"],
		["Sleepy Cow"] = pets["Sleepy Cow"],
		["Awoken Cow"] = pets["Awoken Cow"]
	}

	local totalWeight = 0
	for _, petData in pairs(earthPets) do
		-- Adjust weight for "OP" pets if betterChance is true
		if betterChance and (petData[7] == "OP" or petData[7] == "Legendary" or petData[7] == "Rare") then
			totalWeight += petData[5] * 2
		else
			totalWeight += petData[5]
		end
	end

	local randomNumber = randomGenerator:NextInteger(1, totalWeight)
	local cumulativeWeight = 0

	-- Determine which Earth Pet corresponds to the random number
	for petName, petData in pairs(earthPets) do
		if betterChance and petData[7] == "OP" then
			cumulativeWeight += petData[5] * 2
		else
			cumulativeWeight += petData[5]
		end

		if randomNumber <= cumulativeWeight then
			return petName
		end
	end
end

local function randomBaconPet(betterChance)
	local earthPets = {
		["Pig"] = pets["Pig"],
		["Messy Pig"] = pets["Messy Pig"],
		["Pickle Pig"] = pets["Pickle Pig"],
		["Primitive Pig"] = pets["Primitive Pig"],
		["Rich Pig"] = pets["Rich Pig"]
	}

	local totalWeight = 0
	for _, petData in pairs(earthPets) do
		-- Adjust weight for "OP" pets if betterChance is true
		if betterChance and (petData[7] == "OP" or petData[7] == "Legendary" or petData[7] == "Rare") then
			totalWeight += petData[5] * 2
		else
			totalWeight += petData[5]
		end
	end

	local randomNumber = randomGenerator:NextInteger(1, totalWeight)
	local cumulativeWeight = 0

	-- Determine which Earth Pet corresponds to the random number
	for petName, petData in pairs(earthPets) do
		if betterChance and petData[7] == "OP" then
			cumulativeWeight += petData[5] * 2
		else
			cumulativeWeight += petData[5]
		end

		if randomNumber <= cumulativeWeight then
			return petName
		end
	end
end

local function randomSkiBeeDiPet(betterChance)
	local earthPets = {
		["Toilet Bee"] = pets["Toilet Bee"],
		["Fire Toilet Bee"] = pets["Fire Toilet Bee"],
		["6ix Toilet Bee"] = pets["6ix Toilet Bee"],
		["Candy Toilet Bee"] = pets["Candy Toilet Bee"],
		["Crystal Toilet Bee"] = pets["Crystal Toilet Bee"]
	}

	local totalWeight = 0
	for _, petData in pairs(earthPets) do
		-- Adjust weight for "OP" pets if betterChance is true
		if betterChance and (petData[7] == "OP" or petData[7] == "Legendary" or petData[7] == "Rare") then
			totalWeight += petData[5] * 2
		else
			totalWeight += petData[5]
		end
	end

	local randomNumber = randomGenerator:NextInteger(1, totalWeight)
	local cumulativeWeight = 0

	-- Determine which Earth Pet corresponds to the random number
	for petName, petData in pairs(earthPets) do
		if betterChance and petData[7] == "OP" then
			cumulativeWeight += petData[5] * 2
		else
			cumulativeWeight += petData[5]
		end

		if randomNumber <= cumulativeWeight then
			return petName
		end
	end
end

local function randomPlatypusPet(betterChance)
	local earthPets = {
		["Platypus"] = pets["Platypus"],
		["Cloudy Platypus"] = pets["Cloudy Platypus"],
		["Hot Sauce Platypus"] = pets["Hot Sauce Platypus"],
		["Summer Platypus"] = pets["Summer Platypus"],
		["Secret Agent Platypus"] = pets["Secret Agent Platypus"]
	}

	local totalWeight = 0
	for _, petData in pairs(earthPets) do
		-- Adjust weight for "OP" pets if betterChance is true
		if betterChance and (petData[7] == "OP" or petData[7] == "Legendary" or petData[7] == "Rare") then
			totalWeight += petData[5] * 2
		else
			totalWeight += petData[5]
		end
	end

	local randomNumber = randomGenerator:NextInteger(1, totalWeight)
	local cumulativeWeight = 0

	-- Determine which Earth Pet corresponds to the random number
	for petName, petData in pairs(earthPets) do
		if betterChance and petData[7] == "OP" then
			cumulativeWeight += petData[5] * 2
		else
			cumulativeWeight += petData[5]
		end

		if randomNumber <= cumulativeWeight then
			return petName
		end
	end
end

local function randomCrustateanPet(betterChance)
	local earthPets = {
		["Lobster"] = pets["Lobster"],
		["Blue Lobster"] = pets["Blue Lobster"],
		["Industrial Lobster"] = pets["Industrial Lobster"],
		["Volcanic Lobster"] = pets["Volcanic Lobster"],
		["Chrome Lobster"] = pets["Chrome Lobster"]
	}

	local totalWeight = 0
	for _, petData in pairs(earthPets) do
		-- Adjust weight for "OP" pets if betterChance is true
		if betterChance and (petData[7] == "OP" or petData[7] == "Legendary" or petData[7] == "Rare") then
			totalWeight += petData[5] * 2
		else
			totalWeight += petData[5]
		end
	end

	local randomNumber = randomGenerator:NextInteger(1, totalWeight)
	local cumulativeWeight = 0

	-- Determine which Earth Pet corresponds to the random number
	for petName, petData in pairs(earthPets) do
		if betterChance and petData[7] == "OP" then
			cumulativeWeight += petData[5] * 2
		else
			cumulativeWeight += petData[5]
		end

		if randomNumber <= cumulativeWeight then
			return petName
		end
	end
end

local function randomBunnyPet(betterChance)
	local earthPets = {
		["Bunny"] = pets["Bunny"],
		["Mocha Bunny"] = pets["Mocha Bunny"],
		["Musical Bunny"] = pets["Musical Bunny"],
		["Employed Bunny"] = pets["Employed Bunny"],
		["King Bunny"] = pets["King Bunny"]
	}

	local totalWeight = 0
	for _, petData in pairs(earthPets) do
		-- Adjust weight for "OP" pets if betterChance is true
		if betterChance and (petData[7] == "OP" or petData[7] == "Legendary" or petData[7] == "Rare") then
			totalWeight += petData[5] * 2
		else
			totalWeight += petData[5]
		end
	end

	local randomNumber = randomGenerator:NextInteger(1, totalWeight)
	local cumulativeWeight = 0

	-- Determine which Earth Pet corresponds to the random number
	for petName, petData in pairs(earthPets) do
		if betterChance and petData[7] == "OP" then
			cumulativeWeight += petData[5] * 2
		else
			cumulativeWeight += petData[5]
		end

		if randomNumber <= cumulativeWeight then
			return petName
		end
	end
end

local function randomGubbyPet(betterChance)
	local earthPets = {
		["Gubby"] = pets["Gubby"],
		["Frosted Gubby"] = pets["Frosted Gubby"],
		["Lunar Gubby"] = pets["Lunar Gubby"],
		["c00l Gubby"] = pets["c00l Gubby"],
		["Pancake Gubby"] = pets["Pancake Gubby"]
	}

	local totalWeight = 0
	for _, petData in pairs(earthPets) do
		-- Adjust weight for "OP" pets if betterChance is true
		if betterChance and (petData[7] == "OP" or petData[7] == "Legendary" or petData[7] == "Rare") then
			totalWeight += petData[5] * 2
		else
			totalWeight += petData[5]
		end
	end

	local randomNumber = randomGenerator:NextInteger(1, totalWeight)
	local cumulativeWeight = 0

	-- Determine which Earth Pet corresponds to the random number
	for petName, petData in pairs(earthPets) do
		if betterChance and petData[7] == "OP" then
			cumulativeWeight += petData[5] * 2
		else
			cumulativeWeight += petData[5]
		end

		if randomNumber <= cumulativeWeight then
			return petName
		end
	end
end

local function randomSlimePet(betterChance)
	local earthPets = {
		["Toilet Slime"] = pets["Toilet Slime"],
		["Pink Toilet Slime"] = pets["Pink Toilet Slime"],
		["Fancy Toilet Slime"] = pets["Fancy Toilet Slime"],
		["Queen's Guard Toilet Slime"] = pets["Queen's Guard Toilet Slime"],
		["Pink, White & Blue Toilet Slime"] = pets["Pink, White & Blue Toilet Slime"]
	}

	local totalWeight = 0
	for _, petData in pairs(earthPets) do
		-- Adjust weight for "OP" pets if betterChance is true
		if betterChance and (petData[7] == "OP" or petData[7] == "Legendary" or petData[7] == "Rare") then
			totalWeight += petData[5] * 2
		else
			totalWeight += petData[5]
		end
	end

	local randomNumber = randomGenerator:NextInteger(1, totalWeight)
	local cumulativeWeight = 0

	-- Determine which Earth Pet corresponds to the random number
	for petName, petData in pairs(earthPets) do
		if betterChance and petData[7] == "OP" then
			cumulativeWeight += petData[5] * 2
		else
			cumulativeWeight += petData[5]
		end

		if randomNumber <= cumulativeWeight then
			return petName
		end
	end
end

local function randomWinterPet(betterChance)
	local earthPets = {
		["Snowman"] = pets["Snowman"],
		["Spirit of the Snowfall"] = pets["Spirit of the Snowfall"]
	}

	local totalWeight = 0
	for _, petData in pairs(earthPets) do
		-- Adjust weight for "OP" pets if betterChance is true
		if betterChance and (petData[7] == "OP" or petData[7] == "Legendary" or petData[7] == "Rare") then
			totalWeight += petData[5] * 2
		else
			totalWeight += petData[5]
		end
	end

	local randomNumber = randomGenerator:NextInteger(1, totalWeight)
	local cumulativeWeight = 0

	-- Determine which Earth Pet corresponds to the random number
	for petName, petData in pairs(earthPets) do
		if betterChance and petData[7] == "OP" then
			cumulativeWeight += petData[5] * 2
		else
			cumulativeWeight += petData[5]
		end

		if randomNumber <= cumulativeWeight then
			return petName
		end
	end
end

function hatcher.hatchPet(eggType, numOfHatch, hasChanceGamepass)
	local petsToUnlock = {}
	
	if eggType == "Classic" then
		if numOfHatch == 1 then
			petsToUnlock = randomPet(hasChanceGamepass)
		elseif numOfHatch == 3 then
			table.insert(petsToUnlock, randomPet(hasChanceGamepass))
			table.insert(petsToUnlock, randomPet(hasChanceGamepass))
			table.insert(petsToUnlock, randomPet(hasChanceGamepass))
		end
	elseif eggType == "Cattle" then
		if numOfHatch == 1 then
			petsToUnlock = randomCattlePet(hasChanceGamepass)
		elseif numOfHatch == 3 then
			table.insert(petsToUnlock, randomCattlePet(hasChanceGamepass))
			table.insert(petsToUnlock, randomCattlePet(hasChanceGamepass))
			table.insert(petsToUnlock, randomCattlePet(hasChanceGamepass))
		end
	elseif eggType == "Bacon" then
		if numOfHatch == 1 then
			petsToUnlock = randomBaconPet(hasChanceGamepass)
		elseif numOfHatch == 3 then
			table.insert(petsToUnlock, randomBaconPet(hasChanceGamepass))
			table.insert(petsToUnlock, randomBaconPet(hasChanceGamepass))
			table.insert(petsToUnlock, randomBaconPet(hasChanceGamepass))
		end
	elseif eggType == "SkiBeeDi" then
		if numOfHatch == 1 then
			petsToUnlock = randomSkiBeeDiPet(hasChanceGamepass)
		elseif numOfHatch == 3 then
			table.insert(petsToUnlock, randomSkiBeeDiPet(hasChanceGamepass))
			table.insert(petsToUnlock, randomSkiBeeDiPet(hasChanceGamepass))
			table.insert(petsToUnlock, randomSkiBeeDiPet(hasChanceGamepass))
		end
	elseif eggType == "Platypus" then
		if numOfHatch == 1 then
			petsToUnlock = randomPlatypusPet(hasChanceGamepass)
		elseif numOfHatch == 3 then
			table.insert(petsToUnlock, randomPlatypusPet(hasChanceGamepass))
			table.insert(petsToUnlock, randomPlatypusPet(hasChanceGamepass))
			table.insert(petsToUnlock, randomPlatypusPet(hasChanceGamepass))
		end
	elseif eggType == "Crustatean" then
		if numOfHatch == 1 then
			petsToUnlock = randomCrustateanPet(hasChanceGamepass)
		elseif numOfHatch == 3 then
			table.insert(petsToUnlock, randomCrustateanPet(hasChanceGamepass))
			table.insert(petsToUnlock, randomCrustateanPet(hasChanceGamepass))
			table.insert(petsToUnlock, randomCrustateanPet(hasChanceGamepass))
		end
	elseif eggType == "Bunny" then
		if numOfHatch == 1 then
			petsToUnlock = randomBunnyPet(hasChanceGamepass)
		elseif numOfHatch == 3 then
			table.insert(petsToUnlock, randomBunnyPet(hasChanceGamepass))
			table.insert(petsToUnlock, randomBunnyPet(hasChanceGamepass))
			table.insert(petsToUnlock, randomBunnyPet(hasChanceGamepass))
		end
	elseif eggType == "Gubby" then
		if numOfHatch == 1 then
			petsToUnlock = randomGubbyPet(hasChanceGamepass)
		elseif numOfHatch == 3 then
			table.insert(petsToUnlock, randomGubbyPet(hasChanceGamepass))
			table.insert(petsToUnlock, randomGubbyPet(hasChanceGamepass))
			table.insert(petsToUnlock, randomGubbyPet(hasChanceGamepass))
		end
	elseif eggType == "Slimebidi" then
		if numOfHatch == 1 then
			petsToUnlock = randomSlimePet(hasChanceGamepass)
		elseif numOfHatch == 3 then
			table.insert(petsToUnlock, randomSlimePet(hasChanceGamepass))
			table.insert(petsToUnlock, randomSlimePet(hasChanceGamepass))
			table.insert(petsToUnlock, randomSlimePet(hasChanceGamepass))
		end
	elseif eggType == "Winter" then
		if numOfHatch == 1 then
			petsToUnlock = randomWinterPet(hasChanceGamepass)
		elseif numOfHatch == 3 then
			table.insert(petsToUnlock, randomWinterPet(hasChanceGamepass))
			table.insert(petsToUnlock, randomWinterPet(hasChanceGamepass))
			table.insert(petsToUnlock, randomWinterPet(hasChanceGamepass))
		end
	end
	
	return petsToUnlock
end

return hatcher
