local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PetAttachment = {}

local function attachPetsToPlayer(player)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	local petsFolder = character:WaitForChild("Pets")

	local equippedPetsString = player:WaitForChild("Pets"):WaitForChild("Equipped").Value
	local petNames = {}
	if equippedPetsString ~= "" then
		petNames = string.split(equippedPetsString, ",")
	end

	for i, petName in ipairs(petNames) do
		if petName == "Test" then continue end

		local petTemplate = ReplicatedStorage.Pets:FindFirstChild(petName)
		if not petTemplate then continue end

		local pet = petTemplate:Clone()
		pet.Parent = petsFolder
		pet.Name = player.Name .. "_Pet_" .. (i - 1)

		if not pet.PrimaryPart then continue end

		local alignPosition = Instance.new("AlignPosition")
		alignPosition.Parent = pet.PrimaryPart

		local petAttachment = Instance.new("Attachment")
		petAttachment.Parent = pet.PrimaryPart

		local playerAttachment = humanoidRootPart:FindFirstChild("PetAttachment")
		if not playerAttachment then
			playerAttachment = Instance.new("Attachment")
			playerAttachment.Name = "PetAttachment"
			playerAttachment.Parent = humanoidRootPart
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

local function clearPets(player)
	local character = player.Character
	if not character then return end

	local petsFolder = character:FindFirstChild("Pets")
	if not petsFolder then return end

	for _, pet in ipairs(petsFolder:GetChildren()) do
		if pet.Name:sub(1, #player.Name) == player.Name then
			pet:Destroy()
		end
	end
end

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
					clearPets(player)
					attachPetsToPlayer(player)
					break
				end
			end
		end
		task.wait(1)
	end
end

function PetAttachment.init()
	Players.PlayerAdded:Connect(function(player)
		player.CharacterAdded:Connect(function()
			attachPetsToPlayer(player)

			task.spawn(monitorPetDistance, player)

			player:WaitForChild("Pets"):WaitForChild("Equipped").Changed:Connect(function()
				clearPets(player)
				attachPetsToPlayer(player)
			end)
		end)
	end)
end

return PetAttachment
