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



--[[local trains = {}

function initTrains()
	outputDebug("trains.lua start...")
	
	trains[1] = createVehicle(449, -2007, 125, 30)
	trains[2] = createVehicle(449, -1975, 604, 37)
	trains[3] = createVehicle(449, -1641, 729, 15)
	trains[4] = createVehicle(449, -1862, 850, 36)
	trains[5] = createVehicle(449, -1856, 922, 36)
	trains[6] = createVehicle(449, -1584, 1080, 7)
	trains[7] = createVehicle(449, -1728, 1341, 7)
	trains[8] = createVehicle(449, -2105, 1274, 17)
	trains[9] = createVehicle(449, -2264, 1041, 84)
	trains[10] = createVehicle(449, -2264, 718, 49)
	trains[11] = createVehicle(449, -2322, 509, 32)
	trains[12] = createVehicle(449, -2251, 277, 35)
	trains[13] = createVehicle(449, -2219, -69, 35)
	trains[14] = createVehicle(449, -2124, 31, 35)
	
	for i, vehicle in ipairs(trains) do
		setVehicleLocked(vehicle, true)
		setVehicleDamageProof(vehicle, true)
		setVehicleOverrideLights(vehicle, 2)
		local x, y, z = getElementRotation(vehicle)
		local newx = x + 2*math.cos(math.rad(z + 90))
		local newy = y + 2*math.sin(math.rad(z + 90))
		
		local setx, sety = 0.3, 0.3
		
		if newx - x > 0 then
			setx = 0.3
		else
			setx = -0.3
		end
		
		if newy - y > 0 then
			sety = 0.3
		else
			sety = -0.3
		end
		setElementVelocity(vehicle, setx, sety, 0)		
	end
end
addEventHandler('onResourceStart', getResourceRootElement(), initTrains)

function moveTrains()
	for i, vehicle in ipairs(trains) do
		local x, y, z = getElementRotation(vehicle)
		local newx = x + 2*math.cos(math.rad(z + 90))
		local newy = y + 2*math.sin(math.rad(z + 90))
		
		local setx, sety = 0.3, 0.3
		
		if newx - x > 0 then
			setx = 0.3
		else
			setx = -0.3
		end
		
		if newy - y > 0 then
			sety = 0.3
		else
			sety = -0.3
		end
		setElementVelocity(vehicle, setx, sety, 0)
		--setVehicleTurnVelocity(vehicle, 0, 0, 0.25)
	end
end
addEventHandler('onGeneralTimer', getRootElement(), moveTrains)--]]
