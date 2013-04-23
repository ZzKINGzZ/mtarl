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



rpcRegisterGlobalFunction("changePlayerStatPW")

local function onPWCouterHit(playerSource)
	--if source == counter then
		if getElementType(playerSource) == "player" then
			if g_playerstat[playerSource] then
				CORE:getPlayer(playerSource):callClient("initalizePWChange", true)
			end	
		end
	--end
end

local function initializePWchangeCounter()
	outputDebug("pwChange.lua start...")
	
	local counter = createMarker ( 359.328125, 181.267578125, 1008.3828125-1, "cylinder", 1.5, 200, 255, 0, 190)
	addEventHandler ( "onMarkerHit", counter, onPWCouterHit)
	setElementInterior ( counter, 3)
	local ped = createPed ( 57, 355.6123046875, 181.2783203125, 1008.3778686523 , 200)
	setPedRotation ( ped, 270 )
	setElementInterior ( ped, 3)
end
addEventHandler('onResourceStart', getResourceRootElement(), initializePWchangeCounter)

function changePlayerStatPW(password)
	if password then
		password = escapeString(password)
		mysql_query(g_mysql["connection"], "UPDATE `players` SET `password` = '"..md5(password).."' WHERE `playername` = '"..getPlayerName(client).."' LIMIT 1 ;")
		outputChatBox(g_colors["royalblue"].."Passwort erfolgreich ge"..auml.."ndert!", client, 255, 255, 255, true)
	end
end
