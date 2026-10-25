local ReplicatedStorage = game:GetService("ReplicatedStorage")
local scythes = require(ReplicatedStorage.Modules.Scythes)

ReplicatedStorage.ScytheBuy.OnServerEvent:Connect(function(player, scytheToAdd)
	local price = scythes[scytheToAdd][4]
	
	if player.leaderstats.Cash.Value < price then return end
	if player.leaderstats.Rebirth.Value < scythes[scytheToAdd][3] then return end
	
	player.leaderstats.Cash.Value -= price

	local ownedScythes = player.Scythes.Owned.Value
	local scythesString = ownedScythes .. "," .. scytheToAdd

	task.wait(0.5)

	player.Scythes.Owned.Value = scythesString
	ReplicatedStorage.ScytheBuy:FireClient(player)
	
	local currentScythe = player.Scythes.Equipped

	local playerScythes = player:WaitForChild("Scythes"):WaitForChild("Owned")
	local scythesArray = string.split(playerScythes.Value, ",")

	for i, scythe in ipairs(scythesArray) do
		if scythe == scytheToAdd then
			table.remove(scythesArray, i)
			if currentScythe.Value ~= "" and currentScythe.Value ~= nil then
				table.insert(scythesArray, currentScythe.Value)
			end
		end
	end

	currentScythe.Value = scytheToAdd

	local newScythes = table.concat(scythesArray, ",")
	playerScythes.Value = newScythes


	for _, item in (player.Character:GetChildren()) do
		if item:IsA("Tool") then
			item:Destroy()
		end
	end

	local scytheToEquip = ReplicatedStorage.Scythes[scytheToAdd]:Clone()
	scytheToEquip.Parent = player.Character

	task.wait(0.1)

end)

ReplicatedStorage.ScytheEquip.OnServerEvent:Connect(function(player, scytheToEquip)
	local currentScythe = player.Scythes.Equipped

	local playerScythes = player:WaitForChild("Scythes"):WaitForChild("Owned")
	local scythesArray = string.split(playerScythes.Value, ",")

	-- Check if the scytheToEquip exists in the owned scythes
	local isOwned = false
	for _, scythe in ipairs(scythesArray) do
		if scythe == scytheToEquip then
			isOwned = true
			break
		end
	end

	if not isOwned then
		warn("Error: Attempt to equip a scythe not owned by the player: " .. scytheToEquip)
		return
	end

	-- Equip logic if the scythe is owned
	for i, scythe in ipairs(scythesArray) do
		if scythe == scytheToEquip then
			table.remove(scythesArray, i)
			if currentScythe.Value ~= "" and currentScythe.Value ~= nil then
				table.insert(scythesArray, currentScythe.Value)
			end
		end
	end

	currentScythe.Value = scytheToEquip

	local newScythes = table.concat(scythesArray, ",")
	playerScythes.Value = newScythes

	-- Remove all tools from the character
	for _, item in player.Character:GetChildren() do
		if item:IsA("Tool") then
			item:Destroy()
		end
	end

	-- Equip the new scythe
	local scytheToEquipInstance = ReplicatedStorage.Scythes[scytheToEquip]:Clone()
	scytheToEquipInstance.Parent = player.Character

	task.wait(0.1)

	ReplicatedStorage.ScytheEquip:FireClient(player)
end)
