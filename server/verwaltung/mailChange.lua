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



rpcRegisterGlobalFunction("changePlayerStatMail")

local function onMailCouterHit(playerSource)
	--if source == counter then
		if getElementType(playerSource) == "player" then
			if g_playerstat[playerSource] then
				CORE:getPlayer(playerSource):callClient("initalizeMailChange", true)
			end	
		end
	--end
end

local function initializeMailChangeCounter()
	outputDebug("mailChange.lua start...")
	
	local counter = createMarker(359.0732421875, 185.8173828125, 1008.3828125-1, "cylinder", 1.5, 200, 255, 0, 190)
	addEventHandler("onMarkerHit", counter, onMailCouterHit)
	setElementInterior(counter, 3)
	local ped = createPed(57, 355.2919921875, 185.4287109375, 1008.3786621094 , 200)
	setPedRotation(ped, 270)
	setElementInterior(ped, 3)
end
addEventHandler('onResourceStart', getResourceRootElement(), initializeMailChangeCounter)


function changePlayerStatMail(email)
	if email then
		email = escapeString(email)
		mysql_query(g_mysql["connection"], "UPDATE `players` SET `email` = '"..email.."' WHERE `playername` = '"..getPlayerName(client).."' LIMIT 1 ;")
		outputChatBox(g_colors["royalblue"].."Email "..email.." wurde gespeichert!", client, 255, 255, 255, true)
		rpcCallClientFunction(client, "setLoginVars", email)
	end
end
