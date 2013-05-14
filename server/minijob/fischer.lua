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



local fisch = {}
local fischmodels = {1601, 1602, 1603, 1605, 1606, 1607, 1608}
local fischcol = {}

local function initFisher()
	addJob(13, "Fischer", true, 220, 220, 220)
	addJobLocation(13, 1, -920.904296875, 2671.4970703125, 42.370262145996, 0, 0)
	
	registerJobFunction(13, "onPlayerEnterJob", fisherCrewEnterJob)
	registerJobFunction(13, "onPlayerLeaveJob", fisherCrewLeaveJob)
	
	for i = 1, 17, 1 do
		local rand = math.random(#fisch)
		if fisch[rand] then
			local randModel = math.random(#fischmodels)			
			local object = createObject(fischmodels[randModel], fisch[rand][1], fisch[rand][2], 37.0)
			local col = createColSphere(fisch[rand][1], fisch[rand][2], 40.5, 4)
			addEventHandler("onColShapeHit", col, onFischShapeHit)
			
			fischcol[col] = object
		end
	end
end
addEventHandler("onResourceStart", getResourceRootElement(), initFisher)

function fisherCrewEnterJob(playerSource, staticJobID, locationID, playerJobRank)
	setElementModel(playerSource, 7)
	
	--Fahrzeug erstellen
	local veh = createTempVehicleMTARL(453, -934.7412109375, 2654.5078125, 40.247562408447, 359.57702636719, 359.79675292969, 134.0771484375)
	g_vehiclestat[veh]["FischerCar"] = true
	
	sendPlayerInfo(playerSource, "Wilkommen, im Minijob Fischer! Im ganzen See sind Fische!\n\nFange nun mit dem Boot Fische.")

	--Jobvars
	g_playerstat[playerSource]["Jobvar"] = {}
	g_playerstat[playerSource]["Jobvar"]["Fischer"] = {}
	g_playerstat[playerSource]["Jobvar"]["Fischer"]["Timer"] = -1
	g_playerstat[playerSource]["Jobvar"]["Fischer"]["Car"] = veh
end

function fisherCrewLeaveJob(playerSource, staticJobID, locationID, playerJobRank)
	local veh = g_playerstat[playerSource]["Jobvar"]["Fischer"]["Car"]
	setElementModel(playerSource, g_playerstat[playerSource]["Skin"])
	
	--Fahrzeug l"..ouml.."schen
	if g_vehiclestat[veh]["tempcar"] == true then
		if g_vehiclestat[veh]["FischerCar"] == true then
			deleteTempVehicleMTARL(veh)
		end
	end
	
	--Jobvars reseten
	g_playerstat[playerSource]["Jobvar"]["Fischer"] = nil
end

function leaveCarFischer(player, seat, jacker)
	if isPlayerActiveInJob(player, 13) then
		if getElementModel(source) == 453 then
			if g_vehiclestat[source]["FischerCar"] == true then
				g_playerstat[player]["Jobvar"]["Fischer"]["Car"] = source
				sendPlayerInfo(player, "Du hast dein Boot verlassen. Steige innerhalb von 10 Sekunden wieder ein!")
				g_playerstat[player]["Jobvar"]["Fischer"]["Timer"] = 10
			end
		end
	end
end
addEventHandler("onVehicleExit", getRootElement(), leaveCarFischer)

function enterCarFischer(player, seat, jacked)
	if isPlayerActiveInJob(player, 13) then
		if getElementModel(source) == 453 then
			if g_vehiclestat[source]["FischerCar"] == true then
				g_playerstat[player]["Jobvar"]["Fischer"]["Car"] = source
				g_playerstat[player]["Jobvar"]["Fischer"]["Timer"] = -1
			else
				sendPlayerInfo(player, "Das ist kein Fischer Boot!")
			end
		end
	end
end
addEventHandler("onVehicleEnter", getRootElement(), enterCarFischer)

function onFischShapeHit(playerSource)
	if getElementType(playerSource) == "player" then
		if isPlayerActiveInJob(playerSource, 13) then
			local vehicle = getPedOccupiedVehicle(playerSource)
			if vehicle then
				if getElementModel(vehicle) == 453 then
					if g_vehiclestat[vehicle]["FischerCar"] == true then
						if fischcol[source] then
							destroyElement(fischcol[source]) --Objekt entfernen
							destroyElement(source) --Colshape entfernen 								
							fischcol[source] = nil
							
							--Neuen setzen
							local rand = math.random(#fisch)
							
							if fisch[rand] then
								local randModel = math.random(#fischmodels)
								local object = createObject(fischmodels[randModel], fisch[rand][1], fisch[rand][2], 37.0)
								local col = createColSphere(fisch[rand][1], fisch[rand][2], 40.5, 4)
								addEventHandler("onColShapeHit", col, onFischShapeHit)
								fischcol[col] = object
							end			
							
							--Geld geben
							giveStaatsKasse(-9)
							givePlayerMoney(playerSource, 9) --auf die Hand
							sendPlayerInfo(playerSource, "Gut gemacht, du hast 9$ erhalten. Fange nun weiter!")
						end
					end	
				end
			end	
		end	
	end	
end

function destroyTempCarFischer()
	if g_playerstat[source]["Jobvar"]["Fischer"] then
		local vehicle = g_playerstat[source]["Jobvar"]["Fischer"]["Car"]
		if g_vehiclestat[vehicle]["tempcar"] == true then
			if g_vehiclestat[vehicle]["FischerCar"] == true then
				deleteTempVehicleMTARL(vehicle)
			end
		end
	end
end
addEventHandler("onPlayerLogoutMTARL", getRootElement(), destroyTempCarFischer)

--MTA:RL Internes Event
function timerFischer()
	if g_playerstat[source]["Jobvar"]["Fischer"] then
		if g_playerstat[source]["Jobvar"]["Fischer"]["Timer"] > 0 then
			g_playerstat[source]["Jobvar"]["Fischer"]["Timer"] = g_playerstat[source]["Jobvar"]["Fischer"]["Timer"] - 1
			
			if g_playerstat[source]["Jobvar"]["Fischer"]["Timer"] == 0 then
				sendPlayerInfo(source, "Du hast den Job abgebrochen!")
				g_playerstat[source]["Jobvar"]["Fischer"]["Timer"] = -1
				local vehicle = g_playerstat[source]["Jobvar"]["Fischer"]["Car"]
				if vehicle then					
					--L"..ouml.."schen wir das Fahrzeug
					if g_vehiclestat[vehicle]["tempcar"] == true then
						if g_vehiclestat[vehicle]["FischerCar"] == true then
							deleteTempVehicleMTARL(vehicle)
						end
					end
				end
				
				setElementModel(source, g_playerstat[source]["Skin"])				
					
				--Jobvars reseten
				g_playerstat[source]["Jobvar"]["Fischer"] = nil
				
				--Job verlassen, ohne ihm Geld zu geben und ihm das mitzuteilen
				playerLeaveJob(source, 13, 1, false, true)					
			end
		end
	end
end
addEventHandler("onGeneralPlayerTimer", getRootElement(), timerFischer)

fisch[1] = {-918.8212890625, 2639.09375}
fisch[2] = {-874.8583984375, 2569.078125}
fisch[3] = {-893.0712890625, 2491.0107421875}
fisch[4] = {-906.48828125, 2385.9833984375}
fisch[5] = {-897.6611328125, 2252.9462890625}
fisch[6] = {-806.767578125, 2215.1015625}
fisch[7] = {-701.3046875, 2243.8583984375}
fisch[8] = {-594.3037109375, 2299.2451171875}
fisch[9] = {-543.3671875, 2292.015625}
fisch[11] = {-522.2939453125, 2202.986328125}
fisch[12] = {-531.96875, 2063.53515625}
fisch[13] = {-636.9453125, 2118.50390625}
fisch[14] = {-761.65234375, 2117.6025390625}
fisch[15] = {-522.2939453125, 2202.986328125}
fisch[16] = {-887.90234375, 2048.001953125}
fisch[17] = {-916.0625, 2140.8359375}
fisch[18] = {-1001.701171875, 2195.361328125}
fisch[19] = {-1135.4755859375, 2159.7998046875}
fisch[20] = {-1240.1025390625, 2130.0478515625}
fisch[21] = {-1344.0517578125, 2116.1162109375}
fisch[22] = {-1383.04296875, 2124.3349609375}
fisch[23] = {-1087.26171875, 2181.6064453125}
fisch[24] = {-968.5224609375, 2353.001953125}
fisch[25] = {-1018.3310546875, 2476.43359375}
fisch[26] = {-1087.3310546875, 2626.3984375}
fisch[27] = {-1054.080078125, 2669.6865234375}
fisch[28] = {-954.24609375, 2674.3955078125}
fisch[29] = {-956.9443359375, 2501.46484375}
fisch[30] = {-932.9873046875, 2332.0546875}
fisch[31] = {-907.3837890625, 2199.3876953125}
fisch[32] = {-979.236328125, 2554.9853515625}
