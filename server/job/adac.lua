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



rpcRegisterGlobalFunction("adacRepairVehicleDone")

local function initAdacCrew()
	addJob(5, "ADAC", false, 255, 215, 0, true)
	addJobLocation(5, 1, 1808.9592285156, -1903.7839355469, 13.684513092041, 0, 0)--LS
	addJobLocation(5, 2, -2042.1884765625, 159.70703125, 28.8359375, 0, 0)--SF
	addJobLocation(5, 3, 1658.5339355469, 2199.5522460938, 10.8203125, 0, 0)--LV
	
	addJobRank(5, 1, "Mechaniker", 0.18, false) --rankWage = Lohn pro Sekunde!! --170$ pro 15 Min
	addJobRank(5, 3, "Mechatroniker", 0.19, false) --rankWage = Lohn pro Sekunde!! --180$ pro 15 Min
	addJobRank(5, 2, "ADAC-Chef", 0.21, true) --190$ pro 15 Min -- Chef
	
	setJobExtraMoneyLimit(5, 1000)
	
	registerJobFunction(5, "onPlayerEnterJob", adacCrewEnterJob)
	registerJobFunction(5, "onPlayerLeaveJob", adacCrewLeaveJob)
end
addEventHandler("onResourceStart", getResourceRootElement(), initAdacCrew)

function adacCrewEnterJob(playerSource, staticJobID, locationID, playerJobRank)
	if playerJobRank == 2 then
		setElementModel(playerSource, 309)
		g_playerstat[playerSource]["Jobblib"] = createBlipAttachedTo(playerSource, 0, 2, 255, 215, 0, 155, 0, 99999, playerSource)
	else
		setElementModel(playerSource, 305)
		g_playerstat[playerSource]["Jobblib"] = createBlipAttachedTo(playerSource, 0, 2, 255, 255, 0, 155, 0, 99999, playerSource)
	end
	for i, player in ipairs(getElementsByType("player")) do
		if isPlayerActiveInJob(player, 5) then
			setElementVisibleTo(g_playerstat[playerSource]["Jobblib"], player, true)
			setElementVisibleTo(g_playerstat[player]["Jobblib"], playerSource, true)
		end
	end
	
	bindKey(playerSource, "num_1", "down", adacStartRepairVehicle)
	bindKey(playerSource, "num_4", "down", adacRenewTuv)
	bindKey(playerSource, "num_3", "down", adacSetVehicleSeized)
	bindKey(playerSource, "j", "down", turnJobChat)
	
	g_playerstat[playerSource]["Jobvar"]["Adac"] = {}
end

function adacCrewLeaveJob(playerSource, staticJobID, locationID, playerJobRank)
	setElementModel(playerSource, g_playerstat[playerSource]["Skin"])
	
	destroyElement(g_playerstat[playerSource]["Jobblib"])	
	g_playerstat[playerSource]["Jobblib"] = nil
	
	unbindKey(playerSource, "num_1", "down", adacStartRepairVehicle)
	unbindKey(playerSource, "num_4", "down", adacRenewTuv)
	unbindKey(playerSource, "num_3", "down", adacSetVehicleSeized)
	unbindKey(playerSource, "j", "down", turnJobChat)
end

function adacStartRepairVehicle(playerSource, commandName)
	if isPlayerActiveInJob(playerSource, 5) then
		local car = getPedOccupiedVehicle(playerSource)
		if not car then
			local vehicle, distance = closestVehicle(playerSource)
			if vehicle and distance < 10 then
				--[[if isVehicleUnlimitedBurning(vehicle) then
					sendPlayerInfo(playerSource, "Das Fahrzeug brennt noch. Rufe die Feuerwehr um es zu löschen zu lassen.")
					return false
				end--]]
				
				local occ = getVehicleOccupants(vehicle)
				if #occ > 0 then
					sendPlayerInfo(playerSource, "Das Fahrzeug kann erst repariert werden, wenn sich keine Personen mehr in diesem befinden.", true)
					return false
				end
				
				local health = getElementHealth(vehicle)
				local repairStart = false
				
				if isPlayerInBall(playerSource, 1808.9592285156, -1903.7839355469, 13.684513092041, 40) or isPlayerInBall(playerSource, -2042.1884765625, 159.70703125, 28.8359375, 40) or isPlayerInBall(playerSource, 1658.5339355469, 2199.5522460938, 10.8203125, 40) then
					repairStart = true
				end
				
				if health > 900 then
					repairStart = true 
				end
				
				local vehType = getVehicleType(vehicle)
				if vehType == "Boat" or vehType == "Plane" or vehType == "BMX" or vehType == "Trailer" or vehType == "Train" or vehType == "Helicopter" then
					repairStart = true
				end
				
				if repairStart then
					local points = 0
					--Punkte für die Health
					local health = getElementHealth(vehicle)
					points = (1000 - health) / 10
					
					--Punkte für äußeren Schaden
					local zelle1 = getVehicleDoorState(vehicle, 0)
					local zelle2 = getVehicleDoorState(vehicle, 1)
					local zelle3 = getVehicleDoorState(vehicle, 2)
					local zelle4 = getVehicleDoorState(vehicle, 3)
					local zelle5 = getVehicleDoorState(vehicle, 4)
					local zelle6 = getVehicleDoorState(vehicle, 5)	
					if zelle1 == 2 or zelle1 == 3 or zelle1 == 4 then
						points = points + 20
					end
					if zelle2 == 2 or zelle2 == 3 or zelle2 == 4 then
						points = points + 20
					end
					if zelle3 == 2 or zelle3 == 3 or zelle3 == 4 then
						points = points + 20
					end
					if zelle4 == 2 or zelle4 == 3 or zelle4 == 4 then
						points = points + 20
					end	
					if zelle5 == 2 or zelle5 == 3 or zelle5 == 4 then
						points = points + 20
					end	
					if zelle6 == 2 or zelle6 == 3 or zelle6 == 4 then
						points = points + 20
					end	

					local zelle7
					local zelle8
					local zelle9
					local zelle10
					zelle7, zelle8, zelle9, zelle10 = getVehicleWheelStates(vehicle)
					
					if zelle7 ~= 255 and zelle7 ~= 0 then
						points = points + 10
					end
					if zelle8 ~= 255 and zelle8 ~= 0 then
						points = points + 10
					end
					if zelle9 ~= 255 and zelle9 ~= 0 then
						points = points + 10
					end
					if zelle10 ~= 255 and zelle10 ~= 0 then
						points = points + 10
					end
					
					local zelle11 = getVehicleLightState(vehicle, 0)
					local zelle12 = getVehicleLightState(vehicle, 1)
					local zelle13 = getVehicleLightState(vehicle, 2)
					local zelle14 = getVehicleLightState(vehicle, 3)
					if zelle11 == 1 then
						points = points + 15
					end
					if zelle12 == 1 then
						points = points + 15
					end
					if zelle13 == 1 then
						points = points + 15
					end
					if zelle14 == 1 then
						points = points + 15
					end

					
					local zelle15 = getVehiclePanelState(vehicle, 0)
					local zelle16 = getVehiclePanelState(vehicle, 1)
					local zelle17 = getVehiclePanelState(vehicle, 2)
					local zelle18 = getVehiclePanelState(vehicle, 3)
					local zelle19 = getVehiclePanelState(vehicle, 4)
					local zelle20 = getVehiclePanelState(vehicle, 5)
					local zelle21 = getVehiclePanelState(vehicle, 6)
					
					if zelle15 ~= 0 then
						points = points + 20
					end
					if zelle16 ~= 0 then
						points = points + 20
					end
					if zelle17 ~= 0 then
						points = points + 20
					end
					if zelle18 ~= 0 then
						points = points + 20
					end
					if zelle19 ~= 0 then
						points = points + 20
					end
					if zelle20 ~= 0 then
						points = points + 20
					end
					if zelle21 ~= 0 then
						points = points + 20
					end
					
					
					if round(points) == 0 then
						sendPlayerInfo(playerSource, "Dieses Fahrzeug hat keine Schäden.", true)
						return false
					end	
					
					local x, y, z = getElementPosition(vehicle)
					local rx, ry, rz = getVehicleRotation(vehicle)
					
					setElementPosition(playerSource, x + 1, y, z - 0.5)
					setPedRotation(playerSource, rz)
					
					setCameraMatrix(playerSource, x, y, z + 15, x, y, z)
					setPedAnimation(playerSource, "CAR", "Fixn_Car_Loop", -1, true, false, false)
					setElementCollisionsEnabled(playerSource, false)
					rpcCallClientFunction(playerSource, "adacStartMiniGame", round(points), vehicle)
					g_playerstat[playerSource]["Jobvar"]["Adac"]["Vehicle"] = vehicle
				else
					--sendPlayerInfo(playerSource, "")
					return false	
				end
			else
				sendPlayerInfo(playerSource, "Kein Fahrzeug in der Nähe gefunden", true)
				return false
			end
		else	
			sendPlayerInfo(playerSource, "Du darfst nicht in dem Fahrzeug sitzen!", true)
			return false
		end	
	end
end
addCommandHandler("fix", adacStartRepairVehicle)

function adacRepairVehicleDone(points)
	if isPlayerActiveInJob(client, 5) then
		local vehicle = g_playerstat[client]["Jobvar"]["Adac"]["Vehicle"]
		
		local price = round(points * 6)
		
		if isVehicleJobVehicle(vehicle) then
			giveStaatsKasse(round(price + price/8))
			sendPlayerInfo(client, "Du hast ein Staatsfahrzeug repariert. Dem Staat wurden "..price.."$ abgezogen.", true)
			if g_playerstat[client]["JobRank"][5] ~= 1 then
				addPlayerJobExtraMoney(client, round(price/8))
			end
		else
			giveStaatsKasse(price)
			takePlayerMoney(client, price)
			sendPlayerInfo(client, "Das Fahrzeug wurde repariert. Dir wurden "..price.."$ abgezogen. Du solltest "..tostring(round(price + price/8)).."$ verlangen!", true)
		end
		
		fixVehicle(vehicle)
		setElementHealth(vehicle, 1000)

		
		setCameraTarget(client, client)
		setPedAnimation(client)
		setElementCollisionsEnabled(client, true)
		local x, y, z = getElementPosition(vehicle)
		setElementPosition(client, x + 2, y + 2, z + 0.5)
	end
end

function adacRenewTuv(playerSource, commandName)
	if isPlayerActiveInJob(playerSource, 5) then
		local vehicle, distance = closestVehicle(playerSource)
		if vehicle then
			if distance < 6 then
				if getElementHealth(vehicle) > 900 then	
					local modelid = getElementModel(vehicle)
					local carid = modelid - 399
					if carTable[carid]["TUV"] == 0 then
						sendPlayerInfo(playerSource, "Dieses Fahrzeug benötigt keinen T".."ÜV.", true)
						return false
					end
					
					local time = getTimestamp()
					if carTable[carid]["TUV"] == 1 then
						local curTuv = g_vehiclestat[vehicle]["tuv"]
						local checkTuv = curTuv + 129600
						if checkTuv < time then
							local nexttuv = time + 1296000
							g_vehiclestat[vehicle]["tuv"] = nexttuv
							sendPlayerInfo(playerSource, "Der T".."ÜV wurde ab jetzt um 15 Tage verlängert.", true)
						else
							return false
						end	
					elseif carTable[carid]["TUV"] == 2 then
						local curTuv = g_vehiclestat[vehicle]["tuv"]
						local checkTuv = curTuv + 950400
						if checkTuv < time then
							local nexttuv = time + 950400
							g_vehiclestat[vehicle]["tuv"] = nexttuv
							sendPlayerInfo(playerSource, "Der T".."ÜV wurde ab jetzt um 11 Tage verlängert.", true)
						else
							return false
						end	
					elseif carTable[carid]["TUV"] == 3 then
						local curTuv = g_vehiclestat[vehicle]["tuv"]
						local checkTuv = curTuv + 604800
						if checkTuv < time then						
							local nexttuv = time + 604800
							g_vehiclestat[vehicle]["tuv"] = nexttuv
							sendPlayerInfo(playerSource, "Der T".."ÜV wurde ab jetzt um 7 Tage verlängert.", true)
						else 
							return false
						end	
					end
					
					if isVehicleJobVehicle(vehicle) then
						addPlayerJobExtraMoney(playerSource, 30)
						giveStaatsKasse(-30)
						outputChatBox(g_colors["red"].."Der T".."ÜV wird vom Staat bezahlt du bekommst 30$.", playerSource, 0, 0, 0, true)
					else
						takePlayerMoney(playerSource, 40)
						giveStaatsKasse(40)
						outputChatBox(g_colors["red"].."Dir wurden 40$ abgezogen, du soltest 70$ verlangen.", playerSource, 0, 0, 0, true)
					end
				else
					sendPlayerInfo(playerSource, "Das Fahrzeug ist zu beschädigt um den T".."ÜV zu erneuern.", true)
				end
			end	
		end	
	end	
end
addCommandHandler("maketuv", adacRenewTuv)

function adacSetVehicleSeized(playerSource, commandName)
	if isPlayerActiveInJob(playerSource, 5) then
		local vehicle, distance = closestVehicle(playerSource)
		if vehicle and distance < 10 then
			if isPlayerInBall(playerSource, 1808.9592285156, -1903.7839355469, 13.684513092041, 40) or isPlayerInBall(playerSource, -2042.1884765625, 159.70703125, 28.8359375, 40) or isPlayerInBall(playerSource, 1658.5339355469, 2199.5522460938, 10.8203125, 40) then
				if g_vehiclestat[vehicle]["adacSpawnX"] == 0 and g_vehiclestat[vehicle]["adacSpawnY"] == 0 and g_vehiclestat[vehicle]["adacSpawnZ"] == 0 then
					if not isVehicleJobVehicle(vehicle) then
						g_vehiclestat[vehicle]["adacSpawnX"], g_vehiclestat[vehicle]["adacSpawnY"], g_vehiclestat[vehicle]["adacSpawnZ"] = getElementPosition(vehicle)
						g_vehiclestat[vehicle]["adacSpawnRX"], g_vehiclestat[vehicle]["adacSpawnRY"], g_vehiclestat[vehicle]["adacSpawnRZ"] = getElementRotation(vehicle)
						sendPlayerInfo(playerSource, "Du hast das Fahrzeug erfolgreich beschlagnahmt.", true)
					else
						sendPlayerInfo(playerSource, "Jobfahrzeuge können nicht beschlagnahmt werden!", true)
					end
				else
					g_vehiclestat[vehicle]["adacSpawnX"] = 0
					g_vehiclestat[vehicle]["adacSpawnY"] = 0
					g_vehiclestat[vehicle]["adacSpawnZ"] = 0
					g_vehiclestat[vehicle]["adacSpawnRX"] = 0
					g_vehiclestat[vehicle]["adacSpawnRY"] = 0
					g_vehiclestat[vehicle]["adacSpawnRZ"] = 0
					sendPlayerInfo(playerSource, "Du hast das Fahrzeug erfolgreich wieder freigegeben.", true)					
				end
			end
		end
	end
end
addCommandHandler("seizveh", adacSetVehicleSeized)
