--[[
	@author TwinPlayzDev_YT
	@since 2/15/2021
	This script will give the player AFK Overhead GUI When they Tab Out.
--]]


--[ LOCALS ]--

local AFKStatus = {}
local AFKEvent = game.ReplicatedStorage:FindFirstChild("AFK")

--[ FUNCTIONS ]--

if not AFKEvent then
	AFKEvent = Instance.new("RemoteEvent")
	AFKEvent.Parent = game.ReplicatedStorage
	AFKEvent.Name = "AFK"
end

local updateAFK = function(player,enable)
	
	local GUI = player.Character:WaitForChild("Head"):WaitForChild("AFKTag")
	local Main = player.Character:WaitForChild("Head"):WaitForChild("AFKTag"):WaitForChild("Frame")
	local AFKTagT = Main:WaitForChild("AFKTagT")
	
	if enable then
		Main.Visible = true
		AFKTagT.Text = "~AFK~"
		AFKTagT.TextTransparency = 0
		AFKTagT.TextStrokeTransparency = 0.8
		AFKTagT.Visible = true
	else
		Main.Visible = false
		AFKTagT.Text = ""
		AFKTagT.TextTransparency = 1
		AFKTagT.TextStrokeTransparency = 1
		AFKTagT.Visible = false
	end
end


AFKEvent.OnServerEvent:Connect(function(player,enable)
	AFKStatus[player] = enable
	updateAFK(player,enable)
end)

