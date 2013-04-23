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



rpcRegisterGlobalFunction("setWeaponLizenz")

local function onCouterHit(playerSource)
	--if source == counter then
		local number = 0
		if getElementType(playerSource) == "player" then
			if g_playerstat[playerSource] then
				if g_playerstat[playerSource]["weaponlizenz1"] == true then
					number = number + 1
				end
				if g_playerstat[playerSource]["weaponlizenz2"] == true then
					number = number + 10
				end
				if g_playerstat[playerSource]["weaponlizenz3"] == true then
					number = number + 100
				end
				CORE:getPlayer(playerSource):callClient("initalizeWeaponLizenz", true, number)
				number = 0
			end	
		end
	--end
end

local function initializeWeaponLizenzCounter()
	outputDebug("weaponLizenz.lua start...")
	
	counter = createMarker(359.1708984375, 162.0244140625, 1008.3828125-1, "cylinder", 1.5, 200, 255, 0, 190)
	addEventHandler("onMarkerHit", counter, onCouterHit)
	setElementInterior(counter, 3)
	local ped = createPed(57, 355.8740234375, 162.6328125, 1008.3772583008 , 200)
	setPedRotation(ped, 270)
	setElementInterior(ped, 3)
end
addEventHandler('onResourceStart', getResourceRootElement(), initializeWeaponLizenzCounter)

function setWeaponLizenz(class)
	if class then
		if class == 1 then
			if getPlayerMoney(client) > 5000 then
				takePlayerMoney(client, 5000)
				giveStaatsKasse(5000)
				g_playerstat[client]["weaponlizenz1"] = true
				--outputChatBox(g_colors["royalblue"].."Du hast die Waffenlizenz der Klasse 1 erworben!", client, 255, 255, 255, true)
				sendPlayerInfo(client, "Du hast die Waffenlizenz f"..uuml.."r Waffen der Klasse 1 erworben.")
			else
				outputChatBox(g_colors["red"].."Du hast nicht genug Geld um die Waffenlizenz zu erwerben!", client, 255, 255, 255, true)
			end
		end
		if class == 2 then
			if getPlayerMoney(client) > 7000 then
				takePlayerMoney(client, 7000)
				giveStaatsKasse(7000)
				g_playerstat[client]["weaponlizenz2"] = true
				--outputChatBox(g_colors["royalblue"].."Du hast die Waffenlizenz der Klasse 2 erworben!", client, 255, 255, 255, true)
				sendPlayerInfo(client, "Du hast die Waffenlizenz f"..uuml.."r Waffen der Klasse 2 erworben.")
			else
				outputChatBox(g_colors["red"].."Du hast nicht genug Geld um die Waffenlizenz zu erwerben!", client, 255, 255, 255, true)
			end
		end
		if class == 3 then
			if getPlayerMoney(client) > 15000 then
				takePlayerMoney(client, 15000)
				giveStaatsKasse(15000)
				g_playerstat[client]["weaponlizenz3"] = true
				--outputChatBox(g_colors["royalblue"].."Du hast die Waffenlizenz der Klasse 3 erworben!", client, 255, 255, 255, true)
				sendPlayerInfo(client, "Du hast die Waffenlizenz f"..uuml.."r Waffen der Klasse 3 erworben.")
			else
				outputChatBox(g_colors["red"].."Du hast nicht genug Geld um die Waffenlizenz zu erwerben!", client, 255, 255, 255, true)
			end
		end
	end
end
