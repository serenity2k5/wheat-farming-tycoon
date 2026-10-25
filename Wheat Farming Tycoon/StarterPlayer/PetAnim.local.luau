local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local circleRadius = 8
local circleSpeed = 0.2 -- Speed at which the pets orbit the player
local verticalSpeed = 1 -- Speed of the up-and-down movement
local verticalAmplitude = 0.5 -- Amplitude of the up-and-down movement

local heartbeatConnections = {}

-- Function to check if a player is moving
local function isPlayerMoving(character)
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		return humanoid.MoveDirection.Magnitude > 0
	end
	return false
end

-- Update pets' visual positions, circular movement, and vertical oscillation for a given player
local function updatePets(player)
	local character = player.Character
	if not character then return end

	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	local petsFolder = character:FindFirstChild("Pets")
	local equippedPetsValue = player:FindFirstChild("Pets") and player.Pets:FindFirstChild("Equipped")

	if humanoidRootPart and petsFolder and equippedPetsValue then
		local numberOfPetsEquipped = string.split(equippedPetsValue.Value, ",")
		local petCount = #numberOfPetsEquipped - 1

		for i = 1, petCount do
			local pet = petsFolder:FindFirstChild(player.Name .. "_Pet_" .. i)
			if pet then
				-- Calculate the angle for the circular movement
				local angle = tick() * circleSpeed + (math.pi * 2 / petCount) * (i - 1)
				local circlePosition = humanoidRootPart.Position + Vector3.new(
					math.cos(angle) * circleRadius,
					0,
					math.sin(angle) * circleRadius
				)

				-- Add vertical oscillation using a sine wave
				local verticalOffset = math.sin(tick() * verticalSpeed + i * 0.5) * verticalAmplitude

				-- Move the pet to the calculated circular position, with the vertical offset
				pet:WaitForChild("Main").CFrame = CFrame.new(circlePosition + Vector3.new(0, verticalOffset, 0), humanoidRootPart.Position)

				-- Orient the pet
				if isPlayerMoving(character) then
					-- Face forward in the player's moving direction
					local forwardCFrame = CFrame.new(pet.PrimaryPart.Position, pet.PrimaryPart.Position + humanoidRootPart.CFrame.LookVector)
					pet:SetPrimaryPartCFrame(forwardCFrame)
				else
					-- Face the player when stationary
					local facePlayerCFrame = CFrame.new(pet.PrimaryPart.Position, humanoidRootPart.Position)
					pet:SetPrimaryPartCFrame(facePlayerCFrame)
				end
			end
		end
	end
end

-- Function to start updating pets for a player
local function startUpdatingPets(player)
	if heartbeatConnections[player] then
		heartbeatConnections[player]:Disconnect()
		heartbeatConnections[player] = nil
	end

	heartbeatConnections[player] = RunService.Heartbeat:Connect(function()
		updatePets(player)
	end)
end

-- Function to stop updating pets for a player
local function stopUpdatingPets(player)
	if heartbeatConnections[player] then
		heartbeatConnections[player]:Disconnect()
		heartbeatConnections[player] = nil
	end
end

-- Function to restart updating pets after a delay
local function restartUpdatingPets(player)
	stopUpdatingPets(player)
	startUpdatingPets(player)
end

-- Monitor players joining and leaving the game
Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		startUpdatingPets(player)
	end)
end)

Players.PlayerRemoving:Connect(function(player)
	stopUpdatingPets(player)
end)

-- Start updating pets for existing players
for _, player in ipairs(Players:GetPlayers()) do
	if player.Character then
		startUpdatingPets(player)
	end
	player.CharacterAdded:Connect(function()
		startUpdatingPets(player)
	end)
end

ReplicatedStorage.EquipUnequipPet.OnClientEvent:Connect(function(player)
	restartUpdatingPets(player)
end)



