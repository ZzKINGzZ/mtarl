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



local cartMarker = {}
local cartPlayer
local cartTimer
local car

function initializeCart()
	cartMarker["Start"] = createMarker(1166.5283203125, 1348.1728515625, 10.921875-1, "cylinder", 2, 150, 150, 30, 200, getRootElement())
	cartMarker["Stop"] = createMarker(1161.294921875, 1341.494140625, 10.812517166138-1, "cylinder", 2, 150, 150, 30, 200, getRootElement())
	cartMarker["Repair"] = createMarker(1168.431640625, 1341.6162109375, 10.81251716613-1, "cylinder", 3, 255, 1, 1, 150, getRootElement())
	
	addEventHandler("onMarkerHit", cartMarker["Start"], onCartMarkerHit)
	addEventHandler("onMarkerHit", cartMarker["Stop"], onCartMarkerHit)
	addEventHandler("onMarkerHit", cartMarker["Repair"], onCartMarkerHit)
end
addEventHandler('onResourceStart', getResourceRootElement(), initializeCart)

function onCartMarkerHit(playerSource)
	if getElementType(playerSource) == "player" then
		if not isPlayerActiveInAnyJob(playerSource) then
			if source == cartMarker["Start"] then
				cartPlayer = playerSource
				--toggleCartTimer()	
				takePlayerMoney(playerSource, 20)
				giveStaatsKasse(20)				
				outputChatBox(g_colors["poisongreen"].."Willkommen auf der Cart Bahn! Das Fahren kostet 50$.", playerSource, 0, 0, 0, true)
				setElementPosition(playerSource, 1165.30078125, 1343.90625, 10.812517166138)
				
				--Erstellen wir das GoCarts
				local veh = createTempVehicleMTARL(571, 1174.7392578125, 1331.728515625, 10.112253189087, 359.82421875, 359.99450683594, 91.367797851563)
				g_vehiclestat[veh]["CartCar"] = true
				car = veh
				getPlayerCartMoney()
			end
			if source == cartMarker["Stop"] then
				toggleCartTimer(false)
				setElementPosition(playerSource, 1167.0693359375, 1351.771484375, 10.921875)
				
				--Löschen wir das GoCarts
				if g_vehiclestat[car]["tempcar"] == true then
					if g_vehiclestat[car]["CartCar"] == true then
						destroyElement(car)
					end
				end
			end
			if source == cartMarker["Repair"] then
				local vehicle = getPedOccupiedVehicle(playerSource)
				if g_vehiclestat[vehicle] then
					if g_vehiclestat[vehicle]["CartCar"] == true then
						fixVehicle(vehicle)
						setElementHealth(vehicle, 1000)
						outputChatBox(g_colors["poisongreen"].."Das Fahrzeug ist nun vollgetankt und repariert!", playerSource, 0, 0, 0, true)
						setElementData(vehicle, "tank", 20)
					end
				end	
			end
		end
	end
end


function toggleCartTimer(toggle)
	if toggle == true then
		--cartTimer = setTimer (getPlayerCartMoney, 2000, 5) --18000
	else 
		if isTimer(cartTimer) then
			killTimer(cartTimer)
		end
	end
end

function getPlayerCartMoney()
	takePlayerMoney(cartPlayer, 200)
	giveStaatsKasse(200)
end

local function leaveCarGoCart(player, seat, jacker)
	if g_vehiclestat[source]["CartCar"] == true then
		if getElementModel(source) == 571 then
			if g_vehiclestat[source]["tempcar"] == true then
				car = source
			end			
		end
	end
end
addEventHandler("onVehicleExit", getRootElement(), leaveCarGoCart)
