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



rpcRegisterGlobalFunction("restartPaintballRound")
rpcRegisterGlobalFunction("endPaintballRound")

local paintballMarker

function initPaintball()
	local object = createObject(974, 952.34033203125, 2160.9506835938, 1012.8011474609, 0, 0, 270.17660522461)
	setElementInterior(object, 1)
	
	--Ausgebaut solange es nicht funktioniert :(
	paintballMarker = createMarker(953.40234375, 2164.181640625, 1010.0234375, "cylinder", 2, 255, 115, 0, 155, getRootElement())
	setElementInterior(paintballMarker, 1)
	addEventHandler("onMarkerHit", paintballMarker, onPaintballMarkerHit)
end
addEventHandler('onResourceStart', getResourceRootElement(), initPaintball)

function onPaintballMarkerHit(element, hitDimension)
	if hitDimension then
		if getElementType(element) == "player" then
			if not isPlayerActiveInAnyJob(element) then
				takePlayerMoney(element, 250)
				giveStaatsKasse(250)
				
				outputChatBox(g_colors["yellow"].."Willkommen in der Paintballhalle! Du hast 250$ f"..uuml.."r 3 Runden gezahlt.", element, 0, 0, 0, true)
				
				local x, y, z = getRandomPaintballSpawn()
				setElementPosition(element, x, y, z)
				
				giveWeapon(element, 31, 9000, true)
				
				rpcCallClientFunction(element, "startPaintball", 3)
			end
		end
	end
end

function getRandomPaintballSpawn()
	local spawn = {}
	spawn[1] = {949.9208984375, 2161.2998046875, 1011.0234375}
	spawn[2] = {933.5390625, 2144.47265625, 1011.0234375}
	spawn[3] = {948.6240234375, 2144.458984375, 1011.0227661133}
	spawn[4] = {954.3203125, 2127.005859375, 1011.0234375}
	spawn[5] = {935.70703125, 2107.82421875, 1011.0234375}
	spawn[6] = {959.7392578125, 2099.8857421875, 1011.0252075195}
	
	local number = math.random(1, 6)
	return spawn[number][1], spawn[number][2], spawn[number][3]
end

function restartPaintballRound()
	local x, y, z = getRandomPaintballSpawn()
	setElementPosition(client, x, y, z)
	giveWeapon(client, 31, 9000, true)	
end

function endPaintballRound()
	setElementPosition(client, 953.8818359375, 2169.62109375, 1011.0234375)
	takeWeapon(client, 31)
end
