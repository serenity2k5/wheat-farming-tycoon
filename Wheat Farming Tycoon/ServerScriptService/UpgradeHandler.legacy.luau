local ReplicatedStorage = game:GetService("ReplicatedStorage")
local upgradeEvent = ReplicatedStorage:WaitForChild("Upgrade")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local numFormat = require(ReplicatedStorage.Modules.NumFormat)
local formatter = numFormat.new()

local defaultPosition = UDim2.new(-2, 0, 0, 0)
local goalPosition1 = UDim2.new(0, 0, 0, 0)  -- Position (0, 0, 0, 0)
local goalPosition2 = UDim2.new(2, 0, 0, 0)  -- Position (2, 0, 0, 0)
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

upgradeEvent.OnServerEvent:Connect(function(player, upgradeType, upgradeCount, maxed)
	local leaderstats = player:FindFirstChild("leaderstats")
	local wheatCoin = leaderstats.WheatCoin
	local upgrades = player:FindFirstChild("Upgrades")
	
	if not leaderstats or not wheatCoin or not upgrades then
		warn("Missing player data for " .. player.Name)
		return
	end
	
	local cost = 20 + (upgradeCount * 50)
		
		if wheatCoin.Value < cost then
			return
		end
	
	local upgGui = player.PlayerGui.UpgradeGUI.Background.UpgradeFrame
	
	if upgradeType == "WheatOutput" and upgrades.WheatOutput.Value < 5 then
		upgrades.WheatOutput.Value += 1
		wheatCoin.Value -= cost
		upgGui.WheatOutput.TextButton.Text = "Bought!"
		task.wait(1)
		upgGui.WheatOutput.TextButton.Text = "UPGRADE (" .. (20 + ((upgradeCount + 1) * 50)) .. " WheatCoin)"
	elseif upgradeType == "WheatCoinSpeed" and upgrades.WheatCoinSpeed.Value < 5 then
		upgrades.WheatCoinSpeed.Value += 1
		wheatCoin.Value -= cost
		upgGui.WheatCoinSpeed.TextButton.Text = "Bought!"
		task.wait(1)
		upgGui.WheatCoinSpeed.TextButton.Text = "UPGRADE (" .. (20 + ((upgradeCount + 1) * 50)) .. " WheatCoin)"
	end

	
	player.PlayerGui.MenuGUI.Menu.WheatCoin.Text = formatter:Format(wheatCoin.Value)
end)