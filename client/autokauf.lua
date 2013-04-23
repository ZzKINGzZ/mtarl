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



local rowp
local carID
local carText = {}
local carID = {}
local carShop
local carSeller
local carPrice

function startCarInfoList(toggle, shop)
	initalizeAutokaufGUI()
	if toggle == true then
		guiSetVisible(g_carsale["window_price"], true)
		showCursor(true)
		addEventHandler("onClientGUIClick", g_carsale["price_close"], startCarInfoList, false)
        addEventHandler("onClientGUIClick", g_carsale["price_buy"], carShopHandler)
		addEventHandler("onClientGUIClick", g_carsale["price_list"], changeCarInfoText)
		CarPriceList = 1
		carShop = shop
	else 
		guiSetVisible(g_carsale["window_price"], false)
		showCursor(false)
		removeEventHandler("onClientGUIClick", g_carsale["price_close"], startCarInfoList)
		removeEventHandler("onClientGUIClick", g_carsale["price_buy"], carShopHandler)
		removeEventHandler("onClientGUIClick", g_carsale["price_list"], changeCarInfoText)
		CarPriceList = 0
		guiGridListClear(g_carsale["price_list"])
	end
end

function carShopHandler(button, state)
	if button == "left" then
		--getSelectedCar
		if source == g_carsale["price_buy"] then
			local itemcar = guiGridListGetSelectedItem(g_carsale["price_list"])
			if itemcar then
				local car = guiGridListGetItemText(g_carsale["price_list"], itemcar, 1)
				local carid = carID[car]
				if car then
					startCarInfoList(false)
					rpcCallServerFunction("carsaleserver", carid, carShop)
				end
			end
		end	
	end	
end


function fillCarInfoList(car, text, id)
	local row = guiGridListAddRow (g_carsale["price_list"])
	guiGridListSetItemText(g_carsale["price_list"], row, g_carsale["price_car"], car, false, false)
	carText[car] = text 
	carID[car] = id
end

function changeCarInfoText()
	local itemcar = guiGridListGetSelectedItem(g_carsale["price_list"])
	if itemcar then
		local car = guiGridListGetItemText(g_carsale["price_list"], itemcar, 1)
		local carInfo = carText[car]
		if carInfo then
			guiSetText(g_carsale["price_memo"], carInfo)
		end
	end
end
