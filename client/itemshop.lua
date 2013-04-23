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



local connectorsTable = {}
local itemshop = 0

local function resetGridList()
	guiGridListClear(g_itemshopgui["grid_items"])
	guiGridListClear(g_itemshopgui["grid_warenkorb"])
	
	connectorsTable = nil
	connectorsTable = {}
end

local function onItemShopGUIHandler(button)
	if button == "left" then
		if source == g_itemshopgui["button_close"] then
			toggleItemShop(false)
		end
		
		if source == g_itemshopgui["button_ad"] then
			local item = guiGridListGetSelectedItem(g_itemshopgui["grid_items"])
			if item >= 0 then
				local name = guiGridListGetItemText(g_itemshopgui["grid_items"], item, 1)
				local preis = guiGridListGetItemText(g_itemshopgui["grid_items"], item, 2)
				if name and preis then
					local count = guiGridListGetRowCount(g_itemshopgui["grid_warenkorb"]) - 1
					local found = false
					for item = 0, count, 1 do
						local itemname = guiGridListGetItemText(g_itemshopgui["grid_warenkorb"], item, 1)
						if itemname == name then
							local anzahl = guiGridListGetItemText(g_itemshopgui["grid_warenkorb"], item, 2) + 1
							guiGridListSetItemText(g_itemshopgui["grid_warenkorb"], item, g_itemshopgui["grid_wanzahlcolumm"], tostring(anzahl), false, false)
							local preis = connectorsTable[name]["price"]
							local wpreis = tonumber(preis) * tonumber(anzahl)
							guiGridListSetItemText(g_itemshopgui["grid_warenkorb"], item, g_itemshopgui["grid_wpreiscolumm"], wpreis.."$", false, false)
							found = true
							break
						end
					end
					if found == false then
						local row = guiGridListAddRow (g_itemshopgui["grid_warenkorb"])
						guiGridListSetItemText(g_itemshopgui["grid_warenkorb"], row, g_itemshopgui["grid_witemscolumm"], name, false, false)
						guiGridListSetItemText(g_itemshopgui["grid_warenkorb"], row, g_itemshopgui["grid_wanzahlcolumm"], "1", false, false)
						guiGridListSetItemText(g_itemshopgui["grid_warenkorb"], row, g_itemshopgui["grid_wpreiscolumm"], preis, false, false)
						found = true
					end
				end
			end
		end
		
		if source == g_itemshopgui["button_remove"] then
			local item = guiGridListGetSelectedItem(g_itemshopgui["grid_warenkorb"])
			if item >= 0 then
				local name = guiGridListGetItemText(g_itemshopgui["grid_warenkorb"], item, 1)
				local anzahl = guiGridListGetItemText(g_itemshopgui["grid_warenkorb"], item, 2)
				if name and anzahl then
					anzahl = tonumber(anzahl)
					if anzahl == 1 then
						guiGridListRemoveRow(g_itemshopgui["grid_warenkorb"], item)
					elseif anzahl > 1 then
						anzahl = anzahl - 1
						guiGridListSetItemText(g_itemshopgui["grid_warenkorb"], item, g_itemshopgui["grid_wanzahlcolumm"], tostring(anzahl), false, false)
						local preis = connectorsTable[name]["price"]
						local wpreis = tonumber(preis) * tonumber(anzahl)
						guiGridListSetItemText(g_itemshopgui["grid_warenkorb"], item, g_itemshopgui["grid_wpreiscolumm"], wpreis.."$", false, false)
					end
				end						
			end
		end				
		
		if source == g_itemshopgui["button_buy"] then
			local count = guiGridListGetRowCount(g_itemshopgui["grid_warenkorb"])
			if count >= 1 then
				for item = 0, count, 1 do
					local name = guiGridListGetItemText(g_itemshopgui["grid_warenkorb"], item, 1)
					if name and name ~= " " and name ~= "" then
						local anzahl = guiGridListGetItemText(g_itemshopgui["grid_warenkorb"], item, 2)
						local preis = connectorsTable[name]["price"]
						local staticID = connectorsTable[name]["staticID"]
						--server.onPlayerItemShopBuy(tonumber(staticID), tonumber(preis), itemshop, tonumber(anzahl))
						rpcCallServerFunction("onPlayerItemShopBuy", tonumber(staticID), tonumber(preis), itemshop, tonumber(anzahl))
						toggleItemShop(false)
					end
				end
			end
		end
	end
end

function toggleItemShop(toggle, itemshopID)
	initalizeItemShopGUI()
	if toggle then
		guiSetVisible(g_itemshopgui["window"], true)
		showCursor(true)
		addEventHandler("onClientGUIClick", g_itemshopgui["window"], onItemShopGUIHandler)
		itemshop = itemshopID
	else
		resetGridList()
		guiSetVisible(g_itemshopgui["window"], false)
		showCursor(false)
		removeEventHandler("onClientGUIClick", g_itemshopgui["window"], onItemShopGUIHandler)
		itemshop = 0
	end
end

function addShopItem(name, staticID, price)
	initalizeItemShopGUI()
	local row = guiGridListAddRow (g_itemshopgui["grid_items"])
	guiGridListSetItemText(g_itemshopgui["grid_items"], row, g_itemshopgui["grid_itemscolumm"], name, false, false)
	guiGridListSetItemText(g_itemshopgui["grid_items"], row, g_itemshopgui["grid_ipreiscolumm"], price.."$", false, false)
	
	connectorsTable[name] = {}
	connectorsTable[name]["staticID"] = staticID
	connectorsTable[name]["price"] = price
end
