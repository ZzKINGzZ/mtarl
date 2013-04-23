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



rpcRegisterGlobalFunction("medicOnPlayerDeadTimerKill")

local function initMedicCrew()
	addJob(2, "Medic", false, 0, 255, 0, true)
	addJobLocation(2, 1, 1172.6964111328, -1327.6652832031, 15.401915550232, 0, 0)
	addJobLocation(2, 2, 1614.6671142578, 1817.5483398438, 10.8203125, 0, 0)
	addJobLocation(2, 3, -2665.3134765625, 637.92590332031, 14.453125, 0, 0)
	
	addJobRank(2, 1, "Artztassistent", 0.11, false) --rankWage = Lohn pro Sekunde!! --100$ pro 15 Min
	addJobRank(2, 2, "Arzt", 0.138, false) --125$ pro 15 Min
	addJobRank(2, 3, "Notarzt", 0.16, false) --150$ pro 15 Min
	addJobRank(2, 4, "Oberarzt", 0.19, false) --175$ pro 15 Min
	addJobRank(2, 5, "Doktor", 0.22, true) --200$ pro 15 Min -- Chef
	
	setJobExtraMoneyLimit(2, 10000)
	
	registerJobFunction(2, "onPlayerEnterJob", medicCrewEnterJob)
	registerJobFunction(2, "onPlayerLeaveJob", medicCrewLeaveJob)
end
addEventHandler("onResourceStart", getResourceRootElement(), initMedicCrew)

function medicCrewEnterJob(playerSource, staticJobID, locationID, playerJobRank)
	if playerJobRank == 5 then
		setElementModel(playerSource, 70)
		g_playerstat[playerSource]["Jobblib"] = createBlipAttachedTo(playerSource, 0, 2, 240, 240, 240, 155, 0, 99999, playerSource)
	else
		if locationID == 1 then
			setElementModel(playerSource, 276)
			g_playerstat[playerSource]["Jobblib"] = createBlipAttachedTo(playerSource, 0, 2, 113, 124, 119, 155, 0, 99999, playerSource)
		elseif locationID == 2 then
			setElementModel(playerSource, 275)
			g_playerstat[playerSource]["Jobblib"] = createBlipAttachedTo(playerSource, 0, 2, 113, 136, 101, 155, 0, 99999, playerSource)
		elseif locationID == 3 then
			setElementModel(playerSource, 274)
			g_playerstat[playerSource]["Jobblib"] = createBlipAttachedTo(playerSource, 0, 2, 240, 240, 240, 155, 0, 99999, playerSource)
		end
	end
	for i, player in ipairs(getElementsByType("player")) do
		if isPlayerActiveInJob(player, 2) then
			setElementVisibleTo(g_playerstat[playerSource]["Jobblib"], player, true)
			setElementVisibleTo(g_playerstat[player]["Jobblib"], playerSource, true)
		end
	end
	bindKey(playerSource, "num_1", "down", medicHealPlayer)
	bindKey(playerSource, "num_9", "down", medicSirensHandler)
	bindKey(playerSource, "j", "down", turnJobChat)
end

function medicCrewLeaveJob(playerSource, staticJobID, locationID, playerJobRank)
	setElementModel(playerSource, g_playerstat[playerSource]["Skin"])
	
	destroyElement(g_playerstat[playerSource]["Jobblib"])	
	g_playerstat[playerSource]["Jobblib"] = nil
	for i, player in ipairs(getElementsByType("player")) do
		if g_playerstat[player]["Jobblib"] then
			setElementVisibleTo(g_playerstat[player]["Jobblib"], playerSource, false)
		end
	end
	
	unbindKey(playerSource, "num_1", "down", medicHealPlayer)
	unbindKey(playerSource, "num_9", "down", medicSirensHandler)
	unbindKey(playerSource, "j", "down", turnJobChat)
end

function medicOnPlayerDead(amo, killer, weapon, bodypart, stealth)
	g_playerstat[source]["DeadPickup"] = createBlipAttachedTo(source, 0, 2, 255, 0, 0, 155, 0, 99999, source)
	setElementVisibleTo(g_playerstat[source]["DeadPickup"], source, false)
	
	if getPedOccupiedVehicle(source) then
		removePedFromVehicle(source)
	end	
	
	local playerCity = getElementZoneName(source, true)
	local playerRegion = getElementZoneName(source, false)
	
	for i, player in ipairs(getElementsByType("player")) do
		if player then
			if isPlayerActiveInJob(player, 2) then
				setElementVisibleTo(g_playerstat[source]["DeadPickup"], player, true)
				outputChatBox(g_colors["darkred"].."NOTRUF: #F0E68CDer Spieler "..getPlayerName(source).." ist in Ohnmacht gefallen! Ort: "..playerCity..", "..playerRegion, player, 255, 255, 255, true)
			end
		end
	end

	g_playerstat[source]["DeathRepsawnTime"] = 150
	rpcCallClientFunction(source, "medicStartDeadTimer", true)
end
addEventHandler("onPlayerWasted", getRootElement(), medicOnPlayerDead)

function medicOnPlayerDeadTimerKill()
	if g_playerstat[client]["DeadPickup"] then
		destroyElement(g_playerstat[client]["DeadPickup"])
		g_playerstat[client]["DeadPickup"] = nil
	end
	
	takePlayerMoney(client, 2000)
	
	for i, player in ipairs(getElementsByType("player")) do
		if player then
			if isPlayerActiveInJob(player, 2) then
				outputChatBox(g_colors["darkred"].."Der Spieler "..getPlayerName(client).." ist gestorben! Jede Hilfe kommt zu sp"..auml.."t...", player, 255, 255, 255, true)
			end
		end
	end
end

function medicHealPlayer(playerSource, commandName)
	if isPlayerActiveInJob(playerSource, 2) then
		local player = closestPlayer(playerSource)
		local playerX, playerY = getElementPosition(player)
		local medicX, medicY = getElementPosition(playerSource)
		local distance = getDistanceBetweenPoints2D(playerX, playerY, medicX, medicY)
		if player and distance < 5 then
			addEventHandler("onGeneralPlayerTimer", player, medicHealPlayerTimer)
			g_playerstat[player]["healer"] = playerSource
			
			sendPlayerInfo(playerSource, "Du heilst "..getPlayerName(player)..". Bleibe in seiner N"..auml.."he um die Behandlung nicht abzubrechen.", true)
			sendPlayerInfo(player, "Dein Arzt "..getPlayerName(playerSource).." heilt dich. Bleibe in seiner N"..auml.."he um die Behandlung nicht abzubrechen.", true)
		else
			addEventHandler("onGeneralPlayerTimer", playerSource, medicHealPlayerTimer)
			g_playerstat[playerSource]["healer"] = playerSource
			
			sendPlayerInfo(playerSource, "Du heilst dich.")
		end	
	end
end
addCommandHandler("heal", medicHealPlayer)

function medicHealPlayerTimer()
	local health = getElementHealth(source)
	
	if not isElement(source) then
		removeEventHandler("onGeneralPlayerTimer", source, medicHealPlayerTimer)
		return false	
	end
	
	
	--Hacky, aber wirksam (Automatischer Bugfix) :)
	if not health then
		removeEventHandler("onGeneralPlayerTimer", source, medicHealPlayerTimer)
		return false
	end
	
	if not g_playerstat[source]["healer"] then
		removeEventHandler("onGeneralPlayerTimer", source, medicHealPlayerTimer)
		return false	
	end
	
	local playerX, playerY = getElementPosition(source)
	local medicX, medicY = getElementPosition(g_playerstat[source]["healer"])
	local distance = getDistanceBetweenPoints2D(playerX, playerY, medicX, medicY)
	
	if distance > 5 then
		sendPlayerInfo(source, "Du bist zu weit entfernt von deinem Arzt. Die Behandlung konnte nicht fortgef"..uuml.."hrt werden.", true)
		sendPlayerInfo(g_playerstat[source]["healer"], "Du bist zu weit entfernt von deinem Patienten. Die Behandlung konnte nicht fortgef"..uuml.."hrt werden.", true)
		removeEventHandler("onGeneralPlayerTimer", source, medicHealPlayerTimer)
		return false 
	end
	
	if g_playerstat[source]["DeadPickup"] then
		g_playerstat[source]["DeathRepsawnTime"] = -1
		takePlayerMoney(source, 1496)	--Stimmt so ;)
		addPlayerJobExtraMoney(g_playerstat[source]["healer"], 1000)
		rpcCallClientFunction(source, "medicStartDeadTimer", false)
		
		local x, y, z = getElementPosition(source)
		local int = getElementInterior(source)
		local dim = getElementDimension(source)
		
		if isPlayerActiveInAnyJob(source) then
			local jobSkin = getElementModel(source)
			spawnPlayer(source, x, y, z, jobSkin, 0, g_playerstat[source]["Skin"], int, dim)
			setElementModel(source, jobSkin)
		else
			spawnPlayer(source, x, y, z, g_playerstat["skinid"], 0, g_playerstat[source]["Skin"], int, dim)
			setElementModel(source, g_playerstat[source]["Skin"])
		end
		setElementInterior(source, int)
		setElementDimension(source, dim)
		
		destroyElement(g_playerstat[source]["DeadPickup"])	
		g_playerstat[source]["DeadPickup"] = nil
	end
	
	health = getElementHealth(source)
	if health < 10 then
		local newhealth = health + 1
		setElementHealth(source, newhealth)
		takePlayerMoney(source, 10)
		addPlayerJobExtraMoney(g_playerstat[source]["healer"], 3)
		giveStaatsKasse(10)
	elseif health < 40 and health > 10 then
		local newhealth = health + 2
		setElementHealth(source, newhealth)
		takePlayerMoney(source, 8)
		addPlayerJobExtraMoney(g_playerstat[source]["healer"], 1)
		giveStaatsKasse(8)
	elseif health < 70 and health > 40 then
		local newhealth = health + 4
		setElementHealth(source, newhealth)
		takePlayerMoney(source, 6)
		addPlayerJobExtraMoney(g_playerstat[source]["healer"], 1)
		giveStaatsKasse(8)
	else
		local newhealth = health + 6
		setElementHealth(source, newhealth)
		takePlayerMoney(source, 4)
		addPlayerJobExtraMoney(g_playerstat[source]["healer"], 1)
		giveStaatsKasse(8)
	end
	
	if health > 99 then
		sendPlayerInfo(source, "Du wurdest von "..getPlayerName(g_playerstat[source]["healer"]).." erfolgreich behandelt.", true)
		sendPlayerInfo(g_playerstat[source]["healer"], "Du hast "..getPlayerName(source).." erfolgreich behandelt.", true)
		setElementHealth(source, 100)
		g_playerstat[source]["healer"] = false
		removeEventHandler("onGeneralPlayerTimer", source, medicHealPlayerTimer)
		return false		
	end
end

function medicSirensHandler(playerSource)
	if isPlayerActiveInJob(playerSource, 2) then
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
addCommandHandler("sirene", medicSirensHandler)
