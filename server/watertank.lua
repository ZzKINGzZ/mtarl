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



rpcRegisterGlobalFunction("setServerWatertank")

local status
local veh

function toggleVehicleFire(vehicle, toggle)
	if getVehicleController (vehicle) == source then
		local model = getElementModel (vehicle)
		if model == 601 or model == 407 then
			if g_vehiclestat[vehicle]["watertank"] ~= -1 then
				veh = vehicle
				CORE:getPlayer(source):callClient("toggleWatertankClient", true, tonumber(g_vehiclestat[vehicle]["watertank"]))
				status = 1
				
				toggleControl (source, "vehicle_fire", true)
				toggleControl (source, "vehicle_secondary_fire", true)
			end
		end
	end
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), toggleVehicleFire)

function setServerWatertank(watertank)
	if status == 1 then
		if watertank > 0 then
			g_vehiclestat[veh]["watertank"] = watertank
		else
			g_vehiclestat[veh]["watertank"] = 0
		end
		status = 0
	end
end

function startAuftankenWasser(playerSource, commandName)
	local tanke
	for _, tankstelle in ipairs(getElementsByType("tankstelle")) do
		if isElementWithinColShape(playerSource, getElementData(tankstelle, "colshape")) then
			tanke = tankstelle
			break
		end
	end
	
	if not tanke then 
		outputChatBox(g_colors["red"].."Du bist nicht bei einer Tankstelle!", playerSource, 0, 0, 0, true)
		return false
	end
	
	local vehicle, distance = closestVehicle(playerSource)
	if distance < 5 then
		if isElementWithinColShape(vehicle, getElementData(tanke, "colshape")) then
			local modelid = getElementModel(vehicle)
			local model = tonumber(modelid)
			if not model == 601 or not model == 407 then	
				outputChatBox(g_colors["red"].."Dieses Fahrzeug kann nicht getankt werden!", playerSource, 0, 0, 0, true)
				return false
			end
			
			if g_vehiclestat[vehicle]["watertank"] == 100 then
				outputChatBox(g_colors["red"].."Dein Fahrzeug ist voll genug!", playerSource, 0, 0, 0, true)
				return false
			end
			
			if getPedOccupiedVehicle(playerSource) then
				outputChatBox(g_colors["red"].."Du musst das Fahrzeug verlassen, um aufzutanken!", playerSource, 0, 0, 0, true)
				return false
			end
						
			g_vehiclestat[vehicle]["watertank"] = 100
			outputChatBox(g_colors["green"].."Das Fahrzeug wurde erfolgreich getankt!", playerSource, 0, 0, 0, true)
		else
			outputChatBox(g_colors["red"].."Das Fahrzeug ist nicht nah genug an einer Tankstelle!", playerSource, 0, 0, 0, true)
			return false
		end
	else
		outputChatBox(g_colors["red"].."Kein Fahrzeug zum auftanken in der Nähe gefunden!", playerSource, 0, 0, 0, true)
		return false
	end
end
addCommandHandler("wasser", startAuftankenWasser)
