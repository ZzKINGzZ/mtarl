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



rpcRegisterGlobalFunction("createFireBrigadeFire")
rpcRegisterGlobalFunction("changeFireBrigadeFire")

local fireZones = {}

local function initFireBrigade()
	addJob(1, "Feuerwehr", false, 255, 0, 0, true)
	addJobLocation(1, 1, 1495.1650390625, -2178.8310546875, 13.739019393921, 0, 0)
	addJobLocation(1, 2, 1776.8310546875, 2080.482421875, 10.8203125, 0, 0)
	addJobLocation(1, 3, -2024.6330566406, 67.245750427246, 28.441009521484, 0, 0)
	
	addJobRank(1, 1, "Feuerwehrmann-Anwärter", 0.11, false) --rankWage = Lohn pro Sekunde!! --100$ pro 15 Min
	addJobRank(1, 2, "Feuerwehrmann", 0.16, false) --150$ pro 15 Min
	addJobRank(1, 3, "Hauptfeuerwehrmann", 0.16, false) --150$ pro 15 Min
	addJobRank(1, 4, "Oberfeuerwehrmann", 0.19, false) --175$ pro 15 Min
	addJobRank(1, 5, "Unterbrandmeister", 0.22, false) --200$ pro 15 Min
	addJobRank(1, 6, "Oberbrandmeister", 0.22, false) --200$ pro 15 Min
	addJobRank(1, 7, "Hauptbrandmeister", 0.25, false) --225$ pro 15 Min
	addJobRank(1, 8, "Brandinspektor", 0.25, true) --225$ pro 15 Min -- Chef
	
	registerJobFunction(1, "onPlayerEnterJob", fireBrigadeEnterJob)
	registerJobFunction(1, "onPlayerLeaveJob", fireBrigadeLeaveJob)
end
addEventHandler("onResourceStart", getResourceRootElement(), initFireBrigade)

function fireBrigadeEnterJob(playerSource, staticJobID, locationID, playerJobRank)
	
	g_playerstat[playerSource]["Jobblib"] = createBlipAttachedTo(playerSource, 0, 2, 255, 0, 0, 155, 0, 99999, playerSource)
	
	if locationID == 1 then
		setElementModel(playerSource, 277)
	elseif locationID == 2 then
		setElementModel(playerSource, 278)
	elseif locationID == 3 then
		setElementModel(playerSource, 279)
	end
		
	--Blip sichtbar machen
	for i, player in ipairs(getElementsByType("player")) do
		if isPlayerActiveInJob(player, 1) then
			setElementVisibleTo(g_playerstat[playerSource]["Jobblib"], player, true)
			setElementVisibleTo(g_playerstat[player]["Jobblib"], playerSource, true)
		end
	end
	
	--Zones sichtbar machen
	for zone, boolean in pairs(fireZones) do
		setElementVisibleTo(zone, playerSource, true)
	end
	
	--Feuerloscher
	giveWeapon(playerSource, 42, 999999)
	bindKey(playerSource, "j", "down", turnJobChat)
	bindKey(playerSource, "num_9", "down", fireSirensHandler)
	
	rpcCallClientFunction(playerSource, "setPlayerInFireBrigadeJob", true)
end

function fireBrigadeLeaveJob(playerSource, staticJobID, locationID, playerJobRank)
	rpcCallClientFunction(playerSource, "setPlayerInFireBrigadeJob", false)
	
	setElementModel(playerSource, g_playerstat[playerSource]["Skin"])
	
	unbindKey(playerSource, "j", "down", turnJobChat)
	unbindKey(playerSource, "num_9", "down", fireSirensHandler)
	
	for i, player in ipairs(getElementsByType("player")) do
		if g_playerstat[player]["Jobblib"] then
			setElementVisibleTo(g_playerstat[player]["Jobblib"], playerSource, false)
		end
	end
	
	--Zones unsichtbar machen
	for zone, boolean in pairs(fireZones) do
		setElementVisibleTo(zone, playerSource, false)
	end	
	
	destroyElement(g_playerstat[playerSource]["Jobblib"])	
	g_playerstat[playerSource]["Jobblib"] = nil
end

local function playerHitFire(hitElement, matchingDimension)
	if matchingDimension then
		if getElementType(hitElement) == "player" then
			if not isPlayerActiveInJob(hitElement, 1) then
				setPedOnFire(hitElement, true)
			end
		end
	end	
end

local function playerLeaveFire(hitElement, matchingDimension)
	if matchingDimension then
		if getElementType(hitElement) == "player" then
			if not isPlayerActiveInJob(hitElement, 1) then
				setPedOnFire(hitElement, false)
			end	
		end
	end	
end

function createFireBrigadeFire(x, y, z)
	local fireBrigadeOnline = false
	for i, player in ipairs(getElementsByType("player")) do
		if isPlayerActiveInJob(player, 1) then
			fireBrigadeOnline = true
			break
		end
	end
	
	if not fireBrigadeOnline then return false end
	
	local fireSize = math.random(1, 3)
	local blip
	local obj
	
	if fireSize == 1 then
		obj = createObject(2022, x, y, z)
	elseif fireSize == 2 then
		obj = createObject(2023, x, y, z)
		local obj2 = createObject(2022, x + 0.8, y, z)
		local obj3 = createObject(2022, x - 0.8, y, z)
		local obj4 = createObject(2022, x, y + 0.8, z)
		local obj5 = createObject(2022, x, y - 0.8, z)	
	else
		obj = createObject(2023, x, y, z)
		local obj2 = createObject(2022, x + 0.8, y, z)
		local obj3 = createObject(2022, x - 0.8, y, z)
		local obj4 = createObject(2022, x, y + 0.8, z)
		local obj5 = createObject(2022, x, y - 0.8, z)		
		local obj6 = createObject(2024, x - 0.8, y - 0.8, z)		
		local obj7 = createObject(2024, x - 0.8, y + 0.8, z)		
		local obj8 = createObject(2024, x + 0.8, y - 0.8, z)		
		local obj9 = createObject(2024, x + 0.8, y + 0.8, z)	
	end
	
	--Zone
	
	--Random Offest
	local xOffset = math.random(70, 100)
	local yOffset = math.random(70, 100)
	
	local addX = math.random(30, 50)
	local addY = math.random(30, 50)
	
	local area = createRadarArea(x - xOffset + addX, y - yOffset + addY, xOffset * 2, yOffset * 2, 255, 0, 0, 155)
	setElementVisibleTo(area, root, false)
	setElementParent(area, obj)
	fireZones[area] = true
	
	
	local col = createColSphere(x, y, z, 5)
	setElementParent(col, obj)
	
	addEventHandler("onColShapeHit", col, playerHitFire) 
	addEventHandler("onColShapeLeave", col, playerLeaveFire) 
	
	local zoneName = getZoneName(x, y, z)
	local zoneNameCity = getZoneName(x, y, z, true)
	
	for i, player in ipairs(getElementsByType("player")) do
		if isPlayerActiveInJob(player, 1) then
			setElementVisibleTo(area, player, true)
			sendPlayerInfo(player, "Es wurde ein Feuer in "..zoneName.." ("..zoneNameCity..") entdeckt. Finde und lösche es.", true)
		end
	end	
end

function changeFireBrigadeFire(object)
	if getElementType(object) ~= "object" then
		return false
	end
	
	local model = getElementModel(object)
	if model == 2023 then
		setElementModel(object, 2022)
		--setElementCollisionsEnabled(object, false)
	elseif model == 2022 then
		setElementModel(object, 2024)
		--setElementCollisionsEnabled(object, false)	
	else
		for i, element in ipairs(getElementChildren(object)) do
			if getElementType(element) == "radararea" then
				fireZones[element] = nil
				break
			end
		end
		destroyElement(object)
		sendPlayerInfo(client, "Feuer gelöscht. Weiter gehts. (2$)", true)
		addPlayerJobExtraMoney(client, 2)
	end
end

function fireSirensHandler(playerSource)
	if isPlayerActiveInJob(playerSource, 1) then
		local vehicle = getPedOccupiedVehicle(playerSource)
		if isVehicleJobVehicle(vehicle) then
			if not getVehicleSirensOn(vehicle) then
				setVehicleSirensOn(vehicle, true)
			else
				setVehicleSirensOn(vehicle, false)
			end
		end
	end
end

local function playerEnterVehicleFireBrigade(vehicle, seat, jacked)
	if isPlayerActiveInJob(source, 1) then
		if g_vehiclestat[vehicle]["Specialcar"] then
			if g_vehiclestat[vehicle]["Specialcar"] == "Feuerwehr" then
				giveWeapon(source, 42, 999999)
			end
		end
	end
end
addEventHandler("onPlayerVehicleEnter", root, playerEnterVehicleFireBrigade)
