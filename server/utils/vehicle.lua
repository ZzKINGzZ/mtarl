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



function setVehicleDamagePerPara(vehicle, damagepara)
	local msg = tostring(damagepara), runTo
	local zelle = 0
	runTo = string.split(msg, "|")
	for _, msgVal in next,runTo do
		zelle = zelle + 1
		--T"..Uuml.."RSCHADEN
		if zelle == 1 then
			setVehicleDoorState(vehicle, 0, tonumber(msgVal))
		elseif zelle == 2 then
			setVehicleDoorState(vehicle, 1, tonumber(msgVal))
		elseif zelle == 3 then
			setVehicleDoorState(vehicle, 2, tonumber(msgVal))
		elseif zelle == 4 then
			setVehicleDoorState(vehicle, 3, tonumber(msgVal))
		elseif zelle == 5 then
			setVehicleDoorState(vehicle, 4, tonumber(msgVal))
		elseif zelle == 6 then	
			setVehicleDoorState(vehicle, 5, tonumber(msgVal))
		--REIFENSCHADEN	
		elseif zelle == 7 then
			setVehicleWheelStates(vehicle, tonumber(msgVal),-1,-1,-1)	
		elseif zelle == 8 then
			setVehicleWheelStates(vehicle, -1,tonumber(msgVal),-1,-1)
		elseif zelle == 9 then
			setVehicleWheelStates(vehicle, -1,-1,tonumber(msgVal),-1)
		elseif zelle == 10 then
			setVehicleWheelStates(vehicle, -1,-1,-1,tonumber(msgVal))	
		--LICHTSCHADEN	
		elseif zelle == 11 then
			setVehicleLightState(vehicle, 0, tonumber(msgVal))
		elseif zelle == 12 then
			setVehicleLightState(vehicle, 1, tonumber(msgVal))
		elseif zelle == 13 then
			setVehicleLightState(vehicle, 2, tonumber(msgVal))
		elseif zelle == 14 then
			setVehicleLightState(vehicle, 3, tonumber(msgVal))
		--PANELSCHADEN	
		elseif zelle == 15 then
			setVehiclePanelState(vehicle, 0, tonumber(msgVal))
		elseif zelle == 16 then
			setVehiclePanelState(vehicle, 1, tonumber(msgVal))
		elseif zelle == 17 then
			setVehiclePanelState(vehicle, 2, tonumber(msgVal))
		elseif zelle == 18 then
			setVehiclePanelState(vehicle, 3, tonumber(msgVal))
		elseif zelle == 19 then
			setVehiclePanelState(vehicle, 4, tonumber(msgVal))
		elseif zelle == 20 then
			setVehiclePanelState(vehicle, 5, tonumber(msgVal))
		elseif zelle == 21 then
			setVehiclePanelState(vehicle, 6, tonumber(msgVal))
		end
	end
end

function getVehicleDamagePerPara(vehicle)
	--T"..Uuml.."RENSCHADEN
	local zelle1 = getVehicleDoorState(vehicle, 0)
	local zelle2 = getVehicleDoorState(vehicle, 1)
	local zelle3 = getVehicleDoorState(vehicle, 2)
	local zelle4 = getVehicleDoorState(vehicle, 3)
	local zelle5 = getVehicleDoorState(vehicle, 4)
	local zelle6 = getVehicleDoorState(vehicle, 5)
	--REIFENSCHADEN
	local zelle7
	local zelle8
	local zelle9
	local zelle10
	zelle7, zelle8, zelle9, zelle10 = getVehicleWheelStates(vehicle)
	--LICHTSCHADEN
	local zelle11 = getVehicleLightState(vehicle, 0)
	local zelle12 = getVehicleLightState(vehicle, 1)
	local zelle13 = getVehicleLightState(vehicle, 2)
	local zelle14 = getVehicleLightState(vehicle, 3)
	--PANELSCHADEN
	local zelle15 = getVehiclePanelState(vehicle, 0)
	local zelle16 = getVehiclePanelState(vehicle, 1)
	local zelle17 = getVehiclePanelState(vehicle, 2)
	local zelle18 = getVehiclePanelState(vehicle, 3)
	local zelle19 = getVehiclePanelState(vehicle, 4)
	local zelle20 = getVehiclePanelState(vehicle, 5)
	local zelle21 = getVehiclePanelState(vehicle, 6)
	
	local thereturn = tostring(zelle1) .."|".. tostring(zelle2) .."|".. tostring(zelle3) .."|".. tostring(zelle4) .."|".. tostring(zelle5) .."|".. tostring(zelle6) .."|".. tostring(zelle7) .."|".. tostring(zelle8) .."|".. tostring(zelle9) .."|".. tostring(zelle10) .."|".. tostring(zelle11) .."|".. tostring(zelle12) .."|".. tostring(zelle13) .."|".. tostring(zelle14) .."|".. tostring(zelle15) .."|".. tostring(zelle16) .."|".. tostring(zelle17) .."|".. tostring(zelle18) .."|".. tostring(zelle19) .."|".. tostring(zelle20) .."|".. tostring(zelle21)         
	return thereturn
end

function setVehicleColPerPara(vehicle, para)
	local msg = tostring(para), runTo
	local zelle = 0
	runTo = string.split(msg, "|")
	
	local col1
	local col2
	local col3
	local col4
	
	for _, msgVal in next,runTo do
		zelle = zelle + 1
		if zelle == 1 then
			col1 = tonumber(msgVal)
		elseif zelle == 2 then
			col2 = tonumber(msgVal)
		elseif zelle == 3 then
			col3 = tonumber(msgVal)
		elseif zelle == 4 then
			col4 = tonumber(msgVal)
		end	
	end
	setVehicleColor(vehicle, col1, col2, col3, col4)
end

function getVehicleColPerPara(vehicle)
	local col1, col2, col3, col4 = getVehicleColor(vehicle)
	local thereturn = tostring(col1) .."|".. tostring(col2) .."|".. tostring(col3) .."|".. tostring(col4)
	return thereturn
end

function closestVehicle(playerSource)
	local veh = getPedOccupiedVehicle(playerSource)
	if veh then
		return veh, 0 
	end
	
	local prevdist = 1000000000.0
	local prevvehicle = false
	
	local playerx, playery, playerz = getElementPosition(playerSource)
	
	for i, vehicle in ipairs(getElementsByType("vehicle")) do
		local otherx, othery, otherz = getElementPosition(vehicle)
		local distance = getDistanceBetweenPoints3D(otherx, othery, otherz, playerx, playery, playerz)
		if distance < prevdist then
			prevdist = distance
			prevvehicle = vehicle
		end
	end
	
	return prevvehicle, prevdist
end

function isVehicleEnterableWithoutRights(vehicle)
	if getVehicleDoorState(vehicle, 2) == 1 or getVehicleDoorState(vehicle, 2) == 3 or getVehicleDoorState(vehicle, 2) == 4 then return true end
	if getVehicleDoorState(vehicle, 3) == 1 or getVehicleDoorState(vehicle, 3) == 3 or getVehicleDoorState(vehicle, 3) == 4 then return true end
	if getVehicleDoorState(vehicle, 4) == 1 or getVehicleDoorState(vehicle, 4) == 3 or getVehicleDoorState(vehicle, 4) == 4 then return true end
	if getVehicleDoorState(vehicle, 5) == 1 or getVehicleDoorState(vehicle, 5) == 3 or getVehicleDoorState(vehicle, 5) == 4 then return true end
	return false
end
