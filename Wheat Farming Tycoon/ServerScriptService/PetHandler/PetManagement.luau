local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PetManagement = {}

local MERGE_COUNT = 4

function PetManagement.init()
	ReplicatedStorage.MergePet.OnServerEvent:Connect(function(player, petsToMerge, tier)
		local equippedValue = player:WaitForChild("Pets"):WaitForChild("Equipped")
		local ownedValue = player:WaitForChild("Pets"):WaitForChild("Owned")

		local equippedArray = string.split(equippedValue.Value, ",")
		local ownedArray = string.split(ownedValue.Value, ",")

		-- Remove merged pets from equipped list
		local deleteCount = 0
		for i = #equippedArray, 1, -1 do
			if deleteCount >= MERGE_COUNT then break end
			if equippedArray[i] == petsToMerge then
				deleteCount += 1
				table.remove(equippedArray, i)
			end
		end

		-- Remove merged pets from owned list
		for i = #ownedArray, 1, -1 do
			if deleteCount >= MERGE_COUNT then break end
			if ownedArray[i] == petsToMerge then
				deleteCount += 1
				table.remove(ownedArray, i)
			end
		end

		-- Build the merged pet name
		local mergedPetName
		if tier == "Rainbow" then
			local parts = string.split(petsToMerge, " ")
			table.remove(parts, 1)
			mergedPetName = tier .. " " .. table.concat(parts, " ")
		else
			mergedPetName = tier .. " " .. petsToMerge
		end

		table.insert(ownedArray, mergedPetName)

		equippedValue.Value = table.concat(equippedArray, ",")
		ownedValue.Value = table.concat(ownedArray, ",")

		ReplicatedStorage.MergePet:FireClient(player, ownedValue.Value)
	end)

	ReplicatedStorage.DeletePet.OnServerEvent:Connect(function(player, petToDelete)
		local ownedValue = player:WaitForChild("Pets"):WaitForChild("Owned")
		local petsArray = string.split(ownedValue.Value, ",")

		for i = #petsArray, 1, -1 do
			if petsArray[i] == petToDelete then
				table.remove(petsArray, i)
				break
			end
		end

		ownedValue.Value = table.concat(petsArray, ",")
	end)
end

return PetManagement
