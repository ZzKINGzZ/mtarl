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



local sx, sy = guiGetScreenSize()
local typ = nil
local object
local object2
local object3

function policeCreateObject(model)
	if typ then return end
	typ = model
	if typ == "Sperre" then
		local x, y, z = getPosInFrontOfPlayer(localPlayer, 3)
		local a = getPedRotation(localPlayer)
		outputChatBox(tostring(a))

		if a >= 0 and a <= 45 or a >= 315 and a <= 360 or a >= 135 and a <= 225 then
			object = createObject(1228, x - 2, y, z - 0.5, 0, 0, 90)
			object2 = createObject(1228, x, y, z - 0.5, 0, 0, 90)
			object3 = createObject(1228, x + 2, y, z - 0.5, 0, 0, 90)
			attachElements(object2, object, 0, -2)
			attachElements(object3, object2, 0, -2)
		else
			object = createObject(1228, x , y - 2, z - 0.5, 0, 0, 0)
			object2 = createObject(1228, x, y, z - 0.5, 0, 0, 0)
			object3 = createObject(1228, x , y + 2, z - 0.5, 0, 0, 0)
			attachElements(object2, object, 0, 2)
			attachElements(object3, object2, 0, 2)
		end

		toggleAllControls(false, true, false)		
		addEventHandler("onClientRender", getRootElement(), policeSetObjectPos)
	elseif typ == "Nagelband" then
		local x, y, z = getPosInFrontOfPlayer(localPlayer, 3)
		local a = getPedRotation(localPlayer)
		
		object = createObject(2892, x, y, z - 1, 0, 0, a + 90)
		
		toggleAllControls(false, true, false)		
		addEventHandler("onClientRender", getRootElement(), policeSetObjectPos)
	elseif typ == "Blitzer" then
		local x, y, z = getPosInFrontOfPlayer(localPlayer, 15)
		object = createMarker (x, y, z - 1, "cylinder", 5, 255, 50, 50, 155)
		
		toggleAllControls(false, true, false)		
		addEventHandler("onClientRender", getRootElement(), policeSetObjectPos)
	end
end

function policeSetObjectPos()
	if object then
		dxDrawText("Pfeiltasten - Bewegen", sx - 150, sy / 30 * 24)
		dxDrawText("w/s - H"..ouml.."he", sx - 150, sy / 30 * 25)
		dxDrawText("e/d - Rotation", sx - 150, sy / 30 * 26)
		dxDrawText("Leertaste - Erstellen", sx - 150, sy / 30 * 27)
		dxDrawText("Backspace- Abbrechen", sx - 150, sy / 30 * 28)

		local x, y, z = getElementPosition(object)
		local rx, ry, rz = getElementRotation(object)
		local speed = 0.008
		
		if getKeyState("lshift") then
			speed = speed * 2
		end
		
		if getKeyState("arrow_d") then
			setElementPosition(object, x, y - speed, z)
		end
		if getKeyState("arrow_u") then
			setElementPosition(object, x, y + speed, z)
		end
		if getKeyState("arrow_l") then
			setElementPosition(object, x - speed, y, z)
		end
		if getKeyState("arrow_r") then
			setElementPosition(object, x + speed, y, z)
		end	
		if getKeyState("w") then
			setElementPosition(object, x, y, z + speed)
		end	
		if getKeyState("s") then
			setElementPosition(object, x, y, z - speed)
		end
		if getKeyState("e") then
			if rz then
				setElementRotation(object, rx, ry, rz + speed * 20)
			end
		end
		if getKeyState("d") then
			if rz then
				setElementRotation(object, rx, ry, rz - speed * 20)
			end
		end	
		if getKeyState("space") then
			removeEventHandler("onClientRender", getRootElement(), policeSetObjectPos)	
			toggleAllControls(true, true, false)
			if object then
				x, y, z = getElementPosition(object)
				rpcCallServerFunction("policeCreateObject", typ, getElementModel(object), x, y, z, rx, ry, rz)
				destroyElement(object)
				object = nil
			end
			if object2 then
				x, y, z = getElementPosition(object2)
				rpcCallServerFunction("policeCreateObject", typ, getElementModel(object2), x, y, z, rx, ry, rz)
				destroyElement(object2)
				object2 = nil
			end
			if object3 then
				x, y, z = getElementPosition(object3)
				rpcCallServerFunction("policeCreateObject", typ, getElementModel(object3), x, y, z, rx, ry, rz)
				destroyElement(object3)
				object3 = nil
			end
			typ = nil
		end
		if getKeyState("backspace") then
			typ = nil
			removeEventHandler("onClientRender", getRootElement(), policeSetObjectPos)
			toggleAllControls(true, true, false)
			if object then
				destroyElement(object)
				object = nil
			end
			if object2 then
				destroyElement(object2)
				object2 = nil
			end
			if object3 then
				destroyElement(object3)
				object3 = nil
			end			
		end		
	end
end

function policeNagelbandAction(toggle)
	if toggle == true then
		addEventHandler("onClientRender", getRootElement(), policeOnClientRender)
	else
		removeEventHandler("onClientRender", getRootElement(), policeOnClientRender)
	end
end

function policeOnClientRender()
	if isPedInVehicle(localPlayer) then	
	 	vehicle = getPedOccupiedVehicle(localPlayer)
		vehID = getElementModel(vehicle)
		
		if vehID == 596 or vehID == 597 or vehID == 598 or vehID == 599 or vehID == 490 then return end	--Polizei Autos
		
		local wx1, wy1, wz1 = getVehicleWheelPosition(vehicle,1)
		local wx2, wy2, wz2 = getVehicleWheelPosition(vehicle,2)
		local wx3, wy3, wz3 = getVehicleWheelPosition(vehicle,3)
		local wx4, wy4, wz4 = getVehicleWheelPosition(vehicle,4)
		
		for _, element in ipairs(getElementsByType("object")) do
			if getElementModel(element) == 2892 then
				local vx, vy, vz = getElementPosition(element)
				if getDistanceBetweenPoints3D(wx1, wy1, wz1, vx, vy, vz) <= 2.0 then
					rpcCallServerFunction("policeSetWheelStatus", vehicle, 1, -1, -1, -1)
				end
				if getDistanceBetweenPoints3D(wx2, wy2, wz2, vx, vy, vz) <= 2.0 then
					rpcCallServerFunction("policeSetWheelStatus", vehicle, -1, 1, -1, -1)
				end
				if getDistanceBetweenPoints3D(wx3, wy3, wz3, vx, vy, vz) <= 2.0 then
					rpcCallServerFunction("policeSetWheelStatus", vehicle, -1, -1, 1, -1)
				end
				if getDistanceBetweenPoints3D(wx4, wy4, wz4, vx, vy, vz) <= 2.0 then
					rpcCallServerFunction("policeSetWheelStatus", vehicle, -1, -1, -1, 1)
				end		
			end										
		end
	 end
end
