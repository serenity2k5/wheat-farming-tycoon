local ReplicatedStorage = game:GetService("ReplicatedStorage")
local teleportEvent = ReplicatedStorage:WaitForChild("Teleport")
local plots = workspace.Plots

teleportEvent.OnServerEvent:Connect(function(player, target)
	local cFrame
	
	for _, plot in plots:GetChildren() do
		if plot:GetAttribute("Owner") == player.Name then
			if target == "Earth" then
				cFrame = plot.Items.Rocket.EarthTele
			elseif target == "Moon" then
				cFrame = plot.Items.Rocket.MoonTele
			elseif target == "Mars" then
				cFrame = plot.Items.Rocket.MarsTele
			elseif target == "PlanetIsland" then
				cFrame = plot.Items.Rocket.PlanetIslandTele
			end
		end
	end
	
	local character = player.Character
	if character and character:FindFirstChild("HumanoidRootPart") then
		character.HumanoidRootPart.CFrame = cFrame.CFrame
	end
end)