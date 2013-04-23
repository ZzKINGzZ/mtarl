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



local g_burningvehicles = {}

function vehiclePoolTimer(vehicle)
	if isElementStreamedIn(vehicle) then
		if getElementData(vehicle, "burningunlimited") == true then
			if isVehicleBlown(vehicle) then fixVehicle(vehicle) end
			setElementHealth(vehicle, 250)
			setElementHealth(vehicle, 249)
			--[[if not getBurningTimer(vehicle) then
				setBurningTimer(vehicle)
			end--]]
		end	
	end 
end

function isVehicleBurning(vehicle)
	if getElementData(vehicle, "burningunlimited") == true then
		return true
	else
		return false
	end
end

local function setVehicleInWater()
	if getElementType(source) == "vehicle" then
		local vtype = getVehicleType(source)
		local model = getElementModel(source)
		if vtype ~= "Boat" and model ~= 447 and model ~= 460 and model ~= 539 then
			if isElementInWater(source) then
				--server.setVehicleToRespawnWater(source)
				rpcCallServerFunction("setVehicleToRespawnWater", source)
			end
		end
	end
end
addEventHandler("onClientElementStreamIn", getRootElement(), setVehicleInWater)
addEventHandler("onClientElementStreamOut", getRootElement(), setVehicleInWater)

local function onVehicleExplodeStop()
	cancelEvent()
end
addEventHandler("onClientVehicleExplode", getRootElement(), onVehicleExplodeStop)
