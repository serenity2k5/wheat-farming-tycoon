local ServerScriptService = game:GetService("ServerScriptService")

local petAttachment = require(script.PetAttachment)
local petEquipping = require(script.PetEquipping)
local petHatching = require(script.PetHatching)
local petManagement = require(script.PetManagement)

petAttachment.init()
petEquipping.init()
petHatching.init()
petManagement.init()
