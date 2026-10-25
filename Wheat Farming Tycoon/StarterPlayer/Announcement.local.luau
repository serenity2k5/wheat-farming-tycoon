-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = ReplicatedStorage:WaitForChild("GlobalAnnouncement")
local TextChatService = game:GetService("TextChatService")
local Channel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXSystem")

-- Function to format and display messages
local function DisplayMessage(data)
	local formattedMessage = '<font color="#'..data.Color..'"><font size="17"><font face="FredokaOne">'..data.Text..'</font></font></font>'
	Channel:DisplaySystemMessage(formattedMessage)
end

-- Listen for server announcements
RemoteEvent.OnClientEvent:Connect(function(data)
	DisplayMessage(data)
end)