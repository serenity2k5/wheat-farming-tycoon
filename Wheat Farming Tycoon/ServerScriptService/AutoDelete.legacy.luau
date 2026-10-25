local ReplicatedStorage = game:GetService("ReplicatedStorage")

ReplicatedStorage.SetAutoDelete.OnServerEvent:Connect(function(player, rarityToDelete, enabled)
	local rarityStat = player.AutoDelete[rarityToDelete]
	
	if enabled then 
		rarityStat.Value = true
	else
		rarityStat.Value = false
	end
end)