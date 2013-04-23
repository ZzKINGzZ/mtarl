--Copyright 2008-2013 Einstein & Werni
--
--Diese Datei ist Bestandteil von mtarl.
--
--mtarl ist freie Software:
--Sie können weiterverteilen und/oder modifizieren unter den Bedingungen
--der GNU General Public License, wie von der Free Software Foundation,
--entweder gemäß Version 3 der Lizenz oder (nach Ihrer Option) jeder
--späteren Version veröffentlicht.
--
--mtarl wird verteilt, in der Hoffnung, dass es nützlich sein wird, aber
--ohne jede Garantie; ohne selbst der stillschweigenden Garantie der
--Marktgängigkeit oder Eignung für einen bestimmten Zweck. Finden Sie unter
--der GNU General Public License für weitere Details.
--
--Eine Kopie der GNU General Public License finden Sie unter: http://www.gnu.org/licenses/gpl.txt



--The Submarines - You, Me and the Bourgeoisie

local theSong = nil
local checkPlayerPos = 0

local creditPositions = {}

local textcol = tocolor(135, 206, 250, 255)
local textshadow = tocolor(255, 255, 255, 255)

creditPositions[1] = {}
creditPositions[1]["posX"] =  1451.5622558594
creditPositions[1]["posY"] =  -1409.8314208984
creditPositions[1]["posZ"] =  13.3828125
creditPositions[1]["text"] =  "MTA:RL 2008-2011"

creditPositions[2] = {}
creditPositions[2]["posX"] =  1451.5622558594
creditPositions[2]["posY"] =  -1397.8314208984
creditPositions[2]["posZ"] =  13.3828125
creditPositions[2]["text"] =  "Idee:
Einstein"

creditPositions[3] = {}
creditPositions[3]["posX"] =  1451.5622558594
creditPositions[3]["posY"] =  -1380.8314208984
creditPositions[3]["posZ"] =  13.3828125
creditPositions[3]["text"] =  "Scripting:
Einstein
Werni"

creditPositions[4] = {}
creditPositions[4]["posX"] =  1451.5622558594
creditPositions[4]["posY"] =  -1370.8314208984
creditPositions[4]["posZ"] =  13.3828125
creditPositions[4]["text"] =  "Map Design:
Werni
Einstein
Cocakiller"

creditPositions[5] = {}
creditPositions[5]["posX"] =  1451.5622558594
creditPositions[5]["posY"] =  -1350.8314208984
creditPositions[5]["posZ"] =  13.3828125
creditPositions[5]["text"] =  "Grafik:
Evj
Werni
Einstein"

creditPositions[6] = {}
creditPositions[6]["posX"] =  1441.6939697266
creditPositions[6]["posY"] =  -1326.4133300781
creditPositions[6]["posZ"] =  13.545638084412
creditPositions[6]["text"] =  "Mitwirkende:
arc_
Fetzi
DMA"

-- 1449.0963134766 [number], -1307.0572509766 [number], 19.482162475586

creditPositions[7] = {}
creditPositions[7]["posX"] =  1449.0963134766
creditPositions[7]["posY"] =  -1307.0572509766
creditPositions[7]["posZ"] =  17.482162475586
creditPositions[7]["text"] =  "Besonderen Dank an:
arc_
Sebihunter"


local function creditsClientRender()
	local curPos = getSoundPosition(theSong)
	
	--checkPlayerPos = checkPlayerPos + 1
	--if checkPlayerPos == 5 then
		checkPlayerPos = 0
		
		local posX, posY, posZ = getElementPosition(localPlayer)
		for i = #creditPositions, 1, -1 do
			local dist = getDistanceBetweenPoints3D(posX, posY, posZ, creditPositions[i]["posX"], creditPositions[i]["posY"], creditPositions[i]["posZ"])
				if dist < 15 and dist > 0 then
					--[[if dist < 16 and dist > 14 then
						dxDrawText(creditPositions[i]["text"], x + 1, y, 0, 0, textshadow, (15 - dist) / 3)
						dxDrawText(creditPositions[i]["text"], x - 1, y, 0, 0, textshadow, (15 - dist) / 3)
						dxDrawText(creditPositions[i]["text"], x - 1, y + 1, 0, 0, textshadow, (15 - dist) / 3)
						dxDrawText(creditPositions[i]["text"], x - 1, y - 1, 0, 0, textshadow, (15 - dist) / 3)
					end	--]]
					local x, y = getScreenFromWorldPosition(creditPositions[i]["posX"], creditPositions[i]["posY"], creditPositions[i]["posZ"] + 2, 0, false)
					if x then					
						dxDrawText(creditPositions[i]["text"], x, y, 0, 0, textcol, (15 - dist) / 3)
					end	
				end	
			--end	
		end
	--end
end

--Nicht vergessen, for-schleife r"..uuml.."ckw"..auml.."rts loopen!
function startCredits()
	checkPlayerPos = 0
	setElementPosition(localPlayer, 1447.0762939453, -1471.2956542969, 13.54925918579)
	setPedRotation(localPlayer, 0)
	toggleAllControls(false, true, true)
	setPedAnimation(localPlayer, "ped", "walk_PLAYER", -1, true, true, false, false)
	theSong = playSound("files/temp/TheSubmarinesYouMeandtheBourgeoisie.mp3")
	addEventHandler("onClientRender", root, creditsClientRender)
end

addCommandHandler("testcredits", startCredits)
