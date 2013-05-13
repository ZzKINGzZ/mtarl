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



rpcRegisterGlobalFunction("handleBewerbung")

function toggleBewerbungMenu(toggle, job, player)
	if not toggle then return false end
	if not job then return false end
	if not player then
		if not client then return false 
		else player = client end
	end
	
	if not isCorrectJob(job) then return false end
	
	rpcCallClientFunction(player, "toggleBewerbungsMenu", toggle, job)
	
	if toggle == true then
		local post = mysql_query(g_mysql["connection"], "SELECT * FROM `post` WHERE `toPlayerID` = '-1' AND `ort` = 'Ausgeliefert' AND `special` = '"..job.."'")
		if post then
			while true do
				local row = mysql_fetch_assoc(post)
				if not row then break end

				rpcCallClientFunction(player, "fillBewerbungsGridList", row["fromPlayer"], row["text"])
			end
			mysql_free_result(post)			
		end
	end
end

function handleBewerbung(accepted, playername, jobName)
	local player = getPlayerFromName(playername)
	local job = getJobFromName(jobName)
	local ort = "mailBox"..tostring(math.random(1, 15))
	if accepted == true then
		--Bewerbung angenommen
		--Online
		if player then
			if not isPlayerEmployedInJob(player, job) then
				g_playerstat[player]["Job"][job] = 1
				g_playerstat[player]["JobRank"][job] = 1
				sendPlayerInfo(client, "Du hast "..playername.." eingestellt.")
				sendPlayerInfo(player, "Deine Bewerbung wurde durch "..getPlayerName(client).." bearbeitet und du wurdest eingestellt.")
				mysql_query(g_mysql["connection"], "DELETE FROM `post` WHERE `fromPlayer` = '"..playername.."' AND `toPlayerID` = '-1' AND `special` = '"..jobName.."';")
				addBrief(jobName, g_playerstat[player]["Userid"], "Deine Bewerbung", "Herzlich willkommen! \n\nDu hast es geschafft. Wir freuen uns, dich im Job "..jobName.." begrüßen zu dürfen!\nAls unser neuer Mitarbeiter kannst ab sofort an einer der Niederlassungen den Job betreten.\nWir hoffen dass du deinen Job immer mit großer Freude und Sorgfalt ausführst.\n \nMFG \n"..getPlayerName(client), ort)
                return true
			else
				sendPlayerInfo(client, playername.." ist bereits eingestellt.")
				return false
			end
		else
			--Check ob bereits eingestellt
			local res = mysql_query(g_mysql["connection"], "SELECT * FROM `players` WHERE `playername` = '"..playername.."' LIMIT 1;")
			local row = mysql_fetch_assoc(res)
			local id = tonumber(row["id"])			
			mysql_free_result(res)
			
			local res = mysql_query(g_mysql["connection"], "SELECT * FROM `jobs` WHERE `playerid` = '"..id.."' AND `job` = '"..job.."' LIMIT 1;")
			if mysql_num_rows(res) > 0 then
				sendPlayerInfo(client, playername.." ist bereits in diesem Job t"..auml.."tig.")
				mysql_free_result(res)
				mysql_query(g_mysql["connection"], "DELETE FROM `post` WHERE `fromPlayer` = '"..playername.."' AND `toPlayerID` = '-1' AND `special` = '"..jobName.."';")				
				return false
			end
			mysql_free_result(res)			
			
			mysql_query(g_mysql["connection"], "INSERT INTO `jobs` (`playerid`, `job`, `rank`) VALUES ('"..id.."', '"..job.."', '1');")
			
			mysql_query(g_mysql["connection"], "DELETE FROM `post` WHERE `fromPlayer` = '"..playername.."' AND `toPlayerID` = '-1' AND `special` = '"..jobName.."';")
			
			sendPlayerInfo(client, "Du hast "..playername.." eingestellt.")
			addBrief(jobName, id, "Deine Bewerbung", "Herzlich willkommen! 
 
Du hast es geschafft. Wir freuen uns, dich im Job "..jobName.." begrue"..szlig.."en zu d"..uuml.."rfen! 
Als unser neuer Mitarbeiter kannst ab sofort an einer der Niederlassungen den Job betreten. 
Wir hoffen dass du deinen Job immer mit gro"..szlig.."er Freude und Sorgfalt ausfuehrst.
 
MFG 
"..getPlayerName(client), ort)
		end
	else
		--Bewerbung abgelehnt
		--Online
		if player then
			sendPlayerInfo(client, "Du hast die Bewerbung von "..playername.." abgelehnt.")
			sendPlayerInfo(player, "Deine Bewerbung bei "..jobName.." wurde durch "..getPlayerName(client).." bearbeitet und abgelehnt.")
			mysql_query(g_mysql["connection"], "DELETE FROM `post` WHERE `fromPlayer` = '"..playername.."' AND `toPlayerID` = '-1' AND `special` = '"..jobName.."';")
			addBrief(jobName, g_playerstat[player]["Userid"], "Deine Bewerbung", "Hallo "..playername..", 
leider muessen wir die Mitteilen das deine Bewerbung bei "..jobName.." abgelehnt wurde. 
Bei Fragen kannst du dich gerne an "..getPlayerName(client).." wenden.
 
MFG 
"..getPlayerName(client).." ", ort)
			return true
		else
			mysql_query(g_mysql["connection"], "DELETE FROM `post` WHERE `fromPlayer` = '"..playername.."' AND `toPlayerID` = '-1' AND `special` = '"..jobName.."';")
			sendPlayerInfo(client, "Du hast die Bewerbung von "..playername.." abgelehnt.")
			local res = mysql_query(g_mysql["connection"], "SELECT * FROM `players` WHERE `playername` = '"..playername.."' LIMIT 1;")
			local row = mysql_fetch_assoc(res)
			local id = tonumber(row["id"])			
			mysql_free_result(res)
			addBrief(jobName, id, "Deine Bewerbung", "Hallo "..playername..", 
leider muessen wir die Mitteilen das deine Bewerbung bei "..jobName.." abgelehnt wurde. 
Bei Fragen kannst du dich gerne an "..getPlayerName(client).." wenden.
 
MFG 
"..getPlayerName(client)" ", ort)
			return true
		end
	end
end
