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



local tankstellen = {}

function getTankArt(modelid)
	if modelid then
		local carTableID = tonumber(modelid) - 399
		if carTable[carTableID] then
			if carTable[carTableID]["tankart"] then 
				return carTable[carTableID]["tankart"] 
			end	
		end
	end	
	return false
end

function getMaxTank(modelid)
	if modelid then
		local carTableID = tonumber(modelid) - 399
		if carTable[carTableID] then
			if carTable[carTableID]["tank"] then 
				return carTable[carTableID]["tank"] 
			end	
		end
	end	
	return false
end


local function startTankstellen()
	outputDebug("tankstellen.lua start...")
	
	createObject(1676, 723.16381835938, -1496.5157470703, 2.5152115821838)
	createObject(1676, 2290.7548828125, 521.70013427734, 2.5233335494995)
	createObject(1676, 2297.0122070313, 521.66064453125, 2.5233335494995)
	createObject(1676, -2294.7585449219, 2224.8249511719, 5.5630578994751)
	createObject(1676, -1149.2440185547, -170.55111694336, 14.72930431366, 0, 0, 314.34533691406)
	createObject(1676, 1911.1169433594, -2638.2749023438, 14.12774181366, 0, 0, 270.3603515625)
	createObject(1676, 1911.1201171875, -2634.4274902344, 14.12774181366, 0, 0, 270.27026367188)
	createObject(1676, 1911.1038818359, -2630.4858398438, 14.12774181366, 0, 0, 270.22521972656)
	createObject(1676, 1584.9222412109, 1646.8168945313, 11.40117931366)
	createObject(1676, 1580.8881835938, 1646.9063720703, 11.40117931366)
	createObject(1676, 1577.2114257813, 1646.8234863281, 11.40117931366)
	createObject(1244, -940.09497070313, 2642.2124023438, 41.949893951416, 0, 0, 41.684814453125)

	local tanken = mysql_query(g_mysql["connection"], "SELECT * FROM `tankstellen`")
	if tanken then
		while true do
			local row = mysql_fetch_assoc(tanken)
			if not row then break end
			
			local tanke = createElement("tankstelle")
			setElementPosition(tanke, tonumber(row["x"]), tonumber(row["y"]), tonumber(row["z"]))
			
			local col = createColSphere(tonumber(row["x"]), tonumber(row["y"]), tonumber(row["z"]), 15)
			setElementData(tanke, "id", tonumber(row["id"]))
			setElementData(tanke, "colshape", col)
			setElementData(col, "tankstelle", tanke)
			
			setElementData(tanke, "benzin", tonumber(row["benzin"]))
			setElementData(tanke, "diesel", tonumber(row["diesel"]))
			setElementData(tanke, "super", tonumber(row["super"]))
			setElementData(tanke, "superP", tonumber(row["superP"]))
			setElementData(tanke, "kerosin", tonumber(row["kerosin"]))
			setElementData(tanke, "boot", tonumber(row["boot"]))
			
			local benzinpreis = 0
			if tonumber(row["benzin"]) > 0 then benzinpreis = round(12 - tonumber(row["benzin"])/50)
			elseif tonumber(row["benzin"]) == -1 then benzinpreis = -1 end
			
			local superpreis = 0
			if tonumber(row["super"]) > 0 then superpreis = round(13 - tonumber(row["super"])/50)
			elseif tonumber(row["super"]) == -1 then superpreis = -1 end
			
			local superPpreis = 0
			if tonumber(row["superP"]) > 0 then superPpreis = round(14 - tonumber(row["superP"])/50)
			elseif tonumber(row["superP"]) == -1 then superpPreis = -1 end

			local dieselpreis = 0
			if tonumber(row["diesel"]) > 0 then dieselpreis = round(13 - tonumber(row["diesel"])/50)
			elseif tonumber(row["diesel"]) == -1 then dieselpreis = -1 end

			local kerosinpreis = 0
			if tonumber(row["kerosin"]) > 0 then kerosinpreis = round(17 - tonumber(row["kerosin"])/50)
			elseif tonumber(row["kerosin"]) == -1 then kerosinpreis = -1 end
			
			local bootpreis = 0
			if tonumber(row["boot"]) > 0 then bootpreis = round(15 - tonumber(row["boot"])/50)
			elseif tonumber(row["boot"]) == -1 then bootpreis = -1 end
			
			setElementData(tanke, "benzinPreis", benzinpreis)
			setElementData(tanke, "dieselPreis", dieselpreis)
			setElementData(tanke, "superPreis", superpreis)
			setElementData(tanke, "superPPreis", superPpreis)
			setElementData(tanke, "kerosinPreis", kerosinpreis)
			setElementData(tanke, "bootPreis", bootpreis)

		end
		mysql_free_result(tanken)	
	end
end
addEventHandler('onResourceStart', getResourceRootElement(), startTankstellen)

local function saveTankstellen()
	if shouldServerShutDownFast() then return true end
	
	outputDebug("tankstellen.lua stop")	
	for _, tankstelle in ipairs(getElementsByType("tankstelle")) do
		local id = getElementData(tankstelle, "id")
		
		local res = mysql_query(g_mysql["connection"], "UPDATE `tankstellen` SET\
													                 `benzin` = '"..getElementData(tankstelle, "benzin").."',\
													                 `diesel` = '"..getElementData(tankstelle, "diesel").."',\
													                 `super` = '"..getElementData(tankstelle, "super").."',\
													                 `superP` = '"..getElementData(tankstelle, "superP").."',\
													                 `kerosin` = '"..getElementData(tankstelle, "kerosin").."',\
													                 `boot` = '"..getElementData(tankstelle, "boot").."'\
											WHERE `id` = "..id)
		
		if res then
			outputDebug("Tankstelle gespeichert: "..id)	
		else
			outputDebug("Tankstelle konnte nicht gespeichert werden: "..id)	
		end		
	end	
end
addEventHandler('onResourceStop', getResourceRootElement(), saveTankstellen)

local function startAuftanken(playerSource, commandName)
	--closestVehicle(playerSource)
	local tanke
	for _, tankstelle in ipairs(getElementsByType("tankstelle")) do
		if isElementWithinColShape(playerSource, getElementData(tankstelle, "colshape")) then
			tanke = tankstelle
			break
		end
	end
	
	if not tanke then 
		outputChatBox(colors["red"].."Du bist nicht bei einer Tankstelle!", playerSource, 0, 0, 0, true)
		return false
	end
	
	local vehicle, distance = closestVehicle(playerSource)
	if distance < 5 then
		if isElementWithinColShape(vehicle, getElementData(tanke, "colshape")) then
			local modelid = getElementModel(vehicle)
			local carTableID = modelid - 399
			local tankart = getTankArt(modelid)
			if tankart == "none" then 	
				outputChatBox(g_colors["red"].."Dieses Fahrzeug kann nicht getankt werden!", playerSource, 0, 0, 0, true)
				return false
			end

			if getElementData(tanke, tankart) == -1 then
				outputChatBox(g_colors["red"].."Dieses Fahrzeug verf"..uuml.."gt nicht "..uuml.."ber den n"..ouml.."tigen Kraftstoff!", playerSource, 0, 0, 0, true)
				return false			
			end
			
			if carTable[carTableID]["tank"] < getElementData(vehicle, "tank") then
				outputChatBox(g_colors["red"].."Dein Fahrzeug ist voll genug!", playerSource, 0, 0, 0, true)
				return false
			end
			
			if g_vehiclestat[vehicle]["auftanken"] then
				outputChatBox(g_colors["red"].."Das Fahrzeug tankt bereits auf!", playerSource, 0, 0, 0, true)
				return false			
			end
			
			if getPedOccupiedVehicle(playerSource) then
				outputChatBox(g_colors["red"].."Du musst das Fahrzeug verlassen, um aufzutanken!", playerSource, 0, 0, 0, true)
				return false
			end
			
			g_vehiclestat[vehicle]["auftanken"] = true
			g_vehiclestat[vehicle]["tankstelle"] = tanke
			g_vehiclestat[vehicle]["tanker"] = playerSource
			g_vehiclestat[vehicle]["liter"] = 0
			g_vehiclestat[vehicle]["preis"] = 0
			
			if tankart == "diesel" then
				outputChatBox(g_colors["yellow"].."Tankvorgang gestartet, bitte warte bis das Fahrzeug voll ist. ("..g_colors["green"].."Diesel"..g_colors["yellow"]..")", playerSource, 0, 0, 0, true)
			elseif tankart == "benzin" then
				outputChatBox(g_colors["yellow"].."Tankvorgang gestartet, bitte warte bis das Fahrzeug voll ist. ("..g_colors["green"].."Benzin"..g_colors["yellow"]..")", playerSource, 0, 0, 0, true)
			elseif tankart == "super" then
				outputChatBox(g_colors["yellow"].."Tankvorgang gestartet, bitte warte bis das Fahrzeug voll ist. ("..g_colors["green"].."Super"..g_colors["yellow"]..")", playerSource, 0, 0, 0, true)
			elseif tankart == "superP" then
				outputChatBox(g_colors["yellow"].."Tankvorgang gestartet, bitte warte bis das Fahrzeug voll ist. ("..g_colors["green"].."Super Plus"..g_colors["yellow"]..")", playerSource, 0, 0, 0, true)
			elseif tankart == "boot" then
				outputChatBox(g_colors["yellow"].."Tankvorgang gestartet, bitte warte bis das Fahrzeug voll ist. ("..g_colors["green"].."Bootsdiesel"..g_colors["yellow"]..")", playerSource, 0, 0, 0, true)
			elseif tankart == "kerosin" then
				outputChatBox(g_colors["yellow"].."Tankvorgang gestartet, bitte warte bis das Fahrzeug voll ist. ("..g_colors["green"].."Kerosin"..g_colors["yellow"]..")", playerSource, 0, 0, 0, true)
			end
		else
			outputChatBox(g_colors["red"].."Das Fahrzeug ist nicht nah genug an einer Tankstelle!", playerSource, 0, 0, 0, true)
			return false
		end
	else
		outputChatBox(g_colors["red"].."Kein Fahrzeug zum auftanken in der N"..auml.."he gefunden!", playerSource, 0, 0, 0, true)
		return false
	end
end
addCommandHandler("tanken", startAuftanken)

function stopAuftanken(playerSource)
	local veh, dist = closestVehicle(playerSource)
	if dist < 6 then
		if g_vehiclestat[veh] then
			if g_vehiclestat[veh]["auftanken"] then
				sendPlayerInfo(g_vehiclestat[veh]["tanker"], "Du hast den Tankvorgang abgebrochen. ("..g_vehiclestat[veh]["liter"].."Liter f"..uuml.."r "..g_vehiclestat[veh]["preis"].."$)")
				g_vehiclestat[veh]["auftanken"] = false
			end
		end
	end	
end
addCommandHandler("stoptanken", stopAuftanken)

function fahrzeugTankeTimer()
	if g_vehiclestat[source] then
		if g_vehiclestat[source]["auftanken"] then
			if not g_vehiclestat[source]["tanker"] then
				g_vehiclestat[source]["auftanken"] = false
				return false
			end
			
			local tankstelle
			if not g_vehiclestat[source]["tankstelle"] then
				g_vehiclestat[source]["auftanken"] = false
				return false		
			end
			tankstelle = g_vehiclestat[source]["tankstelle"]
			
			local modelid = getElementModel(source)
			local carTableID = modelid - 399
			
			local tank = getElementData(source, "tank")
			local tankart = getTankArt(modelid)
			
			if not isElementWithinColShape(source, getElementData(tankstelle, "colshape")) then
				--outputChatBox(g_colors["red"].."Das Fahrzeug hat den Tankstellenbereich verlassen. Tankvorgang abgebrochen!", g_vehiclestat[source]["tanker"], 0, 0, 0, true)
				sendPlayerInfo(g_vehiclestat[source]["tanker"], "Das Fahrzeug hat den Tankstellenbereich verlassen. Tankvorgang abgebrochen! ("..g_vehiclestat[source]["liter"].."Liter f"..uuml.."r "..g_vehiclestat[source]["preis"].."$)")
				g_vehiclestat[source]["auftanken"] = false
				return false				
			end
			
			if getElementData(tankstelle, tankart) == -1 then
				g_vehiclestat[source]["auftanken"] = false
				return false		
			end
			
			if getElementData(tankstelle, tankart) == 0 then
				g_vehiclestat[source]["auftanken"] = false
				return false
			end
			
			if carTable[carTableID]["tank"] < tank then
				--Preise neu berechnen
				recalcTankstellenPreis(tankstelle, tankart)
				
				--outputChatBox(g_colors["green"].."Dein Fahrzeug ist nun vollgetankt. Du kannst nun weiterfahren.", g_vehiclestat[source]["tanker"], 0, 0, 0, true)
				sendPlayerInfo(g_vehiclestat[source]["tanker"], "Das Fahrzeug wurde erfolgreich aufgetankt. ("..g_vehiclestat[source]["liter"].."Liter f"..uuml.."r "..g_vehiclestat[source]["preis"].."$)")
				
				g_vehiclestat[source]["auftanken"] = false
				return false
			end	

			if getPlayerMoney(g_vehiclestat[source]["tanker"]) < 0 then
			    g_vehiclestat[source]["auftanken"] = false
				sendPlayerInfo(g_vehiclestat[source]["tanker"], "Dein Geld ist alle!")
				return false
			end
			
			if getElementData(tankstelle, tankart) > 1 then
				g_vehiclestat[source]["liter"] = g_vehiclestat[source]["liter"] + 2
				g_vehiclestat[source]["preis"] = g_vehiclestat[source]["preis"] + getElementData(tankstelle, tankart.."Preis")*2
				local newTank = tank + 2
				setElementData(source, "tank", newTank)
				setElementData(tankstelle, tankart, getElementData(tankstelle, tankart) - 1)
				
				--setElementData(tanke, "benzinPreis", benzinpreis)
				if not isVehicleJobVehicle(source) then
					takePlayerMoney(g_vehiclestat[source]["tanker"], getElementData(tankstelle, tankart.."Preis"))
					giveStaatsKasse(getElementData(tankstelle, tankart.."Preis"))
				end	
			else
				setElementData(source, "tank", tank + getElementData(tankstelle, tankart))
				setElementData(tankstelle, tankart, 0)
				
				if not isVehicleJobVehicle(source) then
					takePlayerMoney(g_vehiclestat[source]["tanker"], getElementData(tankstelle, tankart.."Preis"))
					giveStaatsKasse(getElementData(tankstelle, tankart.."Preis"))
				end	
				
				--outputChatBox(g_colors["green"].."Die Tankstelle ist nun leer, dein Fahrzeug konnte nicht komplett aufgetankt werden.", g_vehiclestat[source]["tanker"], 0, 0, 0, true)
				sendPlayerInfo(g_vehiclestat[source]["tanker"], "Die Tankstelle ist nun leer, dein Fahrzeug konnte nicht komplett aufgetankt werden. ("..g_vehiclestat[vehicle]["liter"].."Liter f"..uuml.."r "..g_vehiclestat[vehicle]["preis"].."$)")
				
				g_vehiclestat[source]["auftanken"] = false
			end
		end
	end	
end
addEventHandler("onGeneralVehicleTimer", getRootElement(), fahrzeugTankeTimer)

local function tankeVehicleEnter(player, seat, jacked, door)
	if g_vehiclestat[source] then 
		if g_vehiclestat[source]["auftanken"] then
			cancelEvent()
			--outputChatBox(g_colors["red"].."Du kannst das Fahrzeug nicht betreten, wenn es aufgetankt wird!", player, 0, 0, 0, true)
			sendPlayerInfo(player, "Du kannst das Fahrzeug nicht betreten, wenn es aufgetankt wird!")
		end
	end
end
addEventHandler("onVehicleStartEnter", getRootElement(), tankeVehicleEnter)

function recalcTankstellenPreis(tankstelle, treibstoff)
	if treibstoff == "benzin" then
		local benzinpreis = 0
		if tonumber(getElementData(tankstelle, "benzin")) > 0 then benzinpreis = round(12 - tonumber(getElementData(tankstelle, "benzin"))/50)
		elseif tonumber(getElementData(tankstelle, "benzin")) == -1 then benzinpreis = -1 end
		setElementData(tankstelle, "benzinPreis", benzinpreis)
	elseif treibstoff == "diesel" then
		local dieselpreis = 0
		if tonumber(getElementData(tankstelle, "diesel")) > 0 then dieselpreis = round(13 - tonumber(getElementData(tankstelle, "diesel"))/50)
		elseif tonumber(getElementData(tankstelle, "diesel")) == -1 then dieselpreis = -1 end	
		setElementData(tankstelle, "dieselPreis", dieselpreis)
	elseif treibstoff == "super" then
		local superpreis = 0
		if tonumber(getElementData(tankstelle, "super")) > 0 then superpreis = round(13 - tonumber(getElementData(tankstelle, "super"))/50)
		elseif tonumber(getElementData(tankstelle, "super")) == -1 then superpreis = -1 end
		setElementData(tankstelle, "superPreis", superpreis)
	elseif treibstoff == "superP" then
		local superPpreis = 0
		if tonumber(getElementData(tankstelle, "superP")) > 0 then superPpreis = round(14 - tonumber(getElementData(tankstelle, "superP"))/50)
		elseif tonumber(getElementData(tankstelle, "superP")) == -1 then superpPreis = -1 end
		setElementData(tankstelle, "superPPreis", superPpreis)
	elseif treibstoff == "kerosin" then
		local kerosinpreis = 0
		if tonumber(getElementData(tankstelle, "kerosin")) > 0 then kerosinpreis = round(17 - tonumber(getElementData(tankstelle, "kerosin"))/50)
		elseif tonumber(getElementData(tankstelle, "kerosin")) == -1 then kerosinpreis = -1 end	
		setElementData(tankstelle, "kerosinPreis", kerosinpreis)
	elseif treibstoff == "boot" then
		local bootpreis = 0
		if tonumber(getElementData(tankstelle, "boot")) > 0 then bootpreis = round(15 - tonumber(getElementData(tankstelle, "boot"))/50)
		elseif tonumber(getElementData(tankstelle, "boot")) == -1 then bootpreis = -1 end
		setElementData(tankstelle, "bootPreis", bootpreis)
	end
end
