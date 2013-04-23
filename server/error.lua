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



local function startScript()
	rpcRegisterGlobalFunction("onClientInfoRecieve")
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), startScript)


local function onServerInfo(sMessage, nLevel, sFile, nLine)
	local nTime = getTimestamp()
	
	--Report zu Dev's
	for i, player in ipairs(getElementsByType("player")) do
		if g_playerstat[player]["Level"] == "Admin" then
			outputChatBox(g_colors["red"].."Es ist ein Fehler im Server aufgetreten:", player, 0, 0, 0, true)
			if sFile and nLine then
				outputChatBox(g_colors["darkorange"]..sMessage.." | Level: "..nLevel.." File: "..sFile.." Line: "..nLine, player, 0, 0, 0, true)
			else
				outputChatBox(g_colors["darkorange"]..sMessage.." | Level: "..nLevel, player, 0, 0, 0, true)
			end	
		end
	end
	
	--Speichern in Tabelle
	if g_mysql["connection"] then
		sFile = sFile or "Keine Datei gefunden"
		nLine = nLine or "-"
		
		local sql = "INSERT INTO `debug` (`message` ,`time`) VALUES ('[SERVER]"..mysql_escape_string(g_mysql["connection"], sMessage).." [Level: "..nLevel.."] [Datei: "..sFile.." Zeile: "..nLine.."]',  '"..getTimestamp().."');"
		mysql_query(g_mysql["connection"], sql)
	end
end
--addEventHandler("onDebugMessage", getResourceRootElement(getThisResource()), onServerInfo)

function onClientInfoRecieve(sMessage, nLevel, sFile, nLine)
	local sPlayername = getPlayerName(client)
	
	--Report zu Dev's
	for i, player in ipairs(getElementsByType("player")) do
		if g_playerstat[player]["Level"] == "Admin" then
			outputChatBox(g_colors["red"].."Es ist ein Fehler beim Client "..sPlayername.." aufgetreten:", player, 0, 0, 0, true)
			if sFile and nLine then
				outputChatBox(g_colors["darkorange"]..sMessage.." | Level: "..nLevel.." File: "..sFile.." Line: "..nLine, player, 0, 0, 0, true)
			else
				outputChatBox(g_colors["darkorange"]..sMessage.." | Level: "..nLevel, player, 0, 0, 0, true)
			end	
		end
	end	
	
	if g_mysql["connection"] then
		sFile = sFile or "Keine Datei gefunden"
		nLine = nLine or "-"
		
		local sql = "INSERT INTO `debug` (`message` ,`time`) VALUES ('[CLIENT: "..sPlayername.."]"..mysql_escape_string(g_mysql["connection"], sMessage).." [Level: "..nLevel.."] [Datei: "..sFile.." Zeile: "..nLine.."]',  '"..getTimestamp().."');"
		mysql_query(g_mysql["connection"], sql)	
	end	
end
