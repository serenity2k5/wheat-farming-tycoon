-- Services
local MessagingService = game:GetService("MessagingService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = ReplicatedStorage.GlobalAnnouncement

local ServerId = game.JobId -- Unique ID for each server

-- Function to send a global announcement
local function SendGlobalAnnouncement(text, color, font)
	-- Broadcast to all servers
	local success, err = pcall(function()
		MessagingService:PublishAsync("GlobalAnnouncement", {
			Text = text,
			Color = color:ToHex(),
			ServerId = ServerId -- Include the originating server's ID
		})
	end)

	if not success then
		warn("Failed to publish global announcement: " .. err)
	end

	-- Send to local clients directly
	RemoteEvent:FireAllClients({
		Text = text,
		Color = color:ToHex()
	})
end

-- Listen for cross-server announcements
MessagingService:SubscribeAsync("GlobalAnnouncement", function(message)
	local data = message.Data

	-- Ignore announcements originating from this server
	if data.ServerId == ServerId then
		return
	end

	-- Send to local clients
	RemoteEvent:FireAllClients({
		Text = data.Text,
		Color = data.Color
	})
end)

-- Public function for triggering announcements
local GlobalAnnouncement = {}
function GlobalAnnouncement.New(text, color, font)
	SendGlobalAnnouncement(text, color, font)
end

return GlobalAnnouncement
