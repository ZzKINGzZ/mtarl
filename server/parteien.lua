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



local parlament = {}
parlament["sitze"] = 12
parlament["parteien"] = {}

local wahl = false
local wahlTimestamp
local wahlparteien = {}

function initParteien()
	outputDebug("parteien.lua start...")
	
	local sql = "SELECT * FROM `parteien` WHERE `sitze` > 0" 
	local parteien = mysql_query(g_mysql["connection"], sql)
	if parteien then
		while true do
			local row = mysql_fetch_assoc(parteien)
			if not row then break end
			local id = tonumber(row["id"])
			local name = row["name"]
			local sitze = tonumber(row["sitze"])
			
			parlament["parteien"][id] = {}
			parlament["parteien"][id]["name"] = name
			parlament["parteien"][id]["sitze"] = sitze
		end
		mysql_free_result(parteien)
	end

	--2 592 000 > 30 Tage
	local lastWahlen = tonumber(getOneVar("letztewahlen"))
	wahlTimestamp = lastWahlen
	local timestampNow = getTimestamp()

	local diff = timestampNow - lastWahlen
	if diff > 2592000 then
		wahl = true
		setOneVar("wahlen", tostring(getTimestamp))
	end
	
	--86 400 24h
	local wahlen = lastWahlen + 86400
	if timestampNow < lastWahlen then
		wahl = true
	end
	
	if wahl then
		local sql = "SELECT * FROM `parteien`" 
		local parteien = mysql_query(g_mysql["connection"], sql)
		if parteien then
			while true do
				local row = mysql_fetch_assoc(parteien)
				if not row then break end
				
				wahlparteien[row["name"]] = tonumber(row["id"])
			end
			mysql_free_result(parteien)	
		end			
	end
end
addEventHandler('onResourceStart', getResourceRootElement(), initParteien)

function parteienPlayerLogin()
	for i, partei in pairs(parlament["parteien"]) do
		rpcCallClientFunction(source, "addPartei", partei["name"], partei["sitze"])
	end
	g_playerstat[source]["lastWahl"] = 0
	
	if wahl then
		local sql = "SELECT * FROM `wahlen` WHERE `playerid` ="..getPlayerID(source)..";"
		local wahlen = mysql_query(g_mysql["connection"], sql)
		if wahlen then
			while true do
				local row = mysql_fetch_assoc(wahlen)
				if not row then break end
				
				if tonumber(row["time"]) > g_playerstat[source]["lastWahl"] then
					g_playerstat[source]["lastWahl"] = tonumber(row["time"])
				end	
			end
			mysql_free_result(wahlen)	
		end
		
		local sql = "DELETE * FROM `wahlen` WHERE `playerid` = '"..tostring(getPlayerID(source)).."' AND `time` < "..tostring(g_playerstat[source]["lastWahl"])
		mysql_query(g_mysql["connection"], sql)
	end	
end
addEventHandler('onPlayerLoginMTARL', getRootElement(), parteienPlayerLogin)

function checkWahl()
	if wahl then
		if g_playerstat[client]["lastWahl"] then
			local wahltime = g_playerstat[client]["lastWahl"] + 86400
			local wahltimer = wahlTimestamp + 86400
			
			print(tostring(wahlTimestamp))
			print(tostring(g_playerstat[client]["lastWahl"]))
			if g_playerstat[client]["lastWahl"] < wahlTimestamp then
				rpcCallClientFunction(client, "toggleWahlen", true)

				for i, partei in pairs(wahlparteien) do
					rpcCallClientFunction(client, "addWahlPartei", i)
				end
			end	
		end	
	end
end

function wahlPartei(parteiname)
	if not parteiname then return false end
	local wahlid = wahlparteien[parteiname]
	
	local sql = "INSERT INTO `wahlen` (`playerid` ,`parteiid` ,`time`) VALUES ('"..getPlayerID(client).."', '"..wahlid.."', '"..getTimestamp().."');"
	mysql_query(g_mysql["connection"], sql)
	
	outputChatBox(g_colors["yellow"].."Du hast erfolgreich für '"..g_colors["green"]..parteiname..g_colors["yellow"].."' gestimmt!", client, 0, 0, 0, true)
end
