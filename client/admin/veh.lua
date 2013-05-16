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

local adminButtonClicked
local adminVeh
local adminVehElement = {}
local adminVehColor = {}

function adminVehFillList()
	guiGridListClear(g_admingui["tabVehList"])
	if g_admingui["tabVehListColID"] and g_admingui["tabVehListColName"] and g_admingui["tabVehListColTyp"] then
		for i_, veh in ipairs(getElementsByType("vehicle")) do
			local id = getElementData(veh, "ID")			
			if id and id ~= "" and id ~= " " then
				local name = getVehicleName(veh)
				local typ = getVehicleType(veh)
				adminVehElement[id] = veh
				
				rowp = guiGridListAddRow(g_admingui["tabVehList"])
				guiGridListSetItemText(g_admingui["tabVehList"], rowp, g_admingui["tabVehListColID"], tostring(id), false, false)
				guiGridListSetItemText(g_admingui["tabVehList"], rowp, g_admingui["tabVehListColName"], tostring(name), false, false)
				guiGridListSetItemText(g_admingui["tabVehList"], rowp, g_admingui["tabVehListColTyp"], tostring(typ), false, false)
			end
		end
	end
end

function adminVehSearch()
	if source == g_admingui["tabVehSearch"] then
		guiGridListClear(g_admingui["tabVehList"])
		local text = guiGetText(source)
		if text == "" then
			adminVehFillList()
		else
			for id, veh in ipairs(getElementsByType("vehicle")) do
				local id = getElementData(veh, "ID")				
				if id and id ~= "" and id ~= " " then	
					local name = getVehicleName(veh)
					local typ = getVehicleType(veh)
					adminVehElement[id] = veh
					if (string.find(string.upper(tostring(id)),string.upper(text),1,true)) or (string.find(string.upper(tostring(name)),string.upper(text),1,true)) or (string.find(string.upper(tostring(typ)),string.upper(text),1,true)) then
						rowp = guiGridListAddRow(g_admingui["tabVehList"])
						guiGridListSetItemText(g_admingui["tabVehList"], rowp, g_admingui["tabVehListColID"], tostring(id), false, false)
						guiGridListSetItemText(g_admingui["tabVehList"], rowp, g_admingui["tabVehListColName"], tostring(name), false, false)
						guiGridListSetItemText(g_admingui["tabVehList"], rowp, g_admingui["tabVehListColTyp"], tostring(typ), false, false)
					end
				end
			end
		end 
	end
end

function adminVehClickList()
	if source == g_admingui["tabVehList"] then
		local veh = guiGridListGetSelectedItem(g_admingui["tabVehList"])
		if veh then
			local vehID = guiGridListGetItemText(g_admingui["tabVehList"], veh, 1)
			if vehID then
				if vehID ~= " " and vehID ~= "" then
					local veh = adminVehElement[tonumber(vehID)]
					rpcCallServerFunction("adminGetVehInfo", veh)
				end
			end
		end
	end
end

function adminFillVehInfo(id, owner, name, temp, health, tank, km, prop, posx, posy, posz)
	guiSetText (g_admingui["tabVehID"], tostring(id))
	guiSetText (g_admingui["tabVehName"], tostring(name))
	guiSetText (g_admingui["tabVehHealth"], tostring(math.floor(health/10)).."%")
	guiSetText (g_admingui["tabVehKM"], tostring(km).." km")
	guiSetText (g_admingui["tabVehOwner"], tostring(owner))
	guiSetText (g_admingui["tabVehTemp"], tostring(temp))
	guiSetText (g_admingui["tabVehTank"], tostring(math.floor(tank)).." l")
	guiSetText (g_admingui["tabVehProp"], tostring(prop))
	guiSetText (g_admingui["tabVehPos"], "X = "..tostring(posx).."\nY = "..tostring(posy).."\nZ = "..tostring(posz))
end

function adminVehClickButton(button, state)
	local veh = guiGridListGetSelectedItem(g_admingui["tabVehList"])
	if veh then
		local vehID = guiGridListGetItemText(g_admingui["tabVehList"], veh, 1)
		if vehID then
			if vehID ~= " " and vehID ~= "" then
				adminVeh = adminVehElement[tonumber(vehID)]
				if source == g_admingui["tabVehButtonLock"] then
					initalizeAdminGuiConfirm2()
					addEventHandler("onClientGUIClick", g_admingui["windowConfirm2"], adminVehClickButtonConfirm)
					guiSetVisible(g_admingui["windowConfirm2"], true)
					guiSetVisible(g_admingui["window"], false)
					guiSetText(g_admingui["confirm2Text"], "Möchtest du das Fahrzeug wirklich zuschließen?")
					adminButtonClicked = "Lock"
				elseif source == g_admingui["tabVehButtonUnlock"] then
					initalizeAdminGuiConfirm2()
					addEventHandler("onClientGUIClick", g_admingui["windowConfirm2"], adminVehClickButtonConfirm)
					guiSetVisible(g_admingui["windowConfirm2"], true)
					guiSetVisible(g_admingui["window"], false)
					guiSetText(g_admingui["confirm2Text"], "Möchtest du das Fahrzeug wirklich aufschließen?")
					adminButtonClicked = "Unlock"
				elseif source == g_admingui["tabVehButtonProp"] then
					initalizeAdminGuiConfirm5()
					addEventHandler("onClientGUIClick", g_admingui["windowConfirm5"], adminVehClickButtonConfirm)
					addEventHandler("onClientGUIComboBoxAccepted", g_admingui["windowConfirm5"], adminVehPropChange)
					guiSetVisible(g_admingui["windowConfirm5"], true)
					guiSetVisible(g_admingui["window"], false)
					adminButtonClicked = "Prop"
				elseif source == g_admingui["tabVehButtonRep"] then
					initalizeAdminGuiConfirm2()
					addEventHandler("onClientGUIClick", g_admingui["windowConfirm2"], adminVehClickButtonConfirm)
					guiSetVisible(g_admingui["windowConfirm2"], true)
					guiSetVisible(g_admingui["window"], false)
					guiSetText(g_admingui["confirm2Text"], "Möchtest du das Fahrzeug wirklich reparieren?")
					adminButtonClicked = "Repair"
				elseif source == g_admingui["tabVehButtonCol"] then
					initalizeAdminGuiConfirm6()
					addEventHandler("onClientGUIClick", g_admingui["windowConfirm6"], adminVehClickButtonConfirm)
					addEventHandler("onClientGUIChanged", g_admingui["windowConfirm6"], adminVehColorChange)
					local r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4 = getVehicleColor (adminVeh,true)
					guiSetText(g_admingui["windowConfirm6Col1R"],tostring(r1))		
					guiSetText(g_admingui["windowConfirm6Col1G"],tostring(g1))
					guiSetText(g_admingui["windowConfirm6Col1B"],tostring(b1))
					guiSetText(g_admingui["windowConfirm6Col2R"],tostring(r1))
					guiSetText(g_admingui["windowConfirm6Col2G"],tostring(g2))
					guiSetText(g_admingui["windowConfirm6Col2B"],tostring(b2))
					guiSetVisible(g_admingui["windowConfirm6"], true)
					guiSetVisible(g_admingui["window"], false)
					adminButtonClicked = "Color"
				elseif source == g_admingui["tabVehButtonDelete"] then
					initalizeAdminGuiConfirm2()
					addEventHandler("onClientGUIClick", g_admingui["windowConfirm2"], adminVehClickButtonConfirm)
					guiSetVisible(g_admingui["windowConfirm2"], true)
					guiSetVisible(g_admingui["window"], false)
					guiSetText(g_admingui["confirm2Text"], "Möchtest du das Fahrzeug wirklich löschen?")
					adminButtonClicked = "Delete"
				end
			end
		end
	end
	if source == g_admingui["tabVehButtonCreate"] then
		initalizeAdminGuiConfirm7()
		addEventHandler("onClientGUIClick", g_admingui["windowConfirm7"], adminVehClickButtonConfirm)
		addEventHandler("onClientGUIChanged", g_admingui["confirm7Car"], adminVehCreateChange)
		guiSetVisible(g_admingui["windowConfirm7"], true)
		guiSetVisible(g_admingui["window"], false)
		adminButtonClicked = "Create"
	end
end

function adminVehClickButtonConfirm(button, state)
	if source == g_admingui["confirm2ButtonYes"] then
		rpcCallServerFunction("adminVehFunction", adminVeh, adminButtonClicked)
		removeEventHandler("onClientGUIClick", g_admingui["windowConfirm2"], adminVehClickButtonConfirm)
		guiSetVisible(g_admingui["windowConfirm2"], false)
		guiSetVisible(g_admingui["window"], true)
	elseif source == g_admingui["confirm2ButtonNo"] then
		removeEventHandler("onClientGUIClick", g_admingui["windowConfirm2"], adminVehClickButtonConfirm)
		guiSetVisible(g_admingui["windowConfirm2"], false)
		guiSetVisible(g_admingui["window"], true)
	elseif source == g_admingui["confirm5ButtonYes"] then
		local prop = guiComboBoxGetItemText (g_admingui["confirm5Prop"], guiComboBoxGetSelected (g_admingui["confirm5Prop"]))
		rpcCallServerFunction("adminVehFunction", adminVeh, adminButtonClicked, prop)
		removeEventHandler("onClientGUIClick", g_admingui["windowConfirm5"], adminVehClickButtonConfirm)
		removeEventHandler("onClientGUIComboBoxAccepted", g_admingui["windowConfirm5"], adminVehPropChange)
		guiSetVisible(g_admingui["windowConfirm5"], false)
		guiSetVisible(g_admingui["window"], true)
		guiSetEnabled(g_admingui["confirm5ButtonYes"], false)
	elseif source == g_admingui["confirm5ButtonNo"] then
		removeEventHandler("onClientGUIClick", g_admingui["windowConfirm5"], adminVehClickButtonConfirm)
		removeEventHandler("onClientGUIComboBoxAccepted", g_admingui["windowConfirm5"], adminVehPropChange)
		guiSetVisible(g_admingui["windowConfirm5"], false)
		guiSetVisible(g_admingui["window"], true)
		guiSetEnabled(g_admingui["confirm5ButtonYes"], false)
	elseif source == g_admingui["confirm6ButtonYes"] then
		local r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4 = adminVehColor["r1"], adminVehColor["g1"], adminVehColor["b1"], adminVehColor["r2"], adminVehColor["g2"], adminVehColor["b2"], adminVehColor["r3"], adminVehColor["g3"], adminVehColor["b3"], adminVehColor["r4"], adminVehColor["g4"], adminVehColor["b4"]
		rpcCallServerFunction("adminVehFunction", adminVeh, adminButtonClicked, nil, nil, nil, r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4)
		removeEventHandler("onClientGUIClick", g_admingui["windowConfirm6"], adminVehClickButtonConfirm)
		removeEventHandler("onClientGUIChanged", g_admingui["windowConfirm6"], adminVehColorChange)
		guiSetVisible(g_admingui["windowConfirm6"], false)
		guiSetVisible(g_admingui["window"], true)
		guiSetEnabled(g_admingui["confirm6ButtonYes"], false)
	elseif source == g_admingui["confirm6ButtonNo"] then
		removeEventHandler("onClientGUIClick", g_admingui["windowConfirm6"], adminVehClickButtonConfirm)
		removeEventHandler("onClientGUIChanged", g_admingui["windowConfirm6"], adminVehColorChange)
		guiSetVisible(g_admingui["windowConfirm6"], false)
		guiSetVisible(g_admingui["window"], true)
		guiSetEnabled(g_admingui["confirm6ButtonYes"], false)
	elseif source == g_admingui["confirm7ButtonYes"] then
		local model = guiGetText(g_admingui["confirm7Car"])
		if getVehicleModelFromName(model) then
			rpcCallServerFunction("adminVehFunction", adminVeh, adminButtonClicked, nil, getVehicleModelFromName(model), guiCheckBoxGetSelected(g_admingui["confirm7Temp"]))
		elseif tonumber(model) ~= nil then
			model = tonumber(model)
			if model >= 401 and model <= 612 then
				rpcCallServerFunction("adminVehFunction", adminVeh, adminButtonClicked, nil, model, guiCheckBoxGetSelected(g_admingui["confirm7Temp"]))
			end
		end
		removeEventHandler("onClientGUIClick", g_admingui["windowConfirm7"], adminVehClickButtonConfirm)
		removeEventHandler("onClientGUIChanged", g_admingui["confirm7Car"], adminVehCreateChange)
		guiCheckBoxSetSelected(g_admingui["confirm7Temp"], false)
		guiSetVisible(g_admingui["windowConfirm7"], false)
		guiSetVisible(g_admingui["window"], true)
		guiSetEnabled(g_admingui["confirm7ButtonYes"], false)
		guiSetText(g_admingui["confirm7Car"], "")
	elseif source == g_admingui["confirm7ButtonNo"] then
		removeEventHandler("onClientGUIClick", g_admingui["windowConfirm7"], adminVehClickButtonConfirm)
		removeEventHandler("onClientGUIChanged", g_admingui["confirm7Car"], adminVehCreateChange)
		guiCheckBoxSetSelected(g_admingui["confirm7Temp"], false)
		guiSetVisible(g_admingui["windowConfirm7"], false)
		guiSetVisible(g_admingui["window"], true)
		guiSetEnabled(g_admingui["confirm7ButtonYes"], false)
		guiSetText(g_admingui["confirm7Car"], "")
	end
end

function adminVehPropChange()
	if source == g_admingui["confirm5Prop"] then
		local prop = guiComboBoxGetSelected (g_admingui["confirm5Prop"])
		if prop then
			if prop ~= -1 then
				guiSetEnabled(g_admingui["confirm5ButtonYes"], true)
			else
				guiSetEnabled(g_admingui["confirm5ButtonYes"], false)
			end
		end
	end
end

function adminVehColorChange()
	local adminVehColorCheck = false
	if source == g_admingui["windowConfirm6Col1R"] then
		local r1 = guiGetText(g_admingui["windowConfirm6Col1R"])
		if string.len(r1) > 0 then
			if tonumber(r1) <= 255 then
				adminVehColorCheck = true
			else
				adminVehColorCheck = false			
			end
		end	
	elseif source == g_admingui["windowConfirm6Col1G"] then
		local g1 = guiGetText(g_admingui["windowConfirm6Col1R"])
		if string.len(g1) > 0 then
			if tonumber(g1) <= 255 then
				adminVehColorCheck = true
			else
				adminVehColorCheck = false	
			end
		end	
	elseif source == g_admingui["windowConfirm6Col1B"] then
		local b1 = guiGetText(g_admingui["windowConfirm6Col1R"])
		if string.len(b1) > 0 then
			if tonumber(b1) <= 255 then
				adminVehColorCheck = true
			else
				adminVehColorCheck = false	
			end
		end
	elseif source == g_admingui["windowConfirm6Col2R"] then
		local r2 = guiGetText(g_admingui["windowConfirm6Col1R"])
		if string.len(r2) > 0 then
			if tonumber(r2) <= 255 then
				adminVehColorCheck = true
			else
				adminVehColorCheck = false	
			end
		end
	elseif source == g_admingui["windowConfirm6Col2G"] then
		local g2 = guiGetText(g_admingui["windowConfirm6Col1R"])
		if string.len(g2) > 0 then
			if tonumber(g2) <= 255 then
				adminVehColorCheck = true
			else
				adminVehColorCheck = false	
			end
		end
	elseif source == g_admingui["windowConfirm6Col2B"] then
		local b2 = guiGetText(g_admingui["windowConfirm6Col1R"])
		if string.len(b2) > 0 then
			if tonumber(b2) <= 255 then
				adminVehColorCheck = true
			else
				adminVehColorCheck = false	
			end
		end
	end
	if adminVehColorCheck == true then
		guiSetEnabled(g_admingui["confirm6ButtonYes"], true)
		local r1 = guiGetText(g_admingui["windowConfirm6Col1R"])
		local g1 = guiGetText(g_admingui["windowConfirm6Col1G"])
		local b1 = guiGetText(g_admingui["windowConfirm6Col1B"])
		local r2 = guiGetText(g_admingui["windowConfirm6Col2R"])
		local g2 = guiGetText(g_admingui["windowConfirm6Col2G"])
		local b2 = guiGetText(g_admingui["windowConfirm6Col2B"])
		adminVehColor["r1"], adminVehColor["g1"], adminVehColor["b1"], adminVehColor["r2"], adminVehColor["g2"], adminVehColor["b2"], adminVehColor["r3"], adminVehColor["g3"], adminVehColor["b3"], adminVehColor["r4"], adminVehColor["g4"], adminVehColor["b4"] = r1,g1,b1,r2,g2,b2,r1,g1,b1,r2,g2,b2
	else
		guiSetEnabled(g_admingui["confirm6ButtonYes"], false)
	end
end

function adminVehCreateChange()
	if source == g_admingui["confirm7Car"] then
		local model = guiGetText(g_admingui["confirm7Car"])
		if getVehicleModelFromName(model) then
			guiSetEnabled(g_admingui["confirm7ButtonYes"], true)
		elseif tonumber(model) ~= nil then
			model = tonumber(model)
			if model >= 401 and model <= 612 then
				if getVehicleNameFromModel(model) then
					guiSetEnabled(g_admingui["confirm7ButtonYes"], true)
				else
					guiSetEnabled(g_admingui["confirm7ButtonYes"], false)
				end
			else
				guiSetEnabled(g_admingui["confirm7ButtonYes"], false)
			end
		else
			guiSetEnabled(g_admingui["confirm7ButtonYes"], false)
		end
	end
end
