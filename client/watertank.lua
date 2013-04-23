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



local veh
local firetimer
local tankvol
local bind = 0
firestatus = false

function toggleWatertankClient(toggle,watertank)
	if toggle == true then
		guiSetVisible(g_watertank["label"], true)
		guiSetVisible(g_watertank["progress"], true)
		guiProgressBarSetProgress (g_watertank["progress"], watertank)
		
		addEventHandler("onClientPlayerVehicleExit", getRootElement(), leaveCar)
		addEventHandler("onClientElementStreamOut", getRootElement(), onWaterTankVehicleStreamOut)
		
		toggleKeys(true)
	else
		guiSetVisible(g_watertank["label"], false)
		guiSetVisible(g_watertank["progress"], false)
		
		removeEventHandler("onClientPlayerVehicleExit", getRootElement(), leaveCar)
		removeEventHandler("onClientElementStreamOut", getRootElement(), onWaterTankVehicleStreamOut)
		
		tankvol = guiProgressBarGetProgress(g_watertank["progress"])
		--server.setServerWatertank(tonumber(tankvol))
		rpcCallServerFunction("setServerWatertank", tonumber(tankvol))
		toggleKeys(false)
		if isTimer(firetimer) then
			killTimer (firetimer)
		end
	end
end

function toggleKeys(toggle)
	if toggle == true then
		bindKey("vehicle_fire", "down", onPlayerVehicelFire)
		bindKey("vehicle_fire", "up", onPlayerStopVehicelFire)
		bindKey("vehicle_secondary_fire", "down", onPlayerVehicelFire)
		bindKey("vehicle_secondary_fire", "up", onPlayerStopVehicelFire)
	else
		unbindKey("vehicle_fire")
		unbindKey("vehicle_secondary_fire")
	end
end

function leaveCar(vehicle)
	toggleWatertankClient(false)
end

function onWaterTankVehicleStreamOut()
	if source == "Vehicle" then
		local id = getElementID (source)
		if id == 601 or id == 407 then
			toggleWatertankClient(false)
		end
	end
end

function onPlayerVehicelFire(key ,status)
	if status == "down" then
		if not isTimer(firetimer) then
			firetimer = setTimer (setProgress, 1000, 0)
		end
	end
end

function onPlayerStopVehicelFire(key ,status)
	if status == "up" then
		if isTimer(firetimer) then
			killTimer (firetimer)
			firestatus = false
		end
	end
end

function setProgress()
	local progress = guiProgressBarGetProgress (g_watertank["progress"])
	if progress <= 0 then
		toggleKeys(false)
		toggleControl ("vehicle_fire", false)
		toggleControl ("vehicle_secondary_fire", false)
		firestatus = true
		if isTimer(firetimer) then
			killTimer (firetimer)
		end
	else
		local tankvol = progress-0.01
		guiProgressBarSetProgress (g_watertank["progress"], tankvol)
	end
end
