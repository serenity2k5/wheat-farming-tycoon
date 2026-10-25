
wait()

--[ LOCALS ]--

local Char = script.Parent
local AFKTag = script:FindFirstChild("AFKTag")

local AFKTagClone = AFKTag:Clone()
AFKTagClone.Parent = Char:FindFirstChild("Head")
AFKTagClone.Adornee = Char:FindFirstChild("Head")

