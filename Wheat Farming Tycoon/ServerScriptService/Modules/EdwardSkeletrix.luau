local SkeletrixIsland = {}

local YoBroWillDoItToYouForABand = {}

function SkeletrixIsland.MuseumMusic(BlurryPicture, Fun)
	local DemonsOnTwitterWontFollowMeBack = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
	local zo6GETOUt = ""

	for i = 1, Fun do
		local HubertSkeletrix = math.random(1, #DemonsOnTwitterWontFollowMeBack)
		zo6GETOUt = zo6GETOUt .. string.sub(DemonsOnTwitterWontFollowMeBack, HubertSkeletrix, HubertSkeletrix)
	end

	YoBroWillDoItToYouForABand[tostring(BlurryPicture.UserId)] = zo6GETOUt

	return zo6GETOUt
end

function SkeletrixIsland.SkeletrixLanguage(id, TypicalRapSong1)
	local MakingArtForMoney = YoBroWillDoItToYouForABand[tostring(id)]

	if MakingArtForMoney == TypicalRapSong1 then
		return "LifesSoFunnyFeato0o"
	else
		return "JunyaJunya"
	end
end

return SkeletrixIsland
