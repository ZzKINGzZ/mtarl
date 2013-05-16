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



rpcRegisterGlobalUnsecureFunction("showPlayerCheck")
rpcRegisterGlobalFunction("registerPlayer")
rpcRegisterGlobalFunction("loginPlayer")

local fixTeam = createTeam("general")

local newPlayers = {}

function checkPlayer(playerNick, playerIP, playerUsername, playerSerial, playerVersion, playerVersionString)
	--if playerVersion < 272 then 
		--cancelEvent()
	--end
	
	--Nur Namen mit Zahlen und Buchstaben sollten erlaubt sein
	if not string.find(playerNick, "%a") and not string.find(playerNick, "%d") then
		cancelEvent()
	end
	
	outputChatBox(g_colors["greenblue"]..playerNick.." ist dem Server beigetreten!", getRootElement(), 255, 255, 255, true)
	
	local iptable = explode(".", playerIP)
	
	--Check ob Name == Job
	--Möglicher Crash des Gesamtsystems
	if isCorrectJob(playerNick) then
		cancelEvent()
	end
end

function showPlayerCheck()
	rpcSendSecurityCodeToPlayer(client)
	
	initVehiclePool(client)
	setPlayerHudForIngame(client)	
	fadeCamera(client, true, 4.5)

	local player = mysql_query(g_mysql["connection"], "SELECT * FROM `players` WHERE `playername` = '"..escapeString(getPlayerName(client)).."' LIMIT 0, 1")
	if player then
		if mysql_num_rows(player) > 0 then
			rpcCallClientFunction(client, "showLogin", true)
		else 
			rpcCallClientFunction(client, "showRegister")
		end
		mysql_free_result(player)
	end
end

function registerPlayer(password, email, skin)
	password = escapeString(password)
	email = escapeString(email)
	skin = escapeString(skin)	
	
	local playername = getPlayerName(client)

	mysql_query(g_mysql["connection"], "INSERT INTO `players` (`playername`) VALUES ('"..playername.."');")
	
	local id = mysql_query(g_mysql["connection"], "SELECT LAST_INSERT_ID(id) AS last FROM players ORDER BY id DESC LIMIT 1;")
	local lastid = mysql_insert_id(g_mysql["connection"])
	mysql_free_result(id)
	
	local spawnx, spawny, spawnz = randomCoordForRegister()
	
	local playernumber = 0
	
	while true do
		local handynumber = math.random(10000, 99999)
		if not g_handystat["inuse"][handynumber] then
			g_handystat["inuse"][handynumber] = 1
			playernumber = handynumber
			break
		end	
	end	
	
	giveStaatsKasse(-65000)
	
	local beduerfnisse = {}
	beduerfnisse["hunger"] = 100
	beduerfnisse["durst"] = 100
	
	local saveTableBed = table.save(beduerfnisse)
	
	local skills = {}
	local saveTableSkill = table.save(skills)
	
	mysql_query(g_mysql["connection"], "UPDATE `players` SET `password` = '"..md5(password).."',\
															 `email` = '"..email.."',\
															 `level` = 'User',\
															 `muted` = '0',\
															 `health` = '100.0',\
															 `armor` = '0.0',\
															 `skin` = '"..skin.."',\
															 `spawnx` = '"..spawnx.."',\
															 `spawny` = '"..spawny.."',\
															 `spawnz` = '"..spawnz.."',\
															 `timeout` = '0',\
															 `timeoutx` = '0',\
															 `timeouty` = '0',\
															 `timeoutz` = '0',\
															 `beduerfnisse` = '"..saveTableBed.."',\
															 `skills` = '"..saveTableSkill.."',\
															 `fightingstyle` = '4',\
															 `handy` = '"..playernumber.."',\
															 `staatsschulden` = '0',\
															 `money` = '500',\
															 `bank` = '14500',\
															 `jailed` = '0',\
															 `jail-resttime` = '-1',\
															 `fat` = '0',\
															 `stamina` = '0',\
															 `muscle` = '0',\
															 `maxhealth` = '569',\
															 `pistol-skill` = '0',\
															 `pistolS-skill` = '0',\
															 `desert-skill` = '0',\
															 `shotgun-skill` = '0',\
															 `sawnoff-skill` = '0',\
															 `spas-skill` = '0',\
															 `microuzi-skill` = '0',\
															 `ak-skill` = '0',\
															 `mp9-skill` = '0',\
															 `m4-skill` = '0',\
															 `sniper-skill` = '0',\
															 `bulletshit` = '0',\
															 `underwater` = '0',\
															 `bikeskill` = '0',\
															 `cycleskill` = '0',\
															 `drivingskill` = '0',\
															 `itemlimit` = '10',\
															 `weaponLicense` = 'false',\
															 `online` = '0',\
															 `forumid` = '-1',\
															 `registerTime` = '"..getTimestamp().."',\
															 `wanted` = '0'\
	WHERE `playername` = '"..playername.."' LIMIT 1 ;")
	
	--Grundtasche für das Itemsystem anlegen
	--mysql_query(g_mysql["connection"], "INSERT INTO `taschen` (`taschenslots` , `playerid` , `taschenslot`) VALUES ('5', '"..lastid.."', '1');");
	
	triggerEvent("onPlayerRegisterMTARL", client, lastid)
	
	rpcCallClientFunction(client, "showLogin", true)
	--startTutorial(client)
	
	newPlayers[client] = true
end

function loginPlayer(passwort, user)
	passwort = escapeString(passwort)
	local player = mysql_query(g_mysql["connection"], "SELECT * FROM `players` WHERE `playername` = '"..escapeString(getPlayerName(client)).."' LIMIT 0, 1")
	if player then
		while true do
			local row = mysql_fetch_assoc(player)
			if not row then break end

			if md5(passwort) ~= row["password"] then
				rpcCallClientFunction(client, "setLabelFalsePSW")
				break
			end

			outputDebug("Lade Account...")

			--
			--local r, g, b, r2, g2, b2 = getSkyGradient()
			--rpcCallClientFunction(client, "setSkyGradient", r, g, b, r2, g2, b2)

			--local weatherID = getWeather()
			--rpcCallClientFunction(client, "setWeather", weatherID)

			--local h, m = getTime()
			--rpcCallClientFunction(client, "setTime", h, m)

			--Klasse initiieren
			local player = CORE:addPlayer(client)

			setPlayerTeam(client, fixTeam)
			g_playerstat[client] = {}

			--DEPRECATED
			g_playerstat[client]["Level"] = row["level"]
			--NEW
			player:setLevel(row["level"])

			if row["level"] == "Admin" then
				addCommandHandler("admin", activateAdminMenu)
				bindKey(client, "p", "down", activateAdminMenu)
			end

			--Userid
			--DEPRECATED
			g_playerstat[client]["Userid"] = tonumber(row["id"])
			--NEW
			player:setUserID(tonumber(row["id"]))

			g_playerstat[client]["Logedin"] = 1

			--Tutorial
			g_playerstat[client]["Tutorial"] = tonumber(row["tutorial"])

			player:callClient("setLoginVars", row["email"])

			--Muted
			if tonumber(row["muted"]) == 1 then
				player:setMuted(true)
			else
				player:setMuted(false)
			end

			--Timeout oder normaler Spawn
			if row["timeout"] == "1" then
				spawnPlayer(client, tonumber(row["timeoutx"]), tonumber(row["timeouty"]), tonumber(row["timeoutz"])+1)
				mysql_query(g_mysql["connection"], "UPDATE `players` SET `timeout` = '0' WHERE `id` = '"..g_playerstat[client]["Userid"].."' LIMIT 1;")
			else
				spawnPlayer(client, tonumber(row["spawnx"]), tonumber(row["spawny"]), tonumber(row["spawnz"])+1, tonumber(row["spawnrz"]))
			end
			mysql_query(g_mysql["connection"], "UPDATE `players` SET `online` = '1' WHERE `id` ='"..g_playerstat[client]["Userid"].."' LIMIT 1;")

			--Geld, Health, Armor, Skin, Staatsschulden, Bank
			player:setMoney(tonumber(row["money"]))
			g_playerstat[client]["Bank"] = tonumber(row["bank"])
			player:setModel(tonumber(row["skin"]))
			g_playerstat[client]["Skin"] = tonumber(row["skin"])
			player:setHealth(tonumber(row["health"]))
			player:setArmor(tonumber(row["armor"]))
			player:setFightingStyle(tonumber(row["fightingstyle"]))
    		g_playerstat[client]["Staatsschulden"] = tonumber(row["staatsschulden"])

			if g_playerstat[client]["Staatsschulden"] > 0 then
				outputChatBox(g_colors["red"].."Du schuldest dem Staat "..g_playerstat[client]["Staatsschulden"].."$", client, 0, 0, 0, true)
			end

			g_playerstat[client]["Verkehrstime"] = -1

			--Wanted
			setPlayerWantedLevel(client, tonumber(row["wanted"]))

			--Handynummer
			local handynummer = tonumber(row["handy"])
			g_playerstat[client]["Handynumber"] = handynummer

			g_handystat["active"][handynummer] = client
			player:callClient("setPhoneNumber", tostring(handynummer))
			g_playerstat[client]["handyactive"] = false

			--Knast
			g_playerstat[client]["Jailed"] = tonumber(row["jailed"])
			if g_playerstat[client]["Jailed"] > 0 then
				g_playerstat[client]["Jailtime"] = tonumber(row["jail-resttime"])
				--setElementInterior(client, 3, 193.1909, 174.9256, 1003.0234)
    			--setElementPosition(client,  193.1909, 174.9256, 1003.0234)
				player:setInterior(3)
				player:setPosition(client, 193.1909, 174.9256, 1003.0234)
			else
				g_playerstat[client]["Jailtime"] = -1
			end
			g_playerstat[client]["busted"] = 0

			--Death
			g_playerstat[client]["DeathRepsawnTime"] = -1

			--Body
			player:setStat(21, tonumber(row["fat"]))
			player:setStat(22, tonumber(row["stamina"]))
			player:setStat(23, tonumber(row["muscle"]))
			player:setStat(24, tonumber(row["maxhealth"]))
			player:setStat(25, tonumber(row["sexappeal"]))

			--Weapon
			player:setStat(69, tonumber(row["pistol-skill"]))
			player:setStat(70, tonumber(row["pistolS-skill"]))
			player:setStat(71, tonumber(row["desert-skill"]))
			player:setStat(72, tonumber(row["shotgun-skill"]))
			player:setStat(73, tonumber(row["sawnoff-skill"]))
			player:setStat(74, tonumber(row["spas-skill"]))
			player:setStat(75, tonumber(row["microuzi-skill"]))
			player:setStat(76, tonumber(row["mp9-skill"]))
			player:setStat(77, tonumber(row["ak-skill"]))
			player:setStat(78, tonumber(row["m4-skill"]))
			player:setStat(79, tonumber(row["sniper-skill"]))

			--Other
			player:setStat(128, tonumber(row["bulletshit"]))
			player:setStat(225, tonumber(row["underwater"]))
			player:setStat(229, tonumber(row["bikeskill"]))
			player:setStat(230, tonumber(row["cycleskill"]))
			player:setStat(160, tonumber(row["drivingskill"]))

			--Weapon License
			if row["weaponLicense"] == "false" then
				g_playerstat[client]["weaponlizenz1"] = false
				g_playerstat[client]["weaponlizenz2"] = false
				g_playerstat[client]["weaponlizenz3"] = false
			else
				local weapons = table.load(row["weaponLicense"])
				if weapons["weaponlizenz1"] == true then g_playerstat[client]["weaponlizenz1"] = true end
				if weapons["weaponlizenz2"] == true then g_playerstat[client]["weaponlizenz2"] = true end
				if weapons["weaponlizenz3"] == true then g_playerstat[client]["weaponlizenz3"] = true end
			end

			--Fluglizenz
			if tonumber(row["flightLicense"]) == 1 then
				g_playerstat[client]["flightlizens"] = true
			else
				g_playerstat[client]["flightlizens"] = false
			end

			--Onfire
			g_playerstat[client]["Onfire"] = 0
			g_playerstat[client]["AbortKeys"] = -1

			--Schlüssel
			g_playerstat[client]["Keys"] = 0
			g_playerstat[client]["Key"] = {}
			local schluss = mysql_query(g_mysql["connection"], "SELECT * FROM `keys` WHERE `playerid` ="..g_playerstat[client]["Userid"])
			if schluss then
				while true do
					local row = mysql_fetch_assoc(schluss)
					if not row then break end

					if tonumber(row["status"]) > 0 then
						if tonumber(row["status"]) == 2 then g_playerstat[client]["Keys"] = g_playerstat[client]["Keys"] + 1 end
						g_playerstat[client]["Key"][tonumber(row["fahrzeugid"])] = tonumber(row["status"])
					end
				end
			mysql_free_result(schluss)
			end

			--Allgemeine Variablen
			g_playerstat[client]["un"] = 1
			g_playerstat[client]["jc"] = 0
			g_playerstat[client]["houseid"] = -1
			g_playerstat[client]["canleavehouse"] = -1
			g_playerstat[client]["healer"] = false
			g_playerstat[client]["gpsON"] = false

			--Jobs
			g_playerstat[client]["Job"] = {}
			g_playerstat[client]["JobRank"] = {}
			g_playerstat[client]["Jobvar"] = {}
			g_playerstat[client]["Jobvar"]["general"] = {}
			g_playerstat[client]["Jobvar"]["general"]["usedVehicles"] = {}

			--nullAllPlayerJobs(client)

			local jobs = mysql_query(g_mysql["connection"], "SELECT * FROM `jobs` WHERE `playerid` ="..g_playerstat[client]["Userid"])

			if jobs then
				while true do
					local row = mysql_fetch_assoc(jobs)
					if not row then break end
					if tonumber(row["rank"]) > 0 then
						g_playerstat[client]["Job"][tonumber(row["job"])] = 1
						g_playerstat[client]["JobRank"][tonumber(row["job"])] = tonumber(row["rank"])
					end
				end
			end

			g_playerstat[client]["Jobtime"] = -1

			g_playerstat[client]["currentJob"] = -1
			g_playerstat[client]["jobExtraMoney"] = 0
			g_playerstat[client]["jobEntrance"] = 0
			g_playerstat[client]["JobAfkTime"] = 0

			--Keybinds
			player:bindKey("b", "down", lockVehicle)
			player:bindKey("l", "down", changeVehicleLight)
			player:bindKey("k", "down", changeVehicleEngine)

			local theTable = table.copy(row)
			triggerEvent("onPlayerLoginMTARL", client, theTable)

            setCameraTarget(client, client)
			player:callClient("showLogin", false)
			player:callClient("playerLogedInFunction")

			showMTARLVersion(client, true)

			--Scoreboard
			player:setData("ScoreboardHandynummer", tostring(g_playerstat[client]["Handynumber"]), true)

			local theTime = getRealTime()
			if theTime.minute < 10 then
				theTime.minute = "0"..theTime.minute
			end
			player:setData("ScoreboardOnline", theTime.hour..":"..theTime.minute.." Uhr", true)

			rpcCallClientFunction(client, "setServerOnlineTime", g_serverOnlineTime)
			rpcCallClientFunction(client, "setServerMaxPlayers", getMaxPlayers())
			rpcCallClientFunction(client, "setHousePos", tonumber(row["spawnx"]), tonumber(row["spawny"]), tonumber(row["spawnz"]))

			setPlayerScoreboardJob(client, false)

			if g_playerstat[client]["Level"] == "Admin" then
				player:setData("ScoreboardNameR", 255, true)
				player:setData("ScoreboardNameG", 0, true)
				player:setData("ScoreboardNameB", 0, true)
				setPlayerNametagColor (client, 255, 0, 0)
				setPlayerNametagText (client, "[Admin] "..getPlayerName(client))
			elseif g_playerstat[client]["Level"] == "Supporter" then
				player:setData("ScoreboardNameR", 0, true)
				player:setData("ScoreboardNameG", 255, true)
				player:setData("ScoreboardNameB", 0, true)
				setPlayerNametagColor (client, 0, 255, 0)
				setPlayerNametagText (client, "[Supporter] "..getPlayerName(client))
			elseif g_playerstat[client]["Level"] == "Team" then
				player:setData("ScoreboardNameR", 255, true)
				player:setData("ScoreboardNameG", 140, true)
				player:setData("ScoreboardNameB", 0, true)
				setPlayerNametagColor (client, 	255, 140, 0)
				setPlayerNametagText (client, "[Team] "..getPlayerName(client))
			elseif g_playerstat[client]["Level"] == "User" then
				player:setData("ScoreboardNameR", 255, true)
				player:setData("ScoreboardNameG", 255, true)
				player:setData("ScoreboardNameB", 255, true)
				setPlayerNametagColor (client, 255, 255, 255)
			end
		end
    end
	mysql_free_result(player)

	outputDebug("Account geladen ["..getPlayerName(client).."]")

	if newPlayers[client] == true then
        sendPlayerInfo(client, "Wilkommen auf MTA:RL!\n\nUm einen ersten Überblick über die Funktionen von MTA:RL zu bekommen empfehlen wir die das Playermenü anzusehen (F1). \nViel Spaß beim Spielen wünscht dir das Team von MTA:RL.")
		newPlayers[client] = nil
	end
end

function randomCoordForRegister()
	local x, y, z = {}, {}, {}
	x[1], y[1], z[1] = -2415.8681640625, 333.24395751953, 34.96875 --SF
	x[2], y[2], z[2] = 1933.27734375, 1345.9658203125, 9.96875 --LV
	x[3], y[3], z[3] = 2229.6784667969, -1163.7022705078, 25.785793304443 --LS


	local rand = math.random(3)
	return x[rand], y[rand], z[rand]
end

function quitPlayer(reason)
	outputDebug("Account einspeichern...")
	if reason == "Unknown" then
		outputChatBox(g_colors["greenblue"]..getPlayerName(source).." hat den Server aus unbekannten Gründen verlassen!", getRootElement(), 255, 255, 255, true)
	elseif reason == "Quit" then
		outputChatBox(g_colors["greenblue"]..getPlayerName(source).." hat den Server verlassen!", getRootElement(), 255, 255, 255, true)
	elseif reason == "Kicked" then	
		outputChatBox(g_colors["greenblue"]..getPlayerName(source).." wurde gekickt!", getRootElement(), 255, 255, 255, true)
	elseif reason == "Banned" then	
		outputChatBox(g_colors["greenblue"]..getPlayerName(source).." wurde gebannt!", getRootElement(), 255, 255, 255, true)
	elseif reason == "Bad Connection" then
		outputChatBox(g_colors["greenblue"]..getPlayerName(source).." hat den Server wegen Netzwerkproblemen verlassen!", getRootElement(), 255, 255, 255, true)
	elseif reason == "Timed out" then
		outputChatBox(g_colors["greenblue"]..getPlayerName(source).." hat den Server wegen einem Timeout verlassen!", getRootElement(), 255, 255, 255, true)
		
		--Timeout, aber er sollte wenigstens seinen Lohn bekommen
		local staticJobID = getPlayerActiveJob(source)
		if statidJobID then
			playerLeaveJob(source, staticJobID, 1, true, true)
		end
	end
	
	--Bye, bye everything
	for i, marker in ipairs(getElementsByType('marker')) do
		setElementVisibleTo(marker, source, false)
	end
	
	for i, blip in ipairs(getElementsByType('blip')) do
		setElementVisibleTo(blip, source, false)
	end	
	
	for i, radar in ipairs(getElementsByType('radararea')) do
		setElementVisibleTo(radar, source, false)
	end		
		
	if g_playerstat[source] then
		if g_playerstat[source]["Logedin"] == 1 then
			if g_playerstat[source]["DeathRepsawnTime"] > 0 then
				destroyElement(g_playerstat[source]["DeadPickup"])	
				g_playerstat[source]["DeadPickup"] = nil
				takePlayerMoney(source, 2000)
				setElementHealth(source, 100)
				
				destroyElement(g_playerstat[source]["DeadPickup"])	
				g_playerstat[source]["DeadPickup"] = nil
			end
			--Weg von der Onlineliste
			--WEB_SendPlayerConnection("disconnect", getPlayerName(source))
			
			local player = CORE:getPlayer(source)
			
			triggerEvent("onPlayerLogoutMTARL", source)
			local playername = escapeString(player:getName())
			
			local sql = "UPDATE `players` SET"
			
			sql = sql.."`level` = '"..player:getLevel().."', "
			
			local muted = 0
			if player:isMuted() then muted = 1 end
			sql = sql.."`muted` = '"..muted.."', "
			

			if player:getInterior() == 0 then
				if reason == "Timed out" or reason == "Bad Connection" then
					local x, y, z = player:getPosition()
					sql = sql.."`timeout` = '1', "
					sql = sql.."`timeoutx` = '"..x.."', "
					sql = sql.."`timeouty` = '"..y.."', "
					sql = sql.."`timeoutz` = '"..z.."', "
				end
			end	
			
			sql = sql.."`health` = '"..player:getHealth().."', "
			sql = sql.."`armor` = '"..player:getArmor().."', "
			
			sql = sql.."`money` = '"..player:getMoney().."', "
			sql = sql.."`fightingstyle` = '"..player:getFightingStyle().."', "
			
			sql = sql.."`bank` = '"..g_playerstat[source]["Bank"].."', "
			
			if g_playerstat["busted"] == 1 then
				g_playerstat[source]["Jailed"] = 1
				g_playerstat[source]["Jailtime"] = 600
			end
			
			sql = sql.."`jailed` = '"..g_playerstat[source]["Jailed"].."' ,"
			sql = sql.."`jail-resttime` = '"..g_playerstat[source]["Jailtime"].."', "
			
			sql = sql.."`staatsschulden` = '"..g_playerstat[source]["Staatsschulden"].."', "
			
			sql = sql.."`fat` = '"..player:getStat(21).."', "
			sql = sql.."`stamina` = '"..player:getStat(22).."', "
			sql = sql.."`muscle` = '"..player:getStat(23).."', "
			sql = sql.."`maxhealth` = '"..player:getStat(24).."', "
			sql = sql.."`sexappeal` = '"..player:getStat(25).."', "
			
			sql = sql.."`pistol-skill` = '"..player:getStat(69).."', "
			sql = sql.."`pistolS-skill` = '"..player:getStat(70).."', "
			sql = sql.."`desert-skill` = '"..player:getStat(71).."', "
			sql = sql.."`shotgun-skill` = '"..player:getStat(72).."', "
			sql = sql.."`sawnoff-skill` = '"..player:getStat(73).."', "
			sql = sql.."`spas-skill` = '"..player:getStat(74).."', "
			sql = sql.."`microuzi-skill` = '"..player:getStat(75).."', "
			sql = sql.."`ak-skill` = '"..player:getStat(76).."', "
			sql = sql.."`mp9-skill` = '"..player:getStat(77).."', "
			sql = sql.."`m4-skill` = '"..player:getStat(78).."', "
			sql = sql.."`sniper-skill` = '"..player:getStat(79).."', "
			
			sql = sql.."`bulletshit` = '"..player:getStat(128).."', "
			sql = sql.."`underwater` = '"..player:getStat(225).."', "
			sql = sql.."`bikeskill` = '"..player:getStat(229).."', "
			sql = sql.."`cycleskill` = '"..player:getStat(230).."', "
			sql = sql.."`drivingskill` = '"..player:getStat(160).."', "

			--Weapon License
			local weapons = {}
			if g_playerstat[source]["weaponlizenz1"] == true then weapons["weaponlizenz1"] = true end
			if g_playerstat[source]["weaponlizenz2"] == true then weapons["weaponlizenz2"] = true end
			if g_playerstat[source]["weaponlizenz3"] == true then weapons["weaponlizenz3"] = true end

			
			sql = sql.."`weaponLicense` = '"..table.save(weapons).."', "
			
			local license = 0
			if g_playerstat[source]["flightlizens"] then license = 1 end
			
			sql = sql.."`flightLicense` = '"..tostring(license).."', "
			
			
			sql = sql.."`online` = '0', "	

			sql = sql.."`wanted` = '"..tostring(getPlayerWantedLevel(source)).."' "
			
			sql = sql.."WHERE `playername` = '"..playername.."' LIMIT 1 ;"
			
			mysql_query(g_mysql["connection"], sql)
			sql = nil
			--Schlüssen neu einspeichern
			--Alle alten Schlüssel löschen
			mysql_query(g_mysql["connection"], "DELETE FROM `keys` WHERE `playerid`= '"..g_playerstat[source]["Userid"].."'")
			
			--Alle Schlüssel wieder einspeichern
			for fahrzeugid, state in pairs(g_playerstat[source]["Key"]) do
				if fahrzeugid and state then
					if state == 1 or state == 2 then
						--Check ob es ein Jobcar ist ;)
						local vehicle = g_vehicleID[fahrzeugid]
						if vehicle then
							if not isVehicleJobVehicle(vehicle) then
								mysql_query(g_mysql["connection"], "INSERT INTO `keys` (`fahrzeugid`, `playerid`, `status`) VALUES ('"..fahrzeugid.."', '"..g_playerstat[source]["Userid"].."', '"..state.."');")
							end	
						end	
					end
				end
			end
			
			--Jobs neu einspeichern
			mysql_query(g_mysql["connection"], "DELETE FROM `jobs` WHERE `playerid`= '"..g_playerstat[source]["Userid"].."'")
			for job, _ in pairs (g_playerstat[source]["Job"]) do
				if job then
					if not isMiniJob(job) then
						if g_playerstat[source]["Job"][job] > 0 then
							mysql_query(g_mysql["connection"], "INSERT INTO `jobs` (`playerid` ,`job` ,`rank`) VALUES ('"..g_playerstat[source]["Userid"].."', '"..job.."', '"..g_playerstat[source]["JobRank"][job].."')")
						end
					end
				end
			end
			
			--Zerstöre Blip, falls vorhanden
			if g_playerstat[source]["Blip"] then
				destroyElement(g_playerstat[source]["Blip"])
			end
			
			if g_playerstat[source]["Jobblib"] then
				destroyElement(g_playerstat[source]["Jobblib"])
			end
			
			--g_handystat["active"][g_playerstat[source]["Handynumber"]] = nil
			
			--Fahrzeuge loopen
			for i, vehicle in ipairs(getElementsByType("vehicle")) do
				if g_vehiclestat[vehicle] then
					if g_vehiclestat[vehicle]["tanker"] == source then 
						g_vehiclestat[vehicle]["auftanken"] = false 
						g_vehiclestat[vehicle]["tanker"] = false 
						g_vehiclestat[vehicle]["tankstelle"] = false 
					end
				end	
			end
			
			g_playerstat[source] = nil
			
			CORE:removePlayer(source)
			
			outputDebug("Account eingespeichert")
		end
	end
	--resetVerkaufsVar(source)
end

addEventHandler('onPlayerQuit', getRootElement(), quitPlayer)
addEventHandler('onPlayerConnect', getRootElement(), checkPlayer)

function setPlayerToOldName(oldnick, newnick)
	outputChatBox(g_colors["red"].."Umbenennung ist nicht unterstützt!", source, 0, 0, 0, true)
	cancelEvent()
end
addEventHandler("onPlayerChangeNick", getRootElement(), setPlayerToOldName)

--Eine Funktion für Einstein, weil der sich das nicht merken kann :(
function getPlayerID(player)
	return g_playerstat[player]["Userid"]
end
