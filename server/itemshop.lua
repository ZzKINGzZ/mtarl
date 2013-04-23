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



rpcRegisterGlobalFunction("onPlayerItemShopBuy")

local itemshopID = 1
local itemshops = {}
local itemshopPickups = {}

local function onPlayerItemShopPickup(playerSource) 
	if not getPedOccupiedVehicle(playerSource) then
		local itemShopID = itemshopPickups[source]
		if itemShopID then
			if itemshops[itemShopID]["items"] then
				for id, price in pairs(itemshops[itemShopID]["items"]) do
					rpcCallClientFunction(playerSource, "addShopItem", getItemName(id), id, price)
				end
				rpcCallClientFunction(playerSource, "toggleItemShop", true, itemShopID)
			end	
		end
	end
end

function createItemShop(posX, posY, posZ, interior, dimension)
	if not interior then interior = 0 end
	if not dimension then dimension = 0 end
	
	local pickup = createPickup(posX, posY, posZ, 3, 1274, 1)
	setElementInterior(pickup, interior)
	setElementDimension(pickup, dimension)
	addEventHandler("onPickupHit", pickup, onPlayerItemShopPickup)
	
	itemshopPickups[pickup] = itemshopID
	
	itemshops[itemshopID] = {}
	itemshops[itemshopID]["pickup"] = pickup
	
	itemshops[itemshopID]["items"] = {}
	
	itemshopID = itemshopID + 1
	
	return itemshopID - 1
end

function addItemShopItem(itemshopID, staticItemID, price)
	if not itemshops[itemshopID] then return false end
	if not itemshops[itemshopID]["items"] then return false end
	
	itemshops[itemshopID]["items"][staticItemID] = price
	return true
end

function addItemShopBuyFunction(itemshopID, buyFunction)
	if not itemshops[itemshopID] then return false end
	
	itemshops[itemshopID]["buyfunction"] = buyFunction
	return true
end

function doesItemShopHasBuyFunction(itemshopID)
	if itemshops[itemshopID]["buyfunction"] then return true end
	
	return false
end

--

function onPlayerItemShopBuy(staticID, price, itemshopID, pieces)	
	if staticID and price then
		if price < 1 then
			--Hack
			kickPlayer(client, "Client Manipulation")
			return false
		end
		
		pieces = tonumber(pieces)
		if pieces ~= 1 then
			local toPay = price * pieces
			if toPay > getPlayerMoney(client) then
				sendPlayerInfo("Du hast zu wenig Geld f"..uuml.."r den Einkauf.", true)
				return false
			end
			
			for i = 1, pieces, 1 do
				addPlayerItem(client, staticID)
				takePlayerMoney(client, price)
				giveStaatsKasse(price)
			end
		else
			if price > getPlayerMoney(client) then
				sendPlayerInfo("Du hast zu wenig Geld f"..uuml.."r den Einkauf.", true)
				return false
			end
			addPlayerItem(client, staticID)
			takePlayerMoney(client, price)
			giveStaatsKasse(price)
		end
		
		if itemshops[itemshopID]["buyfunction"] then
			itemshops[itemshopID]["buyfunction"](client, staticID, price, itemshopID)
		end
	end
end
