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

local function initMafia()
	addJob(100, "Yakuza", false, 105, 105, 105, false, true)
	
	doorMarkerIn = createMarker(2017.4658203125, 1018.0908203125, 996.875+1, "arrow", 1.5, 105, 105, 105, 155, getRootElement())
	doorMarkerOut = createMarker(2020.421875, 1007.576171875, 10.8203125+1, "arrow", 1.5, 105, 105, 105, 155, getRootElement())
	setElementInterior(doorMarkerIn, 10)
	
	addJobLocation(100, 1, 1963.2724609375, 1062.5927734375, 994.46875, 10, 0)
	
	addJobRank(100, 1, "Mitglied(165)", 0, false)
	addJobRank(100, 2, "Mitglied(166)", 0, false)	
	addJobRank(100, 3, "Boss", 0, true) --Chef
	
	registerJobFunction(100, "onPlayerEnterJob", mafiaEnterGang)
	registerJobFunction(100, "onPlayerLeaveJob", mafiaLeaveGang)
end
addEventHandler("onResourceStart", getResourceRootElement(), initMafia)

function onMafiaMarkerHit(playerSource)
	if getElementType(playerSource) == "player" then
		if isPlayerEmployedInJob(playerSource, 100) then
			if source == doorMarkerOut then
				setElementInterior (playerSource, 10)
				setElementPosition (playerSource, 2015.4658203125, 1018.0908203125, 996.875)
			elseif source == doorMarkerIn then
				setElementInterior (playerSource, 0)
				setElementPosition (playerSource, 2022.421875, 1007.576171875, 10.8203125)
			end
		else
			if source == doorMarkerIn or source == doorMarkerOut then
				sendPlayerInfo(playerSource, "Du bist kein Mitglied der Mafia!", true)
			end
		end
	end
end
addEventHandler("onMarkerHit", getRootElement(), onMafiaMarkerHit)

function mafiaEnterGang(playerSource, staticJobID, locationID, playerJobRank)
	if playerJobRank == 1 then
		setElementModel(playerSource, 165)
	elseif playerJobRank == 2 then		
		setElementModel(playerSource, 166)
	elseif playerJobRank == 3 then		
		setElementModel(playerSource, 228)
	end
	
	g_playerstat[playerSource]["Jobblib"] = createBlipAttachedTo(playerSource, 0, 2, 105, 105, 105, 155, 0, 99999, playerSource)
	for i, player in ipairs(getElementsByType("player")) do
		if isPlayerActiveInJob(player, 100) then
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

function mafiaLeaveGang(playerSource, staticJobID, locationID, playerJobRank)
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
