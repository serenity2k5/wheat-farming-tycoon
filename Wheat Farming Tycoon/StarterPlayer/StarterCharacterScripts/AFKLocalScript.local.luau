--[[
	@author TwinPlayzDev_YT
	@since 2/15/2021
	This script will give the player AFK Overhead GUI When they Tab Out.
--]]

--[ LOCALS ]--

local ReplicatedStorageEvent = game.ReplicatedStorage:WaitForChild("AFK")

--[ FUNCTIONS ]--

game:GetService("UserInputService").WindowFocusReleased:Connect(function() -- tab in
	ReplicatedStorageEvent:FireServer(true)
end)

game:GetService("UserInputService").WindowFocused:Connect(function() -- tab out
	ReplicatedStorageEvent:FireServer(false)
end)


