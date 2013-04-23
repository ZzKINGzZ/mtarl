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



rpcRegisterGlobalFunction("createHouseObject")
rpcRegisterGlobalFunction("applyNewKoordEdit")
rpcRegisterGlobalFunction("lockHouse")
rpcRegisterGlobalFunction("enterHouse")

local g_houses = {}
local g_pickuph = {}
local g_colshapeh = {}

-----------------------------------------
--pickupin = aussen || pickupout = innen--
-----------------------------------------

function initHouses()
	outputDebug("houses.lua start...")
	local house = mysql_query(g_mysql["connection"], "SELECT * FROM `houses`")
	if house then
		while true do
			local row = mysql_fetch_assoc(house)
			if not row then break end
			local id = tonumber(row["id"])
			g_houses[id] = {}
			
			local x, y, z = tonumber(row["x"]), tonumber(row["y"]), tonumber(row["z"])
			local pickup = createPickup(x, y, z, 3, 1273, 0)
			g_houses[id]["pickupin"] = pickup
			addEventHandler("onPlayerPickupHit", pickup, pickupHitHouse)
			local pickCol = getElementColShape(pickup)
			addEventHandler("onColShapeLeave", pickCol, pickupColshapeLeavePickupAreaHouse)
			g_pickuph[g_houses[id]["pickupin"]] = id
			--Owner
			g_houses[id]["owner"] = tonumber(row["playerid"])
			g_houses[id]["members"] = 0
			--Member
			g_houses[id]["member"] = {}
			if row["member"] ~= "-1" then
				local str = explode("|", row["member"])
				
				for i, userid in ipairs(str) do
					local nuserid = tonumber(userid)
					if type(nuserid) == "number" then
						g_houses[id]["member"][nuserid] = true
					end	
				end
			end
			
			g_houses[id]["intx"] = tonumber(row["intx"])
			g_houses[id]["inty"] = tonumber(row["inty"])
			g_houses[id]["intz"] = tonumber(row["intz"])
			g_houses[id]["interior"] = tonumber(row["interior"])
			g_houses[id]["dimension"] = id
			g_houses[id]["pickupout"] = createPickup(g_houses[id]["intx"], g_houses[id]["inty"], g_houses[id]["intz"], 3, 1273, 0)
			addEventHandler("onPlayerPickupHit", g_houses[id]["pickupout"], pickupHitHouse)
			g_pickuph[g_houses[id]["pickupout"]] = id
			local col = createColSphere(g_houses[id]["intx"], g_houses[id]["inty"], g_houses[id]["intz"], 4)
			g_colshapeh[col] = id
			g_houses[id]["colshape"] = col
			setElementInterior(col, g_houses[id]["interior"])
			setElementDimension(col, g_houses[id]["dimension"])
			setElementInterior(g_houses[id]["pickupout"], g_houses[id]["interior"])
			setElementDimension(g_houses[id]["pickupout"], g_houses[id]["dimension"])
			g_houses[id]["locked"] = true
			
			g_houses[id]["objects"] = {}
			local houseO = mysql_query(g_mysql["connection"], "SELECT * FROM `houseobjects` WHERE `houseobjects`.`houseid` = "..id)
			if houseO then
				while true do
					local row2 = mysql_fetch_assoc(houseO)
					if not row2 then break end
					
					local object = createObject(tonumber(row2["modelid"]), tonumber(row2["x"]), tonumber(row2["y"]), tonumber(row2["z"]), tonumber(row2["rx"]), tonumber(row2["ry"]), tonumber(row2["rz"]))
					g_houses[id]["objects"][object] = tonumber(row2["id"])
					
					setElementInterior(object, g_houses[id]["interior"])
					setElementDimension(object, g_houses[id]["dimension"])
					setElementData(object, "buildid", g_houses[id]["objects"][object])
					setElementParent(object, g_houses[id]["pickupin"])					
				end
				mysql_free_result(houseO)
			end
		end
	mysql_free_result(house)
	end
end
addEventHandler("onResourceStart", getResourceRootElement(), initHouses)

function addHouse(x, y, z, intx, inty, intz, int, ownerid, owner)
	mysql_query(g_mysql["connection"] , "INSERT INTO `houses` (`id`) VALUES (NULL);")
	
	local lastid = mysql_insert_id(g_mysql["connection"])
	if lastid == 0 then return false end
	
	mysql_query(g_mysql["connection"], "UPDATE `houses` SET\
															`playerid` = '"..ownerid.."',\
															`x` = '"..x.."',\
															`y` = '"..y.."',\
															`z` = '"..z.."',\
															`intx` = '"..intx.."',\
															`inty` = '"..inty.."',\
															`intz` = '"..intz.."',\
															`interior` = '"..int.."'\
										WHERE `houses`.`id` = "..lastid.." LIMIT 1;")					
	
	g_houses[lastid] = {}
	local pickup = createPickup(x, y, z, 3, 1273, 0)
	g_houses[lastid]["pickupin"] = pickup
	addEventHandler("onPlayerPickupHit", g_houses[lastid]["pickupin"], pickupHitHouse)
	local pickCol = getElementColShape(pickup)
	addEventHandler("onColShapeLeave", pickCol, pickupColshapeLeavePickupAreaHouse)	
	g_pickuph[g_houses[lastid]["pickupin"]] = lastid
	g_houses[lastid]["owner"] = ownerid
	g_houses[lastid]["intx"] = intx
	g_houses[lastid]["inty"] = inty
	g_houses[lastid]["intz"] = intz
	g_houses[lastid]["interior"] = int
	g_houses[lastid]["dimension"] = lastid
	g_houses[lastid]["pickupout"] = createPickup(g_houses[lastid]["intx"], g_houses[lastid]["inty"], g_houses[lastid]["intz"], 3, 1273, 0)
	addEventHandler('onPlayerPickupHit', g_houses[lastid]["pickupout"], pickupHitHouse)
	local col = createColSphere(g_houses[lastid]["intx"], g_houses[lastid]["inty"], g_houses[lastid]["intz"], 4)
	g_colshapeh[col] = lastid
	g_houses[lastid]["colshape"] = col
	setElementInterior(col, g_houses[lastid]["interior"])
	setElementDimension(col, g_houses[lastid]["dimension"])	
	g_pickuph[g_houses[lastid]["pickupout"]] = lastid
	setElementInterior(g_houses[lastid]["pickupout"], g_houses[lastid]["interior"])
	setElementDimension(g_houses[lastid]["pickupout"], g_houses[lastid]["dimension"])
	g_houses[lastid]["locked"] = true
	g_houses[lastid]["member"] = {}
	
	local ort = "mailBox"..tostring(math.random(1, 15))
	addBrief("MTA:RL Bot", ownerid, "Dein neues Haus", "Hallo,

wenn du diese Nachricht liest, weisst du, dass dein Postfach an diesem Haus funktioniert. Lerne doch dein neues Zuhause ein wenig kennen, schau dich nach Nachbarn um oder baue einfach im Haus mit dem Command /bauen.

Viel Spass, 
Das MTA:RL Team", ort)			
end

function removeHouse(houseid)
	if g_houses[houseid] then
		destroyElement(g_houses[houseid]["pickupin"])
		destroyElement(g_houses[houseid]["pickupout"])
		destroyElement(g_houses[houseid]["colshape"])
		
		g_houses[houseid] = nil
		
		local sql = "DELETE FROM `houseobjects` WHERE `houseid` = '"..houseid.."';"
		mysql_query(g_mysql["connection"], sql)	
		
		local sql = "DELETE FROM `houses` WHERE `id` = '"..houseid.."';"
		mysql_query(g_mysql["connection"], sql)	
		return true
	end
	return false
end

function pickupHitHouse(pickup, dimension)
	if not getPedOccupiedVehicle(source) then
		if getElementDimension(pickup) == getElementDimension(source) then
			if g_pickuph[pickup] then
				local id = g_pickuph[pickup]
				if pickup == g_houses[id]["pickupin"] then
					if not isPlayerActiveInJob(source, 3) then
						local userid = g_playerstat[source]["Userid"]
						if userid  == g_houses[id]["owner"] or g_houses[id]["member"][userid] then
							rpcCallClientFunction(source, "houseOwnerEnable", true)
							rpcCallClientFunction(source, "showHousesMenu", true, id)
						else
							enterHouse(id, source)
						end
					else
						postSurrender(source, g_houses[id]["owner"]) --Post ausliefern
						for playerID, value in pairs(g_houses[id]["member"]) do
							if value == true then
								postSurrender(source, playerID)
							end
						end
					end
				end	
				if pickup == g_houses[id]["pickupout"] then
					if g_playerstat[source]["canleavehouse"] == 1 then
						local x, y, z = getElementPosition(g_houses[id]["pickupin"])
						setElementPosition(source, x + 2, y, z)
						setElementDimension(source, 0)
						setElementInterior(source, 0)						
					end	
				end
			end
		end	
	end	
end
addEventHandler('onPlayerPickupHit', getRootElement(), pickupHitHouse) --wenn deaktiviert keine reaktion @Einstein fix das mal :D

function pickupColshapeLeavePickupAreaHouse(leaveElement, dimension)
	if dimension then
		if getElementType(leaveElement) == "player" then
			if g_playerstat[leaveElement] then
				if g_playerstat[leaveElement]["houseid"] then
					g_playerstat[leaveElement]["houseid"] = -1
				end
			end
		end
	end
end

function lockHouse(houseid)
	if houseid then
		local playerid = g_playerstat[client]["Userid"]
		if g_houses[houseid]["owner"] == playerid or g_houses[houseid]["member"][playerid] then
			if g_houses[houseid]["locked"] == true then
				outputChatBox(g_colors["yellow"].."Du hast dein Haus aufgeschlossen!", client, 0, 0, 0, true)
				playSoundFrontEnd(client, 42)
				g_houses[houseid]["locked"] = false
			else
				outputChatBox(g_colors["yellow"].."Du hast dein Haus abgeschlossen!", client, 0, 0, 0, true)
				playSoundFrontEnd(client, 41)
				g_houses[houseid]["locked"] = true
			end
		end
	end
end

function enterHouse(houseid, player)
	if not client then client = player end
	if houseid then
		if g_houses[houseid]["locked"] == true then
			--outputChatBox(g_colors["yellow"].."Das Haus ist abgeschlossen!", client, 0, 0, 0, true)
			sendPlayerInfo(client, "Du kannst das Haus nicht betreten, wenn es abgeschlossen ist.", true)
		else
			setElementPosition(client, g_houses[houseid]["intx"], g_houses[houseid]["inty"], g_houses[houseid]["intz"])
			setElementDimension(client, g_houses[houseid]["dimension"])
			setElementInterior(client, g_houses[houseid]["interior"])
			g_playerstat[client]["houseid"] = tonumber(houseid)
			g_playerstat[client]["canleavehouse"] = -1
		end
	end
end

function getNearstHouseID(x, y, z)
	local dist = 999999999
	local houseid = false
	
	for house, i in pairs(g_houses) do
		local x2, y2, z2 = getElementPosition(g_houses[house]["pickupin"])
		local distance = getDistanceBetweenPoints3D(x, y, z, x2, y2, z2)
		if distance < dist then
			dist = distance
			houseid = house 
		end
	end
	return houseid, dist
end

function addHouseUser(playerSource, commandName, newPlayer)
	if not newPlayer then 
		outputChatBox(g_colors["red"].."Du hast keinen Spieler angegeben!", playerSource, 0, 0, 0, true)
		return false
	end
	
    local givenplayer = getPlayerFromName(newPlayer)
	if not givenplayer then 
		givenplayer = getPlayerFromString(newPlayer)
	end	
	if not givenplayer then
		outputChatBox(g_colors["red"].."Der angegebene Spieler ist nicht online oder exestiert nicht!", playerSource, 0, 0, 0, true)
		return false
	end
	
	local sql = "SELECT * FROM `houses` WHERE `playerid` = '"..getPlayerID(givenplayer).."' OR `member` = '"..getPlayerID(givenplayer).."' OR `member` LIKE '%|"..getPlayerID(givenplayer).."|%' OR `member` LIKE '"..getPlayerID(givenplayer).."|%' OR `member` LIKE '%|"..getPlayerID(givenplayer).."'"
	local res = mysql_query(g_mysql["connection"], sql)
	if mysql_num_rows(res) > 0 then	
		outputChatBox(g_colors["red"].."Der angegebene Spieler ist bereits Besitzer eines Hauses oder wohnt in einem.", playerSource, 0, 0, 0, true)
		return false
	end	
	
	if g_playerstat[playerSource]["houseid"] ~= -1 then
		local playerid = g_playerstat[playerSource]["Userid"]
		local houseid = g_playerstat[playerSource]["houseid"]
		if g_houses[houseid]["owner"] == playerid then
			
			local newPlayerId = g_playerstat[givenplayer]["Userid"]
			if g_houses[houseid]["member"][newPlayerId] then
				g_houses[houseid]["member"][newPlayerId] = nil
				local newmember
				for member, _ in pairs(g_houses[houseid]["member"]) do
					if not newmember then
						newmember = member
					else
						newmember = newmember.."|"..member
					end
				end
				
				mysql_query(g_mysql["connection"], "UPDATE `houses` SET `member` = '"..newmember.."' WHERE `id` = "..houseid.." LIMIT 1 ;")
				outputChatBox(g_colors["yellow"].."Du hast "..getPlayerName(givenplayer).." als Mitbewohner entfernt.", playerSource, 0, 0, 0, true)	
				outputChatBox(g_colors["yellow"].."Du wurdest von "..getPlayerName(playerSource).." aus seinem Haus geschmissen!", givenplayer, 0, 0, 0, true)	
			else
				local newPlayerId = g_playerstat[givenplayer]["Userid"]
				g_houses[houseid]["member"][newPlayerId] = true
				local newmember
				for member, _ in pairs(g_houses[houseid]["member"]) do
					if not newmember then
						newmember = member
					else
						newmember = newmember.."|"..member
					end
				end
				
				mysql_query(g_mysql["connection"], "UPDATE `houses` SET `member` = '"..newmember.."' WHERE `id` = "..houseid.." LIMIT 1 ;")
				outputChatBox(g_colors["yellow"].."Du hast "..getPlayerName(givenplayer).." zum neuen Mitbewohner gemacht.", playerSource, 0, 0, 0, true)
				outputChatBox(g_colors["yellow"].."Du wurdest von "..getPlayerName(playerSource).." zum neuen Mitbewohner seines Hauses gemacht.", givenplayer, 0, 0, 0, true)								
			end	
		else
			outputChatBox(g_colors["red"].."Dies ist nicht dein Haus!", playerSource, 0, 0, 0, true)
		end
	else
		outputChatBox(g_colors["red"].."Du bist in keinem Haus!", playerSource, 0, 0, 0, true)
	end
end
addCommandHandler("housemember", addHouseUser)

function newHouseOwner(playerSource, commandName, newPlayer)
	if not newPlayer then 
		outputChatBox(g_colors["red"].."Du hast keinen Spieler angegeben!", playerSource, 0, 0, 0, true)
		return false
	end
	
    local givenplayer = getPlayerFromName(newPlayer)
	if not givenplayer then 
		givenplayer = getPlayerFromString(newPlayer)
	end	
	if not givenplayer then
		outputChatBox(g_colors["red"].."Der angegebene Spieler ist nicht online oder exestiert nicht!", playerSource, 0, 0, 0, true)
		return false
	end
		
	local sql = "SELECT * FROM `houses` WHERE `playerid` = '"..getPlayerID(givenplayer).."' OR `member` = '"..getPlayerID(givenplayer).."' OR `member` LIKE '%|"..getPlayerID(givenplayer).."|%' OR `member` LIKE '"..getPlayerID(givenplayer).."|%' OR `member` LIKE '%|"..getPlayerID(givenplayer).."'"
	local res = mysql_query(g_mysql["connection"], sql)
	if mysql_num_rows(res) > 0 then	
		outputChatBox(g_colors["red"].."Der angegebene Spieler ist bereits Besitzer eines Hauses oder wohnt in einem.", playerSource, 0, 0, 0, true)
		return false
	end
	
	if g_playerstat[playerSource]["houseid"] ~= -1 then
		local playerid = g_playerstat[playerSource]["Userid"]
		local houseid = g_playerstat[playerSource]["houseid"]
		if g_houses[houseid]["owner"] == playerid then
			local newid = g_playerstat[givenplayer]["Userid"]
			g_houses[houseid]["owner"] = newid
			mysql_query(g_mysql["connection"], "UPDATE `houses` SET `owner` = '"..newid.."' WHERE `id` = "..houseid.." LIMIT 1;")
			
			outputChatBox(g_colors["green"].."Du hast dein Haus an "..getPlayerName(givenplayer).." abgegeben!", playerSource, 0, 0, 0, true)
			outputChatBox(g_colors["green"].."Du hast das Haus von "..getPlayerName(playerSource).." uebernommen!", givenplayer, 0, 0, 0, true)
		end
	end	
end
addCommandHandler("houseowner", newHouseOwner)

function enableBauModus(playerSource, commandName)
	if g_playerstat[playerSource]["houseid"] ~= -1 then
		local playerid = g_playerstat[playerSource]["Userid"]
		if g_houses[g_playerstat[playerSource]["houseid"]]["owner"] == playerid then
			local houseid = g_playerstat[playerSource]["houseid"]
			if #getElementChildren(g_houses[houseid]["pickupin"]) > 49 then
				outputChatBox(g_colors["red"].."Du kannst nicht mehr als 50 Objekte in deinem Haus bauen", playerSource, 255, 255, 255, true)
				return false
			end
			
			rpcCallClientFunction(playerSource, "setHouseBuildEnabled", true)
		end
	end
end
addCommandHandler("bauen", enableBauModus)

function enableBauEditModus(playerSource, commandName)
	if g_playerstat[playerSource]["houseid"] ~= -1 then
		local playerid = g_playerstat[playerSource]["Userid"]
		if g_houses[g_playerstat[playerSource]["houseid"]]["owner"] == playerid then
			rpcCallClientFunction(playerSource, "setHouseEditBuildEnabled", true)
		end
	end
end
addCommandHandler("bauedit", enableBauEditModus)

function createHouseObject(modelid, x, y, z, xx, yy, zz, preis)
	modelid = tonumber(modelid)
	x = tonumber(x)
	y = tonumber(y)
	z = tonumber(z)
	xx = tonumber(xx)
	xy = tonumber(yy)
	xz = tonumber(zz)
	preis = tonumber(preis)
	
	if preis < 0 then
		kickPlayer(client, "Clienthacking")
		return 
	end
	
	if modelid and x and y and z and xx and yy and zz and preis then
		takePlayerMoney(client, preis)
		
		mysql_query(g_mysql["connection"] , "INSERT INTO `houseobjects` (`id`, `modelid`, `x`, `y`, `z`, `rx`, `ry`, `rz`, `houseid`) \
											VALUES (NULL, '"..modelid.."', '"..x.."', '"..y.."', '"..z.."', '"..xx.."', '"..yy.."', '"..zz.."', '"..g_playerstat[client]["houseid"].."');")
							
							
		local object = createObject(modelid, x, y, z, xx, yy, zz)
		setElementInterior(object, getElementInterior(client))
		setElementDimension(object, getElementDimension(client))
		setElementData(object, "buildid", lastid)
		--Parent auf Pickup, damit Objecte beim l"..ouml.."schen des Hauses auch gel"..ouml.."scht werden ;) (und zur limitierung von objecten)
		setElementParent(object, g_houses[g_playerstat[client]["houseid"]]["pickupin"])
	end
end

function applyNewKoordEdit(object, x, y, z, rx, ry, rz, delete)
	if object and x and y and z and rx and ry and rz then
		if delete then
			local id = getElementData(object, "buildid")
			
			destroyElement(object)
			mysql_query(g_mysql["connection"] , "DELETE FROM `houseobjects` WHERE `id` ="..id.." LIMIT 1;")	
		else
			local id = getElementData(object, "buildid")
			x = tonumber(x)
			y = tonumber(y)
			z = tonumber(z)
			rx = tonumber(rx)
			ry = tonumber(ry)
			rz = tonumber(rz)	

		mysql_query(g_mysql["connection"], "UPDATE `houseobjects` SET\
												   `x` = '"..x.."',\
												   `y` = '"..y.."',\
												   `z` = '"..z.."',\
												   `rx` = '"..rx.."',\
												   `ry` = '"..ry.."',\
												   `rz` = '"..rz.."'\
											WHERE `houseobjects`.`id` = "..id.." LIMIT 1;")	 

			setElementPosition(object, x, y, z)
			setObjectRotation(object, rx, ry, rz)
		end	
	end
	return false
end

function colShapeHandlerHouse(leaveElement, dimension)
	if getElementType(leaveElement) == "player" then
		if g_colshapeh[source] then
			if getElementDimension(leaveElement) == getElementDimension(source) then
				if g_playerstat[leaveElement] then
					g_playerstat[leaveElement]["canleavehouse"] = 1
				end	
			end
		end
	end	
end	
addEventHandler("onColShapeLeave", getRootElement(), colShapeHandlerHouse)

function getHousePosFromPlayerID(playerID)
	local playerID = tonumber(playerID)
	for _, id in pairs(g_houses) do
		if id["owner"] == playerID or id["member"][playerID] == true then
			local x, y, z = getElementPosition(id["pickupin"])
			return x, y, z
		end
	end
end
