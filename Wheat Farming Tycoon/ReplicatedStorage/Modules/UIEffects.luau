local Handler = {}

local TweenService = game:GetService("TweenService")

local Camera = game.Workspace:WaitForChild("Camera")
local Lighting = game:WaitForChild("Lighting")
local Blur = Lighting.Blur

local TweenTime = 0.2

function Handler.Toggle(value : boolean)
	if value == true then
		TweenService:Create(Camera, TweenInfo.new(TweenTime), {FieldOfView = 60}):Play()
		TweenService:Create(Blur, TweenInfo.new(TweenTime), {Size = 60}):Play()
	else
		TweenService:Create(Camera, TweenInfo.new(TweenTime), {FieldOfView = 70}):Play()
		TweenService:Create(Blur, TweenInfo.new(TweenTime), {Size = 0}):Play()
	end
end

return Handler
