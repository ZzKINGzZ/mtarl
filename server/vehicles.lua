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



rpcRegisterGlobalFunction("setVehicleToRespawnWater")

local notLockableVehicles = {572, 568, 594, 606, 607, 611, 584, 608, 435, 450, 591, 539, 441, 464, 501, 465, 564, 472, 473, 493, 595, 484, 430, 453, 452, 446, 454, 581, 509, 481, 462, 521, 463, 510, 522, 461, 448, 468, 586, 425, 520}

g_vehicleID = {}
g_vehiclestat = {}

function initalizeVehicles()
	outputDebug("vehicles.lua start...")
	g_serverstat["Vehicles"] = 0
	
	local vehicles = mysql_query(g_mysql["connection"], "SELECT * FROM `vehicles`")
	if vehicles then
		while true do
			local row = mysql_fetch_assoc(vehicles)
			if not row then break end
			
			--Erstelle Fahrzeug aus der Datenbank
			g_serverstat["Vehicles"] = g_serverstat["Vehicles"] + 1
			
			local nummernschild = getZoneName(tonumber(row["spawnx"]), tonumber(row["spawny"]), tonumber(row["spawnz"]), true)
			local nummernschildSet = tostring(row["id"])
			
			if nummernschild == "Las Venturas" then
				nummernschildSet = "LV"..row["id"]
			elseif nummernschild == "Los Santos" then
				nummernschildSet = "LS"..row["id"]
			elseif nummernschild == "San Fierro" then
				nummernschildSet = "SF"..row["id"]
			end
			
			local vehicle = createVehicle(tonumber(row["modelid"]), tonumber(row["spawnx"]), tonumber(row["spawny"]), tonumber(row["spawnz"]), tonumber(row["spawnrx"]), tonumber(row["spawnry"]), tonumber(row["spawnrz"]), nummernschildSet)
			if vehicle then
				triggerEvent("onVehicleCreateMTARL", vehicle)
				
				g_vehiclestat[vehicle] = {}
				g_vehiclestat[vehicle]["spawnX"] = tonumber(row["spawnx"])
				g_vehiclestat[vehicle]["spawnY"] = tonumber(row["spawny"])
				g_vehiclestat[vehicle]["spawnZ"] = tonumber(row["spawnz"])
				g_vehiclestat[vehicle]["spawnRX"] = tonumber(row["spawnrx"])
				g_vehiclestat[vehicle]["spawnRY"] = tonumber(row["spawnry"])
				g_vehiclestat[vehicle]["spawnRZ"] =	tonumber(row["spawnrz"])
				
				setVehicleDamagePerPara(vehicle, tostring(row["damage"]))
				setElementHealth(vehicle, tonumber(row["health"]))
				
				if tonumber(row["health"]) < 250 then
					--setVehicleUnlimitedBurning(vehicle, true)
				end
				
				local color = table.load(row["color"])
				setVehicleColor(vehicle, color["r1"], color["g1"], color["b1"], color["r2"], color["g2"], color["b2"], color["r3"], color["g3"], color["b3"], color["r4"], color["g4"], color["b4"])
				
				--setVehicleColPerPara(vehicle, tostring(row["color"]))
				
				g_vehiclestat[vehicle]["ID"] = tonumber(row["id"])
				setElementData(vehicle, "ID", tonumber(row["id"]))
				g_vehicleID[tonumber(row["id"])] = vehicle
				
				setVehiclePaintjob(vehicle, tonumber(row["paintjob"]))
				
				g_vehiclestat[vehicle]["Specialcar"] = false
				if tostring(row["specialcar"]) ~= false then
					g_vehiclestat[vehicle]["Specialcar"] = tostring(row["specialcar"])
				end
				
				--Tuning
				---------ALTE VARIANTE
				--[[if tostring(row["tuning"]) ~= "false" then
					local msg = row["tuning"], runTo
					runTo = string.split(msg, "|")
					for _, msgVal in next,runTo do
						addVehicleUpgrade(vehicle, tonumber(msgVal))
					end
				end--]]
				
				---------NEUE VARIANTE, LIEST ALLES
				if tostring(row["tuning"]) ~= "false" then
					local tuning = table.load(row["tuning"])
					if tuning then
						if tuning["upgrades"] then
							for key, val in pairs(tuning["upgrades"]) do
								addVehicleUpgrade(vehicle, tonumber(val))
							end
						end	
						if tuning["headlight"] then
							setVehicleHeadLightColor(vehicle, tuning["headlight"]["red"], tuning["headlight"]["green"], tuning["headlight"]["blue"])
						end
						if tuning["tacho"] then
							setElementData(vehicle, "tacho", tuning["tacho"], true)
						end	
						if tuning["gps"] then
							if tuning["gps"] == true then
								g_vehiclestat[vehicle]["gps"] = true
							end
						end	
						if tuning["security"] then
							g_vehiclestat[vehicle]["safty"] = tonumber(tuning["security"])
							if not g_vehiclestat[vehicle]["safty"] then g_vehiclestat[vehicle]["safty"] = getCarSafty(tonumber(row["modelid"])) end
						end
					end
				end	
				
				--Handling
				--[[if row["handling"] then
					if row["handling"] ~= "false" and row["handling"] ~= "" and row["handling"] ~= " " then
						--setVehicleHandling(vehicle, table.load(row["handling"]))
						
						for key, val in pairs(table.load(row["handling"])) do
							--print(tostring(key).."|"..tostring(val))
							if key and val then
								--Da wir centerOfMass eh niemals ändern werden
								--lassen wir wie es ist
								if val ~= "centerOfMass" then
									setVehicleHandling(vehicle, key, val)		
								end
							end	
						end
					end
				end--]]	
				
				--T".."ÜV
				if tonumber(row["TUV"]) then
					g_vehiclestat[vehicle]["tuv"] = tonumber(row["TUV"])
				end
				
				--Wassertank
				if tonumber(row["watertank"]) then
					g_vehiclestat[vehicle]["watertank"] = tonumber(row["watertank"])
				end
								
				--Kilometer
				setElementData(vehicle, "km", tonumber(row["km"]))
				setElementData(vehicle, "km2", tonumber(row["km2"]))
				
				--Tank
				if getTankArt(tonumber(row["modelid"])) then
					setElementData(vehicle, "tankArt", getTankArt(tonumber(row["modelid"])))
				else 
					setElementData(vehicle, "tankArt", "none") 
				end
				setElementData(vehicle, "tank", tonumber(row["tank"]))
				
				g_vehiclestat[vehicle]["auftanken"] = false
				g_vehiclestat[vehicle]["tankstelle"] = false
				g_vehiclestat[vehicle]["tanker"] = false
				
				
				--[[Zusatz
				schon vorhanden
				g_vehiclestat[vehicle]["spawnx"] = tonumber(row["spawnx"])
				g_vehiclestat[vehicle]["spawny"] = tonumber(row["spawny"])
				g_vehiclestat[vehicle]["spawnz"] = tonumber(row["spawnz"])
				g_vehiclestat[vehicle]["spawnrx"] = tonumber(row["spawnrx"])
				g_vehiclestat[vehicle]["spawnry"] = tonumber(row["spawnry"])
				g_vehiclestat[vehicle]["spawnrz"] = tonumber(row["spawnrz"])--]]

				--Verwahrung bei ADAC
				g_vehiclestat[vehicle]["adacSpawnX"] = tonumber(row["adacspawnx"])
				g_vehiclestat[vehicle]["adacSpawnY"] = tonumber(row["adacspawny"])
				g_vehiclestat[vehicle]["adacSpawnZ"] = tonumber(row["adacspawnz"])
				g_vehiclestat[vehicle]["adacSpawnRX"] = tonumber(row["adacspawnrx"])
				g_vehiclestat[vehicle]["adacSpawnRY"] = tonumber(row["adacspawnry"])
				g_vehiclestat[vehicle]["adacSpawnRZ"] =	tonumber(row["adacspawnrz"])

				if g_vehiclestat[vehicle]["adacSpawnX"] ~= 0 and g_vehiclestat[vehicle]["adacSpawnY"] ~= 0 and g_vehiclestat[vehicle]["adacSpawnZ"]~= 0 then
					if not isVehicleJobVehicle(vehicle) then
						setElementPosition(vehicle, g_vehiclestat[vehicle]["adacSpawnX"], g_vehiclestat[vehicle]["adacSpawnY"], g_vehiclestat[vehicle]["adacSpawnZ"]+0.5 )
						setElementRotation(vehicle, g_vehiclestat[vehicle]["adacSpawnRX"], g_vehiclestat[vehicle]["adacSpawnRY"], g_vehiclestat[vehicle]["adacSpawnRZ"])
					end
				end
				
				--Gameplayverbesserung
				toggleVehicleRespawn(vehicle, false)
				setVehicleDoorsUndamageable(vehicle, true)
				setVehicleFuelTankExplodable(vehicle, false)
				setVehicleOverrideLights(vehicle, 1)
				setVehicleLocked(vehicle, true)	
				setVehicleDamageProof(vehicle, true) --Fahrzeuge undamagabel machen, wenn keiner die fährt
				
				--Radio
				setElementData(vehicle, "radioChannel", 0)
				
				triggerEvent("onVehicleSetVarsMTARL", vehicle)
				
				--Züge non-derailable
				if getVehicleType(vehicle) == "Train" then
					setTrainDerailable(vehicle, false)
				end				
			end	
		end
		mysql_free_result(vehicles)		
	end		
end

function deinitalizeVehicles()
	outputDebug("vehicles.lua shutdown...")
	if shouldServerShutDownFast() then return true end
	
	local vehicles = mysql_query(g_mysql["connection"], "SELECT * FROM `vehicles`")
	if vehicles then
		while true do
			local row = mysql_fetch_assoc(vehicles)
			if not row then break end
			
			if row["id"] then
				local vehicle = g_vehicleID[tonumber(row["id"])]
				if vehicle then
					if not g_vehiclestat[vehicle]["tempcar"] then
						triggerEvent("onVehicleDeleteMTARL", vehicle)
						
						--Tuning
						local upgrades = getVehicleUpgrades(vehicle)
						local hasTuning = false
						local tuning = {}
						
						if upgrades then
							hasTuning = true
							tuning["upgrades"] = {}
							for key, val in ipairs(upgrades) do
								table.insert(tuning.upgrades, val)
							end
						end
						
						local r, g, b = getVehicleHeadLightColor(vehicle)
						if r ~= 255 or g ~= 255 or b ~= 255 then
							hasTuning = true
							tuning["headlight"] = {}
							tuning["headlight"]["red"] = r
							tuning["headlight"]["green"] = g
							tuning["headlight"]["blue"] = b
						end
						
						--Handling
						local handlingString = table.save(getVehicleHandling(vehicle))
						
						local tacho = getElementData(vehicle, "tacho")
						if tacho then
							hasTuning = true
							tuning["tacho"] = tacho
						end
						
						if g_vehiclestat[vehicle]["gps"] then
							if g_vehiclestat[vehicle]["gps"] == true then
								hasTuning = true
								tuning["gps"] = true
							end
						end
						
						if g_vehiclestat[vehicle]["safty"] then
							tuning["security"] = g_vehiclestat[vehicle]["safty"]
						end
						
						local tuningSet = "false"
						if hasTuning then tuningSet = table.save(tuning) end
						
						
						local specialcar = "false"
						if g_vehiclestat[vehicle]["Specialcar"] then specialcar = g_vehiclestat[vehicle]["Specialcar"] end
						
						local color = {}
						color["r1"], color["g1"], color["b1"], color["r2"], color["g2"], color["b2"], color["r3"], color["g3"], color["b3"], color["r4"], color["g4"], color["b4"] = getVehicleColor(vehicle, true)
						color = table.save(color)
						
						if specialcar ~= "Temp" then
							local query = "UPDATE `vehicles` SET `health` = '"..getElementHealth(vehicle).."',\
																   `damage` = '"..getVehicleDamagePerPara(vehicle).."',\
																   `color` = '"..tostring(color).."',\
																   `paintjob` = '"..getVehiclePaintjob(vehicle).."',\
																   `specialcar` = '"..tostring(specialcar).."',\
																   `km` = '"..getElementData(vehicle, "km").."',\
																   `km2` = '"..getElementData(vehicle, "km2").."',\
																   `tuning` = '"..tostring(tuningSet).."',\
																   `handling` = '"..tostring(handlingString).."',\
																   `tank` = '"..getVehicleFullTankByModel(getElementModel(vehicle)).."',\
																   `TUV` = '"..tostring(g_vehiclestat[vehicle]["tuv"]).."', \
																   `watertank` = '"..tostring(g_vehiclestat[vehicle]["watertank"]).."', \
																   `adacspawnx` = '"..tostring(g_vehiclestat[vehicle]["adacSpawnX"]).."', \
																   `adacspawny` = '"..tostring(g_vehiclestat[vehicle]["adacSpawnY"]).."', \
																   `adacspawnz` = '"..tostring(g_vehiclestat[vehicle]["adacSpawnZ"]).."', \
																   `adacspawnrx` = '"..tostring(g_vehiclestat[vehicle]["adacSpawnRX"]).."', \
																   `adacspawnry` = '"..tostring(g_vehiclestat[vehicle]["adacSpawnRY"]).."', \
																   `adacspawnrz` = '"..tostring(g_vehiclestat[vehicle]["adacSpawnRZ"]).."' \
										   WHERE `vehicles`.`id` ="..row["id"].." LIMIT 1;"
											 			   
							local res = mysql_query(g_mysql["connection"], query)
							if not res then
								outputDebug("Fahrzeug konnte nicht gespeichert werden: "..row["id"])
							else
								outputDebug("Fahrzeug erfolgreich gespeichert: "..row["id"])
							end
						end	
					end	
				end	
			end	
		end
		mysql_free_result(vehicles)
	end	
end

function getVehicleFullTankByModel(model)
	for k, v in pairs(carTable) do -- Use pairs for security (if a number is missing, function isn't working with ipairs)
		if v.id == model then
			return v.id
		end
	end
	return false
end

function lockVehicle(playerSource)
	if playerSource then
		local vehicle, distance = closestVehicle(playerSource)
		if vehicle then
			if getVehicleType(vehicle) ~= "Trailer" then
				if distance < 10 then
					local vehicleid = g_vehiclestat[vehicle]["ID"]
					
					local isJob, jobID = isVehicleJobVehicle(vehicle)
					if isJob then
						if isPlayerActiveInJob(playerSource, jobID) then
							if isVehicleLocked(vehicle) then
								--Offnen
								setVehicleLocked(vehicle, false)
								outputChatBox(g_colors["yellow"].."Du hast das Fahrzeug aufgeschlossen!", playerSource, 255, 255, 255, true)
								playSoundFrontEnd(playerSource, 42)
							else
								--Schließen
								setVehicleLocked(vehicle, true)
								outputChatBox(g_colors["yellow"].."Du hast das Fahrzeug abgeschlossen!", playerSource, 255, 255, 255, true)
								playSoundFrontEnd(playerSource, 41)
							end						
						end
					else
						if g_playerstat[playerSource]["Key"][vehicleid] == 1 or g_playerstat[playerSource]["Key"][vehicleid] == 2 then
							if isVehicleLocked(vehicle) then
								--Offnen
								setVehicleLocked(vehicle, false)
								outputChatBox(g_colors["yellow"].."Du hast das Fahrzeug aufgeschlossen!", playerSource, 255, 255, 255, true)
								playSoundFrontEnd(playerSource, 42)
							else
								--Schliessen
								setVehicleLocked(vehicle, true)
								outputChatBox(g_colors["yellow"].."Du hast das Fahrzeug abgeschlossen!", playerSource, 255, 255, 255, true)
								playSoundFrontEnd(playerSource, 41)
							end
						end
					end	
				end
			end
		end	
	end
end

addEventHandler('onResourceStart', getResourceRootElement(), initalizeVehicles)
addEventHandler('onResourceStop', getResourceRootElement(), deinitalizeVehicles)

--------------------------------------------
--Vehicle Commands
--------------------------------------------
function giveKeyToUser(playerSource, commandName, playerName)
	if not playerName then
		outputChatBox(g_colors["red"].."Du musst einen Spieler angeben!", playerSource, 255, 255, 255, true)
		return false
	end	
	local newPlayer = getPlayerFromName(playerName)
	if not newPlayer then
		outputChatBox(g_colors["red"].."Dieser Spieler exestiert nicht oder ist nicht verbunden!", playerSource, 255, 255, 255, true)
		return false
	end
	local vehicle, distance = closestVehicle(playerSource)
	if vehicle then
		if distance < 10 then
			local vehicleid = g_vehiclestat[vehicle]["ID"]
			if g_playerstat[playerSource]["Key"][vehicleid] == 2 then	
				g_playerstat[newPlayer]["Key"][vehicleid] = 1
				--outputChatBox(g_colors["darkorange"].."Du hast "..playerName.." einen Schlüssel fuer dein Auto gegeben ("..getVehicleName(vehicle)..")!", playerSource, 255, 255, 255, true)
				sendPlayerInfo(playerSource, "Du hast "..playerName.." einen Schlüssel fuer dein Fahrzeug gegeben ("..getVehicleName(vehicle)..").")
				--outputChatBox(g_colors["darkorange"]..""..getPlayerName(playerSource).." hat dir einen Schlüssel fuer dein Auto gegeben ("..getVehicleName(vehicle)..")!", newPlayer, 255, 255, 255, true)
				sendPlayerInfo(newPlayer, getPlayerName(playerSource).." hat dir einen Schlüssel fuer sein Fahrzeug gegeben ("..getVehicleName(vehicle)..").")
			end
		else
			outputChatBox(g_colors["red"].."Es ist kein Fahrzeug in der Nähe!", playerSource, 255, 255, 255, true)
			return false
		end
	else
		outputChatBox(g_colors["red"].."Du musst neben einem Fahrzeug stehen das dir gehoert!", playerSource, 255, 255, 255, true)
		return false
	end
end
addCommandHandler("givekey", giveKeyToUser)

function makeUserOwner(playerSource, commandName, playerName)
	if not playerName then
		outputChatBox(g_colors["red"].."Du musst einen Spieler angeben!", playerSource, 255, 255, 255, true)
		return false
	end	
	local newPlayer = getPlayerFromName(playerName)
	if not newPlayer then
		outputChatBox(g_colors["red"].."Dieser Spieler exestiert nicht oder ist nicht verbunden!", playerSource, 255, 255, 255, true)
		return false
	end
	local vehicle, distance = closestVehicle(playerSource)
	if vehicle then
		if distance < 10 then
			local vehicleid = g_vehiclestat[vehicle]["ID"]
			if g_playerstat[playerSource]["Key"][vehicleid] == 2 or g_playerstat[playerSource]["Level"] == "Admin" then	
				g_playerstat[playerSource]["Keys"] = g_playerstat[playerSource]["Keys"] - 1
				g_playerstat[newPlayer]["Keys"] = g_playerstat[newPlayer]["Keys"] + 1
				g_playerstat[playerSource]["Key"][vehicleid] = 0
				g_playerstat[newPlayer]["Key"][vehicleid] = 2
				--outputChatBox(g_colors["darkorange"].."Du hast "..playerName.." deinen Wagen gegeben ("..getVehicleName(vehicle)..")!", playerSource, 255, 255, 255, true)
				sendPlayerInfo(playerSource, "Du hast "..playerName.." zum neuen Eigentümer deines Fahrzeugs gemacht ("..getVehicleName(vehicle)..").")
				--outputChatBox(g_colors["darkorange"]..""..getPlayerName(playerSource).." hat dich zum Eigentümer seines Fahrzeugs gemacht ("..getVehicleName(vehicle)..")!", newPlayer, 255, 255, 255, true)
				sendPlayerInfo(newPlayer, getPlayerName(playerSource).." hat dich zum Eigentümer seines Fahrzeugs gemacht ("..getVehicleName(vehicle)..").")
			end
		else
			outputChatBox(g_colors["red"].."Es ist kein Fahrzeug in der Nähe!", playerSource, 255, 255, 255, true)
			return false
		end
	else
		outputChatBox(g_colors["red"].."Du musst neben einem Fahrzeug stehen das dir gehört!", playerSource, 255, 255, 255, true)
		return false
	end
end
addCommandHandler("makeowner", makeUserOwner)

function changeVehicleLight(playerSource)
	if isPedInVehicle(playerSource) then
		local playerVehicle = getPedOccupiedVehicle(playerSource)
		local playerSeat = getPedOccupiedVehicleSeat(playerSource)
		if playerSeat == 0 then
			if getVehicleOverrideLights (playerVehicle) ~= 2  then
	            setVehicleOverrideLights (playerVehicle, 2)
				if getElementModel(playerVehicle) == 420 or getElementModel(playerVehicle) == 438 then
					setVehicleTaxiLightOn(playerVehicle, true)
				end
	        else		
	            setVehicleOverrideLights(playerVehicle, 1)
				if getElementModel(playerVehicle) == 420 or getElementModel(playerVehicle) == 438 then
					setVehicleTaxiLightOn(playerVehicle, false)
				end
	        end
		end	
	end
end

function changeVehicleEngine(playerSource)
	if isPedInVehicle(playerSource) then
		local playerVehicle = getPedOccupiedVehicle(playerSource)
		local playerSeat = getPedOccupiedVehicleSeat(playerSource)
		if playerSeat == 0 then
			local state = getVehicleEngineState(playerVehicle)
			if state == true then
				setVehicleEngineState(playerVehicle, false)
			else
				setVehicleEngineState(playerVehicle, true)
			end
		end
	end	
end

function createVehicleMTARL(modelid, x, y, z, rx, ry, rz, playerkey, specialcar)
	if not specialcar then specialcar = "false" end
	mysql_query(g_mysql["connection"] , "INSERT INTO `vehicles` (`id`, `handling`) VALUES (NULL, 'false');")
	
	local newTUV = getRealTime() 
	local ntuv = newTUV.yearday + 20
	
	local model = tonumber(modelid)
	if model == 601 or model == 407 then
		wtank = 100
	else
		wtank = -1
	end
	
	local lastid = mysql_insert_id(g_mysql["connection"])
	if lastid == 0 then 
		return false 
	end
	
	local color = {}
	color["r1"], color["g1"], color["b1"], color["r2"], color["g2"], color["b2"], color["r3"], color["g3"], color["b3"], color["r4"], color["g4"], color["b4"] = 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
	color = table.save(color)	
	
	mysql_query(g_mysql["connection"] , "UPDATE `vehicles` SET `modelid` = '"..modelid.."' ,\
												`spawnx` = '"..x.."' ,\
												`spawny` = '"..y.."', \
												`spawnz` = '"..z.."', \
												`spawnrx` = '"..rx.."', \
												`spawnry` = '"..ry.."', \
												`spawnrz` = '"..rz.."', \
												`health` = '1000', \
												`damage` = '0|0|0|0|0|0|255|255|255|0|0|0|0|0|0|0|0|0|0|0|0', \
												`color` = '"..color.."', \
												`paintjob` = '3', \
												`handling` = 'false',\
												`specialcar` = '"..specialcar.."', \
												`tuning` = 'false', \
												`km` = '0', \
												`km2` = '0', \
												`tank` = '10', \
												`TUV` = '"..ntuv.."', \
												`watertank` = '"..wtank.."' \
										WHERE `id` = "..lastid.." LIMIT 1 ;")								
										
	local vehicle = createVehicle(modelid, x, y, z, rx, ry, rz, tostring(lastid))	
	triggerEvent("onVehicleCreateMTARL", vehicle)
	setVehicleColor(vehicle, 1, 1, 1, 1)

	g_vehiclestat[vehicle] = {}
	g_vehiclestat[vehicle]["ID"] = tonumber(lastid)	
	setElementData(vehicle, "ID", tonumber(lastid))
	g_vehicleID[tonumber(lastid)] = vehicle
	
	if specialcar then
		g_vehiclestat[vehicle]["Specialcar"] = specialcar
	else
		g_vehiclestat[vehicle]["Specialcar"] = false
	end	
	
	toggleVehicleRespawn(vehicle, false)
	setVehicleDoorsUndamageable(vehicle, true)
	setVehicleFuelTankExplodable(vehicle, false)
	setVehicleOverrideLights(vehicle, 1)
	setVehicleLocked(vehicle, true)	
	
	if playerkey ~= false then
		g_playerstat[playerkey]["Key"][lastid] = 2
		g_playerstat[playerkey]["Keys"] = g_playerstat[playerkey]["Keys"] + 1
	end	

	g_vehiclestat[vehicle]["tuv"] = ntuv
	
	setElementData(vehicle, "km", 0)
	setElementData(vehicle, "km2", 0)
	
	setElementData(vehicle, "tankArt", getTankArt(modelid))
	setElementData(vehicle, "tank", getVehicleFullTankByModel(model))
	g_vehiclestat[vehicle]["auftanken"] = false
	g_vehiclestat[vehicle]["tanker"] = false
	g_vehiclestat[vehicle]["tankstelle"] = false
	
	g_vehiclestat[vehicle]["adacSpawnX"] = 0
	g_vehiclestat[vehicle]["adacSpawnY"] = 0
	g_vehiclestat[vehicle]["adacSpawnZ"] = 0
	g_vehiclestat[vehicle]["adacSpawnRX"] = 0
	g_vehiclestat[vehicle]["adacSpawnRY"] = 0
	g_vehiclestat[vehicle]["adacSpawnRZ"] = 0
	
	if model == 601 or model == 407 then
		g_vehiclestat[vehicle]["watertank"] = 100
	else
		g_vehiclestat[vehicle]["watertank"] = -1
	end
	
	--Radio
	setElementData(vehicle, "radioChannel", 0)
	
	--Zuge non-derailable
	if getVehicleType(vehicle) == "Train" then
		setTrainDerailable(vehicle, false)
	end
	
	addEventHandler("onVehicleExplode", vehicle,
		function()
			setTimer(deleteVehicleMTARL, 5000, 1, source)
		end
	)
	
	if vehicle then
		return vehicle
	end
	return false	
end

function createTempVehicleMTARL(model, x, y, z, rx, ry, rz)
	local vehicle = createVehicle(model, x, y, z, rx, ry, rz, "Temp")	
	setVehicleColor(vehicle, 0, 0, 1, 1)
	g_vehiclestat[vehicle] = {}
	
	toggleVehicleRespawn(vehicle, false)
	setVehicleDoorsUndamageable(vehicle, true)
	setVehicleFuelTankExplodable(vehicle, false)
	setVehicleOverrideLights(vehicle, 1)
	setVehicleLocked(vehicle, true)	
	
	setVehicleLocked (vehicle, false)
	
	g_vehiclestat[vehicle]["Specialcar"] = false
	
	g_vehiclestat[vehicle]["tempcar"] = true
	
	setElementData(vehicle, "km", 0)
	setElementData(vehicle, "km2", 0)
	
	setElementData(vehicle, "tankArt", getTankArt(modelid))
	setElementData(vehicle, "tank", getMaxTank(model))
	g_vehiclestat[vehicle]["auftanken"] = false
	g_vehiclestat[vehicle]["tanker"] = false
	g_vehiclestat[vehicle]["tankstelle"] = false
	
	g_vehiclestat[vehicle]["watertank"] = 100
	
	g_vehiclestat[vehicle]["adacSpawnX"] = 0
	g_vehiclestat[vehicle]["adacSpawnY"] = 0
	g_vehiclestat[vehicle]["adacSpawnZ"] = 0
	g_vehiclestat[vehicle]["adacSpawnRX"] = 0
	g_vehiclestat[vehicle]["adacSpawnRY"] = 0
	g_vehiclestat[vehicle]["adacSpawnRZ"] = 0
	
	--Radio
	setElementData(vehicle, "radioChannel", 0)

	--Züge non-derailable
	if getVehicleType(vehicle) == "Train" then
		setTrainDerailable(vehicle, false)
	end
	
	-- Detroy vehicle after it has been exploded (5 seconds later)
	addEventHandler("onVehicleExplode", vehicle,
		function()
			setTimer(deleteTempVehicleMTARL, 5000, 1, source)
		end
	)
	
	if vehicle then
		return vehicle
	end
	return false
end

function deleteTempVehicleMTARL(vehicle)
	g_vehiclestat[vehicle] = nil
	destroyElement(vehicle)
	
	
	if not g_vehiclestat[vehicle] then return true end
	return false
end

function deleteVehicleMTARL(vehicle)
	local vehicleid = g_vehiclestat[vehicle]["ID"]
	triggerEvent("onVehicleDeleteMTARL", vehicle)
	g_vehiclestat[vehicle] = nil
		
	destroyElement(vehicle)
	
	mysql_query(g_mysql["connection"], "DELETE FROM `vehicles` WHERE `id` = '"..vehicleid.."' LIMIT 1")
	
	for i, player in ipairs(getElementsByType("player")) do
		if g_playerstat[player] then
			if g_playerstat[player]["Key"][vehicleid] == 2 then
				g_playerstat[player]["Key"][vehicleid] = nil
				g_playerstat[player]["Keys"] = g_playerstat[player]["Keys"] - 1
			elseif g_playerstat[player]["Key"][vehicleid] == 1 then
				g_playerstat[player]["Key"][vehicleid] = nil
			end
		end
	end
	
	if not g_vehiclestat[vehicle] then return true end
	return false
end

function getVehicleOwner(vehicle)
	local vehicleID = -1
	if isElement(vehicle) then
		vehicleID = g_vehiclestat[vehicle]["ID"]
	end
	if type(vehicle) == "number" then
		vehicleID = vehicle
	end
	if (vehicleID == -1) or (vehicleID == nil) then return false end
	
	local sql = "SELECT *\
				FROM `keys`\
				LEFT JOIN `players` ON keys.playerid = players.id\
				WHERE keys.fahrzeugid ="..vehicleID..";"
	
	local res = mysql_query(g_mysql["connection"], sql)
	if not res then return false end
	
	local row = mysql_fetch_assoc(res)
	if not row then return false end
	
	local playerName = row["playername"]
	local playerID = row["id"]
	
	mysql_free_result(res)
	
	if not playerName then return false end
	
	return playerName, playerID
end

function setVehicleToRespawnWater(vehicle)
	if vehicle then
		if g_vehiclestat[vehicle] then
			if not g_vehiclestat[vehicle]["tempcar"] == true then
				setElementPosition(vehicle, g_vehiclestat[vehicle]["spawnX"], g_vehiclestat[vehicle]["spawnY"], g_vehiclestat[vehicle]["spawnZ"])
				setVehicleRotation(vehicle, g_vehiclestat[vehicle]["spawnRX"], g_vehiclestat[vehicle]["spawnRY"], g_vehiclestat[vehicle]["spawnRZ"])
			else
				destroyElement(vehicle)
			end
		end
	end	
end

function isVehicleNotLockable(veh)
	for i, vehicleID in pairs(notLockableVehicles) do
		if vehicleID == getElementModel(veh) then
			return true
		end
	end
	return false
end

local function setDamageTrue(player, seat, jacked)	
	if isVehicleLocked(source) then
		if isVehicleNotLockable(source) then
			cancelEvent()
			return false
		else
			--if getVehicleDoorOpenRatio(source, 0) ~= 0 or getVehicleDoorOpenRatio(source, 1) ~= 0 or getVehicleDoorOpenRatio(source, 2) ~= 0 or getVehicleDoorOpenRatio(source, 3) ~= 0 or getVehicleDoorOpenRatio(source, 4) ~= 0 or getVehicleDoorOpenRatio(source, 5) ~= 0 then
			if isVehicleEnterableWithoutRights(source) then
				cancelEvent()
				return false
			end
		end
	end
		
	if g_vehiclestat[source]["adacSpawnX"] ~= 0 and g_vehiclestat[source]["adacSpawnY"] ~= 0 and g_vehiclestat[source]["adacSpawnZ"]~= 0 then
		if not isPlayerActiveInJob(player, 5) or isPlayerActiveInJob(player, 4) then
			sendPlayerInfo(player, "Diese Fahrzeug wurde abgeschleppt. Nur ein ADAC Mitarbeiter kann das Fahrzeug wieder freigeben!")
			cancelEvent()
			return false
		end
	end
	
	if seat == 0 then
		setVehicleDamageProof(source, false) --Nehmen wir den Unzerstörbarmodus
		setVehicleDoorsUndamageable(source, false) --Damit die Türen kaputt gehen
	end	
	
	--Gebrauchtwagen:
	--local orginalHandling = getOriginalHandling(getElementModel(source))
	--local currentHandling = getVehicleHandling(source)
	
	--Reifenlager
	--steeringLock
	--[[if getElementData(source, "km") > 100000 then
		if orginalHandling["steeringLock"] == currentHandling["steeringLock"] then
			--Kilometer - Wahrscheinlichkeitszahl
			--100000 - 1000
			--Denkpause, Zeit zum schlafen: 5:34 Uhr
			
			--100.000 km - 10.000 Wahrscheinlichkeit
			--1.000.000 km - 10 Wahrscheinlichkeit
			-- X KM - Y Wahrscheinlichkeit
			-- a/(1e5 - b) = 1e4, a/(1e6 - b)
			-- y = a/(x - b)
			--{b = 99099.09910, a = 0.9009009009 10^7
			--solve({ a/(1e5 - b) = 1e4, a/(1e6 - b) = 10 }, { a, b });
			--a = 0.9009009009*10^7
		end
	end--]]
end
addEventHandler("onVehicleStartEnter", getRootElement(), setDamageTrue)

local function setDamageFalse(player, seat, jacker)
	if seat == 0 then
		setVehicleDamageProof(source, true) --Und geben wir ihn wieder
		setVehicleDoorsUndamageable(source, true) --Damit die Türen nicht kaputt gehen
	end	
end
addEventHandler("onVehicleStartExit", getRootElement(), setDamageFalse)

local function checkTUV(playerSource, commandName)
	local vehicle, distance = closestVehicle(playerSource)
	if vehicle then
		if distance < 7 then
			local time = getTimestamp()
			local restTime = g_vehiclestat[vehicle]["tuv"] - time
			local restMin = restTime/60
			local restH = restMin/60
			local restDays = restH/24
			if restTime > 0 then
				outputChatBox(g_colors["red"].."Der T".."ÜV ist noch "..math.ceil(tostring(restDays)).." Tage gültig!", playerSource, 0, 0, 0, true)
			else
				outputChatBox(g_colors["red"].."Der T".."ÜV ist abgelaufen!", playerSource, 0, 0, 0, true)
			end
		end
	end
end
addCommandHandler("checktuv", checkTUV)

function detachTrailer(playerSource, commandName)
	local vehicle = getPedOccupiedVehicle(playerSource)
	if vehicle then
		if getPedOccupiedVehicleSeat(playerSource) == 0 then
			local trailer = getVehicleTowedByVehicle(vehicle)
			if trailer then
				detachTrailerFromVehicle(vehicle, trailer)
			end
		end
	end	
end
addCommandHandler("detach", detachTrailer)

local function vehicleDamage(loss)
	if loss > 60 then
		local occupants = getVehicleOccupants(source)
		loss = loss / 10
		if occupants then
			for i, occupant in pairs(occupants) do
				local health = getElementHealth(occupant) - loss
				setElementHealth(occupant, health)
				rpcCallClientFunction(occupant, "triggerPlayerDamage")
				if health < 1 then
					removePedFromVehicle(occupant)
					killPed(occupant)
				end	
			end
		end
	end
end
addEventHandler("onVehicleDamage", getRootElement(), vehicleDamage)

local function removeTempCars()
	for key, vehicle in ipairs(getElementsByType("vehicle")) do
		if g_vehiclestat[vehicle] then
			if g_vehiclestat[vehicle]["tempcar"] == true then
				if getElementModel(vehicle) == 510 then
					deleteTempVehicleMTARL(vehicle)
				end
			end
		end	
	end
end
addEventHandler("onDayFinished", getRootElement(), removeTempCars)
