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



rpcRegisterGlobalFunction("toggleBewerbungMenu")
rpcRegisterGlobalFunction("showRankMenu")
rpcRegisterGlobalFunction("changePlayerJob")
rpcRegisterGlobalFunction("getAllJobNames")

local tJobs = {}
local tJobLocationPickups = {}

function addJob(staticID, jobName, miniJob, r, g, b, checkCars, gang)
	if tJobs[staticID] then return false end
	checkCars = checkCars or false
	gang = gang or false
	
	tJobs[staticID] = {}
	tJobs[staticID]["ranks"] = {}
	tJobs[staticID]["functions"] = {}
	tJobs[staticID]["name"] = jobName
	tJobs[staticID]["miniJob"] = miniJob
	tJobs[staticID]["r"] = tonumber(r)
	tJobs[staticID]["g"] = tonumber(g)
	tJobs[staticID]["b"] = tonumber(b)
	tJobs[staticID]["extraMoneyLimit"] = -1
	tJobs[staticID]["checkCars"] = checkCars
	tJobs[staticID]["gang"] = gang
	return true
end

function setJobExtraMoneyLimit(staticID, extraMoneyLimit)
	if not tJobs[staticID] then return false end
	
	return tJobs[staticID]["extraMoneyLimit"]
end

function isMiniJob(staticID)
	if not tJobs[staticID] then return false end
	
	return tJobs[staticID]["miniJob"]
end

function isGangJob(staticID)
	if not tJobs[staticID] then return false end
	
	return tJobs[staticID]["gang"]
end

function shouldCheckJobCars(staticID)
	if not tJobs[staticID] then return false end

	return tJobs[staticID]["checkCars"]
end

function isCorrectJob(jobName)
	for jobID, job in pairs(tJobs) do
		if job["name"] == jobName then return true end
	end
	return false
end

function getJobFromName(jobName)
	for jobID, job in pairs(tJobs) do
		if jobName == tJobs[jobID]["name"] then
			return jobID 
		end
	end
	return false
end

function getJobName(staticID)
	for jobID, job in pairs(tJobs) do
		if jobID == staticID then
			return tJobs[jobID]["name"]
		end
	end
	return false
end

function addJobRank(staticID, rankID, rankName, rankWage, rankBoss)
	if not tJobs[staticID] then return false end
	if tJobs[staticID][rankID] then return false end
	
	tJobs[staticID]["ranks"][rankID] = {}
	tJobs[staticID]["ranks"][rankID]["name"] = rankName
	tJobs[staticID]["ranks"][rankID]["wage"] = rankWage
	tJobs[staticID]["ranks"][rankID]["boss"] = rankBoss or false
	return true
end

function isPlayerJobBoss(playerSource, staticID)
	if not tJobs[staticID] then return false end

	local playerRank = g_playerstat[playerSource]["JobRank"][staticID]
	if not playerRank then return false end

	if not tJobs[staticID]["ranks"][playerRank]["boss"] then return false end
	if tJobs[staticID]["ranks"][playerRank]["boss"] == true then return true end
	return false
end


local fJobFunction = 
function(playerSource)
	local staticID, locationID = tJobLocationPickups[source]["staticID"], tJobLocationPickups[source]["locationID"]
	if staticID and locationID then
		if g_playerstat[playerSource] then
			if g_playerstat[playerSource]["currentJob"] == -1 then
				playerEnterJob(playerSource, staticID, locationID)
			elseif g_playerstat[playerSource]["currentJob"] == staticID	then
				if staticID == 3 then
					if g_playerstat[playerSource]["postMode"] == 2.2 then
						if postIsPostApplication() then
							postSurrender(playerSource, -1, getJobName(staticID))
							return
						end
					end
				end
				if not tJobs[staticID]["gang"] then
					playerLeaveJob(playerSource, staticID, locationID, true, false)
				else
					playerLeaveJob(playerSource, staticID, locationID, true, true)
				end
			elseif g_playerstat[playerSource]["postMode"] == 2.2 then
				postSurrender(playerSource, -1, getJobName(staticID))
			end
		end
	end
end

function playerLeaveJob(playerSource, staticID, locationID, giveMoney, silentAbort)		
	giveMoney = giveMoney or false
	silentAbort = silentAbort or false
	if g_playerstat[playerSource]["currentJob"] == staticID then
		--Bye Bye Job
		g_playerstat[playerSource]["currentJob"] = -1
		local playerJobRank = g_playerstat[playerSource]["JobRank"][staticID]
		local currentTimestamp = getTimestamp()
		
		g_playerstat[playerSource]["jc"] = 0
		
		if tJobs[staticID]["functions"]["onPlayerLeaveJob"] then
			tJobs[staticID]["functions"]["onPlayerLeaveJob"](playerSource, staticID, locationID, playerJobRank)
		end
					
		--Was mussen wir jetzt genau an Strafe zahlen
		--weil wir nicht gescheit aufgetankt haben
		--und die/das Auto/s nicht im ordentlichen Zustand
		--sind?
		local carCheck = false
		if tJobs[staticID]["checkCars"] then
			for vehicle, _ in pairs(g_playerstat[playerSource]["Jobvar"]["general"]["usedVehicles"]) do
				if isElement(vehicle) then
					local health = getElementHealth(vehicle)
					if health < 900 then
						carCheck = true
						break
					end
							
					local tank = getElementData(vehicle, "tank")
					local carModel = getElementModel(vehicle)
					local carTableID = carModel - 399
					local maxTank = carTable[carTableID]["tank"]
					local checkTank = maxTank - 7
					if tank < checkTank then
						carCheck = true
						break
					end
				end
			end
		end


		--Happy paying
		local entranceTime = g_playerstat[playerSource]["jobEntrance"]
		local afkTime = g_playerstat[playerSource]["JobAfkTime"]

		local timeToPay = currentTimestamp - entranceTime - afkTime
		local allToPay = g_playerstat[playerSource]["jobExtraMoney"]

		if tJobs[staticID]["extraMoneyLimit"] ~= -1 then
			if allToPay > tJobs[staticID]["extraMoneyLimit"] then
				allToPay = tJobs[staticID]["extraMoneyLimit"]
			end
		end
		g_playerstat[playerSource]["jobExtraMoney"] = 0

		local playerInfo = "Gehaltsabrechnung:\n"

		if not isMiniJob(staticID) then
			local timePay = 0
			if tJobs[staticID]["ranks"][playerJobRank] then
				timePay = round(tJobs[staticID]["ranks"][playerJobRank]["wage"] * timeToPay)
			else
				round(tJobs[staticID]["ranks"][1]["wage"] * timeToPay)
			end
            --sendPlayerInfo(playerSource, "Gehaltsabrechnung:\nZeitlohn: "..timePay.."$\nExtraverdienst: "..tostring(allToPay).."$")
            playerInfo = playerInfo .. "Zeitlohn: "..timePay.."$\nExtraverdienst: "..tostring(allToPay).."$"
            allToPay = allToPay + timePay
		else
		    --sendPlayerInfo(playerSource, "Gehaltsabrechnung:\n"..allToPay.."$ verdient.")
            playerInfo = playerInfo .. "Gehaltsabrechnung:\n"..allToPay.."$ verdient."
        end

		if carCheck then
            playerInfo = playerInfo .. "\nFahrzeug/e nicht getankt/repariert: -50$"
			allToPay = allToPay - 50
		end

		if not silentAbort then
			sendPlayerInfo(playerSource, playerInfo, true)
		end

		if giveMoney then
			givePlayerMoney(playerSource, allToPay)
			giveStaatsKasse(-allToPay)
		end
		--Waffen
		takeAllWeapons(playerSource)
		--Und noch das Scoreboard resetten
		setPlayerScoreboardJob(playerSource, false)

		--Nicht vergessen die Fahrzeugliste zu nil'en und neu zu erstellen
		g_playerstat[playerSource]["Jobvar"]["general"]["usedVehicles"] = nil
		g_playerstat[playerSource]["Jobvar"]["general"]["usedVehicles"] = {}
		return true
	end
	return false
end

function playerEnterJob(playerSource, staticID, locationID)
	if g_playerstat[playerSource]["currentJob"] == -1 then
		--MiniJob
		if isMiniJob(staticID) then
			--Ab in die JobID, reset Vars
			g_playerstat[playerSource]["currentJob"] = staticID
			g_playerstat[playerSource]["jobExtraMoney"] = 0
			g_playerstat[playerSource]["jobEntrance"] = getTimestamp()

			--Waffe
			takeAllWeapons(playerSource)
					
			if tJobs[staticID]["functions"]["onPlayerEnterJob"] then
				tJobs[staticID]["functions"]["onPlayerEnterJob"](playerSource, staticID, locationID)
				return true
			end				
		else
		--Normaler Job
			if not isPlayerEmployedInJob(playerSource, staticID) then
				sendPlayerInfo(playerSource, "Du bist kein Angestellter in diesem Beruf.", true)
				return
			end
					
			--Ab in die JobID, reset Vars
			g_playerstat[playerSource]["currentJob"] = staticID	
			g_playerstat[playerSource]["jobExtraMoney"] = 0
			g_playerstat[playerSource]["jobEntrance"] = getTimestamp()
			g_playerstat[playerSource]["JobAfkTime"] = 0
			local playerJobRank = g_playerstat[playerSource]["JobRank"][staticID]
					
			--Waffen
			takeAllWeapons(playerSource)
					
			if tJobs[staticID]["functions"]["onPlayerEnterJob"] then
				tJobs[staticID]["functions"]["onPlayerEnterJob"](playerSource, staticID, locationID, playerJobRank)
			end
					
			--Und noch das Scoreboard
			setPlayerScoreboardJob(playerSource, tJobs[staticID]["name"], tJobs[staticID]["r"], tJobs[staticID]["g"], tJobs[staticID]["b"])
			return true
		end
	end
	return false
end

function addJobLocation(staticID, locationID, locationX, locationY, locationZ, locationInterior, locationDimension)
	if not tJobs[staticID] then return false end
	
	if not tJobs[staticID]["locations"] then
		tJobs[staticID]["locations"] = {}
	end

	if tJobs[staticID]["locations"][locationID] then return false end
	
	tJobs[staticID]["locations"][locationID] = {}
	tJobs[staticID]["locations"][locationID]["x"] = locationX
	tJobs[staticID]["locations"][locationID]["y"] = locationY
	tJobs[staticID]["locations"][locationID]["z"] = locationZ
	tJobs[staticID]["locations"][locationID]["interior"] = locationInterior or 0
	tJobs[staticID]["locations"][locationID]["dimension"] = locationDimension or 0
	tJobs[staticID]["locations"][locationID]["pickup"] = createPickup(locationX, locationY, locationZ, 3, 1275, 1)
	if locationInterior ~= 0 then setElementInterior(tJobs[staticID]["locations"][locationID]["pickup"], locationInterior) end
	if locationDimension ~= 0 then setElementDimension(tJobs[staticID]["locations"][locationID]["pickup"], locationDimension) end
	
	--addEventHandler("onPickupHit", tJobs[staticID]["locations"][locationID]["pickup"], fJobFunction)
	addEventHandler("onPickupUse", tJobs[staticID]["locations"][locationID]["pickup"], fJobFunction)
	tJobLocationPickups[tJobs[staticID]["locations"][locationID]["pickup"]] = {}
	tJobLocationPickups[tJobs[staticID]["locations"][locationID]["pickup"]]["staticID"] = staticID
	tJobLocationPickups[tJobs[staticID]["locations"][locationID]["pickup"]]["locationID"] = locationID
	
	return true
end

function isPlayerEmployedInJob(playerSource, jobStaticID)
	if g_playerstat[playerSource]["Job"][jobStaticID] then
		if g_playerstat[playerSource]["Job"][jobStaticID] == 1 then
			return true
		end	
	end
	return false
end

function isPlayerEmployedInAnyJob(playerSource)
	for staticID, tJob in pairs(tJobs) do
		if isPlayerEmployedInJob(playerSource, staticID) then return true end
	end
	return false
end

function isPlayerActiveInJob(playerSource, staticID)
	if g_playerstat[playerSource]["currentJob"] == staticID then return true end
	return false
end

function getPlayerActiveJob(playerSource)
	if g_playerstat[playerSource] then
		if g_playerstat[playerSource]["currentJob"] ~= -1 then return g_playerstat[playerSource]["currentJob"] end
	end
	return false
end

function isPlayerActiveInAnyJob(playerSource)
	for staticID, tJob in pairs(tJobs) do
		if g_playerstat[playerSource]["currentJob"] == staticID then return true end
	end
	return false
end

function registerJobFunction(staticID, eventName, functionPointer)
	if not tJobs[staticID] then return false end
	
	if not tJobs[staticID]["functions"][eventName] then
		tJobs[staticID]["functions"][eventName] = functionPointer
		return true
	end
	return false
end

function addPlayerJobExtraMoney(playerSource, extraMoney)
	g_playerstat[playerSource]["jobExtraMoney"] = g_playerstat[playerSource]["jobExtraMoney"] + tonumber(extraMoney)
end

function addPlayerJobAfkTime(playerSource, afkTime)
	g_playerstat[playerSource]["JobAfkTime"] = g_playerstat[playerSource]["JobAfkTime"] + tonumber(afkTime)
end

function setPlayerJobExtraMoney(playerSource, extraMoney)
	g_playerstat[playerSource]["jobExtraMoney"] = extraMoney
end

function isVehicleJobVehicle(vehicle)
	if g_vehiclestat[vehicle] then
		for jobID, job in pairs(tJobs) do
			if tJobs[jobID]["name"] == g_vehiclestat[vehicle]["Specialcar"] then 
				return true, jobID
			end	
		end	
	end
	return false
end

local function enterVehicleJobSystem(playerSource, seat, jacked)
	if seat == 0 then
		local isJobVehicle, jobID = isVehicleJobVehicle(source)
		if isJobVehicle then
			local jobIDPlayer = getPlayerActiveJob(playerSource)
			if jobID then
				if jobID == jobIDPlayer then
					if tJobs[jobID]["checkCars"] then
						--Here's the list
						if not g_playerstat[playerSource]["Jobvar"]["general"]["usedVehicles"][source] then
							g_playerstat[playerSource]["Jobvar"]["general"]["usedVehicles"][source] = true
						end
					end
				end
			end
		end
	end
end
addEventHandler("onVehicleEnter", root, enterVehicleJobSystem)
---------------------------
--KOMPATIBLITAT
---------------------------

function showRankMenu(job)
	local playerSource = client
	if not job then
		outputChatBox(g_colors["red"].."Du hast keinen Job angegeben!", playerSource, 0, 0, 0, true)
		return false
	end
	local jobID = getJobFromName(job)
	if jobID then
		if isPlayerJobBoss(playerSource, jobID) then
			rpcCallClientFunction(playerSource, "showJobEditWindow", true, job)
			
			--Lade Mitarbeiter
			local playersql = mysql_query(g_mysql["connection"], "SELECT * FROM `jobs` WHERE `job` = '"..jobID.."'")
			if playersql then
				while true do
					local row = mysql_fetch_assoc(playersql)
					if not row then break end
					
					local playerid = tonumber(row["playerid"])
					local playercall = mysql_query(g_mysql["connection"], "SELECT * FROM `players` WHERE `id` ="..playerid.." LIMIT 1")
					
					
					local result = mysql_fetch_assoc(playercall)
					local playername = result["playername"]
					
					local player = getPlayerFromName(playername)
					if player then
						if g_playerstat[player]["Job"][jobID] > 0 then
							rpcCallClientFunction(playerSource, "fillJobEditGridlistWithPlayer", playername)
						end
					else
						rpcCallClientFunction(playerSource, "fillJobEditGridlistWithPlayer", playername)	
					end

				end
			end
				
			--Lade Ränge
			rpcCallClientFunction(playerSource, "fillJobEditGridlistWithRank", "Entlassen")
			for rankID, rank in pairs(tJobs[jobID]["ranks"]) do
				rpcCallClientFunction(playerSource, "fillJobEditGridlistWithRank", rank["name"])
			end
		else
			outputChatBox(g_colors["red"].."Du verfügst nicht über die Rechte!", playerSource, 0, 0, 0, true)
		end	
	else
		outputChatBox(g_colors["red"].."Syntaxfehler!", playerSource, 0, 0, 0, true)
		return false		
	end
end
--addCommandHandler("rank", startRankMenu)

function showChefMenu(playerSource, commandName, job)
	if not job then
		outputChatBox(g_colors["red"].."Du hast keinen Job angegeben!", playerSource, 0, 0, 0, true)
		return false
	end	
	
	local jobID = getJobFromName(job)
	if jobID then
		if isPlayerJobBoss(playerSource, jobID) then
			rpcCallClientFunction(playerSource, "toggleChefMenu", true, job)
			return true
		end
	end	
	outputChatBox(g_colors["red"].."Job nicht gefunden oder du bist kein Chef!", playerSource, 0, 0, 0, true)
end
addCommandHandler("chefmenu", showChefMenu)

function addNewPlayerToJob(playerSource, commandName, playername, job)
	if not job then
		outputChatBox(g_colors["red"].."Du hast keinen Job angegeben!", playerSource, 0, 0, 0, true)
		return false
	end	
	
	if not playername then
		outputChatBox(g_colors["red"].."Du hast keinen Spielernamen angegeben!", playerSource, 0, 0, 0, true)
		return false
	end		
	
	local jobID = getJobFromName(job)
	
	if jobID then
		if isPlayerJobBoss(playerSource, jobID) or g_playerstat[playerSource]["Level"] == "Admin"then
			local player = getPlayerFromName(playername)
			local ort = "mailBox"..tostring(math.random(1, 15))
			if playername then
				--Der Spieler ist verbunden
				if not isPlayerEmployedInJob(player, jobID) then
					g_playerstat[player]["Job"][jobID] = 1
					g_playerstat[player]["JobRank"][jobID] = 1
					outputChatBox(g_colors["green"].."Du wurdest dem Job "..job.." hinzugefügt!", player, 0, 0, 0, true)
					outputChatBox(g_colors["green"].."Du hast "..playername.." dem Job "..job.." hinzugefügt!", playerSource, 0, 0, 0, true)
				    addBrief("MTA:RL Bot", g_playerstat[player]["Userid"], job, "Hallo "..playername..",\n du wurdest soeben dem Job "..job.." hinzugefügt.\n \n MFG\n "..getPlayerName(playerSource), ort)
                end				
			else
				local playersql = mysql_query(g_mysql["connection"], "SELECT * FROM `players` WHERE `playername` = '"..playername.."'")
				local row = mysql_fetch_assoc(playersql)
				
				local playerid = tonumber(row["id"])
				if not playerid then
					outputChatBox(g_colors["red"].."Der Spieler exestiert nicht!", playerSource, 0, 0, 0, true)
					return false
				end
		
				mysql_query(g_mysql["connection"], "DELETE FROM `jobs` WHERE `playerid` ="..playerid.." AND `job` = '"..jobID.." LIMIT 1'")
					
				mysql_query(g_mysql["connection"], "INSERT INTO `jobs` (`playerid` ,`job` ,`rank`) VALUES ('"..playerid.."', '"..jobID.."', '1')")
				
				outputChatBox(g_colors["green"].."Du hast "..playername.." dem Job "..job.." hinzugefügt (/rank zum ".."Ändern des Rank's)", playerSource, 0, 0, 0, true)
				addBrief("MTA:RL Bot", playerid, job, "Hallo "..playername..",\ndu wurdest soeben dem Job "..job.." hinzugefügt.\n\nMFG\n"..getPlayerName(playerSource), ort)
			end
		end
	else
		outputChatBox(g_colors["red"].."Der Job exestiert nicht!", playerSource, 0, 0, 0, true)		
	end	
end
addCommandHandler("rankplayer", addNewPlayerToJob)

function changePlayerJob(job, playername, rankname)
	local jobID = getJobFromName(job)
	
	if jobID then
		if isPlayerJobBoss(client, jobID) then
			if job and playername and rankname then
				--Prüfen wir ob der Spieler verbunden ist oder nicht
				local player = getPlayerFromName(playername)
				local ort = "mailBox"..tostring(math.random(1, 15))
				if player then
					--Der Spieler ist online
					if rankname == "Entlassen" then
						--Der Spieler wird entlassen
						g_playerstat[player]["Job"][jobID] = 0
						g_playerstat[player]["JobRank"][jobID] = 0
						outputChatBox(g_colors["red"].."Du wurdest aus dem "..job.."-Dienst entlassen!", player, 0, 0, 0, true)
						outputChatBox(g_colors["green"].."Du hast "..playername.." aus dem Dienst entlassen", client, 0, 0, 0, true)
						addBrief(job, g_playerstat[player]["Userid"], job, "Hallo "..playername..",\nleider müssen wir die Mitteilen das du aus dem Job "..job.." entlassen wurdest.\nBei Fragen kannst du dich gerne an "..getPlayerName(client).." wenden.\n\nMFG\n"..getPlayerName(client), ort)
					else
						for rankID, rank in pairs(tJobs[jobID]["ranks"]) do
							if rank["name"] == rankname then
								g_playerstat[player]["JobRank"][jobID] = rankID
								rankid = rankID
								break
							end
						end
						outputChatBox(g_colors["green"].."Dein Jobstatus im Dienst "..job.." wurde geändert. ["..rankname.."]", player, 0, 0, 0, true)
						outputChatBox(g_colors["green"].."Du hast "..playername.." wiefolgt geändert: "..rankname, client, 0, 0, 0, true)
						addBrief(job, g_playerstat[player]["Userid"], job, "Hallo "..playername..",\ndein Jobstatus im "..job.." wurde soeben geändert!\nDu bist jetzt "..rankname..".\n\nMFG\n"..getPlayerName(client), ort)
					end
				else
					--Der Spieler ist offline, wir müssen seine MySQL Daten ändern
					local playersql = mysql_query(g_mysql["connection"], "SELECT * FROM `players` WHERE `playername` = '"..playername.."' LIMIT 1;")
					local row = mysql_fetch_assoc(playersql)

					if not row then
						outputChatBox(g_colors["red"].."Konnte "..playername.." nicht in der Datenbank finden!", client, 0, 0, 0, true)
						return false
					end

					local playerid = tonumber(row["id"])

					if rankname == "Entlassen" then
						mysql_query(g_mysql["connection"], "DELETE FROM `jobs` WHERE `playerid` ='"..playerid.."' AND `job` = '"..job.." LIMIT 1'")
						outputChatBox(g_colors["green"].."Du hast "..playername.." aus dem Dienst entlassen", client, 0, 0, 0, true)
						addBrief(job, playerid, job, "Hallo "..playername..",\nleider müssen wir die Mitteilen das du aus dem Job "..job.." entlassen wurdest.\nBei Fragen kannst du dich gerne an "..getPlayerName(client).." wenden.\n\nMFG\n"..getPlayerName(client), ort)
					else
						for rankID, rank in pairs(tJobs[jobID]["ranks"]) do
							if rank["name"] == rankname then
								g_playerstat[player]["JobRank"][jobID] = rankID
								rankid = rankID
								break
							end
						end

						mysql_query(g_mysql["connection"], "DELETE FROM `jobs` WHERE `playerid` ="..playerid.." AND `job` = '"..job.." LIMIT 1'")
						mysql_query(g_mysql["connection"], "INSERT INTO `jobs` (`playerid` ,`job` ,`rank`) VALUES ('"..playerid.."', '"..jobID.."', '"..rankid.."')")

						outputChatBox(g_colors["green"].."Du hast "..playername.." wiefolgt geaendert: "..row2["rankname"], client, 0, 0, 0, true)
						addBrief(job, playerid, job, "Hallo "..playername..",\ndein Jobstatus im "..job.." wurde soeben geändert!\nDu bist jetzt "..rankname..".\n\nMFG\n"..getPlayerName(client), ort)
					end
				end
				return true
			end
		end
	end
	return false
end

---------------------------
--Sonstige FUNKTION
---------------------------

function getAllJobNames(typ)
	for jobID, job in pairs(tJobs) do
		if not isMiniJob(jobID) then
			if typ == 1 then
				rpcCallClientFunction(client, "postFillJobList", job["name"])
			elseif typ == 2 then
			rpcCallClientFunction(client, "adminFillJobList", job["name"])
			end
		end
	end
end
