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



rpcRegisterGlobalFunction("adminGetPlayerInfo")
rpcRegisterGlobalFunction("adminPlayerFunction")
rpcRegisterGlobalFunction("adminGetVehInfo")
rpcRegisterGlobalFunction("adminVehFunction")
rpcRegisterGlobalFunction("adminWlFunction")
rpcRegisterGlobalFunction("adminGetWhitelist")
rpcRegisterGlobalFunction("adminPostFunction")

function adminGetPlayerInfo(playername)
	local player = getPlayerFromName(playername)
	if player then
		local name = playername
		local money = getPlayerMoney(player)
		local bank = g_playerstat[player]["Bank"]
		local health = getElementHealth(player)
		local armor = getPedArmor(player)
		local skin = getElementModel(player)
		local serial = getPlayerSerial (player)
		local ip = getPlayerIP(player)
		local version = getPlayerVersion(player)
		local x, y, z = getElementPosition(player)
		local veh
		local carid
		if getPedOccupiedVehicle(player) then 
			veh = true
			carid = g_vehiclestat[getPedOccupiedVehicle(player)]["ID"]
		else 
			veh = false
		end
		rpcCallClientFunction(client, "adminFillPlayerInfo", name, money, bank, health, armor, skin, serial, veh, ip, version, carid, x, y, z)
	end
end

function adminPlayerFunction(player, clickedButton, reason, job, rank, amount)
	if g_playerstat[client]["Level"] == "Admin" then
		if player and clickedButton then
			if clickedButton == "Ban" then
				banPlayerFromServer(client, "ban", player, reason)
			elseif clickedButton == "Kick" then
				kickPlayerFromServer(client, "kick", player, reason)
			elseif clickedButton == "Mute" then
				mutePlayerCommand(client, "mute", player)
			elseif clickedButton == "Freeze" then
				freezingPlayerCommand(client, "freeze", player)
			elseif clickedButton == "Spawn" then
				savePlayerSpawn(client, "spawn", player)
			elseif clickedButton == "Job" then
				setPlayerInJobCommand(client, "job", player, job, rank)
			elseif clickedButton == "Money" then
				adminGiveCash(client, "money", player, amount, reason)
			elseif clickedButton == "Health" then
				setElementHealth (getPlayerFromName(player), 1000)
			elseif clickedButton == "Team" then
				if rank == "Admin" then return false end
				if rank ~= "Entlassen" then
					g_playerstat[player]["Level"] = rank
				else
					g_playerstat[player]["Level"] = "User"
				end
			end
		end
	end
end

function adminWlFunction(clickedButton, playerName)
	if g_playerstat[client]["Level"] == "Admin" then
		if clickedButton then
			if clickedButton == "Add" then
				setPlayerToWhitelist(client, "adminwhitelist", playerName)
			elseif clickedButton == "Remove" then
				setPlayerToWhitelist(client, "adminwhitelist", playerName)
			end
		end
	end
end

function adminGetVehInfo(veh)
	if veh then
		local id = g_vehiclestat[veh]["ID"]
		local owner = getVehicleOwner(veh)
		if owner == false then owner = "Staat" end
		local name = getVehicleName(veh)
		local temp
		if g_vehiclestat[veh]["tempcar"] == true then temp = "Ja" else temp = "Nein" end
		local health = getElementHealth(veh)
		local tank = getElementData(veh, "tank")
		local km = getElementData(veh, "km")
		local prop
		if g_vehiclestat[veh]["Specialcar"] == "false" then prop = "Keins" else prop = g_vehiclestat[veh]["Specialcar"] end
		local posx, posy, posz = getElementPosition(veh)
		rpcCallClientFunction(client, "adminFillVehInfo", id, owner, name, temp, health, tank, km, prop, posx, posy, posz)
	end
end

function adminVehFunction(veh, clickedButton, prop, model, temp, r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4)
	if veh and clickedButton then
		if clickedButton == "Lock" then
			lockVehicleCar(client, "lock", veh)
		elseif clickedButton == "Unlock" then
			unlockVehicleCar(client, "unlock", veh)
		elseif clickedButton == "Repair" then
			setVehicleFix(client, "rapair", veh)
		elseif clickedButton == "Delete" then
			deleteCarInGame(client, "delete", veh)
		elseif clickedButton == "Prop" then
			setVehicleSpecialProp(client, "prop", prop, veh)
		elseif clickedButton == "Color" then
			setVehicleColRGB(client, "color", r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4, veh)
		end
	elseif clickedButton == "Create" then
		if temp == false then
			createVehicleInGame(client, "createcar", model)
		else
			createTempVehicleInGame(client, "createtempcar", model)
		end
	end
end

function adminGetWhitelist()
	for name, player in pairs(g_whitelist["name"]) do
	
		local playerName = name
		local playerPin
			
		local pin = mysql_query(g_mysql["connection"], "SELECT * FROM `pins` WHERE `name` = '"..playerName.."'")
		if pin then
			while true do
				local row = mysql_fetch_assoc(pin)
				if not row then break end
				
				playerPin = tostring(row["pin"])
				
			end
			mysql_free_result(pin)
		end
		
		if not playerPin then playerPin = "-" end
		
		rpcCallClientFunction(client, "adminWlFillList", playerName, playerPin)
	end
end

function adminPostFunction(sender, subject, content)
	if g_playerstat[client]["Level"] == "Admin" then
		local player = mysql_query(g_mysql["connection"], "SELECT * FROM `players`")
		if player then
			while true do
				local row = mysql_fetch_assoc(player)
				if not row then break end
				
				local to = row["id"]
				local ort = "mailBox"..tostring(math.random(1, 15))
				
				addBrief(sender, to, subject, content, ort)
			end
			mysql_free_result(player)
		end
	end
end
