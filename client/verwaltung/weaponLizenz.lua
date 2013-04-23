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



function initalizeWeaponLizenz(toggle, number)
	initalizeWeaponLizenzGUI()
	if toggle == true then
		if number == 1 then
			guiSetEnabled(g_lizenz["class1"], false)
		elseif number == 10 then
			guiSetEnabled(g_lizenz["class2"], false)
		elseif number == 100 then
			guiSetEnabled(g_lizenz["class3"], false)
		elseif number == 101 then
			guiSetEnabled(g_lizenz["class1"], false)
			guiSetEnabled(g_lizenz["class3"], false)
		elseif number == 110 then
			guiSetEnabled(g_lizenz["class2"], false)
			guiSetEnabled(g_lizenz["class3"], false)
		elseif number == 111 then
			guiSetEnabled(g_lizenz["class1"], false)
			guiSetEnabled(g_lizenz["class2"], false)
			guiSetEnabled(g_lizenz["class3"], false)
		elseif number == 11 then
			guiSetEnabled(g_lizenz["class1"], false)
			guiSetEnabled(g_lizenz["class2"], false)
		end
		guiSetVisible(g_lizenz["window"], true)
		showCursor(true)
		addEventHandler("onClientGUIClick", g_lizenz["window"], WeaponLizenzHandler)
	else 
		guiSetVisible(g_lizenz["window"], false)
		showCursor(false)
		removeEventHandler("onClientGUIClick", g_lizenz["window"], WeaponLizenzHandler)
		guiSetEnabled(g_lizenz["class1"], true)
		guiSetEnabled(g_lizenz["class2"], true)
		guiSetEnabled(g_lizenz["class3"], true)
	end
end

function WeaponLizenzHandler(button)
	if button == "left" then
		--Button Abbrechen
		if source == g_lizenz["abbrechen"] then
			initalizeWeaponLizenz(false)
			return
		end
		--Button 1
		if source == g_lizenz["class1"] then
			local class = 1
			--server.setWeaponLizenz(class)
			rpcCallServerFunction("setWeaponLizenz", class)
			initalizeWeaponLizenz(false)
			return
		end
		--Button 2
		if source == g_lizenz["class2"] then
			local class = 2
			--server.setWeaponLizenz(class)
			rpcCallServerFunction("setWeaponLizenz", class)
			initalizeWeaponLizenz(false)
			return
		end
		--Button 3
		if source == g_lizenz["class3"] then
			local class = 3
			--server.setWeaponLizenz(class)
			rpcCallServerFunction("setWeaponLizenz", class)
			initalizeWeaponLizenz(false)
			return
		end
	end
end
