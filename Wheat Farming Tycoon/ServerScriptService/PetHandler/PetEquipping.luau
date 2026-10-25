local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MarketplaceService = game:GetService("MarketplaceService")

local petsModule = require(ReplicatedStorage.Modules.Pets)

local PetEquipping = {}

local EQUIP_BEST_GAMEPASS_ID = 987715624
local BASE_EQUIP_SLOTS = 3
local GAMEPASS_EQUIP_SLOTS = 5

local function hasGamePass(player, gamePassId)
	local success, result = pcall(function()
		return MarketplaceService:UserOwnsGamePassAsync(player.UserId, gamePassId)
	end)
	return success and result
end

local function removeTestEntries(petList)
	for i = #petList, 1, -1 do
		if petList[i] == "Test" then
			table.remove(petList, i)
		end
	end
end

local function processPets(player, equippedPetsString, petsString)
	local equippedPets = string.split(equippedPetsString, ",")
	local ownedPets = string.split(petsString, ",")

	removeTestEntries(equippedPets)
	removeTestEntries(ownedPets)

	local allPets = {}
	for _, pet in ipairs(equippedPets) do table.insert(allPets, pet) end
	for _, pet in ipairs(ownedPets) do table.insert(allPets, pet) end

	local petScores = {}
	for _, pet in ipairs(allPets) do
		local petData = petsModule[pet]
		if petData and petData[1] then
			table.insert(petScores, { pet = pet, score = petData[1] })
		end
	end

	table.sort(petScores, function(a, b)
		return a.score > b.score
	end)

	local maxSlots = hasGamePass(player, EQUIP_BEST_GAMEPASS_ID)
		and GAMEPASS_EQUIP_SLOTS
		or BASE_EQUIP_SLOTS

	local topPets = { "Test" }
	local remainingPets = { "Test" }

	for i, petData in ipairs(petScores) do
		if i <= maxSlots then
			table.insert(topPets, petData.pet)
		else
			table.insert(remainingPets, petData.pet)
		end
	end

	return topPets, remainingPets
end

function PetEquipping.init()
	ReplicatedStorage.EquipUnequipPet.OnServerEvent:Connect(function(player, equippedPetsString, petsString)
		player.Pets.Owned.Value = petsString
		player.Pets.Equipped.Value = equippedPetsString
	end)

	ReplicatedStorage.EquipBest.OnServerEvent:Connect(function(player)
		local equippedPetsString = player.Pets.Equipped.Value
		local petsString = player.Pets.Owned.Value

		local topPets, remainingPets = processPets(player, equippedPetsString, petsString)

		player.Pets.Owned.Value = table.concat(remainingPets, ",")
		player.Pets.Equipped.Value = table.concat(topPets, ",")
	end)
end

return PetEquipping
