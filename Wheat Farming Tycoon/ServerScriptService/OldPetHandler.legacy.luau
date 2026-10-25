local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local petsModule = require(ReplicatedStorage.Modules.Pets)

-- Function to attach pets to a player
local function attachPetsToPlayer(player)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	local petsFolder = character:WaitForChild('Pets')

	-- Get equipped pets from player's Pets.Equipped
	local equippedPetsString = player:WaitForChild("Pets"):WaitForChild("Equipped").Value
	local petNames = {}
	if equippedPetsString ~= "" then
		petNames = string.split(equippedPetsString, ",")
	end

	-- Clone and setup pets based on equipped pet names
	for i, petName in ipairs(petNames) do
		if petName == "Test" then continue end

		local petTemplate = ReplicatedStorage.Pets:FindFirstChild(petName)
		if petTemplate then
			local pet = petTemplate:Clone()
			pet.Parent = petsFolder
			pet.Name = player.Name .. "_Pet_" .. (i - 1)

			-- Ensure pet's primary part is set
			if pet.PrimaryPart then
				-- Add attachment but leave movement to client
				local alignPosition = Instance.new("AlignPosition", pet.PrimaryPart)
				local petAttachment = Instance.new("Attachment", pet.PrimaryPart)
				local playerAttachment = humanoidRootPart:FindFirstChild("PetAttachment")

				if not playerAttachment then
					playerAttachment = Instance.new("Attachment", humanoidRootPart)
					playerAttachment.Name = "PetAttachment"
				end

				alignPosition.Attachment0 = petAttachment
				alignPosition.Attachment1 = playerAttachment
				alignPosition.MaxForce = 100000
				alignPosition.Responsiveness = 50

				pet.PrimaryPart:SetNetworkOwner(player)

				pet.PrimaryPart.Anchored = true

				pet:SetPrimaryPartCFrame(humanoidRootPart.CFrame * CFrame.new(5, 0, 0))
			end
		end
	end
end

-- Function to check distance between pets and the player
local function monitorPetDistance(player)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	local petsFolder = character:WaitForChild("Pets")

	while player.Parent do
		for _, pet in ipairs(petsFolder:GetChildren()) do
			if pet:IsA("Model") and pet.PrimaryPart then
				local distance = (humanoidRootPart.Position - pet.PrimaryPart.Position).Magnitude
				if distance > 1500 then
					print("Pet is too far! Reattaching pets.")

					-- Clear existing pets before reattaching
					for _, pet in ipairs(petsFolder:GetChildren()) do
						if pet.Name:sub(1, #player.Name) == player.Name then
							pet:Destroy()
						end
					end

					attachPetsToPlayer(player)
					break -- Reattach all pets if one is out of range
				end
			end
		end
		task.wait(1) -- Check every second to avoid excessive processing
	end
end

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		-- Attach pets when the character is added (on first join)
		attachPetsToPlayer(player)

		-- Start monitoring pet distances
		task.spawn(function()
			monitorPetDistance(player)
		end)

		-- Listen for changes in equipped pets
		player:WaitForChild("Pets"):WaitForChild("Equipped").Changed:Connect(function()
			local petsFolder = workspace[player.Name].Pets

			-- Clear existing pets before reattaching
			for _, pet in ipairs(petsFolder:GetChildren()) do
				if pet.Name:sub(1, #player.Name) == player.Name then
					pet:Destroy()
				end
			end

			-- Reattach pets based on updated equipped pets string
			attachPetsToPlayer(player)
		end)
	end)
end)

local announce = require(ReplicatedStorage.Modules.GlobalAnnounce)

-- Sync pets between server and client when the Equipped/Owned pet strings are changed
ReplicatedStorage.EquipUnequipPet.OnServerEvent:Connect(function(player, equippedPetsString, petsString)
	player.Pets.Owned.Value = petsString
	player.Pets.Equipped.Value = equippedPetsString
end)

ReplicatedStorage.EquipBest.OnServerEvent:Connect(function(player)
	print("Fired")

	local petsString = player.Pets.Owned.Value
	local equippedPetsString = player.Pets.Equipped.Value

	local function hasGamePass(player, gamePassId)
		local success, result = pcall(function()
			return player.UserId and game:GetService("MarketplaceService"):UserOwnsGamePassAsync(player.UserId, gamePassId)
		end)
		return success and result
	end

	-- Define the pets processing function
	local function processPets(equippedPetsString, petsString)
		-- Convert strings into tables
		local equippedPets = string.split(equippedPetsString, ",")
		local ownedPets = string.split(petsString, ",")

		-- Remove "Test" from both tables
		for i = #equippedPets, 1, -1 do
			if equippedPets[i] == "Test" then
				table.remove(equippedPets, i)
			end
		end

		for i = #ownedPets, 1, -1 do
			if ownedPets[i] == "Test" then
				table.remove(ownedPets, i)
			end
		end

		-- Combine the tables
		local allPets = {}
		for _, pet in ipairs(equippedPets) do
			table.insert(allPets, pet)
		end
		for _, pet in ipairs(ownedPets) do
			table.insert(allPets, pet)
		end

		-- Get the pets with the highest petsModule[1]
		local petScores = {}
		for _, pet in ipairs(allPets) do
			local petData = petsModule[pet]
			if petData and petData[1] then
				table.insert(petScores, {pet = pet, score = petData[1]})
			end
		end

		-- Sort the pets by their scores (descending order)
		table.sort(petScores, function(a, b)
			return a.score > b.score
		end)

		-- Separate the top 3 pets and the rest
		local topPets = {"Test"}
		local remainingPets = {"Test"}

		if hasGamePass(player, 987715624) then
			for i, petData in ipairs(petScores) do
				if i <= 5 then
					table.insert(topPets, petData.pet)
				else
					table.insert(remainingPets, petData.pet)
				end
			end
		else
			for i, petData in ipairs(petScores) do
				if i <= 3 then
					table.insert(topPets, petData.pet)
				else
					table.insert(remainingPets, petData.pet)
				end
			end
		end

		return topPets, remainingPets
	end

	-- Call the function and get the results
	local topPets, remainingPets = processPets(equippedPetsString, petsString)

	player.Pets.Owned.Value = table.concat(remainingPets, ",")
	player.Pets.Equipped.Value = table.concat(topPets, ",")
end)

local country = require(ReplicatedStorage.Modules.Country)
local petHatcher = require(ServerScriptService.Modules.Hatcher)

ServerStorage.Bindables.HatchPet.Event:Connect(function(player, price)
	local gamePassId = 1024504828

	local function hasGamePass(player, gamePassId)
		local success, result = pcall(function()
			return player.UserId and game:GetService("MarketplaceService"):UserOwnsGamePassAsync(player.UserId, gamePassId)
		end)
		return success and result
	end

	local petToAdd

	if price == 25000 then
		petToAdd = petHatcher.hatchPet("Classic", 1, hasGamePass(player, gamePassId))
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, "CLH1")
	elseif price == 75000 then
		petToAdd = petHatcher.hatchPet("Classic", 3, hasGamePass(player, gamePassId))
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, "CLH3")

		petToAdd = table.concat(petToAdd, ",")
	elseif price == 100000 then
		petToAdd = petHatcher.hatchPet("Cattle", 1, hasGamePass(player, gamePassId))
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, "CAH1")
	elseif price == 300000 then
		petToAdd = petHatcher.hatchPet("Cattle", 3, hasGamePass(player, gamePassId))
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, "CAH3")

		petToAdd = table.concat(petToAdd, ",")
	elseif price == 250000 then
		petToAdd = petHatcher.hatchPet("Bacon", 1, hasGamePass(player, gamePassId))
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, "BAH1")
	elseif price == 750000 then
		petToAdd = petHatcher.hatchPet("Bacon", 3, hasGamePass(player, gamePassId))
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, "BAH3")

		petToAdd = table.concat(petToAdd, ",")
	elseif price == 500000 then
		petToAdd = petHatcher.hatchPet("SkiBeeDi", 1, hasGamePass(player, gamePassId))
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, "SKBH1")
	elseif price == 1500000 then
		petToAdd = petHatcher.hatchPet("SkiBeeDi", 3, hasGamePass(player, gamePassId))
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, "SKBH3")

		petToAdd = table.concat(petToAdd, ",")
	elseif price == 750001 then
		petToAdd = petHatcher.hatchPet("Platypus", 1, hasGamePass(player, gamePassId))
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, "PLH1")
	elseif price == 2250000 then
		petToAdd = petHatcher.hatchPet("Platypus", 3, hasGamePass(player, gamePassId))
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, "PLH3")

		petToAdd = table.concat(petToAdd, ",")
	elseif price == 1000000 then
		petToAdd = petHatcher.hatchPet("Crustatean", 1, hasGamePass(player, gamePassId))
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, "CRH1")
	elseif price == 3000000 then
		petToAdd = petHatcher.hatchPet("Crustatean", 3, hasGamePass(player, gamePassId))
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, "CRH3")

		petToAdd = table.concat(petToAdd, ",")
	elseif price == 2500000 then
		petToAdd = petHatcher.hatchPet("Bunny", 1, hasGamePass(player, gamePassId))
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, "BUNH1")
	elseif price == 7500000 then
		petToAdd = petHatcher.hatchPet("Bunny", 3, hasGamePass(player, gamePassId))
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, "BUNH3")

		petToAdd = table.concat(petToAdd, ",")
	elseif price == 10000000 then
		petToAdd = petHatcher.hatchPet("Gubby", 1, hasGamePass(player, gamePassId))
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, "GUBH1")
	elseif price == 30000000 then
		petToAdd = petHatcher.hatchPet("Gubby", 3, hasGamePass(player, gamePassId))
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, "GUBH3")

		petToAdd = table.concat(petToAdd, ",")
	elseif price == 20000000 then
		petToAdd = petHatcher.hatchPet("Slimebidi", 1, hasGamePass(player, gamePassId))
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, "SLIH1")
	elseif price == 60000000 then
		petToAdd = petHatcher.hatchPet("Slimebidi", 3, hasGamePass(player, gamePassId))
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, "SLIH3")

		petToAdd = table.concat(petToAdd, ",")

	elseif price == 15 then
		petToAdd = petHatcher.hatchPet("Winter", 1, hasGamePass(player, gamePassId))
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, "WIN1")
	elseif price == 45 then
		petToAdd = petHatcher.hatchPet("Winter", 3, hasGamePass(player, gamePassId))
		ReplicatedStorage.HatchPet:FireClient(player, petToAdd, "WIN3")

		petToAdd = table.concat(petToAdd, ",")
	end

	if price ~= 15 and price ~= 45 then
		player.leaderstats.Cash.Value -= price
	else
		player.leaderstats.WheatCoin.Value -= price
	end

	-- Check for Auto-Delete
	local ownedPets = player.Pets.Owned.Value
	local petsString = ownedPets

	for _, petName in pairs(petToAdd:split(",")) do
		local petData = petsModule[petName]
		if petData and petData[3] == "Common" and player.AutoDelete.Common.Value then
			continue
		elseif petData and petData[3] == "Uncommon" and player.AutoDelete.Uncommon.Value then
			continue
		elseif petData and petData[3] == "Rare" and player.AutoDelete.Rare.Value then
			continue
		elseif petData and petData[3] == "Legendary" and player.AutoDelete.Legendary.Value then
			continue
		elseif petData and petData[3] == "OP" and player.AutoDelete.OP.Value then
			continue
		elseif petData and petName == "Snowman" and player.AutoDelete.Common.Value then
			continue
		end

		petsString = petsString .. "," .. petName
	end

	local flag, countryName = country.getFlagAndCountry(player)

	if petToAdd == "Cool Chicken" or petToAdd == "Awoken Cow" or petToAdd == "Rich Pig" or petToAdd == "Crystal Toilet Bee" or petToAdd == "Spirit of the Valentine" or petToAdd == "Secret Agent Platypus" or petToAdd == "Chrome Lobster" or petToAdd == "King Bunny" or petToAdd == "Spirit of the Snowfall" or petToAdd == "Pancake Gubby" or petToAdd == "Pink, White & Blue Toilet Slime" then
		announce.New("[SYSTEM]: " .. player.Name .. " has hatched an OP " .. petToAdd .. " in " .. flag .. " " .. countryName .. "!", Color3.fromRGB(255, 0, 255))
	end

	task.wait(0.5)

	player.Pets.Owned.Value = petsString
end)

ReplicatedStorage.MergePet.OnServerEvent:Connect(function(player, petsToMerge, tier)
	local deleteValue = 0
	local equippedPetsString = player:WaitForChild("Pets"):WaitForChild("Equipped")
	local petsString = player:WaitForChild("Pets"):WaitForChild("Owned")

	local equippedPetsArray = string.split(equippedPetsString.Value, ",")
	local petsArray = string.split(petsString.Value, ",")

	-- Remove the merged pets from equipped and owned lists
	for i = #equippedPetsArray, 1, -1 do
		if deleteValue == 4 then break end
		if equippedPetsArray[i] == petsToMerge then
			deleteValue += 1
			table.remove(equippedPetsArray, i)
		end
	end

	for i = #petsArray, 1, -1 do
		if deleteValue == 4 then break end
		if petsArray[i] == petsToMerge then
			deleteValue += 1
			table.remove(petsArray, i)
		end
	end

	local finalPetToMerge

	if tier == "Rainbow" then
		local petsMergeString = string.split(petsToMerge, " ")
		table.remove(petsMergeString, 1)
		finalPetToMerge = table.concat(petsMergeString, " ")

		table.insert(petsArray, tier .. " " .. finalPetToMerge)
	else
		table.insert(petsArray, tier .. " " .. petsToMerge)
	end

	local newEquippedPets = table.concat(equippedPetsArray, ",")
	local newPets = table.concat(petsArray, ",")

	equippedPetsString.Value = newEquippedPets
	petsString.Value = newPets

	ReplicatedStorage.MergePet:FireClient(player, newPets)
end)

ReplicatedStorage.DeletePet.OnServerEvent:Connect(function(player, petToDelete)
	local deleteValue = 0
	local petsString = player:WaitForChild("Pets"):WaitForChild("Owned")

	local petsArray = string.split(petsString.Value, ",")

	for i = #petsArray, 1, -1 do
		if deleteValue == 1 then break end
		if petsArray[i] == petToDelete then
			deleteValue += 1
			table.remove(petsArray, i)
		end
	end

	local newPetsString = table.concat(petsArray, ",")

	petsString.Value = newPetsString
end)