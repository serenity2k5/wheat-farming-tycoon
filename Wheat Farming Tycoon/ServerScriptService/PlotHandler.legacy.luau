local plots = game.Workspace.Plots
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local TempPlot = ServerStorage.TempPlot

local numFormat = require(ReplicatedStorage.Modules.NumFormat)
local formatter = numFormat.new()

local function getPlot(player)
	for _, plot in plots:GetChildren() do
		local owner = plot:GetAttribute('Owner')
		if not owner then continue end
		if owner ~= player.Name then continue end
		return plot
	end
end

local function teleportPlayerToPlot(player)
	local plot = getPlot(player)
	if plot then
		local teleportPosition = plot.SpawnPart.CFrame.Position
		local character = player.Character
		if character then
			local rootPart = character:FindFirstChild("HumanoidRootPart")
			if rootPart then
				rootPart.CFrame = CFrame.new(teleportPosition)
			end
		end
	end
end

local function rebirthSetup(player)
	
	for _, plot in plots:GetChildren() do
		local sign = plot.Sign.Sign1.SurfaceGui.SIGN
		local sign1 = plot.Sign.Sign.SurfaceGui.SIGN
		if not plot:GetAttribute('Owner') then continue end
		if plot:GetAttribute('Owner') ~= player.Name then continue end

		plot:SetAttribute('Taken', nil)
		plot:SetAttribute('Owner', nil)

		plot.Buttons:Destroy()
		
		player.leaderstats.Cash.Value = 5
		player.leaderstats.Rebirth.Value += 1
		
		local gui = player.PlayerGui
		gui.MenuGUI.Menu.Cash.Text = "$"..player.leaderstats.Cash.Value
		gui.MenuGUI.Menu.WheatCoin.Text = formatter:Format(player.leaderstats.WheatCoin.Value)
		
		print('Plot has been removed to '..player.Name..'!')
		sign.Text = "Nobody's Wheat Farm"
		sign1.Text = "Nobody's Wheat Farm"
		break
	end
end

local function getItemFromTemplatePlot(itemId)
	for _, item in TempPlot.Items:GetChildren() do
		if item:GetAttribute('id') == itemId then
			return item
		end
	end
end

local function getButtonByIdOfItemToUnlock(player, btnId)
	local plot = getPlot(player)
	if not plot then return end
	
	for _, Button in plot.Buttons:GetChildren() do
		local idButtonUnlock = Button:GetAttribute('idUnlock')
		if not idButtonUnlock then continue end
		
		if btnId == idButtonUnlock then 
			return Button 
		end
	end
end

local function loadItems(player, itemIdsTable)
	local plot = getPlot(player)

	for _, itemId in itemIdsTable do
		local item = getItemFromTemplatePlot(itemId)
		if not item then continue end

		local itemClone = item:Clone()
		local itemCFrame

		if itemClone:IsA('Model') then
			itemCFrame = itemClone:GetPivot() -- For Models
		elseif itemClone:IsA('BasePart') then
			itemCFrame = itemClone.CFrame
		end

		local relativeItemCFrame = TempPlot.CFrame:ToObjectSpace(itemCFrame)
		local worldCFrameOfNewPlot = plot.CFrame:ToWorldSpace(relativeItemCFrame)

		if itemClone:IsA('Model') then
			-- Set the new position while maintaining orientation
			itemClone:PivotTo(worldCFrameOfNewPlot * CFrame.Angles(0, 0, 0))
		elseif itemClone:IsA('BasePart') then
			-- Set the new position while maintaining orientation
			itemClone.CFrame = CFrame.new(worldCFrameOfNewPlot.Position) * CFrame.Angles(0, 0, 0)
		end

		itemClone.Parent = plot.Items
	end
end

script:WaitForChild('CreatePlot').Event:Connect(function(player, itemIdsTable, rebirth)	
	local gui = player.PlayerGui
	gui.MenuGUI.Menu.Cash.Text = "$".. formatter:Format(player.leaderstats.Cash.Value)
	gui.MenuGUI.Menu.WheatCoin.Text = formatter:Format(player.leaderstats.WheatCoin.Value)
	
	for _, plot in plots:GetChildren() do
		local sign = plot.Sign.Sign1.SurfaceGui.SIGN
		local sign1 = plot.Sign.Sign.SurfaceGui.SIGN
		
		if rebirth then
			rebirthSetup(player)
		end
		
		if plot:GetAttribute("Taken") then continue end
		
		if plot:FindFirstChild("Items") then
			plot.Items:Destroy()
			print("Deleted items")
		end
		
		plot:SetAttribute('Taken', true)
		plot:SetAttribute('Owner', player.Name)
		
		print('Plot has been given to '..player.Name..'!')
		
		ReplicatedStorage.IsPlotLoaded:FireClient(player)
		
		local itemsFolder = Instance.new('Folder')
		itemsFolder.Name = 'Items'
		itemsFolder.Parent = plot
		
		--load buttons
		local TempButtons = TempPlot.Buttons:Clone()
		local TempItems = TempPlot.Items
		TempButtons.Parent = plot
		
		loadItems(player, itemIdsTable)
		
		for _, Button in TempButtons:GetChildren() do
			if table.find(itemIdsTable, Button:GetAttribute('idUnlock')) then
				continue 
			end
			-- Get the pos of the button relative to the temp plot
			-- How Far away is the button from the centre of the template plot
			local RelativeCFrame = TempPlot.CFrame:ToObjectSpace(Button.PrimaryPart.CFrame)
			Button:SetPrimaryPartCFrame(plot.CFrame:ToWorldSpace(RelativeCFrame))
			
			if Button:GetAttribute('Hidden') then
				for _, part in ipairs(Button:GetDescendants()) do
					if part:IsA("BasePart") then
						part.Transparency = 1
						part.CanCollide = false
					end
				end
				
				Button.Button.BillboardGui.Enabled = false
			end
			
			local MarketplaceService = game:GetService("MarketplaceService")

			Button.PrimaryPart.Touched:Connect(function(hit)
				if Button:GetAttribute('Hidden') then return end

				local player = game.Players:GetPlayerFromCharacter(hit.Parent)
				if not player then return end
				if plot:GetAttribute('Owner') ~= player.Name then return end

				if Button:GetAttribute('Debounce') then return end

				Button:SetAttribute('Debounce', true)

				task.delay(2, function()
					if Button then
						Button:SetAttribute('Debounce', false)
					end
				end)

				local gamepassId = Button:GetAttribute('GamepassId')

				-- If the button has a GamepassId, handle the gamepass logic
				if gamepassId then
					-- Check if the player already owns the gamepass
					if MarketplaceService:UserOwnsGamePassAsync(player.UserId, gamepassId) then
						-- Player already owns the gamepass; destroy the button
						ReplicatedStorage.BuyButton:FireClient(player, true)
						Button:Destroy()
						return
					end

					-- Prompt the player to purchase the gamepass
					MarketplaceService:PromptGamePassPurchase(player, gamepassId)

					-- Listen for the result of the gamepass purchase
					MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(purchasedPlayer, purchasedPassId, wasPurchased)
						if purchasedPlayer == player and purchasedPassId == gamepassId then
							if wasPurchased then
								ReplicatedStorage.BuyButton:FireClient(player, true)
								-- Gamepass was successfully purchased; destroy the button
								Button:Destroy()
							end
						end
					end)

					return -- Skip the cash flow since the gamepass is handled
				end

				-- Regular cash purchase flow
				local itemToUnlock = Button:GetAttribute('idUnlock')
				if not itemToUnlock then warn('Invalid Id Sorry dude lol') return end

				local price = Button:GetAttribute('Price')

				if price then
					if player.leaderstats.Cash.Value < price then
						ReplicatedStorage.BuyButton:FireClient(player, false)
						return
					end

					ReplicatedStorage.BuyButton:FireClient(player, true)
					player.leaderstats.Cash.Value -= price
					gui.MenuGUI.Menu.Cash.Text = "$" .. formatter:Format(player.leaderstats.Cash.Value)
				end

				local idButtonUnlock = Button:GetAttribute('idButtonUnlock')

				if idButtonUnlock then
					local buttonIds = string.split(idButtonUnlock, ',')

					for _, btnId in buttonIds do
						btnId = tonumber(btnId)
						local Button = getButtonByIdOfItemToUnlock(player, btnId)
						if not Button then continue end

						-- Make visible
						for _, part in ipairs(Button:GetDescendants()) do
							if part:IsA("BasePart") then
								part.Transparency = 0
								part.CanCollide = true
							end
						end

						Button:SetAttribute('Hidden', nil)
						Button.Button.BillboardGui.Enabled = true
					end
				end

				for _, item in itemsFolder:GetChildren() do
					if item:GetAttribute('id') == itemToUnlock then continue end
				end

				for _, item in TempItems:GetChildren() do
					if item:GetAttribute('id') ~= itemToUnlock then continue end

					-- Found correct item
					local itemClone = item:Clone()
					local itemCFrame

					if itemClone:IsA('Model') then
						itemCFrame = itemClone:GetPivot()
					elseif itemClone:IsA('BasePart') then
						itemCFrame = itemClone.CFrame
					end

					local relativeItemCFrame = TempPlot.CFrame:ToObjectSpace(itemCFrame)
					local worldCFrameOfNewPlot = plot.CFrame:ToWorldSpace(relativeItemCFrame)

					if itemClone:IsA('Model') then
						itemClone:PivotTo(worldCFrameOfNewPlot * CFrame.Angles(0, 0, 0))
					elseif itemClone:IsA('BasePart') then
						itemClone.CFrame = CFrame.new(worldCFrameOfNewPlot.Position) * CFrame.Angles(0, 0, 0)
					end

					itemClone.Parent = itemsFolder

					Button:Destroy()

					game.ServerScriptService.Data.ItemUnlocked:Fire(player, itemToUnlock)
				end
			end)
			
			Button.Parent = plot.Buttons
		end
		
		TempButtons.Parent = plot
		
		for _, Button in TempButtons:GetChildren() do
			if table.find(itemIdsTable, Button:GetAttribute('idUnlock')) then
			local idButtonUnlock = Button:GetAttribute('idButtonUnlock')

			if idButtonUnlock then
				local buttonIds = string.split(idButtonUnlock, ',')
				-- {2,3,4}

				for _, btnId in buttonIds do
					btnId = tonumber(btnId)
					local Button = getButtonByIdOfItemToUnlock(player, btnId)
					if not Button then continue end
					-- make visible
					for _, part in ipairs(Button:GetDescendants()) do
						if part:IsA("BasePart") then
							part.Transparency = 0
							part.CanCollide = true
						end
					end

					Button:SetAttribute('Hidden', nil)
					Button.Button.BillboardGui.Enabled = true
				end
			end
		end
	end
		
		teleportPlayerToPlot(player)
		sign.Text = player.Name.."'s Wheat Farm"
		sign1.Text = player.Name.."'s Wheat Farm"
		break

	end
end)

game.Players.PlayerRemoving:Connect(function(player)
	for _, plot in plots:GetChildren() do
		local sign = plot.Sign.Sign1.SurfaceGui.SIGN
		local sign1 = plot.Sign.Sign.SurfaceGui.SIGN
		if not plot:GetAttribute('Owner') then continue end
		if plot:GetAttribute('Owner') ~= player.Name then continue end
		
		plot:SetAttribute('Taken', nil)
		plot:SetAttribute('Owner', nil)
		
		plot.Buttons:Destroy()
		for _, child in ipairs(plot.Items:GetChildren()) do
			child:Destroy()
		end
		
		print('Plot has been removed to '..player.Name..'!')
		sign.Text = "Nobody's Wheat Farm"
		sign1.Text = "Nobody's Wheat Farm"
		break
	end
end)