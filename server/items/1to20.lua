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



rpcRegisterGlobalFunction("crackCarWin")

local function usePetrolCan(playerSource, dynamicID, staticID)
	if staticID then
		if not getPedOccupiedVehicle(playerSource) then
			local veh, dist = closestVehicle(playerSource)
			if veh then
				if dist < 3 then
					
					local modelid = getElementModel(veh)
					local carTableID = modelid - 399
					local tank = getElementData(veh, "tank")
					local tankart = getTankArt(modelid)
					
					if tankart == "diesel" then
						tankart = "Diesel"
					elseif tankart == "benzin" then
						tankart = "Benzin"
					elseif tankart == "super" then
						tankart = "Super"
					elseif tankart == "superP" then
						tankart = "Super-Plus"
					elseif tankart == "boot" then
						tankart = "Bootsdiesel"
					elseif tankart == "kerosin" then
						tankart = "Kerosin"
					end
					
					if tankart ~= "none" then
						if tankart == "Benzin" then
							if staticID == 5 then
								if carTable[carTableID]["tank"] > tank + 5 then
									setElementData(veh, "tank", tank + 5)
									sendPlayerInfo(playerSource, "Das Fahrzeug wurde erflogreich betankt.", true)
									removePlayerItem(playerSource,dynamicID)
								else
									sendPlayerInfo(playerSource, "Das Fahrzeug hat noch genug Treibstoff.", true)
								end
							elseif staticID == 6 then
								if carTable[carTableID]["tank"] > tank + 10 then
									setElementData(veh, "tank", tank + 10)
									sendPlayerInfo(playerSource, "Das Fahrzeug wurde erflogreich betankt.", true)
									removePlayerItem(playerSource,dynamicID)
								else
									sendPlayerInfo(playerSource, "Das Fahrzeug hat noch genug Treibstoff.", true)
								end
							else
								sendPlayerInfo(playerSource, "Dein Fahrzeug braucht als Kraftstoff: "..tankart..".", true)
							end
						elseif tankart == "Super-Plus" then
							if staticID == 9 then
								if carTable[carTableID]["tank"] > tank + 5 then
									setElementData(veh, "tank", tank + 5)
									sendPlayerInfo(playerSource, "Das Fahrzeug wurde erflogreich betankt.", true)
									removePlayerItem(playerSource,dynamicID)
								else
									sendPlayerInfo(playerSource, "Das Fahrzeug hat noch genug Treibstoff.", true)
								end
							elseif staticID == 10 then
								if carTable[carTableID]["tank"] > tank + 10 then
									setElementData(veh, "tank", tank + 10)
									sendPlayerInfo(playerSource, "Das Fahrzeug wurde erflogreich betankt.", true)
									removePlayerItem(playerSource,dynamicID)
								else
									sendPlayerInfo(playerSource, "Das Fahrzeug hat noch genug Treibstoff.", true)
								end
							else
								sendPlayerInfo(playerSource, "Dein Fahrzeug braucht als Kraftstoff: "..tankart..".", true)
							end
						elseif tankart == "Diesel" then
							if staticID == 7 then
								if carTable[carTableID]["tank"] > tank + 5 then
									setElementData(veh, "tank", tank + 5)
									sendPlayerInfo(playerSource, "Das Fahrzeug wurde erflogreich betankt.", true)
									removePlayerItem(playerSource,dynamicID)
								else
									sendPlayerInfo(playerSource, "Das Fahrzeug hat noch genug Treibstoff.", true)
								end
							elseif staticID == 8 then
								if carTable[carTableID]["tank"] > tank + 10 then
									setElementData(veh, "tank", tank + 10)
									sendPlayerInfo(playerSource, "Das Fahrzeug wurde erflogreich betankt.", true)
									removePlayerItem(playerSource,dynamicID)
								else
									sendPlayerInfo(playerSource, "Das Fahrzeug hat noch genug Treibstoff.", true)
								end
							else
								sendPlayerInfo(playerSource, "Dein Fahrzeug braucht als Kraftstoff: "..tankart..".", true)
							end
						elseif tankart == "Super" then
							if staticID == 11 then
								if carTable[carTableID]["tank"] > tank + 5 then
									setElementData(veh, "tank", tank + 5)
									sendPlayerInfo(playerSource, "Das Fahrzeug wurde erflogreich betankt.", true)
									removePlayerItem(playerSource,dynamicID)
								else
									sendPlayerInfo(playerSource, "Das Fahrzeug hat noch genug Treibstoff.", true)
								end
							elseif staticID == 12 then
								if carTable[carTableID]["tank"] > tank + 10 then
									setElementData(veh, "tank", tank + 10)
									sendPlayerInfo(playerSource, "Das Fahrzeug wurde erflogreich betankt.", true)
									removePlayerItem(playerSource,dynamicID)
								else
									sendPlayerInfo(playerSource, "Das Fahrzeug hat noch genug Treibstoff.", true)
								end
							else
								sendPlayerInfo(playerSource, "Dein Fahrzeug braucht als Kraftstoff: "..tankart..".", true)
							end
						elseif tankart == "Kerosin" then
							if staticID == 13 then
								if carTable[carTableID]["tank"] > tank + 5 then
									setElementData(veh, "tank", tank + 5)
									sendPlayerInfo(playerSource, "Das Fahrzeug wurde erflogreich betankt.", true)
									removePlayerItem(playerSource,dynamicID)
								else
									sendPlayerInfo(playerSource, "Das Fahrzeug hat noch genug Treibstoff.", true)
								end
							elseif staticID == 14 then
								if carTable[carTableID]["tank"] > tank + 10 then
									setElementData(veh, "tank", tank + 10)
									sendPlayerInfo(playerSource, "Das Fahrzeug wurde erflogreich betankt.", true)
									removePlayerItem(playerSource,dynamicID)
								else
									sendPlayerInfo(playerSource, "Das Fahrzeug hat noch genug Treibstoff.", true)
								end
							else
								sendPlayerInfo(playerSource, "Dein Fahrzeug braucht als Kraftstoff: "..tankart..".", true)
							end
						elseif tankart == "Bootsdiesel" then
							if staticID == 15 then
								if carTable[carTableID]["tank"] > tank + 5 then
									setElementData(veh, "tank", tank + 5)
									sendPlayerInfo(playerSource, "Das Fahrzeug wurde erflogreich betankt.", true)
									removePlayerItem(playerSource,dynamicID)
								else
									sendPlayerInfo(playerSource, "Das Fahrzeug hat noch genug Treibstoff.", true)
								end
							elseif staticID == 16 then
								if carTable[carTableID]["tank"] > tank + 10 then
									setElementData(veh, "tank", tank + 10)
									sendPlayerInfo(playerSource, "Das Fahrzeug wurde erflogreich betankt.", true)
									removePlayerItem(playerSource,dynamicID)
								else
									sendPlayerInfo(playerSource, "Das Fahrzeug hat noch genug Treibstoff.", true)
								end
							else
								sendPlayerInfo(playerSource, "Dein Fahrzeug braucht als Kraftstoff: "..tankart..".", true)
							end
						end
					else
						sendPlayerInfo(playerSource, "Dieses Fahrzeug kann nicht betankt werden.", true)
					end
				else
					sendPlayerInfo(playerSource, "Kein Fahrzeug in der N"..auml.."he gefunden.", true)
				end
			else
				sendPlayerInfo(playerSource, "Du bist in einem Fahrzeug.", true)
			end
		end	
	end
end

local function showArbeitserlaubnis(playerSource, dynamicID, staticID)
	local playername = getPlayerName(playerSource)
	local datum = getItemData(playerSource, dynamicID, "ausgestellt")
	rpcCallClientFunction(playerSource, "toggleArbeitserlaubnis", true, playername, datum)
end

local function useNightVision(playerSource, dynamicID, staticID)
	if staticID then
		CORE:getPlayer(playerSource):callClient("useNightVisionClient")
	end
end

local function useTermalVision(playerSource, dynamicID, staticID)
	if staticID then
		CORE:getPlayer(playerSource):callClient("useTermalVisionClient")
	end	
end

local function useFahrzeugNotKit(playerSource, dynamicID, staticID)
	local veh, dist = closestVehicle(playerSource)
	if veh then
		if dist < 3 then	
			if not isVehicleJobVehicle(veh) then
				local model = getElementModel(veh)
				local safety = getCarSafty(model)
				
				if g_vehiclestat[veh]["safty"] then safety = g_vehiclestat[vehicle]["safty"] end
				
				local howMany = safety * 5
				
				rpcCallClientFunction(playerSource, "startCarCrackingItem", veh, howMany)
				removePlayerItem(playerSource, dynamicID)
			else
				sendPlayerInfo("Staatsfahrzeuge sind gegen Einbruch gesichert.", true)
				return true
			end
		else
			sendPlayerInfo("Kein Fahrzeug in der N"..auml.."he gefunden.", true)
			return true
		end
	end	
end

function crackCarWin(vehicle)
	if vehicle then
		setVehicleLocked(vehicle, false)
	end
end

local function useCam(playerSource, dynamicID, staticID)
	if staticID then
		giveWeapon(playerSource, 43, 10, true)
		removePlayerItem(playerSource,dynamicID)
	end
end

local function toggleHandy(playerSource, dynamicID, staticID)
	if staticID then
		rpcCallClientFunction(playerSource, "toggleHandy")
		--sendPlayerInfo(playerSource, "Das Handy wird zur Zeit "..uuml.."berarbeitet. Warte bis Version 1.2.0")
	end
end

local function oneToTwentyItemsInit()
	--addItem(staticID, name, destroyable, giveable)
	addItem(1, "Personalausweis", false, false, "vcard")
	addItem(2, "Aufenthaltsdokumente", false, false, "travel")
	
	addItem(3, "Arbeitserlaubnis", false, false, "toolbox")
	setItemUseFunction(3, showArbeitserlaubnis)
	
	addItem(4, "Fahrzeug KIT", true, true, "perfomance")
	setItemUseFunction(4, useFahrzeugNotKit)
	
	addItem(5, "5L Benzin-Kanister", true, true, "gas")
	setItemUseFunction(5, usePetrolCan)
	
	addItem(6, "10L Benzin-Kanister", true, true, "gas")
	setItemUseFunction(6, usePetrolCan)
	
	addItem(7, "5L Diesel-Kanister", true, true, "gas")
	setItemUseFunction(7, usePetrolCan)
	
	addItem(8, "10L Diesel-Kanister", true, true, "gas")
	setItemUseFunction(8, usePetrolCan)
	
	addItem(9, "5L SuperPlus-Kanister", true, true, "gas")
	setItemUseFunction(9, usePetrolCan)
	
	addItem(10, "10L SuperPlus-Kanister", true, true, "gas")
	setItemUseFunction(10, usePetrolCan)
	
	addItem(11, "5L Super-Kanister", true, true, "gas")
	setItemUseFunction(11, usePetrolCan)
	
	addItem(12, "10L Super-Kanister", true, true, "gas")
	setItemUseFunction(12, usePetrolCan)
	
	addItem(13, "5L Kerosin-Kanister", true, true, "gas")
	setItemUseFunction(13, usePetrolCan)
	
	addItem(14, "10L Kerosin-Kanister", true, true, "gas")
	setItemUseFunction(14, usePetrolCan)
	
	addItem(15, "5L BootsDiesel-Kanister", true, true, "gas")
	setItemUseFunction(15, usePetrolCan)
	
	addItem(16, "10L BootsDiesel-Kanister", true, true, "gas")
	setItemUseFunction(16, usePetrolCan)
	
	addItem(17, "Nachtsichtkamera", true, true, "camera")
	setItemUseFunction(17, useNightVision)
	
	addItem(18, "W"..auml.."rmebildkamera", true, true, "camera")
	setItemUseFunction(18, useTermalVision)
	
	addItem(19, "Kamera", true, true, "camera")
	setItemUseFunction(19, useCam)
	
	addItem(20, "Mobiltelefon", true , true, "phone")
	setItemUseFunction(20, toggleHandy)
end
addEventHandler('onResourceStart', getResourceRootElement(), oneToTwentyItemsInit)
