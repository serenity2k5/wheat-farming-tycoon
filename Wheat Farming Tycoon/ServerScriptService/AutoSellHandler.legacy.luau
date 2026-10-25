local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local numFormat = require(ReplicatedStorage.Modules.NumFormat)
local formatter = numFormat.new()

local gamePassId = 1021914321
local autoSellInterval = 0.5
local gamePassCheckInterval = 1

local function hasGamePass(player, gamePassId)
	local success, result = pcall(function()
		return player.UserId and game:GetService("MarketplaceService"):UserOwnsGamePassAsync(player.UserId, gamePassId)
	end)
	return success and result
end

local x2GamePassId = 985464840

local function hasx2GamePass(player, gamePassId)
	local success, result = pcall(function()
		return player.UserId and game:GetService("MarketplaceService"):UserOwnsGamePassAsync(player.UserId, gamePassId)
	end)
	return success and result
end

local function sellWheat(player)
	local PlayerObject = player
	local wheatGui = PlayerObject:WaitForChild("PlayerGui"):WaitForChild("MenuGUIS"):WaitForChild("WheatGUI"):WaitForChild("WheatFrame"):WaitForChild("EnclosedFrame")

	local wheatFolder = PlayerObject:WaitForChild("WheatFolder")
	local regWheat = wheatFolder:WaitForChild("RegularWheat")
	local specialWheat = wheatFolder:WaitForChild("SpecialWheat")
	local premiumWheat = wheatFolder:WaitForChild("PremiumWheat")
	local silverWheat = wheatFolder:WaitForChild("SilverWheat")
	local goldWheat = wheatFolder:WaitForChild("GoldWheat")
	local lunarWheat = wheatFolder:WaitForChild("LunarWheat")
	local alienWheat = wheatFolder:WaitForChild("AlienWheat")
	local astroWheat = wheatFolder:WaitForChild("AstroWheat")
	local coconutWheat = wheatFolder:WaitForChild("CoconutWheat")
	local pineappleWheat = wheatFolder:WaitForChild("PineappleWheat")
	local starfruitWheat = wheatFolder:WaitForChild("StarfruitWheat")
	local goldensunWheat = wheatFolder:WaitForChild("GoldenSunWheat")
	local oceanWheat = wheatFolder:WaitForChild("OceanWheat")

	local petsFolder = workspace:WaitForChild(player.Name):WaitForChild("Pets"):GetChildren()
	
	local gamePassMultiplier
	
	if hasx2GamePass(player, x2GamePassId) then
		gamePassMultiplier = 2
	else
		gamePassMultiplier = 1
	end

	local petsMultiplier = 1

	for _, pet in ipairs(petsFolder) do
		if pet:IsA("Model") and pet:GetAttribute("CashMultiplier") then
			local cashMultiplier = pet:GetAttribute("CashMultiplier")
			petsMultiplier += (cashMultiplier - 1)
		end
	end

	local totalCash = ((
		(regWheat.Value * 1) + 
		(specialWheat.Value * 4) + 
		(premiumWheat.Value * 8) + 
		(silverWheat.Value * 12) + 
		(goldWheat.Value * 16) +
		(lunarWheat.Value * 25) +
		(alienWheat.Value * 35) +
		(astroWheat.Value * 50) +
		(coconutWheat.Value * 75) +
		(pineappleWheat.Value * 85) +
		(starfruitWheat.Value * 100) +
		(goldensunWheat.Value * 125) +
		(oceanWheat.Value * 150)
		* gamePassMultiplier) 
		* petsMultiplier )

	totalCash = math.floor(totalCash)

	PlayerObject.leaderstats.Cash.Value += totalCash
	regWheat.Value = 0
	wheatGui.RegularWheat.WheatAmount.Text = 0

	specialWheat.Value = 0
	wheatGui.SpecialWheat.WheatAmount.Text = 0

	premiumWheat.Value = 0
	wheatGui.PremiumWheat.WheatAmount.Text = 0

	silverWheat.Value = 0
	wheatGui.SilverWheat.WheatAmount.Text = 0

	goldWheat.Value = 0
	wheatGui.GoldWheat.WheatAmount.Text = 0

	lunarWheat.Value = 0
	wheatGui.LunarWheat.WheatAmount.Text = 0

	alienWheat.Value = 0
	wheatGui.AlienWheat.WheatAmount.Text = 0

	astroWheat.Value = 0
	wheatGui.AstroWheat.WheatAmount.Text = 0
	
	coconutWheat.Value = 0
	wheatGui.CoconutWheat.WheatAmount.Text = 0
	
	pineappleWheat.Value = 0
	wheatGui.PineappleWheat.WheatAmount.Text = 0
	
	starfruitWheat.Value = 0
	wheatGui.StarfruitWheat.WheatAmount.Text = 0
	
	goldensunWheat.Value = 0
	wheatGui.GoldenSunWheat.WheatAmount.Text = 0
	
	oceanWheat.Value = 0
	wheatGui.OceanWheat.WheatAmount.Text = 0

	local cashToShow = formatter:Format(player.leaderstats.Cash.Value)
	PlayerObject.PlayerGui.MenuGUI.Menu.Cash.Text = "$".. cashToShow
	PlayerObject.PlayerGui.MenuGUI.Menu.TotalWheat.Text = 0
end

local function startAutoSelling(player)
	while task.wait(autoSellInterval) do
		if not player.Parent then break end
		sellWheat(player)
	end
end

local function monitorGamePass(player)
	while task.wait(gamePassCheckInterval) do
		if not player.Parent then break end
		if hasGamePass(player, gamePassId) then
			startAutoSelling(player)
			break
		end
	end
end

Players.PlayerAdded:Connect(function(player)
	task.defer(function()
		monitorGamePass(player)
	end)
end)

for _, player in ipairs(Players:GetPlayers()) do
	task.defer(function()
		monitorGamePass(player)
	end)
end
