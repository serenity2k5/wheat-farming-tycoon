local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ZoneMod = require(ReplicatedStorage.Modules.Zone)
local area = workspace.GrandePrairie.BestQualityScythes.Buy:WaitForChild("BuyCylinder")
local myZone = ZoneMod.new(area)

myZone.localPlayerEntered:Connect(function(plr: Player)
	plr.PlayerGui.BuyScytheGUI.Enabled = true
	
	plr.PlayerGui.MenuGUIS.SettingsGUI.SettingsFrame.EnclosedFrame.Volume.SliderHandler.Status.Value = "ScytheShop"
end)

