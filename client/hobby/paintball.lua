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



--table.insert(t, 1, checkpoint)

local roundsLeft = 0
local markerList = {}
local localPlayer = getLocalPlayer()

function startPaintball(rounds)
	roundsLeft = rounds or 3
	playSoundFight()
	addEventHandler("onClientPlayerWeaponFire", getRootElement(), paintballFire)
	addEventHandler("onClientPlayerDamage", getRootElement(), paintballDamage)
end

function stopPaintball()
	roundsLeft = 3
	removeEventHandler("onClientPlayerWeaponFire", getRootElement(), paintballFire)
	removeEventHandler("onClientPlayerDamage", getRootElement(), paintballDamage)
end

function paintballFire(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
	local marker = createMarker(hitX, hitY, hitZ+0.15, "corona", 0.2, 255, 255, 0, 100)
	setElementInterior(marker, 1)
	table.insert(markerList, 1, marker)
	if hitElement then
		if getElementType(hitElement) == "player" then
			attachElements(marker, hitElement)	
		end
	end	
	
	if markerList[33] then
		destroyElement(markerList[33])
		markerList[33] = nil
	end
end

function paintballDamage(attacker, weapon, bodypart , loss)
	if source == localPlayer then
		cancelEvent()		
		local health = getElementHealth(localPlayer)
		local newHealth = newHeath - 5
		
		if newHealth < 1 then
			setElementHealth(localPlayer, 100)
			outputChatBox("#1E90FFDu bist gestorben.  Noch "..roundsLeft.." Runden Spielzeit", 0, 0, 0, true)
			rpcCallServerFunction("restartPaintballRound")
			roundsLeft = roundsLeft - 1
		end
		
		if roundsLeft == 0 then
			outputChatBox("#1E90FFDu bist gestorben.  Deine Spielzeit ist abgelaufen", 0, 0, 0, true)
			rpcCallServerFunction("endPaintballRound")
			stopPaintball()
		end
	end
end

function playSoundFight()
	local sound = playSound("http://trn.werni-host.de/mtarl/fight.mp3")
	setSoundVolume(sound, 0.5)
end
