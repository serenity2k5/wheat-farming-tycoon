local ProfileService = require(script:WaitForChild('ProfileService'))
local SSS = game:GetService("ServerScriptService")

local playerPlotWait = SSS:WaitForChild('PlotHandler'):WaitForChild("CreatePlot")

local rebirthEvent = game.ReplicatedStorage:WaitForChild("RebirthEvent")

local BadgeService = game:GetService("BadgeService")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ProfileTemplate = {
	Cash = 5;
	Rebirth = 0;
	WheatCoin = 0;
	Items = {};
	
	Wheat = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	
	Pets = "Test";
	EquippedPets = "Test";
	
	Scythes = "Test";
	EquippedScythe = "Rusty Scythe";
	
	Auras = "Test";
	EquippedAura = "None";
	
	Upgrades = {0, 0};
	
	ClaimedReward = false;
	TutorialComplete = false;
	SecretKey = false;
}

local ProfileStore = ProfileService.GetProfileStore(
	"PlayerData",
	ProfileTemplate
)

local Profiles = {}

local function playerAdded(player)
	local profile = ProfileStore:LoadProfileAsync("Player_"..player.UserId)

	if profile then
		profile:AddUserId(player.UserId)
		profile:Reconcile()

		profile:ListenToRelease(function()
			Profiles[player] = nil
			player:Kick()
		end)

		if player:IsDescendantOf(game.Players) == true then
			Profiles[player] = profile
		else
			profile:Release()
		end
	else
		player:Kick()
	end
end



-- When player joins game
game.Players.PlayerAdded:Connect(function(player)
	playerAdded(player)
	
	BadgeService:AwardBadge(player.UserId, 2220973160891839)
	
	local profile = Profiles[player]
	if not profile then warn('No profile') return end
	
	local claimedReward = Instance.new("BoolValue")
	claimedReward.Name = 'ClaimedReward'
	claimedReward.Value = profile.Data.ClaimedReward or false
	claimedReward.Parent = player
	
	local tutorialCompleted = Instance.new("BoolValue")
	tutorialCompleted.Name = 'TutorialCompleted'
	tutorialCompleted.Value = profile.Data.TutorialComplete or false
	tutorialCompleted.Parent = player
	
	-- LEADERSTATS 
	
	local folder = Instance.new('Folder')
	folder.Name = 'leaderstats'
	folder.Parent = player
	
	local cash = Instance.new('IntValue')
	cash.Name = 'Cash'
	cash.Value = profile.Data.Cash or 5
	cash.Parent = folder
	
	local rebirth = Instance.new('IntValue')
	rebirth.Name = 'Rebirth'
	rebirth.Value = profile.Data.Rebirth or 0
	rebirth.Parent = folder
	
	local wheatCoin = Instance.new('NumberValue')
	wheatCoin.Name = 'WheatCoin'
	wheatCoin.Value = profile.Data.WheatCoin or 0
	wheatCoin.Parent = folder
	
	cash:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.Cash = cash.Value
	end)

	rebirth:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.Rebirth = rebirth.Value
	end)

	wheatCoin:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.WheatCoin = wheatCoin.Value
	end)
	
	claimedReward:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.ClaimedReward = claimedReward.Value
	end)
	
	tutorialCompleted:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.TutorialComplete = tutorialCompleted.Value
	end)
	
	-- UPGRADES FOLDER
	
	local upgFolder = Instance.new('Folder')
	upgFolder.Name = 'Upgrades'
	upgFolder.Parent = player
	
	local wheatOutput = Instance.new('IntValue')
	wheatOutput.Name = 'WheatOutput'
	wheatOutput.Value = profile.Data.Upgrades[1] or 0
	wheatOutput.Parent = upgFolder
	wheatOutput:SetAttribute("Maxed", false)

	local wheatCoinSpeed = Instance.new('NumberValue')
	wheatCoinSpeed.Name = 'WheatCoinSpeed'
	wheatCoinSpeed.Value = profile.Data.Upgrades[2] or 0
	wheatCoinSpeed.Parent = upgFolder
	wheatCoinSpeed:SetAttribute("Maxed", false)
	
	wheatOutput:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.Upgrades[1] = wheatOutput.Value
	end)

	wheatCoinSpeed:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.Upgrades[2] = wheatCoinSpeed.Value
	end)
	
	-- PETS
	local petsHolder = Instance.new('Model')
	petsHolder.Name = 'Pets'
	petsHolder.Parent = workspace:WaitForChild(player.Name)
	
	local highlight = Instance.new('Highlight')
	highlight.Parent = petsHolder
	highlight.FillTransparency = 1
	highlight.DepthMode = Enum.HighlightDepthMode.Occluded
	highlight.OutlineTransparency = 0.5
	highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
	
	local petsFolder = Instance.new('Folder')
	petsFolder.Name = 'Pets'
	petsFolder.Parent = player
	
	local equipPetArray = profile.Data.EquippedPets
	
	local equippedPets = Instance.new('StringValue')
	equippedPets.Name = 'Equipped'
	equippedPets.Value = equipPetArray
	equippedPets.Parent = petsFolder
	
	local petArray = profile.Data.Pets

	local ownedPets = Instance.new('StringValue')
	ownedPets.Name = 'Owned'
	ownedPets.Value = petArray
	ownedPets.Parent = petsFolder
	
	equippedPets:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.EquippedPets = equippedPets.Value
	end)
	
	ownedPets:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.Pets = ownedPets.Value
	end)
	
	-- SCYTHES INVENTORY
	local scythesFolder = Instance.new('Folder')
	scythesFolder.Name = 'Scythes'
	scythesFolder.Parent = player
	
	local ownedScythes = Instance.new('StringValue')
	ownedScythes.Name = 'Owned'
	ownedScythes.Parent = scythesFolder
	ownedScythes.Value = profile.Data.Scythes or "Test"
	
	local equippedScythe = Instance.new('StringValue')
	equippedScythe.Name = 'Equipped'
	equippedScythe.Parent = scythesFolder
	equippedScythe.Value = profile.Data.EquippedScythe or "Rusty Scythe"
	
	if ReplicatedStorage.Scythes:FindFirstChild(profile.Data.EquippedScythe) then
		-- Check if the scythe exists in ReplicatedStorage.Scythes
		local scytheToEquip = ReplicatedStorage.Scythes[profile.Data.EquippedScythe]:Clone()
		scytheToEquip.Parent = player.Character
	else
		-- Default to Rusty Scythe if equippedScythe is "None" or invalid
		local scytheToEquip = ReplicatedStorage.Scythes["Rusty Scythe"]:Clone()
		scytheToEquip.Parent = player.Character
		
		equippedScythe.Value = "Rusty Scythe"
	end
	
	equippedScythe:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.EquippedScythe = equippedScythe.Value
	end)

	ownedScythes:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.Scythes = ownedScythes.Value
	end)
	
	-- WHEATFOLDER INVENTORY
	local wheatFolder = Instance.new('Folder')
	wheatFolder.Name = 'WheatFolder'
	wheatFolder.Parent = player
	
	local regWheat = Instance.new('IntValue')
	regWheat.Name = 'RegularWheat'
	regWheat.Value = profile.Data.Wheat[1] or 0
	regWheat.Parent = wheatFolder
	
	local speWheat = Instance.new('IntValue')
	speWheat.Name = 'SpecialWheat'
	speWheat.Value = profile.Data.Wheat[2] or 0
	speWheat.Parent = wheatFolder
	
	local premWheat = Instance.new('IntValue')
	premWheat.Name = 'PremiumWheat'
	premWheat.Value = profile.Data.Wheat[3] or 0
	premWheat.Parent = wheatFolder
	
	local silverWheat = Instance.new('IntValue')
	silverWheat.Name = 'SilverWheat'
	silverWheat.Value = profile.Data.Wheat[4] or 0
	silverWheat.Parent = wheatFolder
	
	local goldWheat = Instance.new('IntValue')
	goldWheat.Name = 'GoldWheat'
	goldWheat.Value = profile.Data.Wheat[5] or 0
	goldWheat.Parent = wheatFolder
	
	local lunarWheat = Instance.new('IntValue')
	lunarWheat.Name = 'LunarWheat'
	lunarWheat.Value = profile.Data.Wheat[6] or 0
	lunarWheat.Parent = wheatFolder
	
	local alienWheat = Instance.new('IntValue')
	alienWheat.Name = 'AlienWheat'
	alienWheat.Value = profile.Data.Wheat[7] or 0
	alienWheat.Parent = wheatFolder
	
	local astroWheat = Instance.new('IntValue')
	astroWheat.Name = 'AstroWheat'
	astroWheat.Value = profile.Data.Wheat[8] or 0
	astroWheat.Parent = wheatFolder
	
	local coconutWheat = Instance.new('IntValue')
	coconutWheat.Name = 'CoconutWheat'
	coconutWheat.Value = profile.Data.Wheat[9] or 0
	coconutWheat.Parent = wheatFolder
	
	local pineappleWheat = Instance.new('IntValue')
	pineappleWheat.Name = 'PineappleWheat'
	pineappleWheat.Value = profile.Data.Wheat[10] or 0
	pineappleWheat.Parent = wheatFolder
	
	local starfruitWheat = Instance.new('IntValue')
	starfruitWheat.Name = 'StarfruitWheat'
	starfruitWheat.Value = profile.Data.Wheat[11] or 0
	starfruitWheat.Parent = wheatFolder
	
	local goldensunWheat = Instance.new('IntValue')
	goldensunWheat.Name = 'GoldenSunWheat'
	goldensunWheat.Value = profile.Data.Wheat[12] or 0
	goldensunWheat.Parent = wheatFolder
	
	local oceanWheat = Instance.new('IntValue')
	oceanWheat.Name = 'OceanWheat'
	oceanWheat.Value = profile.Data.Wheat[13] or 0
	oceanWheat.Parent = wheatFolder
	
	-- Sync RegularWheat
	regWheat:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.Wheat[1] = wheatFolder.RegularWheat.Value
	end)

	-- Sync SpecialWheat
	speWheat:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.Wheat[2] = wheatFolder.SpecialWheat.Value
	end)

	-- Sync PremiumWheat
	premWheat:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.Wheat[3] = wheatFolder.PremiumWheat.Value
	end)

	-- Sync SilverWheat
	silverWheat:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.Wheat[4] = wheatFolder.SilverWheat.Value
	end)

	-- Sync GoldWheat
	goldWheat:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.Wheat[5] = wheatFolder.GoldWheat.Value
	end)

	-- Sync LunarWheat
	lunarWheat:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.Wheat[6] = wheatFolder.LunarWheat.Value
	end)
	
	alienWheat:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.Wheat[7] = wheatFolder.AlienWheat.Value
	end)
	
	astroWheat:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.Wheat[8] = wheatFolder.CoconutWheat.Value
	end)
	
	coconutWheat:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.Wheat[9] = wheatFolder.CoconutWheat.Value
	end)
	
	pineappleWheat:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.Wheat[10] = wheatFolder.PineappleWheat.Value
	end)
	
	starfruitWheat:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.Wheat[11] = wheatFolder.StarfruitWheat.Value
	end)
	
	goldensunWheat:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.Wheat[12] = wheatFolder.GoldenSunWheat.Value
	end)
	
	oceanWheat:GetPropertyChangedSignal('Value'):Connect(function()
		profile.Data.Wheat[13] = wheatFolder.OceanWheat.Value
	end)
	
	
	-- Auto Delete set	
	local autoDeleteFolder = Instance.new('Folder')
	autoDeleteFolder.Name = 'AutoDelete'
	autoDeleteFolder.Parent = player
	
	local common = Instance.new('BoolValue')
	common.Name = 'Common'
	common.Parent = autoDeleteFolder
	
	local uncommon = Instance.new('BoolValue')
	uncommon.Name = 'Uncommon'
	uncommon.Parent = autoDeleteFolder
	
	local rare = Instance.new('BoolValue')
	rare.Name = 'Rare'
	rare.Parent = autoDeleteFolder
	
	local legendary = Instance.new('BoolValue')
	legendary.Name = 'Legendary'
	legendary.Parent = autoDeleteFolder
	
	local op = Instance.new('BoolValue')
	op.Name = 'OP'
	op.Parent = autoDeleteFolder
	
	task.delay(1, function()
		playerPlotWait:Fire(player, profile.Data.Items, false)
	end)
end)

game.Players.PlayerRemoving:Connect(function(player)
	local profile = Profiles[player]
	
	if profile then
		profile:Release()
	end
end)

for _, player in game.Players:GetPlayers() do
	task.spawn(playerAdded, player)
end

script:WaitForChild('ItemUnlocked').Event:Connect(function(player, itemId)
	local profile = Profiles[player]
	table.insert(profile.Data.Items, itemId)
end)

rebirthEvent.Event:Connect(function(player)
	local profile = Profiles[player]
	table.clear(profile.Data.Items)
	
	task.delay(1, function()
		playerPlotWait:Fire(player, profile.Data.Items, true)
	end)
end)

ReplicatedStorage.CompleteTutorial.OnServerEvent:Connect(function(player)
	player.TutorialCompleted.Value = true
end)