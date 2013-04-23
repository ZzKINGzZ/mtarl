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



rpcRegisterGlobalFunction("setTuningGarageOpen")
rpcRegisterGlobalFunction("takeTuningMoney")
rpcRegisterGlobalFunction("setPaintjob")
rpcRegisterGlobalFunction("setCarColor")
rpcRegisterGlobalFunction("setLightColor")
rpcRegisterGlobalFunction("setGPS")
rpcRegisterGlobalFunction("setTacho")
rpcRegisterGlobalFunction("addVehicleTuning")
rpcRegisterGlobalFunction("setSecurityClass")

local garage = {}
local tuning = {}

function setGarage()
	outputDebug("tuning.lua start...")

	garage[1] = createColSphere ( 2386.5859375, 1040.2529296875, 10.8203125, 4) --LV
	garage[2] = createColSphere ( 1041.4326171875, -1027.908203125, 32.1015625, 4) --LS
	garage[3] = createColSphere ( -1935.583984375, 237.58203125, 34.3125, 4) --SF
	
	tuning[1] = createMarker ( 2386.6005859375, 1052.203125, 9.8203125, "cylinder", 6, 55, 255, 55, 190, 155) --LV
	tuning[2] = createMarker ( 1041.6650390625, -1017.8232421875, 31.107528686523, "cylinder", 6, 55, 255, 55, 190, 155) --LS
	tuning[3] = createMarker ( -1936.8125, 247.1923828125, 33.4609375, "cylinder", 6, 55, 255, 55, 190, 155) --SF
	tuning[4] = createMarker ( -2281.6572265625, 2449.2001953125, 0, "cylinder", 8, 55, 255, 55, 190, 155) --Boot
	tuning[5] = createMarker ( 1279.93359375, 1324.0634765625, 10.280610084534, "cylinder", 8, 55, 255, 55, 190, 155) --Flug
end
addEventHandler("onResourceStart", getResourceRootElement(), setGarage)

function openGarage(playerSource)
	if getElementType(playerSource) == "player" then
		local car = getPedOccupiedVehicle(playerSource)
		if car then
			if source == garage[1] then
				setGarageOpen (33, true)
			end
					
			if source == garage[2] then
				setGarageOpen (10, true)
			end
					
			if source == garage[3] then
				setGarageOpen (18, true)
			end
		end
	end
end
addEventHandler("onColShapeHit", getRootElement(), openGarage)

function closeGarage(playerSource)
	if getElementType(playerSource) == "player" then
		local car = getPedOccupiedVehicle(playerSource)
		if car then
			if source == garage[1] then
				if not isElementWithinMarker(playerSource, tuning[1]) then
					setGarageOpen ( 33,false )
					setElementVisibleTo(tuning[1], getRootElement(), true)
				end
			end

			if source == garage[2] then
				if not isElementWithinMarker(playerSource, tuning[2]) then
					setGarageOpen ( 10,false )
					setElementVisibleTo(tuning[2], getRootElement(), true)
				end
			end
					
			if source == garage[3] then
				if not isElementWithinMarker(playerSource, tuning[3]) then
					setGarageOpen ( 18,false )
					setElementVisibleTo(tuning[3], getRootElement(), true)
				end
			end
		end
	end
end
addEventHandler ( "onColShapeLeave", getRootElement(), closeGarage )

function startTuningServer(playerSource)
	if source == tuning[1] or source == tuning[2] or source == tuning[3] or source == tuning[4] or source == tuning[5] then
		if getElementType(playerSource) == "player" then
			if g_playerstat[playerSource] then
				local vehicle = getPedOccupiedVehicle(playerSource)
				if vehicle then
					if g_vehiclestat[vehicle] then 
						if not isVehicleJobVehicle(vehicle) then
							if getVehicleController (vehicle) == playerSource then
							
								local modelid = getElementModel(vehicle)
								local paintjob = getCarPaintjob(modelid)
								local safty = getCarSafty(modelid)
								
								if source == tuning[1] then
									clearElementVisibleTo(tuning[1])
									CORE:getPlayer(playerSource):callClient("startTuningClient", "LV", paintjob, safty)
									setElementPosition ( vehicle, 2386.720703125, 1050.802734375, 9.8203125 + 1 )
									CORE:getPlayer(playerSource):callClient("stopSpeedo")
									setGarageOpen (33 ,false)
								end
								if source == tuning[2] then
									clearElementVisibleTo(tuning[2])
									CORE:getPlayer(playerSource):callClient("startTuningClient", "LS", paintjob, safty)
									setElementPosition ( vehicle, 1041.6650390625, -1017.8232421875, 31.107528686523 + 1 )
									CORE:getPlayer(playerSource):callClient("stopSpeedo")
									setGarageOpen (10 ,false)
								end
								if source == tuning[3] then
									clearElementVisibleTo(tuning[3])
									CORE:getPlayer(playerSource):callClient("startTuningClient", "SF", paintjob, safty)
									setElementPosition ( vehicle, -1936.8125, 247.1923828125, 33.4609375 + 1 )
									CORE:getPlayer(playerSource):callClient("stopSpeedo")
									setGarageOpen (18, false)
								end									
								if source == tuning[4] then
									clearElementVisibleTo(tuning[4])
									CORE:getPlayer(playerSource):callClient("startTuningClient", "boot", paintjob, safty)
									setElementPosition ( vehicle, -2281.6572265625, 2449.2001953125, 0 + 1 )
									CORE:getPlayer(playerSource):callClient("stopSpeedo")
								end
								if source == tuning[5] then
									clearElementVisibleTo(tuning[5])
									CORE:getPlayer(playerSource):callClient("startTuningClient", "flug", paintjob, safty)
									setElementPosition ( vehicle, 1279.93359375, 1324.0634765625, 11.280610084534 + 1 )
									CORE:getPlayer(playerSource):callClient("stopSpeedo")
								end			
								local freeze = setVehicleFrozen ( vehicle, true )
								if freeze then
									setVehicleFrozen ( vehicle, false )
								end
								setVehicleOverrideLights ( vehicle, 2 )
								setVehicleTurnVelocity ( vehicle, 0, 0, 0 )
							else 
								outputChatBox(g_colors["red"].."Diese Fahrzeug kannst du nicht Tunen!", playerSource, 0, 0, 0, true)
								if source == tuning[1] then
									setGarageOpen ( 33, true )
								end
									
								if source == tuning[2] then
									setGarageOpen ( 10, true )
								end
										
								if source == tuning[3] then
									setGarageOpen ( 18, true )
								end
							end
						else
							outputChatBox(g_colors["red"].."Diese Fahrzeug kannst du nicht Tunen!", playerSource, 0, 0, 0, true)
							if source == tuning[1] then
								setGarageOpen ( 33, true )
							end
								
							if source == tuning[2] then
								setGarageOpen ( 10, true )
							end
								
							if source == tuning[3] then
								setGarageOpen ( 18, true )
							end
						end
					end
				end
			end	
		end
	end
end
addEventHandler ( "onMarkerHit", getRootElement(), startTuningServer )

function getCarCategory(modelid)
	if modelid then
		local carTableID = tonumber(modelid) - 399
		if carTable[carTableID] then
			if carTable[carTableID]["category"] then 
				return carTable[carTableID]["category"] 
			end	
		end
	end	
	return false
end

function getCarPaintjob(modelid)
	if modelid then
		local carTableID = tonumber(modelid) - 399
		if carTable[carTableID] then
			if carTable[carTableID]["paintjob"] then 
				if carTable[carTableID]["paintjob"] == true then
					return true 
				end
				if carTable[carTableID]["paintjob"] == false then
					return false 
				end
			end	
		end
	end	
	return false
end

function getCarSafty(modelid)
	if modelid then
		local carTableID = tonumber(modelid) - 399
		if carTable[carTableID] then
			if carTable[carTableID]["safty"] then 
				return carTable[carTableID]["safty"]
			end	
		end
	end	
	return false
end

function setPaintjob(paintjob)
	if paintjob then
		local veh = getPedOccupiedVehicle(client)
		setVehiclePaintjob (veh, paintjob)
	end
end

function setCarColor(r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4)
	if r1 and g1 and b1 and r2 and g2 and b2 and r3 and g3 and b3 and r4 and g4 and b4 then
		local veh = getPedOccupiedVehicle(client)
		setVehicleColor ( veh, r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4)
	end
 end
 
function setLightColor(col_rot, col_gruen, col_blau)
	if col_rot and col_gruen and col_blau then
		local veh = getPedOccupiedVehicle(client)
		setVehicleHeadLightColor ( veh, col_rot, col_gruen, col_blau)
	end
 end
 
function setGPS()
	local veh = getPedOccupiedVehicle(client)
	g_vehiclestat[veh]["gps"] = true
end

function setTacho(tachocolor)
	local veh = getPedOccupiedVehicle(client)
	if tachocolor == nil then
		removeElementData(veh, "tacho")
	else
		setElementData(veh, "tacho", tachocolor)
	end
end

function setVehicleTuning(vehicle)
	for i, upgrade in ipairs(getVehicleUpgrades(vehicle)) do
		removeVehicleUpgrade(vehicle, upgrade)
	end
end

function addVehicleTuning(vehicle, tuningid)
	addVehicleUpgrade(vehicle, tuningid)
end

function takeTuningMoney(money)
	if money > 0 then
		takePlayerMoney(client, money)
		giveStaatsKasse(money)
	end
end

function setSecurityClass(class)
	local veh = getPedOccupiedVehicle(client)
	local modelid = getElementModel(veh)
	local classnormal = tonumber(getCarSafty(modelid))
	class = tonumber(class)
	if class ~= classnormal then
		g_vehiclestat[veh]["safty"] = class
	end
end

function setTuningGarageOpen(TuningCenter)
	if TuningCenter == "SF" then setGarageOpen ( 18,true )
	elseif TuningCenter == "LS" then setGarageOpen ( 10,true )
	elseif TuningCenter == "LV" then setGarageOpen ( 33,true )
	elseif TuningCenter == "boat" then setElementVisibleTo(tuning[4], getRootElement(), true)
	elseif TuningCenter == "flug" then setElementVisibleTo(tuning[2], getRootElement(), true) end
end
