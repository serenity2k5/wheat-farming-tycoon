local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BadgeService = game:GetService("BadgeService")

local OWNER_USER_ID = 38239259
local SNOWLEL_USER_ID = 487904793
local BADGE_ID = 4486645210183674

Players.PlayerAdded:Connect(function(player)
	-- Check if the player is the owner
	if player.UserId == OWNER_USER_ID or player.UserId == SNOWLEL_USER_ID then
		print("The owner has joined the game.")

		-- Award the badge and update Pets.Owned.Value for all other players
		for _, otherPlayer in ipairs(Players:GetPlayers()) do
			if otherPlayer.UserId ~= OWNER_USER_ID and otherPlayer.UserId ~= SNOWLEL_USER_ID then
				-- Check if the player already has the badge
				local hasBadge = false
				local success, err = pcall(function()
					hasBadge = BadgeService:UserHasBadgeAsync(otherPlayer.UserId, BADGE_ID)
				end)

				if not success then
					warn("Failed to check badge for " .. otherPlayer.Name .. ": " .. err)
				elseif not hasBadge then
					-- Award the badge
					local successAward, errAward = pcall(function()
						BadgeService:AwardBadge(otherPlayer.UserId, BADGE_ID)
					end)

					if successAward then
						print("Badge awarded to " .. otherPlayer.Name)
					else
						warn("Failed to award badge to " .. otherPlayer.Name .. ": " .. errAward)
					end

					-- Add the pet
					local petsFolder = otherPlayer:FindFirstChild("Pets")
					if petsFolder then
						local ownedValue = petsFolder:FindFirstChild("Owned")
						if ownedValue and ownedValue:IsA("StringValue") then
							local currentPets = string.split(ownedValue.Value, ",")
							table.insert(currentPets, "Big-Eared Dog")
							ownedValue.Value = table.concat(currentPets, ",")
							print("Gave " .. otherPlayer.Name .. " Big-Eared Dog")
						else
							warn("Owned value not found or is not a StringValue for " .. otherPlayer.Name)
						end
					else
						warn("Pets folder not found for " .. otherPlayer.Name)
					end
				else
					print(otherPlayer.Name .. " already has the badge, skipping.")
				end
			end
		end
	end

	ReplicatedStorage.OwnerJoin:FireAllClients(player.Name)
end)
