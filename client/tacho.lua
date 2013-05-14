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



local x,y = guiGetScreenSize()
local col = tocolor(255, 255, 255, 200)
local oldtick = 0

local km 
local km2
local tank
local tanktype
local tacho
local vehicle
local tanko
local taxikm
local isTempcar = false

function startSpeedo(tempcar)
	if tempcar then isTempcar = true end
	vehicle = getPedOccupiedVehicle(getLocalPlayer())
	tacho = "./files/tachos/tacho.png"
	tanko = "./files/tachos/tank.png"
	local otherTacho = getElementData(vehicle, "tacho")
	if otherTacho then
		tacho = "./files/tachos/tacho_"..otherTacho..".png"
		tanko = "./files/tachos/tank_"..otherTacho..".png"
	end
	toggleControl("accelerate", true)
	addEventHandler("onClientRender", getRootElement(), drawSpeedo)
end

function stopSpeedo()
	removeEventHandler("onClientRender", getRootElement(), drawSpeedo)
	vehicle = nil
	tacho = "./files/tachos/tacho.png"
	tanko = "./files/tachos/tank.png"
	isTempcar = false
end

function drawSpeedo()
	local thevehicle = vehicle
	if not thevehicle then
		return false
	end
	
	local vx, vy, vz = getElementVelocity(thevehicle)
	local theset = (vx^2 + vy^2 + vz^2)^(0.5)*200*1,609344
	--local theset = theset/2 --Das ist unrealer als voher, siehe rechnung oben!
	dxDrawImage(x-175, y-200, 150, 174, tacho)
	
	if getVehicleType(thevehicle) == "BMX" then
		if theset > 40 then
			toggleControl("accelerate", false)
		else
			toggleControl("accelerate", true)
		end
	end
	
	if theset < 1 then
		dxDrawImage(x-200, y-220, 200, 200, "./files/nadel.png", -27)
		setrot = -27
	else
		setrot = (27/20)*theset
		dxDrawImage(x-200, y-220, 200, 200, "./files/nadel.png", setrot-27)
	end	
	
	if isTempcar == false then
		local ausgabekilometer1 = string.format('%.2f', km)
		local ausgabekilometer2 = string.format('%.2f', km2)
		
		local newkm = 0
		if theset > 0 and getTickCount() ~= oldtick then
			newkm = theset/60/60/(getTickCount() - oldtick)
			km = km + newkm
			km2 = km2 + newkm
			if km2 > km then km2 = km end
			
			ausgabekilometer1 = string.format('%.2f', km)
			ausgabekilometer2 = string.format('%.2f', km2)
			oldtick = getTickCount()	
		end
		
		dxDrawText(tostring(ausgabekilometer1).." KM", x-140, y-58, "left", "top", col, 0.9)
		dxDrawText(tostring(ausgabekilometer2).." KM", x-140, y-43, "left", "top", col, 0.9)
		
		--Tank
		if getVehicleType(thevehicle) ~= "BMX" and tanktype ~= "none" then
			dxDrawImage(x-175-140, y-200, 135, 139, tanko)
			
			local model = getElementModel(thevehicle)		
			
			local newtank = g_vehicleverbrauch[model] * (6/100) * newkm
			tank = tank - newtank
			
			if tank <= 0 then
				tank = 0
				--Fahrzeug abschalten, um fahren zu verhindern
				setVehicleEngineState(thevehicle, false)
			end
			local tankstand = 17 + 234*(tank / g_vehiclemaxtank[model])
			dxDrawImage(x-205-150, y-220, 200, 200, "./files/nadel.png", tankstand)
			
			local gang = getVehicleCurrentGear(thevehicle)
			if gang == 0 and theset > 0 then
				gang = "R"
			end
			dxDrawText(tostring(gang), x-175-81, y-90, "left", "top", col, 2)
		end
	else
		dxDrawText("Keine Stats, da", x-140, y-58, "left", "top", col, 0.9)
		dxDrawText("Tempcar", x-140, y-43, "left", "top", col, 0.9)
	end	
end

function startSpeedoThing(vehicle, seat)
	if seat == 0 then
		km = getElementData(vehicle, "km")
		km2 = getElementData(vehicle, "km2")
		tank = getElementData(vehicle, "tank")
		tanktype = getElementData(vehicle, "tankArt")
		oldtick = getTickCount()
	end
end
addEventHandler("onClientPlayerVehicleEnter", getLocalPlayer(), startSpeedoThing)

function stopSpeedoThing(vehicle, seat)
	if seat == 0 and isTempcar == false then
		setElementData(vehicle, "km", km, true)
		setElementData(vehicle, "km2", km2, true)
		setElementData(vehicle, "tank", tank, true)
	end
end
addEventHandler("onClientPlayerVehicleExit", getLocalPlayer(), stopSpeedoThing)

function resetSpeedometer(commandName)
	local veh = getPedOccupiedVehicle(getLocalPlayer())
	if veh then
		if getVehicleController(veh) == getLocalPlayer() then
			if isTempcar == false then
				setElementData(veh, "km2", 0, true)
				km2 = 0
			end	
		end
	end
end
addCommandHandler("reset", resetSpeedometer)

function stopSpeedoThingWhenDestroy()
	if getPedOccupiedVehicle(getLocalPlayer()) == source then
		stopSpeedoThing(source, 0)
		stopSpeedo()
	end
end
addEventHandler("onClientElementDestroy", getRootElement(), stopSpeedoThingWhenDestroy)

function taxiToggleTaxometer(toggle)
	if toggle == true then
		taxikm = km
		showInfoMessage("Taxometer aktiviert.")
	else
		local km = km - taxikm
		showInfoMessage("Taxometer deaktiviert.\nDu solltest"..round(km*3).."$ verlangen.")
	end
end
