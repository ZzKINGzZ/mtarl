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



--[[
HOOK
--]]
--[[function secureLogger(why)
  print ("hook reached: ", why)
  print ("function =", debug.getinfo (2, "n").name)
  local file = fileOpen("logger.txt", false)
  fileWrite(file, tostring(debug.getinfo (2, "n").name).."
")
  fileClose(file)
end
debug.sethook(secureLogger, "c")--]]

--TODO: Maybe firststart.lua?
_addCommandHandler = addCommandHandler

function addCommandHandler(commandName, luaFunction, restricted, caseSensitive)
	caseSensitive = caseSensitive or false
	restricted = restriced or false
	_addCommandHandler(commandName, 
		function(playerSource, commandName, ...)
			if g_playerstat[playerSource] then
				luaFunction(playerSource, commandName, ...)
			end
		end,
	restricted, caseSensitive)
end


--Klassen
CORE = Core()

--
g_playerstat = {}
g_serverstat = {}
g_whitelist = {}
g_handystat = {}
g_handystat["inuse"] = {}
g_trafficlight = {}
g_trafficlight["laststate"] = 1
g_bans = {}
g_bans["serial"] = {}
g_bans["ip"] = {}
debugmode = false
webservice = false

g_mysql = {}

local g_staatskasse

g_colors = {}
g_colors["red"] = "#AA3333"
g_colors["yellow"] = "#FFFF00"
g_colors["crimson"] = "#DC143C"
g_colors["darkred"] = "#8B0000"
g_colors["green"] = "#008000"
g_colors["darkgreen"] = "#006400"
g_colors["gold"] = "#FFD700"
g_colors["darkorange"] = "#FF8C00"
g_colors["orange"] = "#FFA500"
g_colors["blue"] = "#6600CC"
g_colors["lightblue"] = "#6699CC"
g_colors["greenblue"] = "#33FFCC"
g_colors["poisongreen"] = "#00FF40"
g_colors["royalblue"] = "#4169E1"
g_colors["limegreen"] = "#32CD32"
g_colors["deepskyblue"] = "#1E90FF"
g_colors["yellowgreen"] = "#ccff33"

local Timetimer
local timers = {}

addEvent("onPlayerLoginMTARL")
addEvent("onPlayerLogoutMTARL")
addEvent("onPlayerRegisterMTARL")
addEvent("onGeneralTimer")
addEvent("onGeneralPlayerTimer")
addEvent("onGeneralVehicleTimer")
addEvent("onVehicleSetVarsMTARL")
addEvent("onVehicleCreateMTARL")
addEvent("onVehicleDeleteMTARL")
addEvent("onDayFinished")

local dayFinished = -1
local fastShutdown = false

function shouldServerShutDownFast()
	return fastShutdown
end

function preInitalizeServer()

end
--addEventHandler('onResourcePreStart', getResourceRootElement(getThisResource()), preInitalizeServer)

--[[function corePlayerReadyToPlay()
	showPlayerCheck()
end--]]

function initalizeServer()
	local eventcancled = 0
	print("MTA:RL by Einstein")
	print("Parts of Code by Werni")
	print("Copyright 2008 - 2011")
	
	--Lesen wir zuerst unsere Konfigurationsdatei aus
	local xml = xmlLoadFile("config.xml")
	if not xml then
		outputServerLog("Konnte config.xml nicht finden. Laden abgebrochen!")
		cancelEvent()
		stopResource(getThisResource())
		return false
	end
	
	--Debugmodus
	local debugchild = xmlFindChild(xml, "debugmode", 0)
	if not debugchild then
		outputServerLog("Konnte debugmode in config.xml nicht finden, Standartm"..auml.."ssig auf 'false' gesetzt!")
	else
		local debugval = xmlNodeGetValue(debugchild)
		if debugval == "true" then
			outputDebug("Debugmodus aktiviert")
			debugmode = true
		else
			outputServerLog("Debugmodus deaktiviert")
			debugmode = false
		end
	end
	
	--Webservice
	local webservchild = xmlFindChild(xml, "webservices", 0)
	if not webservchild then
		outputDebug("Konnte webservices in config.xml nicht finden, Standartm"..auml.."ssig auf 'false' gesetzt!")
	else
		local webval = xmlNodeGetValue(webservchild)
		if webval == "true" then
			outputDebug("Webservices aktiviert")
			webservice = true
		else
			outputDebug("Webservices deaktiviert")
			webservice = false
		end
	end	
	
	--WEB_SendPlayerConnection("clear", " ")
	
	--MySQL Daten
	outputDebug("Lade MySQL-Daten")
	local mysqlchild = xmlFindChild(xml, "mysqldata", 0)
	if not mysqlchild then
		outputServerLog("Keine MySQL Verbindungsdaten gefunden. Es wird versucht, mit den Standartdaten zu verbinden (localhost, mtarl, nil, mtarl)")
	end
	
	local mysqlhost = xmlGetVal(mysqlchild, "host")
	if mysqlhost then mysql_host = mysqlhost end
	outputDebug("MySQL Host: "..mysql_host)
	
	local mysqluser = xmlGetVal(mysqlchild, "user")
	if mysqluser then mysql_user = mysqluser end
	outputDebug("MySQL User: "..mysql_user)	
	
	local mysqlpsw = xmlGetVal(mysqlchild, "password")
	if mysqlpsw then mysql_password = mysqlpsw end

	local mysqltable = xmlGetVal(mysqlchild, "table")
	if mysqltable then mysql_table = mysqltable end
	outputDebug("MySQL Table: "..mysql_table)	
	
	g_mysql["connection"] = mysql_connect(mysql_host, mysql_user, mysql_password, mysql_table, 3306, nil, "")
	
	if not g_mysql["connection"] then
		outputServerLog("Kann die MySQL-Verbindung nicht aufbauen!")
		print("Kann die MySQL-Verbindung nicht aufbauen!")
		stopResource(getThisResource())
		eventcancled = 1
		cancelEvent()
		return false
	end	
	
	--MySQL Token (SECURITY)
	local configtoken = xmlGetVal(xml, "mysqltoken")
	if not configtoken then
		print("Sicherheitsfehler!")
		stopResource(getThisResource())
		eventcancled = 1
		cancelEvent()
		return false	
	end
	
	local mysqltoken = getOneVar("mysqltoken")
	if mysqltoken ~= configtoken then
		print("Sicherheitsfehler!")
		stopResource(getThisResource())
		eventcancled = 1
		cancelEvent()
		return false	
	end
	
	if eventcancled == 0 then
		--Load Serverdata
		g_staatskasse = tonumber(getOneVar("staatskasse"))

		--Load used Phonenumbers
		local handy = mysql_query(g_mysql["connection"], "SELECT * FROM `handy`")
		if handy then
			g_handystat["inuse"] = {}
			while true do
				local row = mysql_fetch_assoc(handy)
				if not row then break end
				g_handystat["inuse"][tonumber(row["number"])] = 1
			end
			mysql_free_result(handy)		
		end	
		
		--Load our own Bansystem
		--[[local ban = mysql_query(g_mysql["connection"], "SELECT * FROM `ban`")
		if ban then
			while true do
				local row = mysql_fetch_assoc(ban)
				if not row then break end
				
				local serial = row["serial"]
				local ip = row["ip"]
				
				g_bans["serial"][serial] = true
				g_bans["ip"][ip] = true
			end
		end--]]
		
		--Set the Timers
		setTimer(timer, 1000, 0)
		Timetimer = 50
		timers["weather"] = 0
		timers["mysql"] = 0
		timers["trafficlight"] = 0
		
		--Fps, smooze
		setFPSLimit(0)
		
		--Traffic lights
		setTrafficLightsLocked(true)
		setTrafficLightState(0)
		
		--Load Whitelist
		local whitelist = mysql_query(g_mysql["connection"], "SELECT * FROM `whitelist`")
		if whitelist then
			g_whitelist["name"] = {}
			while true do
				local row = mysql_fetch_assoc(whitelist)
				if not row then break end
				
				g_whitelist["name"][tostring(row["name"])] = 1
			end
			mysql_free_result(whitelist)		
		end
		
		--Online
		local sql = "UPDATE `players` SET `online` = 0"
		mysql_query(g_mysql["connection"], sql)
		
		--Day
		--86400 a day
		local curTimestamp = getTimestamp()
		local dayFinish = getOneVar("dayEnd")
		
		if dayFinish then
			dayFinish = tonumber(dayFinish)
			dayFinished = dayFinish
			local difference = curTimestamp - dayFinish
			if difference > 86400 then
				local howMuch = math.floor(difference / 86400)
				for i = 1, howMuch, 1 do
					triggerEvent("onDayFinished", getRootElement())
					outputDebug("Ein Tag wurde beendet.")	
				end
				setOneVar("dayEnd", tostring(curTimestamp))
				dayFinished = curTimestamp
			end
		end

		
		rpcRegisterGlobalFunction("corePlayerReadyToPlay")
	end	
end
addEventHandler('onResourceStart', getResourceRootElement(), initalizeServer)

function deinitalizeServer()
	outputDebug("general.lua shutdown...")
	--Senden wir der Webseite unsere Ereignisse
	--WEB_SendPlayerConnection("clear", " ")
	
	--Reset the Vars
	setWeather(0)
	resetSkyGradient()
	setWaveHeight(0)
	
	--Speichern der Staatskasse
	setOneVar("staatskasse", g_staatskasse)
	
	if shouldServerShutDownFast() then
		outputServerLog("Schnelles Herunterfahren aktiv!")
		return true
	end
	
	--Save the rest of Players
	for i,player in ipairs(getElementsByType("player")) do 
		triggerEvent("onPlayeronPlayerQuit", player, "Quit")
		setControlState(player, "enter_exit", true)
	end

	--Save the Phonenumbers
	local leeren = mysql_query(g_mysql["connection"], "TRUNCATE TABLE `handy`")
	mysql_free_result(leeren)
	
	for i,number in pairs(g_handystat["inuse"]) do
		local aufmachen = mysql_query(g_mysql["connection"], "INSERT INTO `handy` (`number`) VALUES ('"..escapeString(tostring(i)).."');")
		mysql_free_result(aufmachen)
	end
	
	--Write the new Whitelist
	local leeren = mysql_query(g_mysql["connection"], "TRUNCATE TABLE `whitelist`")
	mysql_free_result(leeren)
	
	for o, name in pairs(g_whitelist["name"]) do
		local aufmachen = mysql_query(g_mysql["connection"], "INSERT INTO `whitelist` (`name`) VALUES ('"..escapeString(tostring(o)).."');")
		mysql_free_result(aufmachen)		
	end
	
	--mysql_close(g_mysql["connection"])
	
	print(('Vehicles          [%d]'):format(#getElementsByType('vehicle')))
	print(('Objects           [%d]'):format(#getElementsByType('object')))
	print(('Pickups           [%d]'):format(#getElementsByType('pickup')))
	print(('Markers           [%d]'):format(#getElementsByType('marker')))
	print(('Peds              [%d]'):format(#getElementsByType('ped')))
	print(('Radarareas        [%d]'):format(#getElementsByType('radararea')))
	print(('Waters            [%d]'):format(#getElementsByType('water')))
	print(('Remoteclients     [%d]'):format(#getElementsByType('remoteclient')))
end
addEventHandler('onResourceStop', getResourceRootElement(), deinitalizeServer)

function timer()
	local curTimestamp = getTimestamp()
	
	local diff = curTimestamp - dayFinished
	if diff > 86400 then
		triggerEvent("onDayFinished", getRootElement())
		outputDebug("Ein Tag wurde beendet.")
		setOneVar("dayEnd", tostring(curTimestamp))
		dayFinished = curTimestamp		
	end
	
	Timetimer = Timetimer + 1
	if Timetimer == 60 then
		setRealTime()
		Timetimer = 0
	end	
	
	timers["weather"] = timers["weather"] + 1
	if timers["weather"] == 600 then
		timers["weather"] = 0
		changeWeather()
	end
	
	timers["trafficlight"] = timers["trafficlight"] + 1
	if timers["trafficlight"] == 10 then
		
		if g_trafficlight["laststate"] == 1 then
			setTrafficLightState(3)
			g_trafficlight["laststate"] = 2
		elseif g_trafficlight["laststate"] == 2 then
			setTrafficLightState(6)
			g_trafficlight["laststate"] = 3
		elseif g_trafficlight["laststate"] == 3 then
			setTrafficLightState(0)
			g_trafficlight["laststate"] = 4
		elseif g_trafficlight["laststate"] == 4 then
			setTrafficLightState(6)
			g_trafficlight["laststate"] = 1
		end
		
		timers["trafficlight"] = 0
		if getTrafficLightState() == 6 then timers["trafficlight"] = 8 end
	end
	
	for i, vehicle in ipairs(getElementsByType("vehicle")) do
		if not g_vehiclestat[vehicle]["tempcar"] == true then
			triggerEvent("onGeneralVehicleTimer", vehicle)
		end
	end
	
	for i, player in ipairs(getElementsByType("player")) do
		if player then
			if g_playerstat[player] then
				if g_playerstat[player]["Abortkeys"] then
					if g_playerstat[player]["Abortkeys"] > -1 then
						g_playerstat[player]["Abortkeys"] = g_playerstat[player]["Abortkeys"] - 1
						if g_playerstat[player]["Abortkeys"] == 0 then
							g_playerstat[player]["Abortkeys"] = -1
							setControlState(player, "enter_exit", false)
						end
					end
				end	
				--[[if g_playerstat[player]["Jobtime"] > -1 then
					g_playerstat[player]["Jobtime"] = g_playerstat[player]["Jobtime"] - 1
					if g_playerstat[player]["Jobtime"] == 0 then
						g_playerstat[player]["Jobtime"] = 900
						givePlayerJobMoney(player)
					end
				end--]]
				if g_playerstat[player]["Jailed"] == 1 then
					if g_playerstat[player]["Jobtime"] > -1 then g_playerstat[player]["Jobtime"] = -1 end
					if g_playerstat[player]["Jailtime"] > -1 then
						g_playerstat[player]["Jailtime"] = g_playerstat[player]["Jailtime"] - 1
						if g_playerstat[player]["Jailtime"] == 0 then
							setElementPosition(player, 2284.7248535156, 2429.4458007813, 10.8203125)
							setElementInterior(player, 0)
							g_playerstat[player]["Jailtime"] = -1
							g_playerstat[player]["Jailed"] = 0
							outputChatBox(g_colors["green"].."Du wurdest aus dem Gef"..auml.."ngniss entlassen!", player, 0, 0, 0, true)
						end
					end
				end
				if g_playerstat[player]["Verkehrstime"] > 0 then
					g_playerstat[player]["Verkehrstime"] = g_playerstat[player]["Verkehrstime"] - 1
					if g_playerstat[player]["Verkehrstime"] == 0 then
						policeRemoveStop(player)
					end
				end
				if g_playerstat[player]["DeathRepsawnTime"] > 0 then
					g_playerstat[player]["DeathRepsawnTime"] = g_playerstat[player]["DeathRepsawnTime"] - 1
					if g_playerstat[player]["DeathRepsawnTime"] == 0 then
						g_playerstat[player]["DeathRepsawnTime"] = -1
						local x, y, z = getElementPosition(player)
						local int = getElementInterior(player)
						local dim = getElementDimension(player)
						
						if isPlayerActiveInAnyJob(player) then
							local jobSkin = getElementModel(player)
							spawnPlayer(player, x, y, z, jobSkin, 0, g_playerstat[player]["Skin"], int, dim)
							setElementModel(player, jobSkin)
						else
							spawnPlayer(player, x, y, z, g_playerstat["skinid"], 0, g_playerstat[player]["Skin"], int, dim)
							setElementModel(player, g_playerstat[player]["Skin"])
						end
						setElementInterior(player, int)
						setElementDimension(player, dim)
						
						if g_playerstat[player]["DeadPickup"] then
							destroyElement(g_playerstat[player]["DeadPickup"])	
							g_playerstat[player]["DeadPickup"] = nil
						end
					end
				end
				triggerEvent("onGeneralPlayerTimer", player)
			end	
		end	
	end
	
	triggerEvent("onGeneralTimer", root)
	
	timers["mysql"] = timers["mysql"] + 1
	if timers["mysql"] == 3 then
		checkMySQLCon()
		timers["mysql"] = 0
	end	
end

local function fastShutdownConsole(player, commandName)
	if getElementType(player) == "console" then
		print("FastShutdown aktiviert!")
		fastShutdown = true
	end
end
_addCommandHandler("fastshutdown", fastShutdownConsole)

function giveStaatsKasse(money)
	local themoney = g_staatskasse
	if money > 0 then
		g_staatskasse = themoney + money
	elseif money < 0 then
		g_staatskasse = themoney - money
	end
end
