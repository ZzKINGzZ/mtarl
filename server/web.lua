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



function activateWebsiteCommand(playerSource, commandName, code)
	if not code then
		outputChatBox(g_colors["red"].."Falsche Parameter", playerSource, 255, 255, 255, true)
		return false
	end
	
	local newCode = explode("-", code)
	local forumid = newCode[4]
	
	local sql = "UPDATE `forumconnect` SET `playerid` = '"..getPlayerID(playerSource).."', `code` = '-1' WHERE `playerid` = '0' AND `forumid` = '"..forumid.."'	AND `code` = '"..code.."';"
	local res = mysql_query(g_mysql["connection"], sql)
	
	outputChatBox(g_colors["green"].."Der Account wurde verknüpft!", playerSource, 255, 255, 255, true)
end
--addCommandHandler("connectweb", activateWebsiteCommand, false, true)

--[[local webeserviceadress = "http://mtarl.de/mta_serv_24124/"

function WEB_SendPlayerConnection(sendType, playername)
	if webservice then
		if sendType then
			callRemote(webeserviceadress.."playerConnect.php", WEB_SendPlayerConnection_Callback, sendType, playername)
		end
	end
end

function WEB_SendPlayerConnection_Callback()

end--]]
