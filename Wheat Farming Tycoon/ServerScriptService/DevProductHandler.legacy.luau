local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local numFormat = require(ReplicatedStorage.Modules.NumFormat)
local formatter = numFormat.new()

-- Table of product IDs to check
local productIds = {
	[2668137545] = function(player)
		player.leaderstats.Cash.Value += 1000
		player.PlayerGui.InventoryGui.PlayerStats.Cash.Text = "$"..formatter:Format(player.leaderstats.Cash.Value)
		return true
		end,  -- 1000
	[2668137544] = function(player)
		player.leaderstats.Cash.Value += 10000
		player.PlayerGui.InventoryGui.PlayerStats.Cash.Text = "$"..formatter:Format(player.leaderstats.Cash.Value)
		return true
	end,
	[2668137542] = function(player)
		player.leaderstats.Cash.Value += 100000
		player.PlayerGui.InventoryGui.PlayerStats.Cash.Text = "$"..formatter:Format(player.leaderstats.Cash.Value)
		return true
	end,
	[2668137541] = function(player)
		player.leaderstats.Cash.Value += 1000000
		player.PlayerGui.InventoryGui.PlayerStats.Cash.Text = "$"..formatter:Format(player.leaderstats.Cash.Value)
		return true
	end,
	
	[2693330680] = function(player)
		ReplicatedStorage.PurchasedPet:FireClient(player, 1)
		player.Pets.Owned.Value = player.Pets.Owned.Value .. ",Bunny Girl"
		return true
	end,
	[2693342881] = function(player)
		ReplicatedStorage.PurchasedPet:FireClient(player, 4)
		player.Pets.Owned.Value = player.Pets.Owned.Value .. ",Bunny Girl,Bunny Girl,Bunny Girl,Bunny Girl"
		return true
	end,
	[2693343082] = function(player)
		ReplicatedStorage.PurchasedPet:FireClient(player, 16)
		player.Pets.Owned.Value = player.Pets.Owned.Value .. ",Bunny Girl,Bunny Girl,Bunny Girl,Bunny Girl,Bunny Girl,Bunny Girl,Bunny Girl,Bunny Girl,Bunny Girl,Bunny Girl,Bunny Girl,Bunny Girl,Bunny Girl,Bunny Girl,Bunny Girl,Bunny Girl"
		return true
	end
}

-- Connect the function to the ProcessReceipt event
MarketplaceService.ProcessReceipt = function(info)
	local player = Players:GetPlayerByUserId(info.PlayerId)
	if not player then
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end
	
	local success, result = pcall(productIds[info.ProductId], player)
	if not success or not result then
		warn("Error for Product" .. result)
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end
	
	return Enum.ProductPurchaseDecision.PurchaseGranted
end