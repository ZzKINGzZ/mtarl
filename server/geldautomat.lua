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



rpcRegisterGlobalFunction("changeKontoMoney")
rpcRegisterGlobalFunction("transferMoney")

local markers = {}

function placeGeldautomaten()
	outputDebug("geldautomat.lua start...")
	--markers[1] = createMarker(2089.0959, 2055.0290, 10.8203, "cylinder", 2, 110, 139, 61, 150, getRootElement()) --im Nirgendwo
	markers[2] = createMarker(1467.1107, -1048.9367, 22.8281, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	--markers[3] = createMarker(-2050.0505, 461.3593, -100035.1718, "cylinder", 2, 110, 139, 61, 150, getRootElement()	--Doppelt vorhanden (marker[18])
	markers[4] = createMarker(589.4363,-1252.9896,17.2082, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[5] = createMarker(1104.5245,-923.6553,42.3906, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[6] = createMarker(2401.4680,-1547.5966,23.1641, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[7] = createMarker(2179.0349,-1774.5035,12.5389, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[8] = createMarker(1955.2133,-2178.2131,12.5469, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[9] = createMarker(1755.9009,-1944.2782,12.5672, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[10] = createMarker(1211.2273,-1821.7512,12.5941, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[11] = createMarker(394.5443,-1758.0463,7.1906, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[12] = createMarker(255.0592,-54.2191,1.5703, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[13] = createMarker(1364.1897,301.7996,18.5469, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[14] = createMarker(2302.1636,-13.7446,25.4844, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[15] = createMarker(647.2449,-520.9219,15.3359, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[16] = createMarker(-1420.4598,-289.4524,13.1484, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[17] = createMarker(-1946.2261,-852.2305,31.2266, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[18] = createMarker(-2031.6053,455.7636,34.1723, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[19] = createMarker(-1982.8958,1043.1011,54.7188, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[20] = createMarker(-2580.0720,71.6548,3.9938, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[21] = createMarker(-2651.4854,363.6794,3.3777, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[22] = createMarker(-2724.6375,-322.9290,6.1758, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[23] = createMarker(-1551.3137,1054.2794,6.1875, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[24] = createMarker(-825.5186,1502.7145,18.6339, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[25] = createMarker(-1460.4734,2593.2981,54.8359, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[26] = createMarker(-286.5519,2692.7720,61.6875, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[27] = createMarker(664.8341,1721.2539,6.1875, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[28] = createMarker(1583.9930,2216.7090,10.0692, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[29] = createMarker(2140.4719,2735.3926,10.1763, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[30] = createMarker(2823.5027,2008.0493,10.8203, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[31] = createMarker(2525.6040,1519.2852,9.8203, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[32] = createMarker(2108.8230,898.4670,10.1797, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[33] = createMarker(1307.5076,1252.0139,9.8203, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[34] = createMarker(2469.8975,2243.4092,9.8203, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[35] = createMarker(1901.0206,2447.0144,10.1782, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	markers[36] = createMarker(1589.8370,743.2934,9.8203, "cylinder", 2, 110, 139, 61, 150, getRootElement())
	
	createObject(2942, 589.691040, -1253.831909, 17.739841, 0.0000, 0.0000, 201.0042)
	createObject(2942, 1104.501587, -922.391785, 42.886082, 0.0000, 0.0000, 359.0368)
	createObject(2942, 2401.437744, -1548.918213, 23.656954, 0.0000, 0.0000, 180.3777)
	createObject(2942, 2178.011963, -1774.474976, 13.033852, 0.0000, 0.0000, 86.8032)
	createObject(2942, 1955.196533, -2179.548096, 13.039766, 0.0000, 0.0000, 179.5955)
	createObject(2942, 1755.937988, -1942.973022, 13.065621, 0.0000, 0.0000, 359.9735)
	createObject(2942, 1211.271851, -1820.594116, 13.088680, 0.0000, 0.0000, 359.9735)
	createObject(2942, 394.455536, -1756.748291, 7.748430, 0.0000, 0.0000, 359.9735)
	createObject(2942, 255.099701, -52.690327, 1.070536, 0.0000, 0.0000, 359.9735)
	createObject(2942, 1364.778564, 302.905273, 19.039783, 0.0000, 0.0000, 334.1904)
	createObject(2942, 2303.633057, -13.640266, 25.977266, 0.0000, 0.0000, 271.4516)
	createObject(2942, 647.251526, -519.264954, 16.024916, 0.0000, 0.0000, 359.8705)
	createObject(2942, -1419.547729, -288.508972, 13.641329, 0.0000, 0.0000, 317.7584)
	createObject(2942, -1946.771240, -851.160278, 31.719454, 0.0000, 0.0000, 22.2160)
	createObject(2942, -2031.646118, 454.581940, 34.765188, 0.0000, 0.0000, 178.6331)
	createObject(2942, -1982.903931, 1041.431763, 55.219456, 0.0000, 0.0000, 178.6331)
	createObject(2942, -2580.158203, 70.325699, 4.457871, 0.0000, 0.0000, 178.6331)
	createObject(2942, -2649.906006, 363.678009, 3.870600, 0.0000, 0.0000, 270.5927)
	createObject(2942, -2723.779297, -323.848694, 6.663392, 0.0000, 0.0000, 225.0422)
	createObject(2942, -1550.270996, 1054.285767, 6.680391, 0.0000, 0.0000, 270.5922)
	createObject(2942, -825.594910, 1504.113525, 19.326719, 0.0000, 0.0000, 5.1300)
	createObject(2942, -1460.478516, 2591.666748, 55.328831, 0.0000, 0.0000, 180.4546)
	createObject(2942, -286.578613, 2691.518799, 62.180393, 0.0000, 0.0000, 180.4546)
	createObject(2942, 665.905762, 1720.095703, 6.714607, 0.0000, 0.0000, 219.9889)
	createObject(2942, 1583.951904, 2217.925049, 10.579908, 0.0000, 0.0000, 0.8328)
	createObject(2942, 2140.552002, 2733.903564, 10.669241, 0.0000, 0.0000, 181.3142) 
	createObject(2942, 2821.608154, 2008.144409, 10.313204, 0.0000, 0.0000, 87.7396)
	createObject(2942, 2525.587402, 1517.869507, 10.313204, 0.0000, 0.0000, 176.1576)
	createObject(2942, 2108.687744, 896.852966, 10.672579, 0.0000, 0.0000, 176.1576)
	createObject(2942, 1307.417603, 1250.868164, 10.313204, 0.0000, 0.0000, 176.1576)
	createObject(2942, 2469.913574, 2245.007324, 10.313204, 0.0000, 0.0000, 0.8328)
	createObject(2942, 1900.987183, 2448.418213, 10.671141, 0.0000, 0.0000, 0.8328)
	createObject(2942, 1591.260254, 743.111023, 10.408014, 0.0000, 0.0000, 272.4146)	
end
addEventHandler('onResourceStart', getResourceRootElement(), placeGeldautomaten)

function showGeldautomat(player, dimension)
	if getElementType(player) == "player" then
		if not getPedOccupiedVehicle(player) then
			for i, marker in pairs(markers) do
				if source == marker then
					rpcCallClientFunction(player, "showGeldautomatMenu", g_playerstat[player]["Bank"])
					break
				end
			end
		end
	end
end
addEventHandler('onMarkerHit', getRootElement(), showGeldautomat)

function changeKontoMoney(mode, money)
	if mode == "Einzahlen" then
		if (getPlayerMoney(client) - money) > -1 then
			takePlayerMoney(client, money)
			g_playerstat[client]["Bank"] = g_playerstat[client]["Bank"] + money
			rpcCallClientFunction(client, "hideGeldautomatMenu")
		else
			rpcCallClientFunction(client, "setGeldautomatErrorText", "Fehler: Ungültiger Betrag")
		end
	end
	if mode == "Auszahlen" then
		if (g_playerstat[client]["Bank"] - money) > -1 then
			givePlayerMoney(client, money)
			g_playerstat[client]["Bank"] = g_playerstat[client]["Bank"] - money
			rpcCallClientFunction(client, "hideGeldautomatMenu")
		else
			rpcCallClientFunction(client, "setGeldautomatErrorText", "Fehler: Ungültiger Betrag")
		end
	end
end

function transferMoney(playername, amount)
	if playername and amount then
		local player = getPlayerFromName(playername)
		local amount = tonumber(amount)
		if not player then player = getPlayerFromString(playername) end
		
		if not amount then
			rpcCallClientFunction(client, "setGeldautomatErrorText", "Fehler: Ungültiger Betrag.")
			return false		
		end
		
		if amount < 1 then
			rpcCallClientFunction(client, "setGeldautomatErrorText", "Fehler: Ungültiger Betrag.")
			return false
		end
		
		if player then
			--Der Spieler ist Online
			if (g_playerstat[client]["Bank"] - amount) > -1 then
				g_playerstat[client]["Bank"] = g_playerstat[client]["Bank"] - amount
				g_playerstat[player]["Bank"] = g_playerstat[player]["Bank"] + amount
				rpcCallClientFunction(client, "hideGeldautomatMenu")
			else
				rpcCallClientFunction(client, "setGeldautomatErrorText", "Fehler: Du hast zu wenig Geld.")
			end
		else
			local playersql = mysql_query(g_mysql["connection"], "SELECT * FROM `players` WHERE `playername` = '"..playername.."' LIMIT 1;")
			
			local res = mysql_num_rows(playersql)
			if res == 1 then
				local row = mysql_fetch_assoc(playersql)

				local playerToGiveID = tonumber(row["id"])
				
				local newBetrag = row["bank"] + amount
				
				if playerToGiveID then
					local sql = "UPDATE `players` SET `bank` = '"..newBetrag.."' WHERE `id` = "..playerToGiveID..";"
					mysql_query(g_mysql["connection"], sql)
				end
			else
				rpcCallClientFunction(client, "setGeldautomatErrorText", "Fehler: Kein Spieler mit diesem Namen gefunden.")
				return false			
			end
		end
	end
end

function givePlayerBankInterest()
	local playersOnline = getElementsByType("player")
	local playersOffline = mysql_query(g_mysql["connection"], "SELECT * FROM `players` WHERE `online` = '0';")
	if playersOnline and playersOffline then
		for i,player in ipairs(playersOnline) do
			local playerMoney = g_playerstat[player]["Bank"]
			local zinsen
			
			if playerMoney < 0 then
				zinsen = playerMoney / 100 * 4
			elseif playerMoney > 0 and playerMoney <= 5000 then
				zinsen = playerMoney / 100 * 3
			elseif playerMoney >= 5001 and playerMoney <= 10000 then
				zinsen = playerMoney / 100 * 2.5
			elseif playerMoney >= 10001 and playerMoney <= 25000 then
				zinsen = playerMoney / 100 * 2
			elseif playerMoney >= 25001 and playerMoney <= 50000 then
				zinsen = playerMoney / 100 * 1.5
			elseif playerMoney >= 50001 and playerMoney <= 100000 then
				zinsen = playerMoney / 100 * 1
			elseif playerMoney >= 100001 then
				zinsen = playerMoney / 100 * 0.5
			end
			
			if not zinsen or not playerMoney then return false end
			
			giveStaatsKasse(- zinsen)
			g_playerstat[player]["Bank"] = playerMoney + zinsen
		end
		
		while true do
			local row = mysql_fetch_assoc(playersOffline) --Hole nächste Reihe aus der Datenbank
			if not row then break end --Wenn keine Reihe mehr vorhanden ist, dann Schleife abbrechen
			
			local playerName = row["playername"] --Hole col "playername"
			local playerMoney = tonumber(row["bank"]) --Hole col "bank"
			local zinsen
			
			if playerMoney < 0 then
				zinsen = playerMoney / 100 * 4
			elseif playerMoney > 0 and playerMoney <= 5000 then
				zinsen = playerMoney / 100 * 3
			elseif playerMoney >= 5001 and playerMoney <= 10000 then
				zinsen = playerMoney / 100 * 2.5
			elseif playerMoney >= 10001 and playerMoney <= 25000 then
				zinsen = playerMoney / 100 * 2
			elseif playerMoney >= 25001 and playerMoney <= 50000 then
				zinsen = playerMoney / 100 * 1.5
			elseif playerMoney >= 50001 and playerMoney <= 100000 then
				zinsen = playerMoney / 100 * 1
			elseif playerMoney >= 100001 then
				zinsen = playerMoney / 100 * 0.5
			end
			
			if not zinsen or not playerMoney then return false end
			
			giveStaatsKasse(-zinsen)			
			local newPlayerMoney = playerMoney + zinsen
			
			local sql = "UPDATE `players` SET `bank` = '"..newPlayerMoney.."' WHERE `playername` = '"..playerName.."' AND `id` = '"..row['id'].."';"			
			mysql_query(g_mysql["connection"], sql) --Eintragen lassen, und damit haben wir es für diese Reihe :)
		end
	end
end
addEventHandler("onDayFinished", getRootElement(), givePlayerBankInterest)
