local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BadgeService = game:GetService("BadgeService")

ReplicatedStorage.BadgeGet.OnServerEvent:Connect(function(player, badgeId)
	BadgeService:AwardBadge(player.UserId, badgeId)
end)