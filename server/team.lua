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



--Userstats:
--Admin
--Sumod
--Mod
--Support
--User < Brauchen wir hier nicht

function setPlayerToWhitelist(playerSource, commandName, playerName)
	if g_playerstat[playerSource]["Level"] == "Supporter" or g_playerstat[playerSource]["Level"] == "Team" or g_playerstat[playerSource]["Level"] == "Admin" then
		if not playerName then
			outputChatBox(g_colors["darkorange"].."Du musst einen Spielernamen angeben, der auf die Whitelist gesetzt werden soll", playerSource, 0, 0, 0, true)
			return false
		end
		playerName = escapeString(playerName)
		
		if not g_whitelist["name"][playerName] then
			local pin = math.random(111111, 999999)
			local sql = "INSERT INTO `pins` (`name`, `pin`) VALUES ('"..playerName.."', '"..pin.."');"
			mysql_query(g_mysql["connection"], sql)
			g_whitelist["name"][playerName] = 1
			if commandName ~= "adminwhitelist" then
				outputChatBox(g_colors["darkorange"].."Du hast "..playerName.." der Whitelist hinzugefügt! PIN: "..pin, playerSource, 0, 0, 0, true)
			else
				rpcCallClientFunction(client, "adminWLSetPin", pin)
			end
			return true
		else
			local sql = "DELETE FROM `pin` WHERE `name` = '"..playerName.."';"
			mysql_query(g_mysql["connection"], sql)
			g_whitelist["name"][playerName] = nil
			if commandName ~= "adminwhitelist" then
				outputChatBox(g_colors["darkorange"].."Du hast "..playerName.." von der Whitelist entfernt (PIN entfernt)!", playerSource, 0, 0, 0, true)
			else
				rpcCallClientFunction(client, "adminWLSetPin", "Entfernt")
			end
			return true
		end
	end
end
addCommandHandler("whitelist", setPlayerToWhitelist)

function savePlayerSpawn(playerSource, commandName, player)
	if g_playerstat[playerSource]["Job"]["Makler"] == 1 or g_playerstat[playerSource]["Level"] == "Supporter" or g_playerstat[playerSource]["Level"] == "Team" or g_playerstat[playerSource]["Level"] == "Admin" then
		if not player then
			--outputChatBox(g_colors["darkorange"].."Du musst einen Spieler zum Speichern angeben", playerSource, 0, 0, 0, true)
			sendPlayerInfo(playerSource, "Du musst einen Spieler zum speichern angeben.")
			return false
		end	
		local thePlayer = getPlayerFromName(player)
		if not thePlayer then
			thePlayer = getPlayerFromString(player)
		end
		
		if not thePlayer then
			--outputChatBox(g_colors["darkorange"].."Es wurde kein Spieler mit diesem (Teil)Namen gefunden", playerSource, 0, 0, 0, true)
			sendPlayerInfo(playerSource, "Es wurde kein Spieler mit diesem (Teil-)Namen gefunden.", true)
			return false
		end
		
		local x, y, z = getElementPosition(thePlayer)
		local rot = getPedRotation(thePlayer)
		
		local playername = getPlayerName(thePlayer)		
		mysql_query(g_mysql["connection"], "UPDATE `players` SET\
																 `spawnx` = '"..x.."',\
																 `spawny` = '"..y.."',\
																 `spawnz` = '"..z.."',\
																 `spawnrz` = '"..rot.."'\
											WHERE `playername` = '"..playername.."' LIMIT 1;")											
		
		sendPlayerInfo(thePlayer, "Teammitglied "..getPlayerName(playerSource).." hat deine Spawn-Koordinaten gespeichert.", true)
		--outputChatBox(g_colors["darkorange"].."Teammitglied "..getPlayerName(playerSource).." hat deine Spawnkoordinaten gespeichert", thePlayer, 0, 0, 0, true)
		sendPlayerInfo(playerSource, "Du hast die Position von "..getPlayerName(thePlayer).." gespeichert.", true)
		--outputChatBox(g_colors["darkorange"].."Du hast die Position von "..getPlayerName(thePlayer).." gespeichert", playerSource, 0, 0, 0, true)		
	end
end
addCommandHandler("savespawn", savePlayerSpawn)

function mutePlayerCommand(playerSource, commandName, playerToMute)
	if g_playerstat[playerSource]["Level"] == "Supporter" or g_playerstat[playerSource]["Level"] == "Team" or g_playerstat[playerSource]["Level"] == "Admin" then
		if not playerToMute then
			--outputChatBox(g_colors["darkorange"].."Du musst einen Spieler zum muten angeben", playerSource, 0, 0, 0, true)
			sendPlayerInfo(playerSource, "Du musst einen Spieler zum muten angeben.", true)
			return false
		end
		
		local thePlayer = getPlayerFromName(playerToMute)
		if not thePlayer then
			thePlayer = getPlayerFromString(playerToMute)
		end
		
		if not thePlayer then
			--outputChatBox(g_colors["darkorange"].."Es wurde kein Spieler mit diesem (Teil)Namen gefunden", playerSource, 0, 0, 0, true)
			sendPlayerInfo(playerSource, "Es wurde kein Spieler mit diesem (Teil-)Namen gefunden.", true)
			return false
		end
		
		if isPlayerMuted(thePlayer) then
			setPlayerMuted(thePlayer, false)
			outputChatBox(g_colors["green"]..getPlayerName(playerSource).." hat "..getPlayerName(thePlayer).." entmuted", getRootElement(), 0, 0, 0, true)
		else
			setPlayerMuted(thePlayer, true)
			outputChatBox(g_colors["green"]..getPlayerName(playerSource).." hat "..getPlayerName(thePlayer).." gemuted", getRootElement(), 0, 0, 0, true)
		end
	end
end
addCommandHandler("muteplayer", mutePlayerCommand)

function kickPlayerFromServer(playerSource, commandName, playerToMute, ...)
	if g_playerstat[playerSource]["Level"] == "Supporter" or g_playerstat[playerSource]["Level"] == "Team" or g_playerstat[playerSource]["Level"] == "Admin" then
		if not playerToMute then
			--outputChatBox(g_colors["darkorange"].."Du musst einen Spieler zum kicken angeben", playerSource, 0, 0, 0, true)
			sendPlayerInfo(playerSource, "Du musst einen Spieler zum kicken angeben.", true)
			return false
		end
		
		local thePlayer = getPlayerFromName(playerToMute)
		if not thePlayer then
			thePlayer = getPlayerFromString(playerToMute)
		end
		
		if not thePlayer then
			--outputChatBox(g_colors["darkorange"].."Es wurde kein Spieler mit diesem (Teil)Namen gefunden", playerSource, 0, 0, 0, true)
			sendPlayerInfo(playerSource, "Es wurde kein Spieler mit diesem (Teil-)Namen gefunden.", true)
			return false
		end	
		
		local thereason = table.concat({...}, " ")
		teamLog(getPlayerName(playerSource).." hat "..getPlayerName(thePlayer).." aus folgenden Gründen gekickt: "..thereason)
		kickPlayer(thePlayer, playerSource, thereason)
	end
end
addCommandHandler("kickplayer", kickPlayerFromServer)

function banPlayerFromServer(playerSource, commandName, playerToMute, ...)
	if g_playerstat[playerSource]["Level"] == "Team" or g_playerstat[playerSource]["Level"] == "Admin" then
		if not playerToMute then
			--outputChatBox(g_colors["darkorange"].."Du musst einen Spieler zum bannen angeben", playerSource, 0, 0, 0, true)
			sendPlayerInfo(playerSource, "Du musst einen Spieler zum bannen angeben.", true)
			return false
		end
		
		local thePlayer = getPlayerFromName(playerToMute)
		if not thePlayer then
			thePlayer = getPlayerFromString(playerToMute)
		end
		
		if not thePlayer then
			--outputChatBox(g_colors["darkorange"].."Es wurde kein Spieler mit diesem (Teil)Namen gefunden", playerSource, 0, 0, 0, true)
			sendPlayerInfo(playerSource, "Es wurde kein Spieler mit diesem (Teil-)Namen gefunden.", true)
			return false
		end	
		
		local thereason = table.concat({...}, " ")
		teamLog(getPlayerName(playerSource).." hat "..getPlayerName(thePlayer).." aus folgenden Gründen gebannt: "..thereason)
		banPlayer(thePlayer, true, true, true, playerSource, thereason, 0)
	end
end
addCommandHandler("banplayer", banPlayerFromServer)

function createVehicleInGame(playerSource, commandName, modelid, col1, col2)
	if g_playerstat[playerSource]["Level"] == "Admin" then
		if not modelid then
			--outputChatBox(g_colors["darkorange"].."Du hast keine Modelid angegeben!", playerSource, 0, 0, 0, true)
			sendPlayerInfo(playerSource, "Du hast keine ModelID angegeben.", true)
			return false
		end
		if not col1 then
			local col1 = 1
			local col2 = 1
		end
		local x, y, z = getElementPosition(playerSource)
		local rz = getPedRotation(playerSource)
		local vehicle = createVehicleMTARL(modelid, x, y + 3, z + 1, 0, 0, rz, playerSource)
		if vehicle then
			--outputChatBox(g_colors["green"].."Das Fahrzeug wurde erfolgreich erstellt!", playerSource, 0, 0, 0, true)
			sendPlayerInfo(playerSource, "Das Fahrzeug wurde erfolgreich erstellt.", true)
		else
			--outputChatBox(g_colors["darkorange"].."Das Fahrzeug konnte nicht erstellt werden!", playerSource, 0, 0, 0, true)
			sendPlayerInfo(playerSource, "Das Fahrzeug konnte nicht erstellt werden.", true)
		end
	end
end
addCommandHandler("createcar", createVehicleInGame)

function createTempVehicleInGame(playerSource, commandName, modelid, col1, col2)
	if g_playerstat[playerSource]["Level"] == "Admin" then
		if not modelid then
			--outputChatBox(g_colors["darkorange"].."Du hast keine Modelid angegeben!", playerSource, 0, 0, 0, true)
			sendPlayerInfo(playerSource, "Du hast keine ModelID angegeben.", true)
			return false
		end
		if not col1 then
			local col1 = 1
			local col2 = 1
		end
		local x, y, z = getElementPosition(playerSource)
		local rz = getPedRotation(playerSource)
		local vehicle = createTempVehicleMTARL(modelid, x, y + 3, z + 1, 0, 0, rz)
		if vehicle then
			--outputChatBox(g_colors["green"].."Das Fahrzeug wurde erfolgreich erstellt!", playerSource, 0, 0, 0, true)
			sendPlayerInfo(playerSource, "Das Fahrzeug wurde erfolgreich erstellt.", true)
			warpPedIntoVehicle(playerSource, vehicle, 0)
		else
			--outputChatBox(g_colors["darkorange"].."Das Fahrzeug konnte nicht erstellt werden!", playerSource, 0, 0, 0, true)
			sendPlayerInfo(playerSource, "Das Fahrzeug konnte nicht erstellt werden.", true)
		end
	end
end
addCommandHandler("createtempcar", createTempVehicleInGame)

--[[local function onPlayerLeaveTempCar(vehicle, seat, jacker)
	if seat == 0 then
		if g_vehiclestat[vehicle] then
			if g_vehiclestat[vehicle]["tempcar"] then
				deleteTempVehicleMTARL(vehicle)
			end
		end
	end
end
addEventHandler("onPlayerVehicleExit", root, onPlayerLeaveTempCar)--]]

function deleteCarInGame(playerSource, commandName, veh)
	if g_playerstat[playerSource]["Level"] == "Admin" then
		if not veh then
			local vehicle, distance = closestVehicle(playerSource)
			if not g_vehiclestat[vehicle]["tempcar"] then
				if distance < 10 then
					local done = deleteVehicleMTARL(vehicle)
					if done then
						sendPlayerInfo(playerSource, "Das Fahrzeug wurde erfolgreich entfernt.", true)
						--outputChatBox(g_colors["green"].."Das Fahrzeug wurde erfolgreich entfernt!", playerSource, 0, 0, 0, true)
					else
						--outputChatBox(g_colors["darkorange"].."Fehler beim Löschen des Fahrzeuges!", playerSource, 0, 0, 0, true)
						sendPlayerInfo(playerSource, "Das Fahrzeug konnte nicht entfernt werden.", true)
					end
				else
					--outputChatBox(g_colors["darkorange"].."Kein Fahrzeug in der Nähe gefunen!", playerSource, 0, 0, 0, true)
					sendPlayerInfo(playerSource, "Kein Fahrzeug in der Nähe gefunden.", true)
					return false
				end
			else
				local vehicle = getPedOccupiedVehicle(playerSource)
				if vehicle then
					local done = deleteTempVehicleMTARL(vehicle)
					if done then
						sendPlayerInfo(playerSource, "Das Fahrzeug wurde erfolgreich entfernt.", true)
						--outputChatBox(g_colors["green"].."Das Fahrzeug wurde erfolgreich entfernt!", playerSource, 0, 0, 0, true)
					else
						--outputChatBox(g_colors["darkorange"].."Fehler beim Löschen des Fahrzeuges!", playerSource, 0, 0, 0, true)
						sendPlayerInfo(playerSource, "Das Fahrzeug konnte nicht entfernt werden.", true)
					end
				else
					sendPlayerInfo(playerSource, "Du musst in dem Fahrzeug sitzen.", true)
					--outputChatBox(g_colors["darkorange"].."Du musst in dem Fahrzeug sitzen!", playerSource, 0, 0, 0, true)
				end
			end
		else
			if not g_vehiclestat[veh]["tempcar"] then
				deleteVehicleMTARL(veh)
			else
				deleteTempVehicleMTARL(veh)
			end
		end
	end
end
addCommandHandler("deletecar", deleteCarInGame)
addCommandHandler("deletcar", deleteCarInGame) --Werni: weil Werni das immer falsch schreibt^^

function setVehicleSpecialProp(playerSource, commandName, prop, veh)
	if g_playerstat[playerSource]["Level"] == "Admin" then
		if not veh then
			local vehicle, distance = closestVehicle(playerSource)
			if vehicle and distance < 10 then
				local oldprop = tostring(g_vehiclestat[vehicle]["Specialcar"])
				if prop then
					local prop = tostring(prop)
					if isCorrectJob(prop) then
						if prop == "Post" then
							setVehicleColor (vehicle, 255, 211, 15, 255, 211, 15, 255, 211, 15, 255, 211, 15)
						elseif prop == "Tanker" then
							setVehicleColor (vehicle, 105, 105, 105, 0, 0, 0, 255, 140, 0, 0, 0, 0)
						elseif prop == "ADAC" then
							setVehicleColor (vehicle, 128, 128, 128, 253, 247, 2, 253, 247, 2, 128, 128, 128)
						elseif prop == "Polizei" then
							setVehicleColor (vehicle, 27, 55, 109, 255, 255, 255, 27, 55, 109, 255, 255, 255)
						elseif prop == "Feuerwehr" then
							setVehicleColor (vehicle, 134, 4, 16, 255, 255, 255, 134, 4, 16, 255, 255, 255)
						elseif prop == "Medic" then
							setVehicleColor (vehicle, 192, 255, 62, 178, 34, 34, 192, 255, 62, 244, 64, 11)
						elseif prop == "Taxi" then
							setVehicleColor (vehicle, 254, 223, 86, 254, 223, 86, 254, 223, 86, 254, 223, 86)
						elseif prop == "El-Salvador" then
							setVehicleColor (vehicle, 0, 139, 69, 0, 139, 69, 0, 139, 69, 0, 139, 69)
						elseif prop == "18th-Street-Gang" then
							setVehicleColor (vehicle, 0, 206, 209, 0, 206, 209, 0, 206, 209, 0, 206, 209)
						elseif prop == "Yakuza" then
							setVehicleColor (vehicle, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105)
						end
						--outputChatBox(g_colors["green"].."Das 'Prop' des Fahrzeuges wurde auf "..prop.." geändert (Altes 'Prop': "..oldprop..")!", playerSource, 0, 0, 0, true)
						sendPlayerInfo(playerSource, "Das 'Prop' des Fahrzeuges wurde auf "..prop.." geändert (Altes 'Prop': "..oldprop..").", true)
						g_vehiclestat[vehicle]["Specialcar"] = tostring(prop)
						if isVehicleJobVehicle(vehicle) then
							local id = tonumber(g_vehiclestat[vehicle]["ID"])
							if g_playerstat[playerSource]["Key"][id] then
								g_playerstat[playerSource]["Key"][id] = nil
								sendPlayerInfo(playerSource, "Du hast den Schlüssel für den Wagen verloren, da es zu einem Job-Fahrzeug wurde.", true)
								--outputChatBox(g_colors["yellow"].."Du hast den Schlüssel für den Wagen verloren, weil es zum Jobcar wurde!", playerSource, 0, 0, 0, true)
							end	
						end
					else
						--outputChatBox(g_colors["darkorange"].."Falscher Syntax: /propcar ADAC VPolizei Feuerwehr KPolizei Post Medic Tanker Taxi", playerSource, 0, 0, 0, true)
						sendPlayerInfo(playerSource, "Falsche Syntax: /propcar ADAC Polizei Feuerwehr Post Medic Tanker Taxi", true)
						return false
					end
				else
					--outputChatBox(g_colors["green"].."Das 'Prop' des Fahrzeuges wurde entfernt (Altes 'Prop': "..oldprop..")!", playerSource, 0, 0, 0, true)
					sendPlayerInfo(playerSource, "Das 'Prop' des Fahrzeuges wurde entfernt (Altes 'Prop': "..oldprop..").", true)
					g_vehiclestat[vehicle]["Specialcar"] = false
				end
			else
				--outputChatBox(g_colors["darkorange"].."Kein Fahrzeug in der Nähe gefunden!", playerSource, 0, 0, 0, true)
				sendPlayerInfo(playerSource, "Kein Fahrzeug in der Nähe gefunden.", true)
				return false
			end
		else
			if prop == "Post" then
				setVehicleColor (vehicle, 255, 211, 15, 255, 211, 15, 255, 211, 15, 255, 211, 15)
			elseif prop == "Tanker" then
				setVehicleColor (vehicle, 105, 105, 105, 0, 0, 0, 255, 140, 0, 0, 0, 0)
			elseif prop == "ADAC" then
				setVehicleColor (vehicle, 128, 128, 128, 253, 247, 2, 253, 247, 2, 128, 128, 128)
			elseif prop == "Polizei" then
				setVehicleColor (vehicle, 27, 55, 109, 255, 255, 255, 27, 55, 109, 255, 255, 255)
			elseif prop == "Feuerwehr" then
				setVehicleColor (vehicle, 134, 4, 16, 255, 255, 255, 134, 4, 16, 255, 255, 255)
			elseif prop == "Medic" then
				setVehicleColor (vehicle, 192, 255, 62, 178, 34, 34, 192, 255, 62, 244, 64, 11)
			elseif prop == "Taxi" then
				setVehicleColor (vehicle, 254, 223, 86, 254, 223, 86, 254, 223, 86, 254, 223, 86)
			elseif prop == "El-Salvador" then
				setVehicleColor (vehicle, 0, 139, 69, 0, 139, 69, 0, 139, 69, 0, 139, 69)
			elseif prop == "18th-Street-Gang" then
				setVehicleColor (vehicle, 0, 206, 209, 0, 206, 209, 0, 206, 209, 0, 206, 209)
			elseif prop == "Yakuza" then
				setVehicleColor (vehicle, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105)
			end
			

			g_vehiclestat[veh]["Specialcar"] = tostring(prop)
			if isVehicleJobVehicle(veh) then
				local id = tonumber(g_vehiclestat[veh]["ID"])
				if g_playerstat[playerSource]["Key"][id] then
					g_playerstat[playerSource]["Key"][id] = nil
				end	
			end
		end
	end
end
addCommandHandler("propcar", setVehicleSpecialProp)

function setVehicleFix(playerSource, commandName, veh)
	if g_playerstat[playerSource]["Level"] == "Admin" then
		if not veh then
			local vehicle, distance = closestVehicle(playerSource)
			if vehicle and distance < 10 then
				fixVehicle(vehicle)
				--outputChatBox(g_colors["deepskyblue"].."Fahrzeug Repariet!", playerSource, 0, 0, 0, true)
				sendPlayerInfo(playerSource, "Das Fahrzeug wurde repariert.", true)
			end
		else
			fixVehicle(veh)
		end
	end
end	
addCommandHandler("adminrepair", setVehicleFix)

function unlockVehicleCar(playerSource, commandName, veh)
	if g_playerstat[playerSource]["Level"] == "Admin" then
		if not veh then
			local vehicle, distance = closestVehicle(playerSource)
			if vehicle and distance < 10 then
				setVehicleLocked(vehicle, false)
				--outputChatBox(g_colors["limegreen"].."Fahrzeug geöfnet!", playerSource, 0, 0, 0, true)
				sendPlayerInfo(playerSource, "Das Fahrzeug wurde geöffnet.", true)
			end
		else
			setVehicleLocked(veh, false)
		end
	end
end	
addCommandHandler("unlockcar", unlockVehicleCar)

function lockVehicleCar(playerSource, commandName, veh)
	if g_playerstat[playerSource]["Level"] == "Admin" then
		if not veh then
			local vehicle, distance = closestVehicle(playerSource)
			if vehicle and distance < 10 then
				setVehicleLocked(vehicle, true)
				--outputChatBox(g_colors["limegreen"].."Fahrzeug geschlossen!", playerSource, 0, 0, 0, true)
				sendPlayerInfo(playerSource, "Das Fahrzeug wurde geschlossen.", true)
			end
		else
			setVehicleLocked(veh, true)
		end
	end
end	
addCommandHandler("lockcar", lockVehicleCar)

local function setVehicleCol(playerSource, commandName, col1, col2, col3, col4)
	if g_playerstat[playerSource]["Level"] == "Admin" then
		local vehicle, distance = closestVehicle(playerSource)
		if vehicle and distance < 10 then
			if col1 and col2 and col3 and col4 then
				setVehicleColor(vehicle, col1, col2, col3, col4)
			end
		end
	end
end	
addCommandHandler("changecol", setVehicleCol)

function setVehicleColRGB(playerSource, commandName, r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4, veh)
	if g_playerstat[playerSource]["Level"] == "Admin" then
		if not veh then
			local vehicle, distance = closestVehicle(playerSource)
			if vehicle and distance < 10 then
				if r1 and g1 and b1 and r2 and g2 and b2 and r3 and g3 and b3 and r4 and g4 and b4 then
					setVehicleColor (vehicle, tonumber(r1), tonumber(g1), tonumber(b1), tonumber(r2), tonumber(g2), tonumber(b2), tonumber(r3), tonumber(g3), tonumber(b3), tonumber(r4), tonumber(g4), tonumber(b4))
				end
			end
		else
			setVehicleColor (veh, tonumber(r1), tonumber(g1), tonumber(b1), tonumber(r2), tonumber(g2), tonumber(b2), tonumber(r3), tonumber(g3), tonumber(b3), tonumber(r4), tonumber(g4), tonumber(b4))
		end
	end
end	
addCommandHandler("changecolrgb", setVehicleColRGB)

function setPlayerInJobCommand(playerSource, commandName, playerToChange, job, rank)
	if g_playerstat[playerSource]["Level"] == "Supporter" or g_playerstat[playerSource]["Level"] == "Team" or g_playerstat[playerSource]["Level"] == "Admin" then
		local jobID = getJobFromName(job)
		
		if not playerToChange then
			--outputChatBox(g_colors["darkorange"].."Du musst einen Spieler angeben", playerSource, 0, 0, 0, true)
			sendPlayerInfo(playerSource, "Du musst einen Spieler zum angeben.", true)
			return false
		end
		
		local thePlayer = getPlayerFromName(playerToChange)
		if not thePlayer then
			thePlayer = getPlayerFromString(playerToChange)
		end
		
		if not thePlayer then
			sendPlayerInfo(playerSource, "Es wurde kein Spieler mit diesem (Teil-)Namen gefunden.", true)
			return false
		end
		
		if thePlayer == playerSource then
			if g_playerstat[playerSource]["Level"] ~= "Admin" then
				sendPlayerInfo(playerSource, "Du kannst deinen Job-Rank nicht manipulieren.", true)
				return false	
			end
		end
		
		if not jobID then
			sendPlayerInfo(playerSource, "Dieser Job exestiert nicht.", true)
			return false			
		end
		
		if rank then
			g_playerstat[thePlayer]["Job"][jobID] = 1
			g_playerstat[thePlayer]["JobRank"][jobID] = tonumber(rank)
			--outputChatBox(g_colors["yellow"].."Du hast "..getPlayerName(thePlayer).." zum Job "..job.." mit Rank "..rank.." hinzugefügt.", playerSource, 0, 0, 0, true)
			sendPlayerInfo(playerSource, "Du hast "..getPlayerName(thePlayer).." zum Job "..job.." mit Rank "..rank.." hinzugefügt.", true)
			--outputChatBox(g_colors["yellow"]..getPlayerName(playerSource).." hat dich zum Job "..job.." mit Rank "..rank.." hinzugefügt.", thePlayer, 0, 0, 0, true)
			sendPlayerInfo(thePlayer, getPlayerName(playerSource).." hat dich zum Job "..job.." mit Rank "..rank.." hinzugefügt.", true)
			teamLog(getPlayerName(playerSource).." hat "..getPlayerName(thePlayer).." zum Job "..job.." (Rank "..rank..") hinzugefügt")
		else
			g_playerstat[thePlayer]["Job"][jobID] = 1
			g_playerstat[thePlayer]["JobRank"][jobID] = 1
			outputChatBox(g_colors["yellow"].."Du hast "..getPlayerName(thePlayer).." zum Job "..job.." mit Rank 1 hinzugefügt.", playerSource, 0, 0, 0, true)
			outputChatBox(g_colors["yellow"]..getPlayerName(playerSource).." hat dich zum Job "..job.." mit Rank 1 hinzugefügt.", thePlayer, 0, 0, 0, true)
			teamLog(getPlayerName(playerSource).." hat "..getPlayerName(thePlayer).." zum Job "..job.." (Rank 1) hinzugefügt")
		end
	end
end
addCommandHandler("job", setPlayerInJobCommand)

local function removeInteriorCommand(playerSource, commandName)
	if g_playerstat[playerSource]["Level"] == "Admin" then
		local marker, dist = closestMarker(playerSource)
		if marker then
			if dist < 10 then
				local interior = getElementData(marker, "interior")
				if interior then
					local markerToRemove = getElementData(interior, "markerOutside")
					removeEventHandler("onMarkerHit", markerToRemove, onOutsideInteriorMarkerHit)
					destroyElement(markerToRemove)
					local markerToRemove = getElementData(interior, "markerInside")
					removeEventHandler("onMarkerHit", markerToRemove, onInsideInteriorMarkerHit)
					destroyElement(markerToRemove)
					
					local sql = "DELETE FROM interiors WHERE id = '"..getElementData(interior, "id").."' LIMIT 1;"
					mysql_query(g_mysql["connection"], sql)
					
					destroyElement(interior)
					--outputChatBox(g_colors["yellow"].."Du hast den Interior erfolgreich entfernt!", playerSource, 0, 0, 0, true)
					sendPlayerInfo(playerSource, "Du hast den Interior erfolgreich entfernt", true)
				end
			end
		end
	end
end
addCommandHandler("removeinterior", removeInteriorCommand)

function adminGiveCash(playerSource, commandName, player, cash, ...)
	if g_playerstat[playerSource]["Level"] == "Admin" then
		if not player then
			outputChatBox(g_colors["darkorange"].."Du musst einen Spieler angeben", playerSource, 0, 0, 0, true)
			return false
		end
		
		local thePlayer = getPlayerFromName(player)
		if not thePlayer then
			thePlayer = getPlayerFromString(player)
		end
		
		if not thePlayer then
			outputChatBox(g_colors["darkorange"].."Es wurde kein Spieler mit diesem (Teil)Namen gefunden", playerSource, 0, 0, 0, true)
			return false
		end
		
		if not cash then
			outputChatBox(g_colors["darkorange"].."Du musst einen Geldbetrag angeben!", playerSource, 0, 0, 0, true)
			return false
		end
		
		local reason = table.concat({...}, " ")
		if not reason then
			outputChatBox(g_colors["darkorange"].."Du musst einen Grund angeben!", playerSource, 0, 0, 0, true)
			return false
		end
		
		giveStaatsKasse(-cash)
		givePlayerMoney(thePlayer, cash)
		
		--outputChatBox(g_colors["red"].."Du hast von "..getPlayerName(playerSource).." "..cash.."$ bekommen! Grund: ["..reason.."]", thePlayer, 0, 0, 0, true)
		sendPlayerInfo(thePlayer, "Du hast von "..getPlayerName(playerSource).." "..cash.."$ bekommen! Grund: ["..reason.."]", true)
		--outputChatBox(g_colors["red"].."Du hast "..getPlayerName(thePlayer).." "..cash.."$ gegeben!", playerSource, 0, 0, 0, true)
		sendPlayerInfo(playerSource, "Du hast "..getPlayerName(thePlayer).." "..cash.."$ gegeben!", true)
		teamLog(getPlayerName(playerSource).." hat "..getPlayerName(thePlayer).." "..cash.."$ gegeben! Grund: ["..reason.."]")
	end
end	
addCommandHandler("admincash", adminGiveCash)

local function loadTeamScript(playerSource, commandName, scriptname, intoMeta, initalizeFunction, mysqlData)
	if g_playerstat[playerSource]["Level"] == "Admin" then
		if not scriptname or not intoMeta then
			outputChatBox(g_colors["red"].."Ungültige Parameter!", playerSource, 0, 0, 0, true)
			return false			
		end
		
		--Prüfen ob Scriptname überhaupt exestiert
		if not fileExists(scriptname) then
			outputChatBox(g_colors["red"].."Das angegebene Script kann nicht gefunden werden.", playerSource, 0, 0, 0, true)
			return false				
		end
		
		--Okay, alles klar, wir laden das Script ein, ab hier gibt es keinen Weg zurück, dass heißt, Errors werden das Script zerstören :O!
		local theFile = fileOpen(scriptname, true)
		local script = fileRead(theFile, fileGetSize(theFile))
		fileClose(theFile)
		
		--todo
		
	end
end
--addCommandHandler("loadscript", loadTeamScript)

function freezingPlayerCommand(playerSource, commandName, playerToChange)
	if g_playerstat[playerSource]["Level"] == "Admin" then
		if not playerToChange then
			outputChatBox(g_colors["darkorange"].."Du musst einen Spieler angeben", playerSource, 0, 0, 0, true)
			return false
		end
		
		local thePlayer = getPlayerFromName(playerToChange)
		if not thePlayer then
			thePlayer = getPlayerFromString(playerToChange)
		end
		
		if not thePlayer then
			outputChatBox(g_colors["darkorange"].."Es wurde kein Spieler mit diesem (Teil)Namen gefunden", playerSource, 0, 0, 0, true)
			return false
		end
			
		if thePlayer == playerSource then
			if g_playerstat[playerSource]["Level"] ~= "Admin" then
				outputChatBox(g_colors["darkorange"].."Du kannst dich nicht selbst freezen/unfreezen!", playerSource, 0, 0, 0, true)
				return false	
			end
		end
		
		if isElementFrozen(thePlayer) then
			--outputChatBox(g_colors["darkorange"].."Du hast "..getPlayerName(thePlayer).." entfroren", playerSource, 0, 0, 0, true)
			--outputChatBox(g_colors["darkorange"].."Du wurdest von "..getPlayerName(playerSource).." entfroren", thePlayer, 0, 0, 0, true)
			sendPlayerInfo(playerSource, "Du hast "..getPlayerName(thePlayer).." entfroren.", true)
			sendPlayerInfo(thePlayer, "Du wurdest von "..getPlayerName(playerSource).." entfroren", true)
			setElementFrozen(thePlayer, false)
		else
			--outputChatBox(g_colors["darkorange"].."Du hast "..getPlayerName(thePlayer).." eingefroren", playerSource, 0, 0, 0, true)
			--outputChatBox(g_colors["darkorange"].."Du wurdest von "..getPlayerName(playerSource).." eingefroren", thePlayer, 0, 0, 0, true)	
			sendPlayerInfo(playerSource, "Du hast "..getPlayerName(thePlayer).." eingefroren.", true)
			sendPlayerInfo(thePlayer, "Du wurdest von "..getPlayerName(playerSource).." eingefroren", true)			
			setElementFrozen(thePlayer, true)
		end
	end	
end
addCommandHandler("freeze", freezingPlayerCommand)

local function removeHouseCommand(playerSource, commandName)
	if g_playerstat[playerSource]["Level"] == "Admin" then
		local x, y, z = getElementPosition(playerSource)
		local house, dist = getNearstHouseID(x, y, z)
		if house then
			if dist < 10 then
				--if removeHouse(house) then outputChatBox(g_colors["darkorange"].."Du hast das Haus erfolgreich entfernt", playerSource, 0, 0, 0, true)
				--else outputChatBox(g_colors["red"].."Fehler beim löschen des Hauses aufgetreten", playerSource, 0, 0, 0, true) end
				if removeHouse(house) then sendPlayerInfo(playerSource, "Du hast das Haus erfolgreich entfernt.", true)
				else sendPlayerInfo(playerSource, "Es ist ein Fehler beim entfernen des Hauses aufgetreten!", true) end
			end
		end
	end
end
addCommandHandler("removehouse", removeHouseCommand)

function coords(playerSource, commandName)
	if g_playerstat[playerSource]["Level"] == "Admin" then
		local x,y,z = getElementPosition(playerSource)
		local rz = getPedRotation(playerSource)
		outputServerLog("Coords:"..tostring(x)..", "..tostring(y)..", "..tostring(z).." Interior:".. getElementInterior(playerSource).." Z-Angle:"..rz.." Dimesnsion:"..getElementDimension(playerSource))
		--outputServerLog("createItemShop("..tostring(x)..", "..tostring(y)..", "..tostring(z)..", "..tostring(getElementInterior(playerSource))..", "..tostring(getElementDimension(playerSource))..")")
	end
end
addCommandHandler("savekoord", coords)

function carkoords(playerSource, commandName)
	if g_playerstat[playerSource]["Level"] == "Admin" then
		local vehicle = CORE:getPlayer(playerSource):getOccupiedVehicle()
		if vehicle then
			local posx, posy, posz = getElementPosition(vehicle)
			local rx, ry, rz = getVehicleRotation(vehicle)
			outputServerLog("createTempVehicleMTARL("..getElementModel(vehicle)..", "..posx..", "..posy..", "..posz..", "..rx..", "..ry..", "..rz..")")
			--outputServerLog("autohausSpawn = { x ="..posx..", y="..posy..", z="..posz..", rx="..rx..", ry="..ry..", rz="..rz.."}, "..getElementModel(vehicle))
		end
	end
end
addCommandHandler("savecarkoord", carkoords)

function activateAdminMenu(playerSource)
	if playerSource then
		if CORE:getPlayer(playerSource):getLevel() == "Admin" then
			rpcCallClientFunction(playerSource, "toggleAdminMenu")
		end
	end
end

function adminMessage(playerSource, commandName, ...)
	if playerSource then
		if CORE:getPlayer(playerSource):getLevel() == "Admin" then
			for i,player in ipairs(getElementsByType("player")) do
				local msg = table.concat({...}, " ")
				sendPlayerInfo(player, "Admin "..getPlayerName(playerSource)..": "..msg, true)
			end
		end
	end
end
addCommandHandler("adminmsg", adminMessage)

function teamLog(logMessage)
	local sql = "INSERT INTO `adminlog` (`log`, `time`) VALUES ('"..logMessage.."', '"..getTimestamp().."');"
	mysql_query(g_mysql["connection"], sql)
end
