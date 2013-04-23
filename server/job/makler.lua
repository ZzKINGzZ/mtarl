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



rpcRegisterGlobalFunction("createMaklerHouse")

local makler = {}

local function initMaklerCrew()
	addJob(8, "Makler", false, 0, 255, 0)
	
	addJobRank(8, 1, "Makler", 0, false)
	addJobRank(8, 2, "Makler-Chef", 0, true)
end
addEventHandler("onResourceStart", getResourceRootElement(), initMaklerCrew)

function initCreateHouse(playerSource, commandName, player)
	if g_playerstat[playerSource]["Job"][8] == 1 or g_playerstat[playerSource]["Level"] == "Supporter" or g_playerstat[playerSource]["Level"] == "Team" or g_playerstat[playerSource]["Level"] == "Admin" then
		if not player then
			outputChatBox(g_colors["red"].."Du hast keinen Besitzer angegeben!", playerSource, 0, 0, 0, true)
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

		player = thePlayer
		local sql = "SELECT * FROM `houses` WHERE `playerid` = '"..getPlayerID(player).."' OR `member` = '"..getPlayerID(player).."' OR `member` LIKE '%|"..getPlayerID(player).."|%' OR `member` LIKE '"..getPlayerID(player).."|%' OR `member` LIKE '%|"..getPlayerID(player).."'"
		local res = mysql_query(g_mysql["connection"], sql)

		if mysql_num_rows(res) > 0 then
			--outputChatBox(g_colors["red"].."Der Spieler besitzt bereits ein Haus oder ist bereits woanders wohnhaft!", playerSource, 0, 0, 0, true)
			sendPlayerInfo(playerSource, "Der Spieler besitzt bereits ein Haus oder lebt mit jemand anderem zusammen.")
			return false		
		end
		
		CORE:getPlayer(playerSource):callClient("startCreateHouseClient", getPlayerName(thePlayer))
		
		makler[playerSource] = {}
		makler[playerSource]["step"] = 1
		makler[playerSource]["buyer"] = thePlayer
	end
end
addCommandHandler("createhouse", initCreateHouse)

function createMaklerHouse(preis, groesse)
	if makler[client]["step"] == 1 then
		local buyer = makler[client]["buyer"]
		if buyer and preis and groesse then
			if preis < 0 then
				return false
			end
			
			local x, y, z, int = getRandomHouse(tostring(groesse))
			if not x then
				outputChatBox(g_colors["red"].."Du hast eine falsche Hausgr"..ouml..""..szlig.."e angegeben!", client, 0, 0, 0, true)
				return false
			end
			
			local ownerid = g_playerstat[buyer]["Userid"]
			local createx, createy, createz = getPosInFrontOfPlayer(client, 2)
			local createx, createy, createz = getElementPosition(client)
			addHouse(createx, createy, createz, x, y, z, int, ownerid, buyer)
			
			if getPlayerMoney(buyer) > 0 then
				giveStaatsKasse(round(preis/100*91))
				givePlayerMoney(client, round(preis/100*9))
				takePlayerMoney(buyer, preis)
			else
				outputChatBox(g_colors["red"].."Der K"..auml.."ufer hat zu wenig Geld!", client, 0, 0, 0, true)
			end
			
			outputChatBox(g_colors["green"]..getPlayerName(client).." hat ein Haus auf deinem Namen erstellt!", buyer, 0, 0, 0, true)
			outputChatBox(g_colors["green"].."Du hast ein Haus f"..uuml.."r "..getPlayerName(buyer).." erstellt!", client, 0, 0, 0, true)
			teamLog(getPlayerName(client).." hat ein Haus f"..uuml.."r "..getPlayerName(buyer).." erstellt! (Preis: "..preis.."$")
			
			makler[client] = nil
		end
	end
end

--Syntax: interiorx, interiory, interiorz, interiorid getRandomHouse(string size)
function getRandomHouse(size)
	size = tostring(size)
	
	if size == "S" then
		local rand = math.random(4)
		
		if rand == 1 then
			return 2233.3603515625, -1114.9169921875, 1050.8828125, 5
		elseif rand == 2 then
			return 2282.9111328125, -1140.0166015625, 1050.8984375, 11
		elseif rand == 3 then
			return 2218, -1076.1748046875, 1050.484375, 1
		elseif rand == 4 then
			return 422.1181640625, 2536.345703125, 10, 10
		end
	end
	
	if size == "M" then
		local rand = math.random(6)

		if rand == 1 then
			return 223.29296875, 1287.2783203125, 1082.140625, 1
		elseif rand == 2 then
			return -260.689453125, 1456.52734375, 1084.3671875, 4
		elseif rand == 3 then
			return 2333.296875, -1076.662109375, 1049.0234375, 6
		elseif rand == 4 then
			return 318.6767578125, 1114.6806640625, 1083.8828125, 5
		elseif rand == 5 then
			return 2308.7900390625, -1212.4013671875, 1049.0234375, 6
		elseif rand == 6 then
			return 261.0087890625, 1284.5078125, 1080.2578125, 4
		end
	end
	
	if size == "L" then
		local rand = math.random(6)

		if rand == 1 then
			return 2365.2998046875, -1134.919921875, 1050.875, 8
		elseif rand == 2 then
			return 2196.30078125, -1204.1494140625, 1049.0234375, 6
		elseif rand == 3 then
			return 2269.5908203125, -1210.568359375, 1047.5625, 10
		elseif rand == 4 then
			return 2237.3310546875, -1081.076171875, 1049.0234375, 2
		elseif rand == 5 then
			return 2495.962890625, -1692.3232421875, 1014.7421875, 3
		elseif rand == 6 then
			return 2807.634765625, -1173.763671875, 1025.5703125, 8
		end
	end
	
	if size == "XL" then
		local rand = math.random(4)
		
		if rand == 1 then
			return 2317.5888671875, -1026.4130859375, 1050.2177734375, 9
		elseif rand == 2 then
			return 139.9794921875, 1366.7890625, 1083.859375, 5
		elseif rand == 3 then
			return 83.2275390625, 1322.4599609375, 1083.8662109375, 9
		elseif rand == 4 then
			return -283.875, 1471.2568359375, 1084.375, 15
		end
	end
	return false
end
