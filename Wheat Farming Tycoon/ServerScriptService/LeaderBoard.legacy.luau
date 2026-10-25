local DataStore = game:GetService("DataStoreService")

local numFormat = require(game.ReplicatedStorage.Modules.NumFormat)
local formatter = numFormat.new()

local RebirthLB = DataStore:GetOrderedDataStore("RebirthLeaderboard")
local leaderboardRebirth = game.Workspace.LeaderboardRebirth

local CashLB = DataStore:GetOrderedDataStore("CashLeaderboard")
local leaderboardCash = game.Workspace.LeaderboardCash

local WheatCoinLB = DataStore:GetOrderedDataStore("WheatCoinLeaderboard")
local leaderboardWheatCoin = game.Workspace.LeaderboardWheatCoin

local function updateLeaderboard(dataStore, leaderboardGui, statName)
	local success, errorMessage = pcall(function()
		local data = dataStore:GetSortedAsync(false, 50)
		local page = data:GetCurrentPage()

		for _, frame in pairs(leaderboardGui.SurfaceGui.Holder:GetChildren()) do
			if frame:IsA("Frame") then
				frame:Destroy()
			end
		end

		for rank, entry in ipairs(page) do
			local userName = game.Players:GetNameFromUserIdAsync(tonumber(entry.key))
			local userId = game.Players:GetUserIdFromNameAsync(userName)
			local statValue = entry.value

			if statValue then
				local NewLBFrame = game.ReplicatedStorage:WaitForChild("LeaderboardFrame"):Clone()

				NewLBFrame.Player.Text = userName
				NewLBFrame.Player.avatar.Image = game.Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
				NewLBFrame.Stat.Text = formatter:Format(statValue)
				NewLBFrame.Rank.Text = "#" .. rank

				if rank == 1 then
					NewLBFrame.Player.TextStrokeColor3 = Color3.new(1, 0.705882, 0.227451)
					NewLBFrame.Stat.TextStrokeColor3 = Color3.new(1, 0.705882, 0.227451)
					NewLBFrame.Rank.TextStrokeColor3 = Color3.new(1, 0.705882, 0.227451)
				elseif rank == 2 then
					NewLBFrame.Player.TextStrokeColor3 = Color3.new(0.721294, 0.721279, 0.721279)
					NewLBFrame.Stat.TextStrokeColor3 = Color3.new(0.721294, 0.721279, 0.721279)
					NewLBFrame.Rank.TextStrokeColor3 = Color3.new(0.721294, 0.721279, 0.721279)
				elseif rank == 3 then
					NewLBFrame.Player.TextStrokeColor3 = Color3.new(0.736507, 0.487678, 0.259174)
					NewLBFrame.Stat.TextStrokeColor3 = Color3.new(0.736507, 0.487678, 0.259174)
					NewLBFrame.Rank.TextStrokeColor3 = Color3.new(0.736507, 0.487678, 0.259174)
				end

				NewLBFrame.Parent = leaderboardGui.SurfaceGui.Holder
			end
		end
	end)

	if not success then
		print(errorMessage)
	end
end

local function updateLeaderboards()
	updateLeaderboard(RebirthLB, leaderboardRebirth, "Rebirth")
	updateLeaderboard(CashLB, leaderboardCash, "Cash")
	updateLeaderboard(WheatCoinLB, leaderboardWheatCoin, "WheatCoin")
end

while true do
	for _, player in pairs(game.Players:GetPlayers()) do
		local rebirthStat = player.leaderstats.Rebirth
		local cashStat = player.leaderstats.Cash
		local wheatCoinStat = player.leaderstats.WheatCoin

		local wheatCoinValue = wheatCoinStat.Value
		if type(wheatCoinValue) == "number" then
			wheatCoinValue = math.floor(wheatCoinValue)
		end

		-- Store the values in DataStores
		RebirthLB:SetAsync(player.UserId, rebirthStat.Value)
		CashLB:SetAsync(player.UserId, cashStat.Value)
		WheatCoinLB:SetAsync(player.UserId, wheatCoinValue)
	end

	updateLeaderboards()
	task.wait(60)
end
