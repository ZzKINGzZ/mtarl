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



rpcRegisterGlobalFunction("getWeaponsforCategory")
rpcRegisterGlobalFunction("createWeapon")

local weaponMaker = {}
local number = 0

function initializeShops()
	outputDebug("weapon.lua start...")
	
	weaponMaker[1] = createMarker ( 2176.9658203125, 924.5712890625, 11.099519729614-1, "cylinder", 2, 20, 100, 100, 190) --LV
	weaponMaker[2] = createMarker ( 1367.544921875, -1279.9501953125, 13.546875-1, "cylinder", 2, 20, 100, 100, 190) --LS
	weaponMaker[3] = createMarker ( -2626.892578125, 209.32421875, 4.5897541046143-1, "cylinder", 2, 20, 100, 100, 190) --SF
	addEventHandler ( "onMarkerHit", weaponMaker[1], startWeaponSale)
	addEventHandler ( "onMarkerHit", weaponMaker[2], startWeaponSale)
	addEventHandler ( "onMarkerHit", weaponMaker[3], startWeaponSale)
	
end
addEventHandler('onResourceStart', getResourceRootElement(), initializeShops)

function startWeaponSale(playerSource)
	if source == weaponMaker[1] or source == weaponMaker[2] or source == weaponMaker[3] then
		if getElementType(playerSource) == "player" then
			if g_playerstat[playerSource] then
				if not isPlayerActiveInAnyJob(playerSource) then
					if g_playerstat[playerSource]["weaponlizenz1"] == true then
						number = number + 1
					end
					if g_playerstat[playerSource]["weaponlizenz2"] == true then
						number = number + 10
					end
					if g_playerstat[playerSource]["weaponlizenz3"] == true then
						number = number + 100
					end
					CORE:getPlayer(playerSource):callClient("startWeaponSaleClient", true, number)
					outputChatBox(g_colors["darkred"].."----------------------------------------------------", playerSource, 255, 255, 255, true)
					outputChatBox(g_colors["darkred"].."Waffen werden nicht gespeichert", playerSource, 255, 255, 255, true)
					outputChatBox(g_colors["darkred"].."und werden bei betreten eines", playerSource, 255, 255, 255, true)
					outputChatBox(g_colors["darkred"].."Jobs abgenommen!", playerSource, 255, 255, 255, true)
					outputChatBox(g_colors["darkred"].."-----------------------------------------------------", playerSource, 255, 255, 255, true)
					number = 0
				else
					outputChatBox(g_colors["red"].."Du bist in einem Job!", playerSource, 255, 255, 255, true)
				end
			end
		end
	end
end

function getWeaponsforCategory(category)
	if category == 1 then
		for _, weapon in pairs(weaponTable) do
			if not weapon["public"] == false then
				if weapon["category"] == 1 then
					local weapons = weapon["name"]
					local id = weapon["id"]
					local preis = weapon["preis"]
					CORE:getPlayer(client):callClient("fillWeaponGridList", weapons, id, preis)
				end
			end
		end
	elseif category == 2 then
		for _, weapon in pairs(weaponTable) do
			if not weapon["public"] == false then
				if weapon["category"] == 2 then
					local weapons = weapon["name"]
					local id = weapon["id"]
					local preis = weapon["preis"]
					CORE:getPlayer(client):callClient("fillWeaponGridList", weapons, id, preis)
				end
			end
		end
	elseif category == 3 then
		for _, weapon in pairs(weaponTable) do
			if not weapon["public"] == false then
				if weapon["category"] == 3 then
					local weapons = weapon["name"]
					local id = weapon["id"]
					local preis = weapon["preis"]
					CORE:getPlayer(client):callClient("fillWeaponGridList", weapons, id, preis)
				end
			end
		end
	end
end

function createWeapon(weaponname)
	if weaponname then
		local preis, id = getWeaponInfosfromString(weaponname)
		
		giveStaatsKasse(preis)
		takePlayerMoney(client, preis)
		giveWeapon (client, id , 100)
	end
end

function getWeaponInfosfromString(weaponname)
	for _, weapon in pairs(weaponTable) do
		if weapon["name"] == weaponname then
			local preis = weapon["preis"]
			local id = weapon["id"] 
			return preis, id
		end
	end
end
