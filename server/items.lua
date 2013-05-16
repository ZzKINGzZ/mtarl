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



rpcRegisterGlobalFunction("onPlayerItemDestroy")
rpcRegisterGlobalFunction("onPlayerItemUse")
rpcRegisterGlobalFunction("onPlayerItemGive")
rpcRegisterGlobalFunction("onPlayerItemDestroy")

local items = {}

function addItem(staticID, name, destroyable, giveable, iconName)
	if not destroyable then destroyable = false end
	if not giveable then giveable = false end
	items[staticID] = {}
	items[staticID]["name"] = name
	items[staticID]["destroyable"] = destroyable
	items[staticID]["giveable"] = giveable
	items[staticID]["iconName"] = iconName or "cross"
	return true
end

function setItemUseFunction(staticID, functionPointer)
	if not items[staticID] then return false end
	items[staticID]["useFunc"] = functionPointer
	return true
end

function getItemUseFunction(staticID)
	if not items[staticID] then return false end
	if not items[staticID]["useFunc"] then return false end
	
	return items[staticID]["useFunc"]
end

function hasItemUseFunction(staticID)
	if not items[staticID] then return false end
	if not items[staticID]["useFunc"] then return false end

	return true
end

function getItemName(staticID)
	if not items[staticID] then return false end
	return items[staticID]["name"]
end

function getItemIcon(staticID)
	return items[staticID]["iconName"]
end

function isItemDestroyable(staticID)
	if not items[staticID] then return nil end
	if not items[staticID]["destroyable"] then return nil end
	
	return items[staticID]["destroyable"]
end

function isItemGiveable(staticID)
	if not items[staticID] then return nil end
	if not items[staticID]["giveable"] then return nil end
	
	return items[staticID]["giveable"]
end

function setItemData(playerSource, dynamicID, var, key)
	if g_playerstat[playerSource]["items"][dynamicID] then
		g_playerstat[playerSource]["items"][dynamicID]["addVars"][var] = key
		return true
	end
	return false
end

function getItemData(playerSource, dynamicID, var)
	if g_playerstat[playerSource]["items"][dynamicID] then
		return g_playerstat[playerSource]["items"][dynamicID]["addVars"][var]
	end
	return false	
end

--Gibt zurück:
--true wenn item vorhanden, number wieviele
--oder
--false
function hasPlayerItem(playerSource, staticID)
	if not items[staticID] then return false end
	
	local howOften = 0
	for dynamicID, item in pairs(g_playerstat[playerSource]["items"]) do
		if item["staticID"] == staticID then
			howOften = howOften + 1
		end
	end
	
	if howOften > 0 then return true, howOften end
	return false
end

function addPlayerItem(playerSource, staticID)
	local emptytable = {}
	local sql = "INSERT INTO `items` (`dynamicID` ,`staticID` ,`playerID`, `addVars`)VALUES (NULL, '"..staticID.."', '"..getPlayerID(playerSource).."', '"..tostring(table.save(emptytable)).."');"
	mysql_query(g_mysql["connection"], sql)
	local dynamicID = mysql_insert_id(g_mysql["connection"])
	if not dynamicID then return false end
	
	g_playerstat[playerSource]["items"][dynamicID] = {}
	g_playerstat[playerSource]["items"][dynamicID]["staticID"] = staticID
	g_playerstat[playerSource]["items"][dynamicID]["addVars"] = {}
	
	rpcCallClientFunction(playerSource, "addItemToList", dynamicID, staticID, getItemName(staticID), isItemDestroyable(staticID), hasItemUseFunction(staticID), isItemGiveable(staticID), getItemIcon(staticID))
	
	return dynamicID
end

function addPlayerItemMySQL(playerID, staticID)
	--local emptytable = {}
	--local sql = "INSERT INTO `items` (`dynamicID` ,`staticID` ,`playerID`, `addVars`) VALUES (NULL, '"..staticID.."', '"..playerID.."', '"..tostring(table.save(emptytable)).."');"
	local sql = "INSERT INTO `items` (`dynamicID` ,`staticID` ,`playerID` ,`addVars`) VALUES (NULL , '"..staticID.."', '"..playerID.."', 'return {{},}--|');"
	if not mysql_query(g_mysql["connection"], sql) then return false end
	return true
end

function removePlayerItem(playerSource, dynamicID)
	if g_playerstat[playerSource]["items"][dynamicID] then
		rpcCallClientFunction(playerSource, "removeItemFromList", dynamicID)
		g_playerstat[playerSource]["items"][dynamicID] = nil
	end	
end

function getPlayerItems(playerSource)
	return g_playerstat[playerSource]["items"]
end

function getPlayerItem(playerSource, staticID, cursor)
	if not cursor then cursor = 1 end
	
	local curGet = 1
	for dynamicID, item in pairs(g_playerstat[playerSource]["items"]) do
		if item["staticID"] == staticID then 
			if cursor == curGet then
				return dynamicID
			else
				curGet = curGet + 1
			end
		end
	end
	
	return false
end

function getPlayerItemsByStaticID(playerSource, staticID)
	local itemTable = {}
	
	for dynamicID, item in pairs(g_playerstat[playerSource]["items"]) do
		if item["staticID"] == staticID then
			table.insert(itemTable, dynamicID)
		end
	end
	
	return itemTable
end

function buildPlayerItemList(playerSource)
	rpcCallClientFunction(playerSource, "rebuildItemList")
	for dynamicID, item in pairs(g_playerstat[playerSource]["items"]) do
		rpcCallClientFunction(playerSource, "addItemToList", dynamicID, item["staticID"], getItemName(item["staticID"]), isItemDestroyable(item["staticID"]), hasItemUseFunction(item["staticID"]), isItemGiveable(item["staticID"]), getItemIcon(item["staticID"]))
	end
end

---
local function itemPlayerJoin()
	g_playerstat[source]["items"] = {}
	
	local sql = "SELECT * FROM `items` WHERE `playerid` ="..getPlayerID(source)
	local itemres = mysql_query(g_mysql["connection"], sql)
	
	if itemres then
		while true do
			local row = mysql_fetch_assoc(itemres)
			if not row then break end
			g_playerstat[source]["items"][tonumber(row["dynamicID"])] = {}
			g_playerstat[source]["items"][tonumber(row["dynamicID"])]["staticID"] = tonumber(row["staticID"])
			g_playerstat[source]["items"][tonumber(row["dynamicID"])]["addVars"] = table.load(row["addVars"])
		end	
		mysql_free_result(itemres)
	end
	
	buildPlayerItemList(source)
	rpcCallClientFunction(source, "bindItemKeys")
end
addEventHandler('onPlayerLoginMTARL', getRootElement(), itemPlayerJoin)

local function itemPlayerLeave()
	local deleteSql = "DELETE FROM `items` WHERE `playerid`= '"..getPlayerID(source).."';"
	mysql_query(g_mysql["connection"], deleteSql)
	
	for dynamicID, item in pairs(g_playerstat[source]["items"]) do
		local sql = "INSERT INTO `items` (`dynamicID` ,`staticID` ,`playerID`, `addVars`)VALUES ('"..dynamicID.."', '"..item["staticID"].."', '"..getPlayerID(source).."', '"..tostring(table.save(g_playerstat[source]["items"][dynamicID]["addVars"])).."');"
		mysql_query(g_mysql["connection"], sql)
	end	
end
addEventHandler('onPlayerLogoutMTARL', getRootElement(), itemPlayerLeave)

function onPlayerItemDestroy(dynamicID, anz, useAnz)
	if not useAnz then
		local staticID = g_playerstat[client]["items"][dynamicID]["staticID"]
		if staticID then
			if isItemDestroyable(staticID) then
				removePlayerItem(client, dynamicID)
			end	
		end	
	else
		local staticID = dynamicID
		if staticID then
			if isItemDestroyable(staticID) then
				--removePlayerItem(client, dynamicID)
				local items = getPlayerItemsByStaticID(client, staticID)
				local removed = 0
				for i, dynamicID in pairs(items) do
					if removed == anz then break 
					else removed = removed + 1 end
					
					removePlayerItem(client, dynamicID)
				end
			end	
		end			
	end
end

function onPlayerItemUse(dynamicID)
	local staticID = g_playerstat[client]["items"][dynamicID]["staticID"]
	if hasItemUseFunction(staticID) then
		getItemUseFunction(staticID)(client, dynamicID, staticID)
	end
end

function onPlayerItemGive(dynamicID)
	local staticID = g_playerstat[client]["items"][dynamicID]["staticID"]
	if staticID then
			if isItemGiveable(staticID) then
			local player, dist = closestPlayer(client)
			if dist < 4 then
				local staticID = g_playerstat[client]["items"][dynamicID]["staticID"]
				g_playerstat[player]["items"][dynamicID] = table.copy(g_playerstat[client]["items"][dynamicID])
				removePlayerItem(client, dynamicID)
				rpcCallClientFunction(player, "addItemToList", dynamicID, staticID, getItemName(staticID), isItemDestroyable(staticID), hasItemUseFunction(staticID), isItemGiveable(staticID), getItemIcon(staticID))
				outputChatBox(g_colors["green"].."Du hast "..getPlayerName(player).." das Item "..getItemName(staticID).." gegeben", client, 255, 255, 255, true)
				outputChatBox(g_colors["green"].."Du hast von "..getPlayerName(client).." das Item "..getItemName(staticID).." bekommen", player, 255, 255, 255, true)
			else
				outputChatBox(g_colors["red"].."Kein Spieler in der Nähe gefunden", client, 255, 255, 255, true)
			end
		end
	end	
end
