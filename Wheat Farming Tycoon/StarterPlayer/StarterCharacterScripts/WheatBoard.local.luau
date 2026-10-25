local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ZoneMod = require(ReplicatedStorage.Modules.Zone)

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local wheatBuyer = workspace.GrandePrairie.WheatBoard.WheatBuyer
local area = workspace.GrandePrairie.WheatBoard:WaitForChild("Area")
local myZone = ZoneMod.new(area)
local originalCFrame = wheatBuyer:WaitForChild("HumanoidRootPart").CFrame

local overlapParams = OverlapParams.new()
overlapParams.FilterType = Enum.RaycastFilterType.Include
overlapParams.FilterDescendantsInstances = {character}

local TweenService = game:GetService("TweenService")
local wheatBoardGui = player.PlayerGui.GPGuis:WaitForChild("WheatBoardGUI")
local bgFrame = wheatBoardGui.Inbg
local frame = bgFrame.BG
local title = bgFrame.Title

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

local wheatBuyerInfo = TweenInfo.new(
	0.4, -- Duration
	Enum.EasingStyle.Quad, -- Easing style
	Enum.EasingDirection.Out -- Easing direction
)


-- Define tween goals
local showGoal = { Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0)}
local hideGoal = { Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0, 0, 1, 0)}

local frameGoal = { Size = UDim2.new(.5, 0, 0.95, 0), Transparency = 0}
local frameHideGoal = { Size = UDim2.new(0, 0, 0.95, 0), Transparency = 1}

local titleGoal = { Position = UDim2.new(0.275,  0, 0.28, 0), TextTransparency = 0}
local titleHideGoal = { Position = UDim2.new(0.325,  0, 0.28, 0), TextTransparency = 1}

-- Create tweens
local showTween = TweenService:Create(bgFrame, showTweenInfo, showGoal)
local hideTween = TweenService:Create(bgFrame, hideTweenInfo, hideGoal)

local showFrameTween = TweenService:Create(frame, showTweenInfo, frameGoal)
local hideFrameTween = TweenService:Create(frame, hideTweenInfo, frameHideGoal)

local showTitleTween = TweenService:Create(title, showTweenInfo, titleGoal)
local hideTitleTween = TweenService:Create(title, hideTweenInfo, titleHideGoal)

local titleHideGoal = { Position = UDim2.new(0.325,  0, 0.28, 0), TextTransparency = 1}

-- Control Variables
local isPlayerInZone = false
local pivotUpdateInterval = 0.01
local lastUpdateTime = 0

RunService.Heartbeat:Connect(function(deltaTime)
	lastUpdateTime = lastUpdateTime + deltaTime

	if lastUpdateTime >= pivotUpdateInterval then
		lastUpdateTime = 0

		if isPlayerInZone then
			-- Face the player
			local playerPosition = character:GetPrimaryPartCFrame().Position
			local buyerPosition = wheatBuyer.PrimaryPart.Position
			local direction = (playerPosition - buyerPosition).Unit
			local targetCFrame = CFrame.new(buyerPosition, buyerPosition + direction)
			wheatBuyer:PivotTo(wheatBuyer:GetPivot():Lerp(targetCFrame, 0.1))
		else
			-- Smoothly return to original orientation
			local currentCFrame = wheatBuyer.PrimaryPart.CFrame
			local lerpedCFrame = currentCFrame:Lerp(originalCFrame, 0.1) -- Adjust 0.1 for speed
			wheatBuyer:PivotTo(lerpedCFrame)
		end
	end
end)

myZone.localPlayerEntered:Connect(function(plr: Player)
	isPlayerInZone = true
	showTween:Play()
	showTween.Completed:Wait()
	showFrameTween:Play()
	showTitleTween:Play()
end)

myZone.localPlayerExited:Connect(function(plr: Player)
	isPlayerInZone = false
	
	hideTween:Play()
	hideTween.Completed:Wait()
	hideFrameTween:Play()
	hideTitleTween:Play()
	hideFrameTween.Completed:Wait()
end)