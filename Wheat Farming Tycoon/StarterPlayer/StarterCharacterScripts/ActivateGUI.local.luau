local player = game.Players.LocalPlayer
local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")
local hrp = character:WaitForChild("HumanoidRootPart") -- HumanRootPart for distance checks

local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ZoneMod = require(ReplicatedStorage.Modules.Zone)

local eggGUIs = player.PlayerGui:WaitForChild("EggGUIs") -- Parent of all GUIs
local debounceTable = {}
local debounceTime = 1 -- Time in seconds between activations

-- Tween info for showing the PetInfo (expanding size)
local showTweenInfo = TweenInfo.new(
	0.2, -- Duration
	Enum.EasingStyle.Quad, -- Easing style
	Enum.EasingDirection.Out -- Easing direction
)

-- Tween info for hiding the PetInfo (shrinking size)
local hideTweenInfo = TweenInfo.new(
	0.2, -- Duration
	Enum.EasingStyle.Quad, -- Easing style
	Enum.EasingDirection.In -- Easing direction
)

-- Define tween goals
local showGoal = { Size = UDim2.new(.9, 0, .9, 0), Position = UDim2.new(0.05, 0, 0.05, 0) }
local hideGoal = { Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0) }

-- Function to connect a zone to its GUI
local function setupZone(zoneName)
	local zoneFolder = workspace.GrandePrairie:FindFirstChild(zoneName)
	if not zoneFolder then return end

	local eggActivatePart = zoneFolder:FindFirstChild("EggActivate")
	if not eggActivatePart then return end

	local myZone = ZoneMod.new(eggActivatePart)
	local petInfo = eggGUIs:FindFirstChild(zoneName .. "GUI") and eggGUIs[zoneName .. "GUI"]:FindFirstChild("PetInfo")
	if not petInfo then return end

	-- Create tweens for the current GUI
	local showTween = TweenService:Create(petInfo, showTweenInfo, showGoal)
	local hideTween = TweenService:Create(petInfo, hideTweenInfo, hideGoal)

	-- Connect zone events
	myZone.localPlayerEntered:Connect(function()
		if not debounceTable[zoneName] or os.clock() - debounceTable[zoneName] > debounceTime then
			debounceTable[zoneName] = os.clock()
			petInfo.Visible = true
			showTween:Play()
		end
	end)

	myZone.localPlayerExited:Connect(function()
		hideTween:Play()
		hideTween.Completed:Wait()
		petInfo.Visible = false
	end)
end

-- Set up all zones
local zoneNames = { "Classic", "Cattle", "Bacon", "Winter", "SkiBeeDi", "Platypus", "Crustatean", "Bunny", "Gubby", "Slimebidi"}
for _, zoneName in ipairs(zoneNames) do
	setupZone(zoneName)
end
