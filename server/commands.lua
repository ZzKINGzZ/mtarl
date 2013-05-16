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



--Player


function pmPlayer(playerSource, commandName, goToPlayer, ...)
	if not goToPlayer then
		outputChatBox(g_colors["red"].."Du musst einen Spielerteil oder den vollen Spielernamen angeben!", playerSource, 255, 255, 255, true)
		return false
	end
	local thePlayer = getPlayerFromName(goToPlayer)
	if not thePlayer then
		thePlayer = getPlayerFromString(goToPlayer)
	end
	if not thePlayer then 
		outputChatBox(g_colors["red"].."Dieser Spieler ist nicht online oder exestiert nicht!", playerSource, 255, 255, 255, true)
		return false
	end
	
	local thepm = table.concat({...}, " ")
	outputChatBox(g_colors["darkorange"].." [PM nach "..getPlayerName(thePlayer).."] "..thepm, playerSource, 255, 255, 255, true)
	outputChatBox(g_colors["darkorange"].." [PM von "..getPlayerName(playerSource).."] "..thepm, thePlayer, 255, 255, 255, true)
end
addCommandHandler("pm", pmPlayer)

function givePlayerCash(source, command, giveplayername, amount)
	if not giveplayername then
		outputChatBox("Du hast keinen Spieler angegeben", source, 243, 151, 12)
		return false
	end
	if not amount then
		outputChatBox("Du hast keinen Betrag angegeben", source, 243, 151, 12)
		return false
	end	
	local player = CORE:getPlayer(source)
    local money = player:getMoney()
    local givenplayer = getPlayerFromName(giveplayername)
	if not givenplayer then 
		givenplayer = getPlayerFromString(giveplayername)
	end
    local moneytogive = tonumber(amount)    
    if money < moneytogive then
        outputChatBox("* Ungueltig", source, 243, 151, 12)
        return
    end
    if moneytogive < 1 then
        outputChatBox("* Ungueltig", source, 243, 151, 12)
        return
    end    
    local playername = player:getName()
    if givenplayer then
		CORE:getPlayer(givenplayer):giveMoney(tonumber(amount))
		player:takeMoney(tonumber(amount))
        --outputChatBox("Du hast " ..amount.."$ an "..getPlayerName ( givenplayer ).. " gesendet", source, 243, 151, 12)
        --outputChatBox(playername.. " hat dir " ..amount.. "$ geschickt.", givenplayer, 243, 151, 12)
		sendPlayerInfo(source, "Du hast " ..amount.."$ an "..getPlayerName ( givenplayer ).. " gesendet.", true)
		sendPlayerInfo(givenplayer, playername.. " hat dir " ..amount.. "$ geschickt.", true)
    else
        outputChatBox("Dieser Spieler ist nicht online oder exestiert nicht", source, 243, 151, 12)
    end    
end
addCommandHandler("givecash", givePlayerCash)

function saveCarSpawn(playerSource, commandName)
	local vehicle, distance = closestVehicle(playerSource)
	if vehicle then
		if distance < 10 then
			local vehicleid = g_vehiclestat[vehicle]["ID"]
			if g_playerstat[playerSource]["Key"][vehicleid] == 2 or g_playerstat[playerSource]["Level"] == "Admin" then
				local x, y, z = getElementPosition(vehicle)
				local rx, ry, rz = getVehicleRotation(vehicle)
				
				mysql_query(g_mysql["connection"], "UPDATE `vehicles` SET\
																		  `spawnx` = '"..x.."',\
																		  `spawny` = '"..y.."',\
																		  `spawnz` = '"..z.."',\
																		  `spawnrx` = '"..rx.."',\
																		  `spawnry` = '"..ry.."',\
																		  `spawnrz` = '"..rz.."'\
													WHERE `vehicles`.`id` = "..vehicleid.." LIMIT 1;")					  
				
				g_vehiclestat[vehicle]["spawnx"] = x
				g_vehiclestat[vehicle]["spawny"] = y
				g_vehiclestat[vehicle]["spawnz"] = z
				g_vehiclestat[vehicle]["spawnrx"] = rx
				g_vehiclestat[vehicle]["spawnry"] = ry
				g_vehiclestat[vehicle]["spawnrz"] = rz			

				--outputChatBox(g_colors["green"].."Fahrzeug erfolgreich gespeichert!", playerSource, 255, 255, 255, true)
				sendPlayerInfo(playerSource, "Du hast das Fahrzeug erfolgreich an dieser Position gespeichert.", true)
			else
				outputChatBox(g_colors["red"].."Dieses Fahrzeug gehört dir nicht!", playerSource, 255, 255, 255, true)
				return false
			end
		end
	end
end 
addCommandHandler("savecar", saveCarSpawn)

function tilgeStaatsschulden(playerSource, commandName, amount)
	amount = tonumber(amount)
	if not amount then 
		if g_playerstat[playerSource]["Staatsschulden"] > getPlayerMoney(playerSource) then
			amount = getPlayerMoney(playerSource)
		else
			amount = g_playerstat[playerSource]["Staatsschulden"]
		end	
	else
		if getPlayerMoney(playerSource) < amount then
			amount = getPlayerMoney(playerSource)
		end
	end
	
	if amount > 0 then
	
		takePlayerMoney(playerSource, amount)
		giveStaatsKasse(amount)
		g_playerstat[playerSource]["Staatsschulden"] = g_playerstat[playerSource]["Staatsschulden"] - amount
		--outputChatBox(g_colors["green"].."Du hast deine Staatsschulden getilgt (Noch offen: "..g_playerstat[playerSource]["Staatsschulden"]..")", playerSource, 0, 0, 0, true)
		sendPlayerInfo(playerSource, "Du hast "..amount.."$ deiner Staatschulden beglichen.", true)
	end	
end	
addCommandHandler("tilgen", tilgeStaatsschulden)

function GPSPlayerCars(playerSource, commandName)
	--isVehicleJobVehicle(vehicle)
	if not g_playerstat[playerSource]["gpsON"] then
		for fahrzeugid, state in pairs(g_playerstat[playerSource]["Key"]) do
			if fahrzeugid and state then
				if state == 2 then
					local vehicle = getElementByID(tostring(fahrzeugid))
					if vehicle then
						if not isVehicleJobVehicle(vehicle) then
							if g_vehiclestat[vehicle]["gps"] then
								local blip = createBlipAttachedTo(vehicle, 55, 2, 255, 0, 0, 255, 0, 99999.0, playerSource)
								setElementData(blip, "GPSVehicle", vehicle)
							end
						end
					end	
				end
			end
		end
		outputChatBox(g_colors["yellow"].."GPS aktiviert!", playerSource, 0, 0, 0, true)
		g_playerstat[playerSource]["gpsON"] = true
	else
		for fahrzeugid, state in pairs(g_playerstat[playerSource]["Key"]) do
			if fahrzeugid and state then
				if state == 2 then
					local vehicle = getElementByID(tostring(fahrzeugid))
					if vehicle then
						if not isVehicleJobVehicle(vehicle) then
							if g_vehiclestat[vehicle]["gps"] then
								--local blip = createBlipAttachedTo(vehicle, 55, 2, 255, 0, 0, 255, 0, 99999.0, playerSource)
								--setElementData(blip, "GPSVehicle", vehicle)
								local elements = getAttachedElements(vehicle) 
								for i, element in ipairs(elements) do
									if getElementType(element) == "blip" then
										if getElementData(element, "GPSVehicle") then
											if getElementData(element, "GPSVehicle") == vehicle then
												destroyElement(element)
											end
										end
									end
								end
							end
						end
					end	
				end
			end
		end
		outputChatBox(g_colors["yellow"].."GPS deaktiviert!", playerSource, 0, 0, 0, true)
		g_playerstat[playerSource]["gpsON"] = false
	end
end
addCommandHandler("gps", GPSPlayerCars)

function togglePlayerAfk(playerSource, commandName)
	if not g_playerstat[playerSource]["AFK"] then
		g_playerstat[playerSource]["AFK"] = getTimestamp()
		
		outputChatBox(g_colors["greenblue"]..getPlayerName(playerSource).." ist nun AFK!", getRootElement(), 0, 0, 0, true)
		setElementAlpha(playerSource, 150)
		setElementFrozen(playerSource, false)
		toggleAllControls(playerSource, false, false, false)
		
		if not getPedOccupiedVehicle( playerSource) then
			setElementCollisionsEnabled(playerSource, false)
		end		
	else
		outputChatBox(g_colors["greenblue"]..getPlayerName(playerSource).." ist wieder da!", getRootElement(), 0, 0, 0, true)
		setElementAlpha (playerSource, 255)
		setElementFrozen(playerSource, true)
		toggleAllControls(playerSource, true, true, true)
		
		if not getPedOccupiedVehicle( playerSource) then
			setElementCollisionsEnabled(playerSource, true)
		end	
		
		if isPlayerActiveInAnyJob(playerSource) then
			local currentTime = getTimestamp()
			local afkTime = currentTime - g_playerstat[playerSource]["AFK"]
			addPlayerJobAfkTime(playerSource, afkTime)
		end
		g_playerstat[playerSource]["AFK"] = nil
	end
end
addCommandHandler("afk", togglePlayerAfk)
addCommandHandler("back", togglePlayerAfk)


function adminCall(playerSource, commandName)
	if not g_playerstat[playerSource]["adminBlip"] then
		g_playerstat[playerSource]["adminBlip"] = createBlipAttachedTo(playerSource, 0, 2, 255, 0, 0, 155, 0, 99999, playerSource)
		setElementVisibleTo(g_playerstat[playerSource]["adminBlip"], getRootElement(), false)
		for i, player in ipairs(getElementsByType("player")) do
			if g_playerstat[player]["Level"] == "Supporter" or g_playerstat[player]["Level"] == "Team" or g_playerstat[player]["Level"] == "Admin" then
				setElementVisibleTo(g_playerstat[playerSource]["adminBlip"], player, true)
				sendPlayerInfo(player, getPlayerName(playerSource).." hat sich für das Team auf der Karte sichtbar gemacht.", true)
			end
		end
	else
		destroyElement(g_playerstat[playerSource]["adminBlip"])	
		g_playerstat[playerSource]["adminBlip"] = nil
	end
end
addCommandHandler("admincall", adminCall)
