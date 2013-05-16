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



local WeaponGridList = 0
local rowWeapon
local class = 1
local weapons

function startWeaponSaleClient(toggle, number)
	initalizeWeaponShopGUI()
	if toggle == true then
		local number = tonumber(number)
		if number == 1 then
			guiSetEnabled(g_weaponshop["class1"], true)
		elseif number == 10 then
			guiSetEnabled(g_weaponshop["class2"], true)
		elseif number == 100 then
			guiSetEnabled(g_weaponshop["class3"], true)
		elseif number == 101 then
			guiSetEnabled(g_weaponshop["class1"], true)
			guiSetEnabled(g_weaponshop["class3"], true)
		elseif number == 110 then
			guiSetEnabled(g_weaponshop["class2"], true)
			guiSetEnabled(g_weaponshop["class3"], true)
		elseif number == 111 then
			guiSetEnabled(g_weaponshop["class1"], true)
			guiSetEnabled(g_weaponshop["class2"], true)
			guiSetEnabled(g_weaponshop["class3"], true)
		elseif number == 11 then
			guiSetEnabled(g_weaponshop["class1"], true)
			guiSetEnabled(g_weaponshop["class2"], true)
		end
		if number > 0 then
			weapons = true
			guiSetEnabled(g_weaponshop["buy"], true)
		end
		guiSetVisible(g_weaponshop["window"], true)
		showCursor(true)
		addEventHandler("onClientGUIClick", g_weaponshop["window"], WeaponShopButtonHandler)
		server.getWeaponsforCategory(1)
		WeaponGridList = 1
	else 
		guiSetVisible(g_weaponshop["window"], false)
		showCursor(false)
		removeEventHandler("onClientGUIClick", g_weaponshop["window"], WeaponShopButtonHandler)
		WeaponGridList = 0
		guiGridListClear(g_weaponshop["grid"])
		class = 1
	end
end

function fillWeaponGridList(weapon,id, preis)
	if weapons == true then
		if WeaponGridList == 1 then
			rowWeapon = guiGridListAddRow (g_weaponshop["grid"])
			guiGridListSetItemText(g_weaponshop["grid"], rowWeapon, g_weaponshop["gridWeapon"], weapon, false, false)
			guiGridListSetItemText(g_weaponshop["grid"], rowWeapon, g_weaponshop["gridPrice"], preis.."$", false, false)
		end
	end
end

function WeaponShopButtonHandler(button)
	if button == "left" then
		--Abbrechen
		if source == g_weaponshop["abbrechen"] then
			startWeaponSaleClient(false)
			return
		end
		--Class1
		if source == g_weaponshop["class1"] then
			if class ~= 1 then
				class = 1
				guiGridListClear(g_weaponshop["grid"])
				--server.getWeaponsforCategory(1)
				rpcCallServerFunction("getWeaponsforCategory", 1)
			end
		end	
		--Class2
		if source == g_weaponshop["class2"] then
			if class ~= 2 then
				class = 2
				guiGridListClear(g_weaponshop["grid"])
				--server.getWeaponsforCategory(2)
				rpcCallServerFunction("getWeaponsforCategory", 2)
			end
		end
		--Class3
		if source == g_weaponshop["class3"] then
			if class ~= 3 then
				class = 3
				guiGridListClear(g_weaponshop["grid"])
				--server.getWeaponsforCategory(3)
				rpcCallServerFunction("getWeaponsforCategory", 3)
			end
		end
		if source == g_weaponshop["buy"] then
			local item = guiGridListGetSelectedItem(g_weaponshop["grid"])
			if item then
				local weaponname = guiGridListGetItemText(g_weaponshop["grid"], item, 1)
				weaponname = tostring(weaponname)
				if weaponname then
					startWeaponSaleClient(false)
					--server.createWeapon(weaponname)
					rpcCallServerFunction("createWeapon", weaponname)
				else
					outputChatBox ( "Du musst eine Waffe zum Kauf auswählen!", 255, 0, 0)
				end
			end
		end
	end
end
