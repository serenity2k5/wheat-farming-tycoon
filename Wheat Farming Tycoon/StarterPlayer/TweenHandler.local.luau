local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

ReplicatedStorage.TweenIrrigation.OnClientEvent:Connect(function(partA, partB, primaryPart)
	-- Function to create a tween that moves the PrimaryPart without changing its rotation
	local tweenInfo = TweenInfo.new(5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
	
	local function createTween(targetPosition)
		return TweenService:Create(primaryPart, tweenInfo, {CFrame = CFrame.new(targetPosition)})
	end

	-- Looping tween between PartA and PartB
	local function irrigationLoop()
		while true do

			local tweenToB = createTween(partB.Position)
			local tweenToA = createTween(partA.Position)

			tweenToB:Play()
			tweenToB.Completed:Wait()  -- Wait until it reaches PartB

			tweenToA:Play()
			tweenToA.Completed:Wait()  -- Wait until it returns to PartA
		end
	end
	
	irrigationLoop()
end)