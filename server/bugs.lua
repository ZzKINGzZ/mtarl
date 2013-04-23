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



rpcRegisterGlobalFunction("sendBugReport")

function sendBugReport(text)
	--security
	text = mysql_escape_string(g_mysql["connection"], text)
	
	local insert = "Bugreport von "..getPlayerName(client)..": "..text
	local now = getTimestamp()
	local x, y, z = getElementPosition(client)
	
	local posText = "x: "..x.." y: "..y.." z: "..z.." RotZ: "..getPedRotation(client).." Interior: "..getElementInterior(client).." Dimension: "..getElementDimension(client)
	
	local dataText = "Health: "..getElementHealth(client)
	dataText = dataText.." Armor: "..getPedArmor(client)
	dataText = dataText.." Serial: "..getPlayerSerial(client)
	
	local sql = "INSERT INTO `bugs` (`time` ,`bug`, `positionData`, `playerData`)VALUES ('"..now.."', '"..insert.."', '"..posText.."', '"..dataText.."');"
	mysql_query(g_mysql["connection"], sql)
	
	sendPlayerInfo(client, "Bug erfolgreich gemeldet.", true)
end
