local Players = game:GetService("Players")

-- List of pets to remove
local petsToRemove = {
	"Rainbow Golden Chicken",
	"Rainbow Golden Choco Chicken",
	"Rainbow Golden Strawberry Chicken",
	"Rainbow Golden Banana Chicken",
	"Rainbow Golden Cool Chicken"
}

-- Function to handle when a player joins
local function onPlayerAdded(player)
	local petsFolder = player:WaitForChild("Pets") -- Assuming PetsFolder is created elsewhere
	local ownedPets = petsFolder:FindFirstChild("Owned")

	if ownedPets then
		-- Convert the Value (string) into a Lua table
		local petArray = string.split(ownedPets.Value, ",") -- Assuming pets are stored as comma-separated values

		-- Filter out pets to remove
		local filteredPets = {}
		for _, petName in ipairs(petArray) do
			if not table.find(petsToRemove, petName) then
				table.insert(filteredPets, petName)
			end
		end

		-- Update the Owned value with the filtered pets
		ownedPets.Value = table.concat(filteredPets, ",")
	end
end

-- Connect the PlayerAdded event
Players.PlayerAdded:Connect(onPlayerAdded)
