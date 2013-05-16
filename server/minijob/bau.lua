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



local bauMarker = {}
local bauBlip = {}

local function initAirCargo()
	addJob(12, "Bau", true, 220, 220, 220)
	addJobLocation(12, 1, -2121.076171875, 219.9658203125, 35.249809265137, 0, 0)
	
	registerJobFunction(12, "onPlayerEnterJob", bauCrewEnterJob)
	registerJobFunction(12, "onPlayerLeaveJob", bauCrewLeaveJob)
		
	bauMarker[1] = createMarker (-2048.728515625, 250.4228515625, 33.596961975098, "cylinder", 10, 100, 100, 0)
	bauMarker[2] = createMarker (-1816.2587890625, -1660.0048828125, 19.728996276855, "cylinder", 10, 100, 100, 0)
	bauMarker[3] = createMarker (-30.2412109375, -1126.6904296875, -1.078125, "cylinder", 10, 100, 100, 0)
	bauMarker[4] = createMarker ( 1249.978515625, -1264.935546875, 10.352693557739, "cylinder", 10, 100, 100, 0)
	bauMarker[5] = createMarker ( 2526.44921875, -2486.453125, 11.646039009094, "cylinder", 10, 100, 100, 0)
	bauMarker[6] = createMarker ( 2603.8544921875, 835.6337890625, 3.203125, "cylinder", 10, 100, 100, 0)
	bauMarker[7] = createMarker ( 2424.2041015625, 1921.8623046875, 4.015625, "cylinder", 10, 100, 100, 0)
	bauMarker[8] = createMarker ( 1708.787109375, 1252.5224609375, 8.693808555603, "cylinder", 10, 100, 100, 0)
	bauMarker[9] = createMarker ( 603.5771484375, 884.5439453125, -41.387432098389, "cylinder", 10, 100, 100, 0)
	
	bauBlip[1] = createBlip (-2048.728515625, 250.4228515625, 35.596961975098, 11, 0, 0, 0, 255)
	bauBlip[2] = createBlip (-1816.2587890625, -1660.0048828125, 21.728996276855, 11, 0, 0, 0, 255)
	bauBlip[3] = createBlip (-30.2412109375, -1126.6904296875, 1.078125, 11, 0, 0, 0, 255)
	bauBlip[4] = createBlip ( 1249.978515625, -1264.935546875, 13.352693557739, 11, 0, 0, 0, 255)
	bauBlip[5] = createBlip ( 2526.44921875, -2486.453125, 13.646039009094, 11, 0, 0, 0, 255)
	bauBlip[6] = createBlip ( 2603.8544921875, 835.6337890625, 5.203125, 11, 0, 0, 0, 255)
	bauBlip[7] = createBlip ( 2424.2041015625, 1921.8623046875, 6.015625, 11, 0, 0, 0, 255)
	bauBlip[8] = createBlip ( 1708.787109375, 1252.5224609375, 10.693808555603, 11, 0, 0, 0, 255)
	bauBlip[9] = createBlip ( 603.5771484375, 884.5439453125, -43.387432098389, 11, 0, 0, 0, 255)
	
	for number = 1, #bauMarker, 1 do
		setElementVisibleTo(bauBlip[number], getRootElement(), false)
		setElementVisibleTo(bauMarker[number], getRootElement(), false)
		addEventHandler("onMarkerHit", bauMarker[number], bauMarkerHit)
	end
end
addEventHandler("onResourceStart", getResourceRootElement(), initAirCargo)

function bauCrewEnterJob(playerSource, staticJobID, locationID, playerJobRank)
	setElementModel(playerSource, 27)
	
	--Fahrzeug erstellen
	local veh = createTempVehicleMTARL(524, -2101.927734375, 214.25390625, 36.233551025391, 359.93957519531, 359.912109375, 89.335327148438)
	g_vehiclestat[veh]["BauCar"] = true
	
	sendPlayerInfo(playerSource, "Wilkommen, im Minijob Bau! In diesem Job Transportierst du Zement.\n\nSteige nun in dein Fahrzeug.")
	
	--Marker+Blip
	local rand = math.random(#bauMarker)	
	setElementVisibleTo(bauMarker[rand], playerSource, true)
	setElementVisibleTo(bauBlip[rand], playerSource, true)
	
	--Jobvars
	g_playerstat[playerSource]["Jobvar"] = {}
	g_playerstat[playerSource]["Jobvar"]["Bau"] = {}
	g_playerstat[playerSource]["Jobvar"]["Bau"]["Timer"] = -1
	g_playerstat[playerSource]["Jobvar"]["Bau"]["Car"] = veh
end

function bauCrewLeaveJob(playerSource, staticJobID, locationID, playerJobRank)
	local veh = g_playerstat[playerSource]["Jobvar"]["Bau"]["Car"]
	setElementModel(playerSource, g_playerstat[playerSource]["Skin"])
	
	--Fahrzeug löschen
	if g_vehiclestat[veh]["tempcar"] == true then
		if g_vehiclestat[veh]["BauCar"] == true then
			deleteTempVehicleMTARL(veh)
		end
	end
	
	--Maker + Blip unsichtbar machen
	for number = 1, #bauMarker, 1 do
		setElementVisibleTo(bauBlip[number], playerSource, false)
		setElementVisibleTo(bauMarker[number], playerSource, false)
	end
	
	--Jobvars reseten
	g_playerstat[playerSource]["Jobvar"]["Bau"] = nil
end

function leaveCarBau(player, seat, jacker)
	if isPlayerActiveInJob(player, 12) then
		if getElementModel(source) == 524 then
			if g_vehiclestat[source]["BauCar"] == true then
				g_playerstat[player]["Jobvar"]["Bau"]["Car"] = source
				sendPlayerInfo(player, "Du hast dein Fahrzeug verlassen. Steige innerhalb von 10 Sekunden wieder ein!")
				g_playerstat[player]["Jobvar"]["Bau"]["Timer"] = 10
			end
		end
	end
end
addEventHandler("onVehicleExit", getRootElement(), leaveCarBau)

function enterCarBau(player, seat, jacked)
	if isPlayerActiveInJob(player, 12) then
		if getElementModel(source) == 524 then
			if g_vehiclestat[source]["BauCar"] == true then
				g_playerstat[player]["Jobvar"]["Bau"]["Car"] = source
				sendPlayerInfo(player, "Fahre nun zur Baustelle um den Zement auszuliefern. Dein Ziel ist nun auf der Karte sichtbar!")
				g_playerstat[player]["Jobvar"]["Bau"]["Timer"] = -1
			else
				sendPlayerInfo(player, "Das ist kein Bau Fahrzeug!")
			end
		end
	end
end
addEventHandler("onVehicleEnter", getRootElement(), enterCarBau)

function bauMarkerHit(playerSource)
	if getElementType(playerSource) == "player" then
		if isPlayerActiveInJob(playerSource, 12) then
			local vehicle = getPedOccupiedVehicle(playerSource)
			if vehicle then
				if getElementModel(vehicle) == 524 then
					if g_vehiclestat[vehicle]["BauCar"] == true then
						--Unsichtbar machen
						if isElementVisibleTo(source, playerSource) then
							for number = 1, #bauMarker, 1 do
								setElementVisibleTo(bauBlip[number], playerSource, false)
								setElementVisibleTo(bauMarker[number], playerSource, false)
							end
								
							--Neuen setzen
							local rand = math.random(#bauMarker)							
							setElementVisibleTo(bauMarker[rand], playerSource, true)
							setElementVisibleTo(bauBlip[rand], playerSource, true)
							
							--Geld geben
							giveStaatsKasse(-30)
							givePlayerMoney(playerSource, 30)
							sendPlayerInfo(playerSource, "Hervorragend! Dafür bekommst du 30$. Fahre nun zur nächsten Baustelle.")
						end
					end	
				end
			end	
		end	
	end	
end

function destroyTempCarBau()
	if g_playerstat[source]["Jobvar"]["Bau"] then
		local vehicle = g_playerstat[source]["Jobvar"]["Bau"]["Car"]
		if g_vehiclestat[vehicle]["tempcar"] == true then
			if g_vehiclestat[vehicle]["BauCar"] == true then
				deleteTempVehicleMTARL(vehicle)
			end
		end
	end
end
addEventHandler("onPlayerLogoutMTARL", getRootElement(), destroyTempCarBau)

--MTA:RL Internes Event
function timerBau()
	if g_playerstat[source]["Jobvar"]["Bau"] then
		if g_playerstat[source]["Jobvar"]["Bau"]["Timer"] > 0 then
			g_playerstat[source]["Jobvar"]["Bau"]["Timer"] = g_playerstat[source]["Jobvar"]["Bau"]["Timer"] - 1
			
			if g_playerstat[source]["Jobvar"]["Bau"]["Timer"] == 0 then
				sendPlayerInfo(source, "Du hast den Job abgebrochen!")
				g_playerstat[source]["Jobvar"]["Bau"]["Timer"] = -1
				local vehicle = g_playerstat[source]["Jobvar"]["Bau"]["Car"]
				if vehicle then					
					--Loschen wir das Fahrzeug
					if g_vehiclestat[vehicle]["tempcar"] == true then
						if g_vehiclestat[vehicle]["BauCar"] == true then
							deleteTempVehicleMTARL(vehicle)
						end
					end
				end
				
				setElementModel(source, g_playerstat[source]["Skin"])				
				
				--Maker + Blip unsichtbar machen
				for number = 1, #bauMarker, 1 do
					setElementVisibleTo(bauBlip[number], source, false)
					setElementVisibleTo(bauMarker[number], source, false)
				end
					
				--Jobvars reseten
				g_playerstat[source]["Jobvar"]["Bau"] = nil
				
				--Job verlassen, ohne ihm Geld zu geben und ihm das mitzuteilen
				playerLeaveJob(source, 12, 1, false, true)					
			end
		end
	end
end
addEventHandler("onGeneralPlayerTimer", getRootElement(), timerBau)
