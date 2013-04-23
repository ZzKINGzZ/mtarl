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



rpcRegisterGlobalFunction("setFlightLizenz")

local function onCouterHit(playerSource)
	--if source == counter then
		if getElementType(playerSource) == "player" then
			if g_playerstat[playerSource] then
				if g_playerstat[playerSource]["flightlizens"] == false then
					CORE:getPlayer(playerSource):callClient("initalizeFlightLizenz", true)
				else
					outputChatBox(g_colors["royalblue"].."Du besitzt bereits einen Flugschein!", playerSource, 255, 255, 255, true)
				end
			end	
		end
	--end
end

local function initializeFlightLizenzCounter()
	outputDebug("flightLizenz.lua start...")
	
	local counter = createMarker(359.3583984375, 165.5771484375, 1008.3828125-1, "cylinder", 1.5, 200, 255, 0, 190)
	addEventHandler("onMarkerHit", counter, onCouterHit)
	setElementInterior(counter, 3)
	local ped = createPed(57, 355.6484375, 165.75390625, 1008.3778076172 , 200)
	setPedRotation(ped, 270)
	setElementInterior(ped, 3)
end
addEventHandler('onResourceStart', getResourceRootElement(), initializeFlightLizenzCounter)

function setFlightLizenz(toggle)
	if toggle then
		if getPlayerMoney(client) > 2000 then
			takePlayerMoney(client, 2000)
			giveStaatsKasse(2000)
			g_playerstat[client]["flightlizens"] = true
			--outputChatBox(g_colors["royalblue"].."Du hast die Fluglizenz erworben!", client, 255, 255, 255, true)
			sendPlayerInfo(client, "Du hast die Fluglizenz erworben.")
		else
			outputChatBox(g_colors["red"].."Du hast nicht genug Geld f"..uuml.."r einen Flugschein!", client, 255, 255, 255, true)
		end
	end
end
