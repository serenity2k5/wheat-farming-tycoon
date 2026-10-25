local Lighting = game:GetService("Lighting")
local mapValue = script:WaitForChild("Map")
local RS = game:GetService("ReplicatedStorage")
local skies = Lighting.Skies

local function onMapValueChanged(newValue)
	if newValue == 1 then
		Lighting.Sky:Destroy()
		
		local newSky = skies.Earth:Clone()
		newSky.Name = "Sky"
		newSky.Parent = Lighting
		Lighting.ClockTime = 12
		
		workspace.Gravity = 196.2
		
	elseif newValue == 2 then
		Lighting.Sky:Destroy()

		local newSky = skies.Moon:Clone()
		newSky.Name = "Sky"
		newSky.Parent = Lighting
		
		Lighting.ClockTime = 12
		
		workspace.Gravity = 32.4
		
	elseif newValue == 3 then
		Lighting.Sky:Destroy()

		local newSky = skies.Mars:Clone()
		newSky.Name = "Sky"
		newSky.Parent = Lighting

		Lighting.ClockTime = 12

		workspace.Gravity = 74.22
		
	else
		print("Unknown Map")
	end
end

mapValue:GetPropertyChangedSignal("Value"):Connect(function()
	onMapValueChanged(mapValue.Value)
end)

onMapValueChanged(mapValue.Value)

RS.ChangeSkybox.OnClientEvent:Connect(function(mapVal)
	script.Map.Value = mapVal
end)