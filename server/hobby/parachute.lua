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



function initParachute()
	outputDebug("parachute.lua start...")
	--startResource("parachute")
	parachuteMarker = createMarker(-1749.6572265625, 902.20703125, 25.0859375-1, "cylinder", 1.5, 255, 115, 0, 155, getRootElement())
	addEventHandler("onMarkerHit", parachuteMarker, onParachuteMarkerHit)
end
addEventHandler('onResourceStart', getResourceRootElement(), initParachute)

function onParachuteMarkerHit(playerSource)
	if getElementType(playerSource) == "player" then
		if not isPlayerActiveInAnyJob(playerSource) then
			takePlayerMoney(playerSource, 100)
			giveStaatsKasse(100)
				
			outputChatBox(g_colors["yellow"].."Willkommen bei Parachute! Sie hast 100$ für 1x Springen bezahlt.", playerSource, 0, 0, 0, true)
			
			setElementPosition(playerSource, -1753.58203125, 884.8779296875, 295.875)
			setPedRotation(playerSource, 2.7218933105469)
			giveWeapon(playerSource, 46, 1, true)
		end
	end
end
