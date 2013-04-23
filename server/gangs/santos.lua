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

local function initSalvador()
	addJob(101, "El-Salvador", false, 0, 139, 69, false, true)
	
	doorMarkerIn = createMarker(2215.78515625, -1150.693359375, 1025.796875+1, "arrow", 1.5, 0, 139, 69, 155, getRootElement())
	doorMarkerOut = createMarker(2232.6806640625, -1159.6630859375, 25.890625+1, "arrow", 1.5, 0, 139, 69, 155, getRootElement())
	setElementInterior(doorMarkerIn, 15)
	
	addJobLocation(101, 1, 2224.2353515625, -1142.736328125, 1025.796875, 15, 0)
	
	addJobRank(101, 1, "Mitglied(105)", 0, false)
	addJobRank(101, 2, "Mitglied(106)", 0, false)	
	addJobRank(101, 3, "Mitglied(107)", 0, false)
	addJobRank(101, 4, "Boss", 0, true) --Chef
	
	registerJobFunction(101, "onPlayerEnterJob", salvadorEnterGang)
	registerJobFunction(101, "onPlayerLeaveJob", salvadorLeaveGang)
end
addEventHandler("onResourceStart", getResourceRootElement(), initSalvador)

function onSalvadorMarkerHit(playerSource)
	if getElementType(playerSource) == "player" then
		if isPlayerEmployedInJob(playerSource, 101) then
			if source == doorMarkerOut then
				setElementInterior (playerSource, 15)
				setElementPosition (playerSource, 2217.78515625, -1150.693359375, 1025.796875)
			elseif source == doorMarkerIn then
				setElementInterior (playerSource, 0)
				setElementPosition (playerSource, 2230.6806640625, -1159.6630859375, 25.890625)
			end
		else
			if source == doorMarkerIn or source == doorMarkerOut then
				sendPlayerInfo(playerSource, "Du bist kein Mitglied der Gang!", true)
			end
		end
	end
end
addEventHandler("onMarkerHit", getRootElement(), onSalvadorMarkerHit)

function salvadorEnterGang(playerSource, staticJobID, locationID, playerJobRank)
	if playerJobRank == 1 then
		setElementModel(playerSource, 105)
	elseif playerJobRank == 2 then		
		setElementModel(playerSource, 106)
	elseif playerJobRank == 3 then		
		setElementModel(playerSource, 107)	
	elseif playerJobRank == 4 then		
		setElementModel(playerSource, 270)
	end
	
	g_playerstat[playerSource]["Jobblib"] = createBlipAttachedTo(playerSource, 0, 2, 0, 139, 69, 155, 0, 99999, playerSource)	
	for i, player in ipairs(getElementsByType("player")) do
		if isPlayerActiveInJob(player, 101) then
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

function salvadorLeaveGang(playerSource, staticJobID, locationID, playerJobRank)
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
