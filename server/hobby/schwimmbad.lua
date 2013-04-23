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



--1958.7489013672 [number], -1454.8581542969 [number], 13.549285888672 [number] EINGANG
--1959.2056884766 [number], -1446.0635986328 [number], 13.499690055847 [number] AUSGANG

local function onSchwimmbadEnter(playerSource)
	if getElementType(playerSource) == "player" then
		if not getPedOccupiedVehicle(playerSource) then
			setElementPosition(playerSource, 1964.2056884766, -1446.0635986328, 13.499690055847)
			outputChatBox(g_colors["yellow"].."Der Eintritt kostet dich 20$!", playerSource, 0, 0, 0, true)
			takePlayerMoney(playerSource, 20)
			giveStaatsKasse(20)
		end
	end
end

local function onSchwimmbadExit(playerSource)
	if getElementType(playerSource) == "player" then
		setElementPosition(playerSource, 1955.7489013672, -1454.8581542969, 13.549285888672)
	end
end

local function onSchwimmbadInit()
	outputDebug("schwimmbad.lua start...")
	local markerEntrance = createMarker(1953.1611328125, -1453.067382812, 12.549285888672, "cylinder", 2, 20, 25, 200, 155)
	addEventHandler("onMarkerHit", markerEntrance, onSchwimmbadEnter)
	local markerExit = createMarker(1953.427734375, -1446.8857421875, 12.499690055847, "cylinder", 2, 20, 25, 200, 155)
	addEventHandler("onMarkerHit", markerExit, onSchwimmbadExit)
end
addEventHandler("onResourceStart", getResourceRootElement(), onSchwimmbadInit)
