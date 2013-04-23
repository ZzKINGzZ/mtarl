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



addEvent("rpcOnClientCallArrive", true)

--LOCAL
local tAllowedFunctions = {}
local tAllowedUnsecureFunctions = {}

local nSecurityCode = math.random(10000, 99999)

--TODO: AllowedPlayerFuncs

local function rpcProcessClientFunctionRequest(p_sFunctionname, p_nSecCode, ...)
	local tArguments = { ... }
	
	for mKey, mValue in next, tArguments do
		tArguments[mKey] = tonumber(mValue) or mValue
	end	
	
	if ( nSecurityCode == p_nSecCode and tAllowedFunctions[p_sFunctionname] ) or tAllowedUnsecureFunctions[p_sFunctionname] then
		if _G[p_sFunctionname] then
			_G[p_sFunctionname](unpack(tArguments or {}))
		end	
	else
		outputServerLog("Sicherheitsfehler: '"..getPlayerName(client).."' versucht die Funktion '"..p_sFunctionname.."' aufzurufen. Diese ist aber nicht registriert.")
	end
end
addEventHandler("rpcOnClientCallArrive", root, rpcProcessClientFunctionRequest)


--PUBLIC
function rpcRegisterGlobalFunction(p_sFunctioname)
	if tAllowedFunctions[p_sFunctioname] then return false end
	tAllowedFunctions[p_sFunctioname] = true
	return true
end

function rpcRegisterGlobalUnsecureFunction(p_sFunctioname)
	if tAllowedUnsecureFunctions[p_sFunctioname] then return false end
	tAllowedUnsecureFunctions[p_sFunctioname] = true
	return true	
end

function rpcSendSecurityCodeToPlayer(p_ePlayer)
	return rpcCallClientFunction(p_ePlayer, "rpcSetSecurityCode", nSecurityCode)
end

function rpcCallClientFunction(p_eClient, p_sFunctionname, ...)
	local tArguments = { ... }
	
	for mKey, mValue in next, tArguments do
		if type(mValue) == "number" then tArguments[mKey] = tostring(mValue) end
	end
	
	return triggerClientEvent(p_eClient, "rpcOnServerCallArrive", root, p_sFunctionname, unpack(tArguments or {}))
end 

--[[local rpcFunctions = {
	showPlayerCheck = true,
	registerPlayer = true,
	loginPlayer = true,
	changePlayerStatMail = true,
	callNumber = true,
	endCall = true,
	changeKontoMoney = true,
	transferMoney = true,
	setVehicleUnlimitedBurning = true,
	setElementHealth = true,
	ADACDoneReapir = true,
	setVehicleToRespawnWater = true,
	putOutOfCar = true,
	enterHouse = true,
	lockHouse = true,
	requestPost = true,
	requestPostRead = true,
	deletePost = true,
	writePostClient = true,
	createHouseObject = true,
	applyNewKoordEdit = true,
	reacivateMenuControl = true,
	changePlayerJob = true,
	fillTanker = true,
	--anticheatKick = true,
	showRankMenu = true,
	toggleBewerbungMenu = true,
	handleBewerbung = true,
	endTutorial = true,
	setPaintjob = true,
	setCarColor = true,
	setLightColor = true,
	setTacho = true,
	setGPS = true,
	renderCarPreisServer = true,
	carsaleserver = true,
	sellOptionServer = true,
	setVehicleTuning = true,
	addVehicleTuning = true,
	takeTuningMoney = true,
	restartPaintballRound = true,
	endPaintballRound = true,
	setWeaponLizenz = true,
	setFlightLizenz = true,
	getWeaponsforCategory = true,
	createWeapon = true,
	checkWahl = true,
	wahlPartei = true,
	createMaklerHouse = true,
	setServerWatertank = true,
	requestNoHousePost = true,
	requestNoHousePostRead = true,
	changePlayerStatPW = true,
	writePostBewerbung = true,
	onClientInfoRecieve = true,
	onPlayerItemUse = true,
	onPlayerItemDestroy = true,
	stadtVerwaltungBeantragung = true,
	onPlayerItemGive = true,
	onPlayerItemShopBuy = true,
	sendBugReport = true,
	setSecurityClass = true,
	setTuningGarageOpen = true,
	crackCarWin = true
}

addEvent('onServerCall', true)
addEventHandler('onServerCall', getResourceRootElement(getThisResource()),
	function(fnName, securityCode, ...)
		if securityCode then
			if tonumber(securityCode) > 254 and tonumber(securityCode) < 1000 then
				if rpcFunctions[fnName] then
					local fn = _G[fnName]
					if fn then
						fn(...)
					end
				end
			else kickPlayer(client, "Manipulation erkannt!")	
			end	
		else kickPlayer(client, "Manipulation erkannt!")	
		end	
	end,
	false
)

function rpcCallClientFunction(player, fnName, ...)
	triggerClientEvent(player, 'onClientCall', getResourceRootElement(getThisResource()), fnName, ...)
end--]]
