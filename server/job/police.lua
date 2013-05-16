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



rpcRegisterGlobalFunction("policeCreateObject")
rpcRegisterGlobalFunction("policeSetWheelStatus")

local policeStop = {}
local policeBlitzerVar = {}

local function initPoliceCrew()
	addJob(4, "Polizei", false, 70, 130, 180, true)
	addJobLocation(4, 1, 254.0732421875, 76.564453125, 1003.640625, 6, 0) --LS
	addJobLocation(4, 2, 223.2255859375, 186.337890625, 1003.03125, 3, 0) --LV
	addJobLocation(4, 3, -1592.3161621094, 716.09307861328, -5.2421875, 0, 0) --SF
	
	addJobRank(4, 1, "Polizeimeisteranwärter", 0.14, false) --130$ pro 15 Min
	addJobRank(4, 2, "Polizeimeister", 0.16, false) --150$ pro 15 Min
	addJobRank(4, 3, "Polizeiobermeister", 0.188, false) --170$ pro 15 Min
	addJobRank(4, 4, "Polizeihauptmeister", 0.21, false) --190$ pro 15 Min
	addJobRank(4, 5, "Polizeidirektor", 0.23, true) --210$ pro 15 Min -- Chef
	
	setJobExtraMoneyLimit(4, 1000)
	
	registerJobFunction(4, "onPlayerEnterJob", policeCrewEnterJob)
	registerJobFunction(4, "onPlayerLeaveJob", policeCrewLeaveJob)
	
	policeStop["display"] = textCreateDisplay()
	policeStop["item"] = textCreateTextItem("Halt Polizei!", 0.5, 0.5, "normal", 255, 0, 0, 200, 1.5)
	textDisplayAddText(policeStop["display"], policeStop["item"])
end
addEventHandler("onResourceStart", getResourceRootElement(), initPoliceCrew)

function policeCrewEnterJob(playerSource, staticJobID, locationID, playerJobRank)
	--Skin
	if playerJobRank == 5 then
		setElementModel(playerSource, 265)
		g_playerstat[playerSource]["Jobblib"] = createBlipAttachedTo(playerSource, 0, 2, 0, 0, 205, 155, 0, 99999, playerSource)
	else
		if locationID == 1 then
			setElementModel(playerSource, 280)
			g_playerstat[playerSource]["Jobblib"] = createBlipAttachedTo(playerSource, 0, 2, 0, 191, 255, 155, 0, 99999, playerSource)
		elseif locationID == 2 then
			setElementModel(playerSource, 282)
			g_playerstat[playerSource]["Jobblib"] = createBlipAttachedTo(playerSource, 0, 2, 25, 25, 112, 155, 0, 99999, playerSource)
		elseif locationID == 3 then
			setElementModel(playerSource, 281)
			g_playerstat[playerSource]["Jobblib"] = createBlipAttachedTo(playerSource, 0, 2, 0, 0, 205, 155, 0, 99999, playerSource)
		end
	end
	--Blip sichtbar machen
	for i, player in ipairs(getElementsByType("player")) do
		if isPlayerActiveInJob(player, 4) then
			setElementVisibleTo(g_playerstat[playerSource]["Jobblib"], player, true)
			setElementVisibleTo(g_playerstat[player]["Jobblib"], playerSource, true)
		end
	end
	
	--Waffen
	if playerJobRank == 1 then
		giveWeapon(playerSource, 3)
		--giveWeapon(playerSource, 17, 200)
	elseif playerJobRank == 2 then
		giveWeapon(playerSource, 3)
		--giveWeapon(playerSource, 17, 200)
		giveWeapon(playerSource, 22, 150)
	elseif playerJobRank == 3 then
		giveWeapon(playerSource, 3)
		--giveWeapon(playerSource, 17, 200)
		giveWeapon(playerSource, 24, 150)
	elseif playerJobRank == 4 then
		giveWeapon(playerSource, 3)
		--giveWeapon(playerSource, 17, 200)
		giveWeapon(playerSource, 24, 150)
		giveWeapon(playerSource, 29, 100)
	elseif playerJobRank == 5 then
		giveWeapon(playerSource, 3)
		giveWeapon(playerSource, 17, 200)
		giveWeapon(playerSource, 24, 150)
		giveWeapon(playerSource, 29, 100)
		giveWeapon(playerSource, 31, 100)
	end
	
	--Binds
	bindKey(playerSource, "num_1", "down", policeBustPlayer)
	bindKey(playerSource, "num_2", "down", policeStopPlayerDriving)
	bindKey(playerSource, "num_3", "down", policeRoadblock)
	bindKey(playerSource, "num_4", "down", policeNagelband)
	bindKey(playerSource, "num_9", "down", policeSirensHandler)
	bindKey(playerSource, "j", "down", turnJobChat)
	
	--Job Variablen
	g_playerstat[playerSource]["Jobvar"]["Police"] = {}
	
	--Gangareas
	for i, area in ipairs(getElementsByType("radararea")) do
		if gangAreaTable[area] then
			setElementVisibleTo(area, playerSource, true)
		end
	end
end

function policeCrewLeaveJob(playerSource, staticJobID, locationID, playerJobRank)
	setElementModel(playerSource, g_playerstat[playerSource]["Skin"])
	
	destroyElement(g_playerstat[playerSource]["Jobblib"])	
	g_playerstat[playerSource]["Jobblib"] = nil	
	for i, player in ipairs(getElementsByType("player")) do
		if g_playerstat[player]["Jobblib"] then
			setElementVisibleTo(g_playerstat[player]["Jobblib"], playerSource, false)
		end
	end
	
	unbindKey(playerSource, "num_1", "down", policeBustPlayer)
	unbindKey(playerSource, "num_2", "down", policeStopPlayerDriving)
	unbindKey(playerSource, "num_3", "down", policeRoadblock)
	unbindKey(playerSource, "num_4", "down", policeNagelband)
	unbindKey(playerSource, "num_9", "down", policeSirensHandler)
	unbindKey(playerSource, "j", "down", turnJobChat)
	
	if g_playerstat[playerSource]["Jobvar"]["Police"]["Sperre1"] then
		destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["Sperre1"])
		destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["Sperre2"])
		destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["Sperre3"])
	end
	
	if g_playerstat[playerSource]["Jobvar"]["Police"]["Nagelband"] then
		destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["Nagelband"])
		destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["NagelbandCol"])	
	end

	if g_playerstat[playerSource]["Jobvar"]["Police"]["Blitzer"] then
		destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["Blitzer"])
		destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["BlitzerCol"])
	end	
	
	g_playerstat[playerSource]["Jobvar"]["Police"] = nil
	
	--Gangareas
	for i, area in ipairs(getElementsByType("radararea")) do
		if gangAreaTable[area] then
			setElementVisibleTo(area, playerSource, false)
		end
	end
end

function policeDeleteObjects(player)
	if g_playerstat[player]["Jobvar"]["Police"] then
		g_playerstat[playerSource]["Jobvar"]["Police"] = nil

		if g_playerstat[playerSource]["Jobvar"]["Police"]["Sperre1"] then
			destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["Sperre1"])
			destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["Sperre2"])
			destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["Sperre3"])
		end

		if g_playerstat[playerSource]["Jobvar"]["Police"]["Nagelband"] then
			destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["Nagelband"])
			destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["NagelbandCol"])
		end

		if g_playerstat[playerSource]["Jobvar"]["Police"]["Blitzer"] then
			destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["Blitzer"])
			destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["BlitzerCol"])
		end
	end
end
addEventHandler("onPlayerLogoutMTARL", getResourceRootElement(), policeDeleteObjects)

function policeBustPlayer(playerSource, commandName)
	if isPlayerActiveInJob(playerSource, 4) then
		local player, dist = closestPlayer(playerSource)
		if player then
			if dist < 4 then
				if g_playerstat[player]["busted"] == 0 then
					vx, vy, vz = getElementVelocity(player)
					if vx > 5 or vy > 5 or vz > 5 then
						return
					end
					g_playerstat[player]["busted"] = 1
					toggleAllControls(player, false, true, false)
					outputChatBox(g_colors["blue"].."Du hast "..getPlayerName(player).." die Handschellen angelegt", playerSource, 0, 0, 0, true)
					sendPlayerInfo(player, "Dir wurden von "..getPlayerName(playerSource).." die Handschellen angelegt", true)
				else
					g_playerstat[player]["busted"] = 0
					toggleAllControls(player, true, true, false)
					outputChatBox(g_colors["blue"].."Du hast "..getPlayerName(player).." die Handschellen abgelegt", playerSource, 0, 0, 0, true)
					sendPlayerInfo(player, getPlayerName(playerSource).."hat dir die Handschellen abgenommen", true)
				end
			end
		end
	end
end
addCommandHandler("bust", policeBustPlayer)

function punishPlayer(playerSource, commandName, player, money, prisonTime, ...)
	if isPlayerActiveInJob(playerSource, 4) then
		if not player or not money or not prisonTime then
			outputChatBox(g_colors["red"].."Syntax: /strafe [Spieler(teil)name] [Strafgeld] [Strafsekunden Gefägniss] [Begründung]", playerSource, 0, 0, 0, true)
			return false
		end

		-- Punishing is only allowed in 'LSPD HQ' interior
		local px, py, pz = getElementPosition(playerSource)
		local distanceToPD = getDistanceBetweenPoints3D(x, y, z, 253, 71, 1004)
		if not (distanceToPD < 100 and getElementInterior(playerSource) == 6) then
			outputChatBox(g_colors["red"].."Du bist nicht im Los Santos Police Department!", playerSource, 0, 0, 0, true)
			return false
		end

		local thePlayer = getPlayerFromName(player)
		if not thePlayer then
			thePlayer = getPlayerFromString(player)
		end
		if not thePlayer then
			outputChatBox(g_colors["red"].."Dieser Spieler ist nicht online!", playerSource, 255, 255, 255, true)
			return false
		end

		money = tonumber(money)
		prisonTime = tonumber(prisonTime)

		if not money or not prisonTime or money < 0 or prisonTime < 0 then
			outputChatBox(g_colors["red"].."Falsche Strafangaben!", playerSource, 255, 255, 255, true)
			return false
		end

		local strafe = ""
		strafe = strafe.."Du wurdest zu folgender Strafe verurteilt:\n"
		if money > 0 then
			g_playerstat[thePlayer]["Staatsschulden"] = g_playerstat[thePlayer]["Staatsschulden"] + money
			strafe = strafe.." \n"..money.."$ Strafgeld (/tilgen um alle Schulden zu tilgen)"

			addPlayerJobExtraMoney(playerSource, money/3)
		end

		if prisonTime > 0 then
			g_playerstat[thePlayer]["busted"] = 0
			toggleAllControls(thePlayer, true, true, false)
			g_playerstat[thePlayer]["Jailed"] = 1
			g_playerstat[thePlayer]["Jailtime"] = prisonTime
			setElementInterior(thePlayer, 3, 193.1909, 174.9256, 1003.0234)
			setElementPosition(thePlayer,  193.1909, 174.9256, 1003.0234)
            strafe = strafe.." \n+\n"..prisonTime.." Sekunden im Gefängniss"
		end

    	local grund = table.concat({...}, " ")

		strafe = strafe.." \n\nGrund: "..grund
        sendPlayerInfo(thePlayer, strafe)
		outputChatBox(g_colors["green"]..getPlayerName(thePlayer).." wurde verurteilt! Du hast ein drittel der Strafe bekommen.", playerSource, 0, 0, 0, true)
	end
end
addCommandHandler("strafe", punishPlayer)

function policeRemoveStop(playerSource)
	textDisplayRemoveObserver(policeStop["display"], playerSource)
	g_playerstat[playerSource]["Verkehrstime"] = -1
end

function policeStopPlayerDriving(playerSource, commandName)
	if isPlayerActiveInJob(playerSource, 4) then
		local x, y, z = getElementPosition(playerSource)
		for i, player in ipairs(getElementsByType("player")) do
			local xx, yy, zz = getElementPosition(player)
			if getDistanceBetweenPoints3D(x, y, z, xx, yy, zz) < 40 then
				if player ~= playerSource then
					g_playerstat[player]["Verkehrstime"] = 7
					textDisplayAddObserver(policeStop["display"], player)
					outputChatBox(g_colors["green"]..getPlayerName(player).." wurde das Stop gesendet!", player, 0, 0, 0, true)
				end
			end
		end
	end
end
addCommandHandler("stopcall", policeStopPlayerDriving)

function policeRoadblock(playerSource, commandName)
	if isPlayerActiveInJob(playerSource, 4) then
		if g_playerstat[playerSource]["Jobvar"]["Police"]["Sperre1"] then
			destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["Sperre1"])
			destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["Sperre2"])
			destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["Sperre3"])
			g_playerstat[playerSource]["Jobvar"]["Police"]["Sperre1"] = nil
			g_playerstat[playerSource]["Jobvar"]["Police"]["Sperre2"] = nil
			g_playerstat[playerSource]["Jobvar"]["Police"]["Sperre3"] = nil
		else
			if not getPedOccupiedVehicle(playerSource) then
				rpcCallClientFunction(playerSource, "policeCreateObject", "Sperre")
			end
		end
	end
end
addCommandHandler("sperre", policeRoadblock)

function policeNagelband(playerSource, commandName)
	if isPlayerActiveInJob(playerSource, 4) then
		if g_playerstat[playerSource]["Jobvar"]["Police"]["Nagelband"] then
			destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["Nagelband"])
			destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["NagelbandCol"])
			g_playerstat[playerSource]["Jobvar"]["Police"]["Nagelband"] = nil
			g_playerstat[playerSource]["Jobvar"]["Police"]["NagelbandCol"] = nil
		else
			if not getPedOccupiedVehicle(playerSource) then
				rpcCallClientFunction(playerSource, "policeCreateObject", "Nagelband")
			end
		end
	end
end
addCommandHandler("nagelband", policeNagelband)

function policeBlitzer(playerSource, commandName, velo)
	if isPlayerActiveInJob(playerSource, 4) then
		if g_playerstat[playerSource]["Jobvar"]["Police"]["Blitzer"] then
			destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["Blitzer"])
			destroyElement(g_playerstat[playerSource]["Jobvar"]["Police"]["BlitzerCol"])
			g_playerstat[playerSource]["Jobvar"]["Police"]["Blitzer"] = nil
			g_playerstat[playerSource]["Jobvar"]["Police"]["BlitzerCol"] = nil
			g_playerstat[playerSource]["Jobvar"]["Police"]["BlitzerVelo"] = nil
		else
			if not getPedOccupiedVehicle(playerSource) then
				local velo = tonumber(velo)
				if not velo or velo <= 30 then
					sendPlayerInfo(playerSource, "Keine oder falsche Geschwindigkeit", true)
					return
				end
				rpcCallClientFunction(playerSource, "policeCreateObject", "Blitzer")
				g_playerstat[playerSource]["Jobvar"]["Police"]["BlitzerVelo"] = velo
			end
		end
	end
end
addCommandHandler("blitzer", policeBlitzer)

function policeCreateObject(typ, model, x, y, z, rx, ry, rz)
	if isPlayerActiveInJob(client, 4) then
		if typ == "Sperre" then
			if not g_playerstat[client]["Jobvar"]["Police"]["Sperre1"] then
				g_playerstat[client]["Jobvar"]["Police"]["Sperre1"] = createObject(model, x, y, z, rx, ry, rz)
				setElementParent(g_playerstat[client]["Jobvar"]["Police"]["Sperre1"], client)
				setElementFrozen(g_playerstat[client]["Jobvar"]["Police"]["Sperre1"], true)
			elseif not g_playerstat[client]["Jobvar"]["Police"]["Sperre2"] then
				g_playerstat[client]["Jobvar"]["Police"]["Sperre2"] = createObject(model, x, y, z, rx, ry, rz)
				setElementParent(g_playerstat[client]["Jobvar"]["Police"]["Sperre2"], client)
				setElementFrozen(g_playerstat[client]["Jobvar"]["Police"]["Sperre2"], true)
			elseif not g_playerstat[client]["Jobvar"]["Police"]["Sperre3"] then
				g_playerstat[client]["Jobvar"]["Police"]["Sperre3"] = createObject(model, x, y, z, rx, ry, rz)
				setElementParent(g_playerstat[client]["Jobvar"]["Police"]["Sperre3"], client)
				setElementFrozen(g_playerstat[client]["Jobvar"]["Police"]["Sperre3"], true)
			end
		elseif typ == "Nagelband" then
			if not g_playerstat[client]["Jobvar"]["Police"]["Nagelband"] then
				g_playerstat[client]["Jobvar"]["Police"]["Nagelband"] = createObject(model, x, y, z, rx, ry, rz)
				g_playerstat[client]["Jobvar"]["Police"]["NagelbandCol"] = createColSphere (x, y, z, 8)
				setElementParent(g_playerstat[client]["Jobvar"]["Police"]["Nagelband"], client)
				setElementParent(g_playerstat[client]["Jobvar"]["Police"]["NagelbandCol"], client)
				addEventHandler("onColShapeHit", g_playerstat[client]["Jobvar"]["Police"]["NagelbandCol"], policeNagelbandHandler)
				addEventHandler("onColShapeLeave", g_playerstat[client]["Jobvar"]["Police"]["NagelbandCol"], policeNagelbandHandler)
			end
		elseif typ == "Blitzer" then
			if not g_playerstat[client]["Jobvar"]["Police"]["Blitzer"] then
				local x2, y2, z2 = getPosInFrontOfPlayer(client, 1)
				local a = math.deg(math.atan((y2 - y) / (x2 - x)))+270
				g_playerstat[client]["Jobvar"]["Police"]["Blitzer"] = createObject(2600, x2, y2, z2 - 0.3, 0, 0, a)
				local col = createColSphere(x, y, z, 5)
				g_playerstat[client]["Jobvar"]["Police"]["BlitzerCol"] = col
				setElementParent(g_playerstat[client]["Jobvar"]["Police"]["Blitzer"], client)
				setElementParent(col, client)
				policeBlitzerVar[col] = {}
				policeBlitzerVar[col]["Velo"] = g_playerstat[client]["Jobvar"]["Police"]["BlitzerVelo"]
				policeBlitzerVar[col]["Owner"] = client
				addEventHandler("onColShapeHit", g_playerstat[client]["Jobvar"]["Police"]["BlitzerCol"], policeBlitzerHandler)
			end
		end
	end
end

function policeNagelbandHandler(element)
	if getElementType(element) == "vehicle" then
		local player = getVehicleOccupant (element)
		if player then
			if isElementWithinColShape(element, source) then
				rpcCallClientFunction(player, "policeNagelbandAction", true)
			else
				rpcCallClientFunction(player, "policeNagelbandAction", false)
			end
		end
	end
end

function policeSetWheelStatus(vehicle , frontLeft, rearLeft, frontRight, rearRight)
	setVehicleWheelStates(vehicle , frontLeft, rearLeft, frontRight, rearRight)
end

function policeBlitzerHandler(element)
	if getElementType(element) == "vehicle" then
		local player = getVehicleOccupant (element)
		if player then
			if not isPlayerActiveInJob(player, 4) or not isPlayerActiveInJob(player, 2) then
				if policeBlitzerVar[source]["Owner"] then
					local x1, y1, z1 = getElementPosition(player)
					local x2, y2, z2 = getElementPosition(policeBlitzerVar[source]["Owner"])
					if getDistanceBetweenPoints3D(x1, y1, z1, x2, y2, z2) < 20 then
						local vx, vy, vz = getElementVelocity(element)
						local velo = (vx^2 + vy^2 + vz^2)^(0.5)*200*1,609344
						if velo > policeBlitzerVar[source]["Velo"] then
							local overplus = velo - policeBlitzerVar[source]["Velo"]
							local money = math.floor(overplus * 2)
							g_playerstat[player]["Staatsschulden"] = g_playerstat[player]["Staatsschulden"] + money
							sendPlayerInfo(player, "Du wurdest soeben mit "..math.floor(velo).."km/h geblitzt.\nDas waren "..math.floor(overplus).."km/h zu viel.\nDeswegen musst du "..money.."$ bezahlen\nDiese kannst du mit /tilgen bezahlen.", true)
							local policemoney = math.floor(money / 2)
							addPlayerJobExtraMoney(policeBlitzerVar[source]["Owner"], policemoney)
							sendPlayerInfo(policeBlitzerVar[source]["Owner"], "Es wurde soeben "..getPlayerName(player).." mit "..math.floor(velo).."km/h Geblitzt.\nDafür bekommst du "..policemoney.."$.", true)
						end
					end
				end
			end
		end
	end
end

function policeSirensHandler(playerSource)
	if isPlayerActiveInJob(playerSource, 4) then
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
addCommandHandler("sirene", policeSirensHandler)

function policeSirensHandler(playerSource)
	if isPlayerActiveInJob(playerSource, 4) then
		local player, dist = closestPlayer(playerSource)
		if player then
			if dist < 4 then
				local level = tostring(getPlayerWantedLevel(player))
				sendPlayerInfo(playerSource, "Der Spieler: "..getPlayerName(player).." hat das Wandet-Level: "..level.."!", true)
			end
		end
	end
end
addCommandHandler("getwanted", policeSirensHandler)

function policeSirensHandler(playerSource, commandName, player)
	if isPlayerActiveInJob(playerSource, 4) then
		if not player then
			outputChatBox(g_colors["red"].."Syntax: /addwanted [Spieler(teil)name]", playerSource, 0, 0, 0, true)
			return false
		end

		local thePlayer = getPlayerFromName(player)
		if not thePlayer then
			thePlayer = getPlayerFromString(player)
		end
		if not thePlayer then 
			outputChatBox(g_colors["red"].."Dieser Spieler ist nicht online!", playerSource, 255, 255, 255, true)
			return false
		end

		local level = tonumber(getPlayerWantedLevel(thePlayer))
		if level == 6 then
			sendPlayerInfo(playerSource, "Der Spieler: "..getPlayerName(thePlayer).." hat bereits das höchste Wanted-Level.", true)
		else
			level = level + 1
			setPlayerWantedLevel(thePlayer, level)
			sendPlayerInfo(playerSource, "Der Spieler: "..getPlayerName(thePlayer).." hat nun das Wandet-Level: "..tostring(level).."!", true)
		end
	end
end
addCommandHandler("addwanted", policeSirensHandler)

function policeSirensHandler(playerSource, commandName, player)
	if isPlayerActiveInJob(playerSource, 4) then
		if not player then
			outputChatBox(g_colors["red"].."Syntax: /removewanted [Spieler(teil)name]", playerSource, 0, 0, 0, true)
			return false
		end

		local thePlayer = getPlayerFromName(player)
		if not thePlayer then
			thePlayer = getPlayerFromString(player)
		end
		if not thePlayer then
			outputChatBox(g_colors["red"].."Dieser Spieler ist nicht online!", playerSource, 255, 255, 255, true)
			return false
		end

		local level = tonumber(getPlayerWantedLevel(thePlayer))
		if level == 0 then
			sendPlayerInfo(playerSource, "Der Spieler: "..getPlayerName(thePlayer).." hat bereits das nidrigste Wanted-Level.", true)
		else
			level = level - 1
			setPlayerWantedLevel(thePlayer, level)
			sendPlayerInfo(playerSource, "Der Spieler: "..getPlayerName(thePlayer).." hat nun das Wandet-Level: "..tostring(level).."!", true)
		end
	end
end
addCommandHandler("removewanted", policeSirensHandler)
