local scythes = {
	-- Buyable Scythes

	-- BASIC
	["Rusty Scythe"] = {10, 0, 0, 20, "A simple tool for simple tasks.", 100, 113444397759678},
	["Flint Scythe"] = {20, 1, 0, 250, "Primitive but surprisingly efficient.", 99, 84723672603076},
	["Stone Scythe"] = {30, 1, 0, 500, "Cavemen made good wheat farmers.", 98, 80181058693956},
	["Bronze Scythe"] = {40, 1, 0, 1000, "The dawn of metalworking revolutionized wheat farming.", 97, 117459941570958},
	["Copper Scythe"] = {50, 1, 0, 2500, "Shiny, reliable and efficient. The fields will shine!", 96, 103379584216135},
	["Iron Scythe"] = {60, 1, 0, 5000, "The workhorse of any wheat farm.", 95, 129596939469171},
	["Steel Scythe"] = {70, 1, 0, 10000, "A blade sharp enough for the busy harvest.", 94, 105460660896834},
	["Silver Scythe"] = {80, 1, 0, 25000, "A refined tool for high-class wheat farmers.", 93, 106347106418355},
	["Golden Scythe"] = {90, 1, 0, 50000, "For wheat farmers that slay.", 92, 94025466483886},
	["Diamond Scythe"] = {100, 2, 0, 100000, "Sharp, unbreakable, and unmatched.", 91, 112543193268565},

	-- REBIRTH SCYTHES
	["Enchanted Scythe"] = {110, 3, 1, 250000, "The spirits of the harvest grow this blade.", 90, 77001833955798},
	["Shadow Scythe"] = {120, 4, 2, 500000, "Harvests in silence, but leave no stalk untouched.", 89, 102673662801638},
	["Lunar Scythe"] = {130, 5, 3, 750000, "The moonlight empowers the wheat farm.", 88, 125106591658049},
	["Plasma Scythe"] = {140, 6, 4, 1000000, "Straight out of tomorrow's farms.", 87, 129315544447966},
	["Solar Scythe"] = {150, 7, 5, 1250000, "Its blade gleams brighter than the sun.", 86, 127648736345801},
	["Cosmic Scythe"] = {160, 8, 6, 1500000, "Harvest among the stars and reap celestial rewards.", 85, 85899100220863},
	
	["Mythril Scythe"] = {170, 9, 7, 1750000, "Its legendary alloy ensures a flawless harvest.", 84, 92192485726373},
	["Phoenix Scythe"] = {180, 10, 8, 2000000, "Its flames bring fields back to life.", 83, 79009926278505},
	["Celestial Scythe"] = {190, 11, 9, 2500000, "Blessed by the heavens, its power knows no bounds.", 82, 128048489346971},
	["Abyssal Scythe"] = {200, 12, 10, 2750000, "Forged in darkness, wielded by the brave.", 81, 87501126970945},
	["Eternal Scythe"] = {230, 13, 11, 3000000, "Forever etched in the history of wheat farming.", 80, 123356590542051},
	["Harvest Scythe of Titans"] = {250, 14, 12, 3250000, "A tool of legends, used by the higher powers of the harvest.", 79, 136663064551037},
	["Prismatic Scythe"] = {400, 15, 13, 3500000, "Its kaleidoscope blade turns wheat into gold.", 78, 82662874039889},
	["Infinity Scythe"] = {650, 16, 14, 5000000, "The scythe to end all scythes.", 77, 75143969085359},
	["Apocalypse Scythe"] = {900, 17, 15, 10000000, "The end of all fields, or the beginning of infinite harvests.", 76, 127909597647577},

	---- SPECIAL REBIRTH SCYTHES
	["Sunset Beach Scythe"] = {1900, 20, 20, 15000000, "The sunset shines so bright the ocean looks like it has a white armor.", 75, 87548134324527},
	["Back 2 Life Scythe"] = {2400, 25, 25, 25000000, "This scythe thrives and destroys crops outside the digital screen.", 74, 96526453312824},
	["Echo Scythe"] = {2900, 30, 30, 50000000, "The sounds of the scythe echo throughout the thousands of nights.", 73, 136631823423730},
	["Icedancer Scythe"] = {4900, 50, 40, 100000000, "The iciest blade.", 72, 109165070020392},
}


return scythes


--[[
Scythe Structure is as follows:
1: + Wheat Harvest Speed
2: + Wheat Harvest Output
3: Rebirth Requirement
4: Price
5: Description
6: ZIndex
7: Image ID
]]