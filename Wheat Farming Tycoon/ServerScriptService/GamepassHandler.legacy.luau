local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

local GamepassID = 987231258
local Multiplier = 2

-- Function to update player's speed if they own the gamepass
local function updateSpeedIfGamepassOwned(Player)
	local function applySpeed()
		local Character = Player.Character or Player.CharacterAdded:Wait()
		local Humanoid = Character:WaitForChild("Humanoid")
		if MarketplaceService:UserOwnsGamePassAsync(Player.UserId, GamepassID) then
			Humanoid.WalkSpeed = Humanoid.WalkSpeed * Multiplier
			print(Player.Name .. "'s speed updated to " .. Humanoid.WalkSpeed)
		end
	end

	-- If the player respawns, reapply the speed
	Player.CharacterAdded:Connect(applySpeed)

	-- Apply speed to current character (if it exists)
	if Player.Character then
		applySpeed()
	end
end

-- When a player joins, check if they own the gamepass
Players.PlayerAdded:Connect(function(Player)
	updateSpeedIfGamepassOwned(Player)
end)

-- When a player purchases the gamepass
MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(Player, gamePassId, wasPurchased)
	if gamePassId == GamepassID and wasPurchased then
		print("Gamepass purchased successfully by " .. Player.Name)
		-- Update speed immediately for the player who purchased it
		updateSpeedIfGamepassOwned(Player)
	end
end)
