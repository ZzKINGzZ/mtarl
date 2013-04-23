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



local doorMarkerIn
local doorMarkerOut

local function initStreet()
	addJob(102, "18th-Street-Gang", false, 0, 206, 209, false, true)
	
	doorMarkerIn = createMarker(-2636.6904296875, 1402.9248046875, 906.4609375+1, "arrow", 1.5, 0, 206, 209, 155, getRootElement())
	doorMarkerOut = createMarker(-2624.6171875, 1411.146484375, 7.09375+1, "arrow", 1.5, 0, 206, 209, 155, getRootElement())
	setElementInterior(doorMarkerIn, 3)
	
	addJobLocation(102, 1, -2641.4580078125, 1419.224609375, 906.4609375, 3, 0)
	
	addJobRank(102, 1, "Mitglied(114)", 0, false)
	addJobRank(102, 2, "Mitglied(116)", 0, false)
	addJobRank(102, 3, "Boss", 0, true) --Chef
	
	registerJobFunction(102, "onPlayerEnterJob", streetEnterGang)
	registerJobFunction(102, "onPlayerLeaveJob", streetLeaveGang)
end
addEventHandler("onResourceStart", getResourceRootElement(), initStreet)

function onStreetMarkerHit(playerSource)
	if getElementType(playerSource) == "player" then
		if isPlayerEmployedInJob(playerSource, 102) then
			if source == doorMarkerOut then
				setElementInterior (playerSource, 3)
				setElementPosition (playerSource, -2636.6904296875, 1404.9248046875, 906.4609375)
			elseif source == doorMarkerIn then
				setElementInterior (playerSource, 0)
				setElementPosition (playerSource, -2624.6171875, 1408.146484374, 7.09375)
			end
		else
			if source == doorMarkerIn or source == doorMarkerOut then
				sendPlayerInfo(playerSource, "Du bist kein Mitglied der Gang!", true)
			end
		end
	end
end
addEventHandler("onMarkerHit", getRootElement(), onStreetMarkerHit)

function streetEnterGang(playerSource, staticJobID, locationID, playerJobRank)
	if playerJobRank == 1 then
		setElementModel(playerSource, 114)
	elseif playerJobRank == 2 then		
		setElementModel(playerSource, 116)
	elseif playerJobRank == 3 then		
		setElementModel(playerSource, 115)
	end
	
	g_playerstat[playerSource]["Jobblib"] = createBlipAttachedTo(playerSource, 0, 2, 0, 206, 209, 155, 0, 99999, playerSource)
	for i, player in ipairs(getElementsByType("player")) do
		if isPlayerActiveInJob(player, 102) then
			setElementVisibleTo(g_playerstat[playerSource]["Jobblib"], player, true)
			setElementVisibleTo(g_playerstat[player]["Jobblib"], playerSource, true)
		end
	end
	
	for i, area in ipairs(getElementsByType("radararea")) do
		if gangAreaTable[area] then
			setElementVisibleTo(area, playerSource, true)
		end
	end
end

function streetLeaveGang(playerSource, staticJobID, locationID, playerJobRank)
	setElementModel(playerSource, g_playerstat[playerSource]["Skin"])
	
	destroyElement(g_playerstat[playerSource]["Jobblib"])	
	g_playerstat[playerSource]["Jobblib"] = nil
	for i, player in ipairs(getElementsByType("player")) do
		if g_playerstat[player]["Jobblib"] then
			setElementVisibleTo(g_playerstat[player]["Jobblib"], playerSource, false)
		end
	end	
	
	for i, area in ipairs(getElementsByType("radararea")) do
		if gangAreaTable[area] then
			setElementVisibleTo(area, playerSource, false)
		end
	end
end
