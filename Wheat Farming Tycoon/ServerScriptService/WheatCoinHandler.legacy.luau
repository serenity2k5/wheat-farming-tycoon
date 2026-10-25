local ts = game:GetService("TweenService")
local tInfo = TweenInfo.new(2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
script.WheatCoinPrice.Changed:Connect(function()
	workspace.GrandePrairie.GPTechComputers.WTCRate.PriceBlock.SurfaceGui.SIGN.Text = "$" .. script.WheatCoinPrice.Value
end)

while true do
	local priceOfCoin = math.random(25,200)
	
	task.wait(14)
	
	ts:Create(script.WheatCoinPrice,tInfo,{Value = priceOfCoin}):Play()
	
	task.wait(1)
end
