local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")

-- Function to handle when a player joins
local function onPlayerAdded(player)
	-- Wait for the character to fully load and be added
	player.CharacterAdded:Wait()

	-- Clone the aura from ServerStorage
	local aura = ServerStorage.Auras.Star:Clone()

	-- Wait for the HumanoidRootPart to be available
	local humanoidRootPart = player.Character:WaitForChild("HumanoidRootPart")

	-- Parent the aura to the HumanoidRootPart
	aura.Parent = humanoidRootPart

	-- Create a WeldConstraint
	local weld = Instance.new("WeldConstraint")
	weld.Parent = aura
	weld.Part0 = humanoidRootPart
	weld.Part1 = aura

	-- Optional: Adjust position offset for the aura if needed
	aura.Position = humanoidRootPart.Position + Vector3.new(0, 1, 0)  -- Example offset above the HumanoidRootPart
end

-- Connect the PlayerAdded event
Players.PlayerAdded:Connect(onPlayerAdded)
