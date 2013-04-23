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



local status = 0
local doormarker = {}

function initalizeClub()
	doormarker[1] = createMarker(493.39, -24.92, 999.69+2, "arrow", 1.5, 100, 100, 150, 155, getRootElement())
	doormarker[2] = createMarker(1836.9, -1681.75, 12.3635+2, "arrow", 1.5, 100, 100, 150, 155, getRootElement())
	setElementInterior(doormarker[1], 17)
end
addEventHandler('onResourceStart', getResourceRootElement(), initalizeClub)

function toggleClub(playerSource, commandName)
	if g_playerstat[playerSource]["Level"] == "Admin" then
		if status == 0 then
			status = 1
			outputChatBox(g_colors["red"].."Der Club wurde ge"..ouml.."ffnet!", playerSource, 0, 0, 0, true)
		else
			status = 0
			outputChatBox(g_colors["red"].."Der Club wurde geschlossen!", playerSource, 0, 0, 0, true)
		end
	end
end	
addCommandHandler("openclub", toggleClub)
addCommandHandler("closeclub", toggleClub)

function onClubMarkerHit(playerSource)
	if getElementType(playerSource) == "player" then
		if source == doormarker[2] then
			if status == 1 then
				setElementInterior (playerSource, 17)
				setElementPosition (playerSource, 493.3896484375, -21.919921875, 1000.6796875)
				setElementRotation (playerSource, 0, 0, 0)
				takeAllWeapons(playerSource)
				outputChatBox(g_colors["red"].."Willkommen im Club! Eintritt: 50$", playerSource, 0, 0, 0, true)
				giveStaatsKasse(50)
				takePlayerMoney(playerSource, 50)
			else
				outputChatBox(g_colors["red"].."Der Club hat derzeit geschlossen!", playerSource, 0, 0, 0, true)
			end
		elseif source == doormarker[1] then
			setElementInterior (playerSource, 0)
			setElementPosition (playerSource, 1833.8994140625, -1681.75, 13.454011917114)
			setElementRotation (playerSource, 0, 0, 90)
		end
	end
end
addEventHandler("onMarkerHit", getRootElement(), onClubMarkerHit)
