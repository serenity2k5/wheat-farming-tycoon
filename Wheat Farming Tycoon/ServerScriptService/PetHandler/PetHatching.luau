local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local MarketplaceService = game:GetService("MarketplaceService")

local petsModule = require(ReplicatedStorage.Modules.Pets)
local announce = require(ReplicatedStorage.Modules.GlobalAnnounce)
local country = require(ReplicatedStorage.Modules.Country)
local petHatcher = require(game:GetService("ServerScriptService").Modules.Hatcher)

local PetHatching = {}

local HATCH_GAMEPASS_ID = 1024504828

-- Table-driven hatch configuration: price -> egg data
local HATCH_TABLE = {
	[25000]    = { egg = "Classic",    count = 1, animId = "CLH1",  currency = "Cash" },
	[75000]    = { egg = "Classic",    count = 3, animId = "CLH3",  currency = "Cash" },
	[100000]   = { egg = "Cattle",     count = 1, animId = "CAH1",  currency = "Cash" },
	[300000]   = { egg = "Cattle",     count = 3, animId = "CAH3",  currency = "Cash" },
	[250000]   = { egg = "Bacon",      count = 1, animId = "BAH1",  currency = "Cash" },
	[750000]   = { egg = "Bacon",      count = 3, animId = "BAH3",  currency = "Cash" },
	[500000]   = { egg = "SkiBeeDi",   count = 1, animId = "SKBH1", currency = "Cash" },
	[1500000]  = { egg = "SkiBeeDi",   count = 3, animId = "SKBH3", currency = "Cash" },
	[750001]   = { egg = "Platypus",   count = 1, animId = "PLH1",  currency = "Cash" },
	[2250000]  = { egg = "Platypus",   count = 3, animId = "PLH3",  currency = "Cash" },
	[1000000]  = { egg = "Crustatean", count = 1, animId = "CRH1",  currency = "Cash" },
	[3000000]  = { egg = "Crustatean", count = 3, animId = "CRH3",  currency = "Cash" },
	[2500000]  = { egg = "Bunny",      count = 1, animId = "BUNH1", currency = "Cash" },
	[7500000]  = { egg = "Bunny",      count = 3, animId = "BUNH3", currency = "Cash" },
	[10000000] = { egg = "Gubby",      count = 1, animId = "GUBH1", currency = "Cash" },
	[30000000] = { egg = "Gubby",      count = 3, animId = "GUBH3", currency = "Cash" },
	[20000000] = { egg = "Slimebidi",  count = 1, animId = "SLIH1", currency = "Cash" },
	[60000000] = { egg = "Slimebidi",  count = 3, animId = "SLIH3", currency = "Cash" },
	[15]       = { egg = "Winter",     count = 1, animId = "WIN1",  currency = "WheatCoin" },
	[45]       = { egg = "Winter",     count = 3, animId = "WIN3",  currency = "WheatCoin" },
}

local OP_PETS = {
	["Cool Chicken"] = true,
	["Awoken Cow"] = true,
	["Rich Pig"] = true,
	["Crystal Toilet Bee"] = true,
	["Spirit of the Valentine"] = true,
	["Secret Agent Platypus"] = true,
	["Chrome Lobster"] = true,
	["King Bunny"] = true,
	["Spirit of the Snowfall"] = true,
	["Pancake Gubby"] = true,
	["Pink, White & Blue Toilet Slime"] = true,
}

local AUTO_DELETE_RARITIES = { "Common", "Uncommon", "Rare", "Legendary", "OP" }

local function hasGamePass(player, gamePassId)
	local success, result = pcall(function()
		return MarketplaceService:UserOwnsGamePassAsync(player.UserId, gamePassId)
	end)
	return success and result
end

local function shouldAutoDelete(player, petName)
	local petData = petsModule[petName]
	if not petData then return false end

	local rarity = petData[3]

	-- Special case: Snowman counts as Common for auto-delete
	if petName == "Snowman" then
		return player.AutoDelete.Common.Value
	end

	for _, r in ipairs(AUTO_DELETE_RARITIES) do
		if rarity == r then
			return player.AutoDelete[r].Value
		end
	end

	return false
end

local function announceOPPet(player, petName)
	if not OP_PETS[petName] then return end

	local flag, countryName = country.getFlagAndCountry(player)
	announce.New(
		"[SYSTEM]: " .. player.Name .. " has hatched an OP " .. petName
			.. " in " .. flag .. " " .. countryName .. "!",
		Color3.fromRGB(255, 0, 255)
	)
end

function PetHatching.init()
	ServerStorage.Bindables.HatchPet.Event:Connect(function(player, price)
		local hatchData = HATCH_TABLE[price]
		if not hatchData then
			warn("PetHatching: Unknown price " .. tostring(price))
			return
		end

		local ownsPass = hasGamePass(player, HATCH_GAMEPASS_ID)
		local petToAdd = petHatcher.hatchPet(hatchData.egg, hatchData.count, ownsPass)

		-- Fire the client with the hatched result
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, hatchData.animId)

		-- For multi-hatches, convert to comma-separated string
		if hatchData.count > 1 then
			petToAdd = table.concat(petToAdd, ",")
		end

		-- Deduct currency
		player.leaderstats[hatchData.currency].Value -= price

		-- Apply auto-delete filtering
		local petsString = player.Pets.Owned.Value
		for _, petName in ipairs(string.split(petToAdd, ",")) do
			if not shouldAutoDelete(player, petName) then
				petsString = petsString .. "," .. petName
			end
		end

		-- Announce OP pets
		announceOPPet(player, petToAdd)

		task.wait(0.5)
		player.Pets.Owned.Value = petsString
	end)
end

return PetHatching
