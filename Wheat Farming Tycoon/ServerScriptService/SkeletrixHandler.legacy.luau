-- ServerScript (Server-side Script)
local ServerStorage = game:GetService("ServerStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Require the KeyGenerationModule
local KeyGenerationModule = require(game.ServerScriptService.Modules.EdwardSkeletrix)

-- Bindable folder
local bindables = ServerStorage.Bindables

-- Function that generates the key when a player joins
local function onPlayerAdded(player)
	-- Generate a key when the player joins
	local key = KeyGenerationModule.MuseumMusic(player, 36)

	-- Optionally, you can store this key in ReplicatedStorage or another service
	-- For example, you can create a folder for each player and store the key there
	local playerData = Instance.new("Folder")
	playerData.Name = player.Name
	playerData.Parent = ServerStorage.PlayerKeys

	local keyValue = Instance.new("StringValue")
	keyValue.Name = "GeneratedKey"
	keyValue.Value = key
	keyValue.Parent = playerData
	

end

-- Connect the PlayerAdded event to the function
Players.PlayerAdded:Connect(onPlayerAdded)

local debounce = false

ReplicatedStorage.HelloServer.OnServerEvent:Connect(function(player, eventType, petOrScythe)	
	if debounce == true then return end
	debounce = true
	if eventType == "ClassicHatch1" then
		bindables.HatchPet:Fire(player, 25000)
		
		task.wait(3)
		debounce = false
	elseif eventType == "ClassicHatch3" then
		bindables.HatchPet:Fire(player, 75000)

		task.wait(3)
		debounce = false
	elseif eventType == "CattleHatch1" then
		bindables.HatchPet:Fire(player, 100000)
		
		task.wait(3)
		debounce = false
	elseif eventType == "CattleHatch3" then
		bindables.HatchPet:Fire(player, 300000)

		task.wait(3)
		debounce = false
	elseif eventType == "BaconHatch1" then
		bindables.HatchPet:Fire(player, 250000)
			
		task.wait(3)
		debounce = false
	elseif eventType == "BaconHatch3" then
		bindables.HatchPet:Fire(player, 750000)

		task.wait(3)
		debounce = false
	elseif eventType == "SkiBeeDiHatch1" then
		bindables.HatchPet:Fire(player, 500000)

		task.wait(3)
		debounce = false
	elseif eventType == "SkiBeeDiHatch3" then
		bindables.HatchPet:Fire(player, 1500000)

		task.wait(3)
		debounce = false
	elseif eventType == "PlatypusHatch1" then
		bindables.HatchPet:Fire(player, 750001)

		task.wait(3)
		debounce = false
	elseif eventType == "PlatypusHatch3" then
		bindables.HatchPet:Fire(player, 2250000)

		task.wait(3)
		debounce = false
	elseif eventType == "CrustateanHatch1" then
		bindables.HatchPet:Fire(player, 1000000)

		task.wait(3)
		debounce = false
	elseif eventType == "CrustateanHatch3" then
		bindables.HatchPet:Fire(player, 3000000)

		task.wait(3)
		debounce = false
	elseif eventType == "BunnyHatch1" then
		bindables.HatchPet:Fire(player, 2500000)

		task.wait(3)
		debounce = false
	elseif eventType == "BunnyHatch3" then
		bindables.HatchPet:Fire(player, 7500000)

		task.wait(3)
		debounce = false
	elseif eventType == "GubbyHatch1" then
		bindables.HatchPet:Fire(player, 10000000)

		task.wait(3)
		debounce = false
	elseif eventType == "GubbyHatch3" then
		bindables.HatchPet:Fire(player, 30000000)

		task.wait(3)
		debounce = false
	elseif eventType == "SlimebidiHatch1" then
		bindables.HatchPet:Fire(player, 20000000)

		task.wait(3)
		debounce = false
	elseif eventType == "SlimebidiHatch3" then
		bindables.HatchPet:Fire(player, 60000000)

		task.wait(3)
		debounce = false
	elseif eventType == "WinterHatch1" then
		bindables.HatchPet:Fire(player, 15)

		task.wait(3)
		debounce = false
	elseif eventType == "WinterHatch3" then
		bindables.HatchPet:Fire(player, 45)

		task.wait(3)
		debounce = false
	end
end)