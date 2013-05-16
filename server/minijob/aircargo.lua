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



local airMarker = {}
local airBlip = {}

local function initAirCargo()
	addJob(11, "AirCargo", true, 220, 220, 220)
	addJobLocation(11, 1, 1668.759765625, 1566.658203125, 10.779090881348, 0, 0)
	
	registerJobFunction(11, "onPlayerEnterJob", airCrewEnterJob)
	registerJobFunction(11, "onPlayerLeaveJob", airCrewLeaveJob)
		
	airMarker[1] = createMarker ( 1896.9111328125, -2385.0576171875, 12.53911781311, "cylinder", 25, 3, 50, 150)
	airMarker[2] = createMarker (-1410.9697265625, -588.916015625, 13.1484375, "cylinder", 25, 3, 50, 150)
	airMarker[3] = createMarker ( 424.23046875, 2504.3076171875, 15.484375, "cylinder", 25, 3, 50, 150)
	airMarker[4] = createMarker ( 1601.5859375, 1606.158203125, 9.8203125, "cylinder", 25, 3, 50, 150)
	
	airBlip[1] = createBlip ( 1896.9111328125, -2385.0576171875, 12.53911781311, 5, 0, 0, 0, 255)
	airBlip[2] = createBlip (-1410.9697265625, -588.916015625, 13.1484375, 5, 0, 0, 0, 255)
	airBlip[3] = createBlip ( 424.23046875, 2504.3076171875, 15.484375, 5, 0, 0, 0, 255)
	airBlip[4] = createBlip ( 1601.5859375, 1606.158203125, 9.8203125, 5, 0, 0, 0, 255)
	
	for number = 1, #airMarker, 1 do
		setElementVisibleTo(airBlip[number], getRootElement(), false)
		setElementVisibleTo(airMarker[number], getRootElement(), false)
		addEventHandler("onMarkerHit", airMarker[number], airMarkerHit)
	end
end
addEventHandler("onResourceStart", getResourceRootElement(), initAirCargo)

function airCrewEnterJob(playerSource, staticJobID, locationID, playerJobRank)
	setElementModel(playerSource, 61)
	
	--Fahrzeug erstellen
	local veh = createTempVehicleMTARL(548, 1652.380859375, 1560.5, 12.466816902161, 0.90087890625, 359.76379394531, 60.847778320313)
	g_vehiclestat[veh]["AirCar"] = true
	
	sendPlayerInfo(playerSource, "Wilkommen, im Minijob Air Cargo! In diesem Job musst du Luftfracht Transportieren.\n\nSteige nun in dein Flugzeug!")
	
	--Marker+Blip
	local rand = math.random(#airMarker)	
	setElementVisibleTo(airMarker[rand], playerSource, true)
	setElementVisibleTo(airBlip[rand], playerSource, true)
	
	--Jobvars
	g_playerstat[playerSource]["Jobvar"] = {}
	g_playerstat[playerSource]["Jobvar"]["AirCargo"] = {}
	g_playerstat[playerSource]["Jobvar"]["AirCargo"]["Timer"] = -1
	g_playerstat[playerSource]["Jobvar"]["AirCargo"]["Car"] = veh
end

function airCrewLeaveJob(playerSource, staticJobID, locationID, playerJobRank)
	local veh = g_playerstat[playerSource]["Jobvar"]["AirCargo"]["Car"]
	setElementModel(playerSource, g_playerstat[playerSource]["Skin"])
	
	--Fahrzeug löschen
	if g_vehiclestat[veh]["tempcar"] == true then
		if g_vehiclestat[veh]["AirCar"] == true then
			deleteTempVehicleMTARL(veh)
		end
	end
	
	--Maker + Blip unsichtbar machen
	for number = 1, #airMarker, 1 do
		setElementVisibleTo(airBlip[number], playerSource, false)
		setElementVisibleTo(airMarker[number], playerSource, false)
	end
	
	--Jobvars reseten
	g_playerstat[playerSource]["Jobvar"]["AirCargo"] = nil
end

function leaveCarAir(player, seat, jacker)
	if isPlayerActiveInJob(player, 11) then
		if getElementModel(source) == 548 then
			if g_vehiclestat[source]["AirCar"] == true then
				g_playerstat[player]["Jobvar"]["AirCargo"]["Car"] = source
				sendPlayerInfo(player, "Du hast dein Flugzeug verlassen. Steige innerhalb von 10 Sekunden wieder ein!")
				g_playerstat[player]["Jobvar"]["AirCargo"]["Timer"] = 10
			end
		end
	end
end
addEventHandler("onVehicleExit", getRootElement(), leaveCarAir)

function enterCarAir(player, seat, jacked)
	if isPlayerActiveInJob(player, 11) then
		if getElementModel(source) == 548 then
			if g_vehiclestat[source]["AirCar"] == true then
				g_playerstat[player]["Jobvar"]["AirCargo"]["Car"] = source
				sendPlayerInfo(player, "Fliege nun zum Flughafen und liefere deine Ware ab. Dein Ziel ist nun auf der Karte sichtbar!")
				g_playerstat[player]["Jobvar"]["AirCargo"]["Timer"] = -1
			else
				sendPlayerInfo(player, "Das ist kein AirCargo Fahrzeug!")
			end
		end
	end
end
addEventHandler("onVehicleEnter", getRootElement(), enterCarAir)

function airMarkerHit(playerSource)
	if getElementType(playerSource) == "player" then
		if isPlayerActiveInJob(playerSource, 11) then
			local vehicle = getPedOccupiedVehicle(playerSource)
			if vehicle then
				if getElementModel(vehicle) == 548 then
					if g_vehiclestat[vehicle]["AirCar"] == true then
						if isElementVisibleTo(source, playerSource) then
							--Unsichtbar machen
							for number = 1, #airMarker, 1 do
								setElementVisibleTo(airBlip[number], playerSource, false)
								setElementVisibleTo(airMarker[number], playerSource, false)
							end
								
							--Neuen setzen
							local rand = math.random(#airMarker)							
							setElementVisibleTo(airMarker[rand], playerSource, true)
							setElementVisibleTo(airBlip[rand], playerSource, true)
							
							--Geld geben
							giveStaatsKasse(-30)
							givePlayerMoney(playerSource, 30)
							sendPlayerInfo(playerSource, "Hervorragend! Fliege jetzt zum Nächsten Flughafen! Du hast 30$ erhalten.")
						end	
					end	
				end
			end	
		end	
	end	
end

function destroyTempCarAir()
	if g_playerstat[source]["Jobvar"]["AirCargo"] then
		local vehicle = g_playerstat[source]["Jobvar"]["AirCargo"]["Car"]
		if g_vehiclestat[vehicle]["tempcar"] == true then
			if g_vehiclestat[vehicle]["AirCar"] == true then
				deleteTempVehicleMTARL(vehicle)
			end
		end
	end
end
addEventHandler("onPlayerLogoutMTARL", getRootElement(), destroyTempCarAir)

--MTA:RL Internes Event
function timerCargo()
	if g_playerstat[source]["Jobvar"]["AirCargo"] then
		if g_playerstat[source]["Jobvar"]["AirCargo"]["Timer"] > 0 then
			g_playerstat[source]["Jobvar"]["AirCargo"]["Timer"] = g_playerstat[source]["Jobvar"]["AirCargo"]["Timer"] - 1
			
			if g_playerstat[source]["Jobvar"]["AirCargo"]["Timer"] == 0 then
				sendPlayerInfo(source, "Du hast den Job abgebrochen!")
				g_playerstat[source]["Jobvar"]["AirCargo"]["Timer"] = -1
				local vehicle = g_playerstat[source]["Jobvar"]["AirCargo"]["Car"]
				if vehicle then					
					--Loschen wir das Fahrzeug
					if g_vehiclestat[vehicle]["tempcar"] == true then
						if g_vehiclestat[vehicle]["AirCar"] == true then
							deleteTempVehicleMTARL(vehicle)
						end
					end
				end
				
				setElementModel(source, g_playerstat[source]["Skin"])				
				
				--Maker + Blip unsichtbar machen
				for number = 1, #airMarker, 1 do
					setElementVisibleTo(airBlip[number], source, false)
					setElementVisibleTo(airMarker[number], source, false)
				end
					
				--Jobvars reseten
				g_playerstat[source]["Jobvar"]["AirCargo"] = nil
				
				--Job verlassen, ohne ihm Geld zu geben und ihm das mitzuteilen
				playerLeaveJob(source, 11, 1, false, true)	
			end
		end
	end
end
addEventHandler("onGeneralPlayerTimer", getRootElement(), timerCargo)
