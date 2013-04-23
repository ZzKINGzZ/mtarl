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



local TuningCenter = nil
local toggle_drawPaintjob = 0
local toggle_drawGPS = 0
local toggle_drawSicherheit = 0
local cam_visible = 0
local preis = 0
local paintjob_visible = 0
local paintjobPreis = 0
local color_visible = 0
local colorPreis = 0
local licht_visible = 0
local lichtPreis = 0
local gps_visible = 0
local gpsPreis = 0
local tacho_visible = 0
local tachoPreis = 0
local tachoPreisfalse
local tacho = 1
local teile_visible = 0
local tunings = 0
local tuningList = {}
local oldVehicleSettings = {}
local safty_visible = 0
local carSafty
local priceX, priceY = 0, 0
local x, y =  guiGetScreenSize()

function startTuningClient(toggle, paintjob, safty)
	initalizeTuningGUI()
	if toggle == "LV" then
		setCameraMatrix ( 2382.6796875, 1055.0986328125, 10.8203125+2, 2386.720703125, 1050.802734375, 9.8203125)
		TuningCenter = "LV"
	end
	
	if toggle == "SF" then
		setCameraMatrix ( -1940.4921875, 250.515625, 34.4609375+2, -1936.8125, 247.1923828125, 33.4609375)
		TuningCenter = "SF"
	end
	
	if toggle == "LS" then
		setCameraMatrix ( 1038.68359375, -1013.3203125, 32.107528686523+2, 1041.6650390625, -1017.8232421875, 31.107528686523)
		TuningCenter = "LS"
	end
	
	if toggle == "boot" then
		setCameraMatrix ( -2268.326171875, 2448.2978515625, 0+1, -2281.6572265625, 2449.2001953125, 0)
		TuningCenter = "boat"
	end
	
	if toggle == "flug" then
		setCameraMatrix ( 1274.904296875, 1316.7890625, 10.8203125+2, 1279.93359375, 1324.0634765625, 11.280610084534)
		TuningCenter = "flug"
	end
	guiSetVisible(g_tuning["window_strg"], true)
	showCursor(true)
	addEventHandler("onClientGUIClick", g_tuning["window_strg"], TuningsSteuerung)
	local x, y = guiGetPosition(g_tuning["window_strg"], false)
	local w, h = guiGetSize(g_tuning["window_strg"], false)
	priceX, priceY = x , y + h + 1
	addEventHandler("onClientRender",getRootElement(), drawPreis)
	carpaintjob = paintjob
	carSafty = safty
	if safty == 10 then	
		guiSetEnabled(g_tuning["button_safty_up"], false)
		guiSetEnabled(g_tuning["button_safty_down"], false)
	else
		guiSetEnabled(g_tuning["button_safty_down"], false)
	end
	guiSetText(g_tuning["label_safty"], tostring(safty))
	guiSetText(g_tuning["label_safty_current"], tostring(safty))
	guiSetText(g_tuning["label_safty_add"], "+0")
	toggleHudModus()
	preis = 0
	
	local vehicle = getPedOccupiedVehicle(getLocalPlayer())
	oldVehicleSettings["color"] = {}
	oldVehicleSettings["color"]["r1"], oldVehicleSettings["color"]["g1"], oldVehicleSettings["color"]["b1"], oldVehicleSettings["color"]["r2"], oldVehicleSettings["color"]["g2"], oldVehicleSettings["color"]["b2"], oldVehicleSettings["color"]["r3"], oldVehicleSettings["color"]["g3"], oldVehicleSettings["color"]["b3"], oldVehicleSettings["color"]["r4"], oldVehicleSettings["color"]["g4"],  oldVehicleSettings["color"]["b4"] = getVehicleColor(vehicle,true)
	oldVehicleSettings["lightcolor"] = {}
	oldVehicleSettings["lightcolor"]["r"], oldVehicleSettings["lightcolor"]["g"], oldVehicleSettings["lightcolor"]["b"] = getVehicleHeadLightColor (vehicle)
	if carpaintjob == true then
		oldVehicleSettings["paintjob"] = getVehiclePaintjob(vehicle)
	end
	
	if toggle == "boot" or toggle == "flug" then
		guiSetEnabled(g_tuning["teile"], false)
	else
		guiSetEnabled(g_tuning["teile"], true)
	end
end

function stopTuningClient()
	local client = getLocalPlayer()
	local clientCar = getPedOccupiedVehicle(client)
	guiSetVisible(g_tuning["window_cam"], false)
	guiSetVisible(g_tuning["window_strg"], false)
	guiSetVisible(g_tuning["window_paintjob"], false)
	guiSetVisible(g_tuning["window_farbe"], false)
	guiSetVisible(g_tuning["window_licht"], false)
	guiSetVisible(g_tuning["window_gps"], false)
	guiSetVisible(g_tuning["window_tacho"], false)
	guiSetVisible(g_tuning["window_teile"], false)
	guiSetVisible(g_tuning["window_safty"], false)
	showCursor(false)
	removeEventHandler("onClientGUIDoubleClick", g_tuning["window_teile"], TuningTeile)
	removeEventHandler("onClientGUIClick", g_tuning["window_strg"], TuningsSteuerung)
	removeEventHandler("onClientRender", getRootElement(), drawPreis)
	removeEventHandler("onClientGUIClick", g_tuning["window_tacho"], TuningTacho)
	removeEventHandler("onClientGUIClick", g_tuning["window_gps"], TuningGPS)
	removeEventHandler("onClientGUIClick", g_tuning["window_cam"], TuningCam)
	removeEventHandler("onClientGUIScroll", g_tuning["window_licht"], TuningLightCol)
	removeEventHandler("onClientGUIClick", g_tuning["window_safty"], TuningSafty)
	guiGridListClear(g_tuning["grid_teile"])
	setCameraTarget(client, client)
	toggleHudModus()
	setElementFrozen(clientCar, false)
	startSpeedo()
	cam_visible = 0
	paintjob_visible = 0
	paintjobPreis = 0
	color_visible = 0
	colorPreis = 0
	licht_visible = 0
	lichtPreis = 0
	gps_visible = 0
	gpsPreis = 0
	tacho_visible = 0
	tachoPreis = 0
	teile_visible = 0
	tunings = 0
	safty_visible = 0
	carSafty = nil
	--server.setTuningGarageOpen(TuningCenter)
	rpcCallServerFunction("setTuningGarageOpen", TuningCenter)
	TuningCenter = nil
	tuningList = nil
	tuningList = {}
	oldVehicleSettings = nil
	oldVehicleSettings = {}
end

function TuningsSteuerung(button)
	if button == "left" then
		--Button Abbrechen
		if source == g_tuning["abbrechen"] then
			local vehicle = getPedOccupiedVehicle(getLocalPlayer())
			for i, upgrade in ipairs(tuningList) do
				removeVehicleUpgrade(vehicle, upgrade)
			end	
			setVehicleColor(vehicle,oldVehicleSettings["color"]["r1"], oldVehicleSettings["color"]["g1"], oldVehicleSettings["color"]["b1"], oldVehicleSettings["color"]["r2"], oldVehicleSettings["color"]["g2"], oldVehicleSettings["color"]["b2"], oldVehicleSettings["color"]["r3"], oldVehicleSettings["color"]["g3"], oldVehicleSettings["color"]["b3"], oldVehicleSettings["color"]["r4"], oldVehicleSettings["color"]["g4"], oldVehicleSettings["color"]["b4"])
			setVehicleHeadLightColor(vehicle,oldVehicleSettings["lightcolor"]["r"], oldVehicleSettings["lightcolor"]["g"], oldVehicleSettings["lightcolor"]["b"])
			if carpaintjob == true then
				setVehiclePaintjob(vehicle,oldVehicleSettings["paintjob"])
			end
			stopTuningClient()
		end
		--Button Annehmen
		if source == g_tuning["annehmen"] then
			local veh = getPedOccupiedVehicle(getLocalPlayer())
			outputChatBox("Du hast f"..uuml.."r das Tuning deines Fahrzeuges "..preis.."$ bezahlt.", 0, 20, 200)
			--server.takeTuningMoney(preis)
			rpcCallServerFunction("takeTuningMoney", preis)
			if paintjobPreis == 1 then
				local paintjob = getVehiclePaintjob ( veh )
				--server.setPaintjob(paintjob)
				rpcCallServerFunction("setPaintjob", paintjob)
			end
			if colorPreis == 1 then
				local r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4 = getVehicleColor (veh, true)
				rpcCallServerFunction("setCarColor", r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4)
			end
			if lichtPreis == 1 then
				local col_rot, col_gruen, col_blau = getVehicleHeadLightColor ( veh )
				rpcCallServerFunction("setLightColor", col_rot, col_gruen, col_blau)
			end
			if gpsPreis == 1 then
				--server.setGPS()
				rpcCallServerFunction("setGPS")
			end
			if tachoPreis == 1 then
				local tachocolor = getElementData(veh, "tacho")
				--server.setTacho(tachocolor)
				rpcCallServerFunction("setTacho", tachocolor)
			end
			if tunings == 1 then
				--server.setVehicleTuning(veh)
				for i, upgrade in ipairs(getVehicleUpgrades(veh)) do
					removeVehicleUpgrade(veh, upgrade)
					--server.addVehicleTuning(veh, upgrade)
					rpcCallServerFunction("addVehicleTuning", veh, upgrade)
				end			
				tuningList = nil
				tuningList = {}
			end
			local class = tonumber(guiGetText(g_tuning["label_safty_current"]))
			--server.setSecurityClass(class)
			rpcCallServerFunction("setSecurityClass", class)
			stopTuningClient(preis)
			playSoundFrontEnd (46)
		end
		--Button Kamera
		if source == g_tuning["cam"] then
			if cam_visible == 0 then
				addEventHandler("onClientGUIClick", g_tuning["window_cam"], TuningCam)
				guiSetVisible(g_tuning["window_cam"], true)
				cam_visible = 1
			else
				removeEventHandler("onClientGUIClick", g_tuning["window_cam"], TuningCam)
				guiSetVisible(g_tuning["window_cam"], false)
				cam_visible = 0
			end
			
		end
		--Button Paintjob
		if source == g_tuning["paintjob"] then
			if paintjob_visible == 0 then
				if carpaintjob == true then
					addEventHandler("onClientGUIClick", g_tuning["window_paintjob"], TuningPaintjob)
					guiSetVisible(g_tuning["window_paintjob"], true)
					paintjob_visible = 1
				end
				if carpaintjob == false then
					toggleTextPaintjob()
				end
			else
				removeEventHandler("onClientGUIClick", g_tuning["window_paintjob"], TuningPaintjob)
				guiSetVisible(g_tuning["window_paintjob"], false)
				paintjob_visible = 0
			end
		end
		--Button Vehiclecolor
		if source == g_tuning["farbe"] then
			if color_visible == 0 then
				local col1, col2 = getVehicleColor(getPedOccupiedVehicle(getLocalPlayer()))
				guiSetText (g_tuning["color1"], col1)
				guiSetText (g_tuning["color2"], col2)
				addEventHandler("onClientGUIChanged", g_tuning["window_farbe"], TuningCarColor)
				guiSetVisible(g_tuning["window_farbe"], true)
				color_visible = 1		
			else
				removeEventHandler("onClientGUIChanged", g_tuning["window_farbe"], TuningCarColor)
				guiSetVisible(g_tuning["window_farbe"], false)
				color_visible = 0
			end
		end
		--Button Vehiclelightcolor
		if source == g_tuning["licht"] then
			if licht_visible == 0 then
				local lcol1, lcol2, lcol3 = getVehicleHeadLightColor(getPedOccupiedVehicle(getLocalPlayer()))
				guiScrollBarSetScrollPosition(g_tuning["rot"], (100/255)*lcol1)
				guiScrollBarSetScrollPosition(g_tuning["gruen"], (100/255)*lcol2)
				guiScrollBarSetScrollPosition(g_tuning["blau"], (100/255)*lcol3)
				addEventHandler("onClientGUIScroll", g_tuning["window_licht"], TuningLightCol)
				guiSetVisible(g_tuning["window_licht"], true)
				licht_visible = 1
			else
				removeEventHandler("onClientGUIScroll", g_tuning["window_licht"], TuningLightCol)
				guiSetVisible(g_tuning["window_licht"], false)
				licht_visible = 0
			end
		end
		--Button GPS
		if source == g_tuning["gps"] then
			if gps_visible == 0 then
				local vehicle = getPedOccupiedVehicle(getLocalPlayer())
				if getElementData(vehicle, "gps") == false then
					addEventHandler("onClientGUIClick", g_tuning["window_gps"], TuningGPS)
					guiSetVisible(g_tuning["window_gps"], true)
					gps_visible = 1
				end
				if getElementData(vehicle, "gps") == true then
					toggleTextGPS()
				end
			else
				removeEventHandler("onClientGUIClick", g_tuning["window_gps"], TuningGPS)
				guiSetVisible(g_tuning["window_gps"], false)
				gps_visible = 0
			end
		end
		--Button Sicherheit
		if source == g_tuning["sicherheit"] then
			if safty_visible == 0 then
				addEventHandler("onClientGUIClick", g_tuning["window_safty"], TuningSafty)
				guiSetVisible(g_tuning["window_safty"], true)
				safty_visible = 1
			else
				removeEventHandler("onClientGUIClick", g_tuning["window_safty"], TuningSafty)
				guiSetVisible(g_tuning["window_safty"], false)
				safty_visible = 0
			end
		end
		--Button Tacho
		if source == g_tuning["tacho"] then
			if tacho_visible == 0 then
				addEventHandler("onClientGUIClick", g_tuning["window_tacho"], TuningTacho)
				guiSetVisible(g_tuning["window_tacho"], true)
				local vehicle = getPedOccupiedVehicle(getLocalPlayer())
				local oldtacho = getElementData(vehicle, "tacho")
				if not oldtacho then
					tacho = 1
					tachoPreisfalse = nil
				elseif oldtacho == "green" then
					tacho = 2
					tachoPreisfalse = "green"
				elseif oldtacho == "red" then
					tacho = 3
					tachoPreisfalse = "red"
				elseif oldtacho == "blue" then
					tacho = 4
					tachoPreisfalse = "blue"
				end
				changeTacho()
				tacho_visible = 1
			else
				removeEventHandler("onClientGUIClick", g_tuning["window_tacho"], TuningTacho)
				guiSetVisible(g_tuning["window_tacho"], false)
				guiSetVisible(g_tuning["img_tank"], false)
				guiSetVisible(g_tuning["img_tacho"], false)
				guiSetVisible(g_tuning["img_tank_green"], false)
				guiSetVisible(g_tuning["img_tacho_green"], false)
				guiSetVisible(g_tuning["img_tank_red"], false)
				guiSetVisible(g_tuning["img_tacho_red"], false)
				guiSetVisible(g_tuning["img_tank_blue"], false)
				guiSetVisible(g_tuning["img_tacho_blue"], false)
				tacho_visible = 0
			end
		end
		--Button Teile
		if source == g_tuning["teile"] then
			if teile_visible == 0 then
				addEventHandler("onClientGUIDoubleClick", g_tuning["window_teile"], TuningTeile)
				guiSetVisible(g_tuning["window_teile"], true)
				--g_tuning["column_teile"]
				local vehicle = getPedOccupiedVehicle(getLocalPlayer())
				local tunings = getVehicleCompatibleUpgrades(vehicle)
				local installedUpgrades = getVehicleUpgrades(vehicle)
				for i, upgrade in ipairs(tunings) do
					local slotName = getVehicleUpgradeSlotName(upgrade)
                    local row = guiGridListAddRow(g_tuning["grid_teile"])
                    guiGridListSetItemText(g_tuning["grid_teile"], row, g_tuning["column_teile"], upgradeName[upgrade].." ("..tostring(upgrade)..")", false, false)
					
					if table.find(installedUpgrades, upgrade) ~= false then
						--local row = guiGridListAddRow(g_tuning["grid_teile"])
						guiGridListSetItemText(g_tuning["grid_teile"], row, g_tuning["column_x"], "X", false, false)					
					end
				end
				teile_visible = 1
			else
				removeEventHandler("onClientGUIDoubleClick", g_tuning["window_teile"], TuningTeile)
				guiSetVisible(g_tuning["window_teile"], false)
				guiGridListClear(g_tuning["grid_teile"])
				teile_visible = 0
			end
		end
	end
end

--Preis
function drawPreis()
	dxDrawText("Aktueller Preis: "..preis.."$",priceX, priceY,189.0,99.0,tocolor(50,200,100,255),1.5,"default","left","top",false,false,false)
end

function TuningTeile(button)
	if button == "left" then
		local item = guiGridListGetSelectedItems(g_tuning["grid_teile"])
		if item ~= nil and item[1] ~= nil and item[1]["row"] ~= nil then
			local vehicle = getPedOccupiedVehicle(getLocalPlayer())
			local tuning = guiGridListGetItemText(g_tuning["grid_teile"], item[1]["row"], g_tuning["column_teile"])
			local from, to, num = tuning:find("(%d+)", 9)
			num = tonumber(num)
			
			local upgrades = getVehicleUpgrades(vehicle)
			--Preis
			for i, tuningTeil in ipairs(tuningList) do
				if tuningTeil == num then
					preis = preis - 350
					table.remove(tuningList, i)
				end
			end
			
			--Bereits vorhanden
			for i, tuningTeil in ipairs(upgrades) do
				if tuningTeil == num then
					removeVehicleUpgrade(vehicle, tonumber(num))
					guiGridListSetItemText(g_tuning["grid_teile"], item[1]["row"], g_tuning["column_x"], " ", false, false)
					return true
				end
			end
			
			guiGridListSetItemText(g_tuning["grid_teile"], item[1]["row"], g_tuning["column_x"], "X", false, false)
			addVehicleUpgrade(vehicle, num)
			table.insert(tuningList, num)
			tunings = 1
			preis = preis + 350
		end
	end
end
--Tacho
function TuningTacho(button)
	if button == "left" then
		if source == g_tuning["tacho_back"] then
			if tacho == 1 then 
				tacho = 4
				changeTacho()
			else
				tacho = tacho - 1
				changeTacho()
			end
		end
		if source == g_tuning["tacho_forth"] then
			if tacho == 4 then 
				tacho = 1
				changeTacho()
			else
				tacho = tacho + 1
				changeTacho()
			end
		end
	end
end

function changeTacho()
	local vehicle = getPedOccupiedVehicle(getLocalPlayer())
	if tacho == 1 then
		guiSetVisible(g_tuning["img_tank"], true)
		guiSetVisible(g_tuning["img_tacho"], true)
		guiSetVisible(g_tuning["img_tank_green"], false)
		guiSetVisible(g_tuning["img_tacho_green"], false)
		guiSetVisible(g_tuning["img_tank_red"], false)
		guiSetVisible(g_tuning["img_tacho_red"], false)
		guiSetVisible(g_tuning["img_tank_blue"], false)
		guiSetVisible(g_tuning["img_tacho_blue"], false)
		setElementData(vehicle, "tacho", nil)
		if tachoPreis == 0 then
			if tachoPreisfalse ~= nil then
				preis = preis + 550
				tachoPreis = 1
			end
		else
			if tachoPreisfalse == nil then
				preis = preis - 550
				tachoPreis = 0
			end
		end
	end
	if tacho == 2 then
		guiSetVisible(g_tuning["img_tank"], false)
		guiSetVisible(g_tuning["img_tacho"], false)
		guiSetVisible(g_tuning["img_tank_green"], true)
		guiSetVisible(g_tuning["img_tacho_green"], true)
		guiSetVisible(g_tuning["img_tank_red"], false)
		guiSetVisible(g_tuning["img_tacho_red"], false)
		guiSetVisible(g_tuning["img_tank_blue"], false)
		guiSetVisible(g_tuning["img_tacho_blue"], false)
		setElementData(vehicle, "tacho", "green")
		if tachoPreis == 0 then
			if tachoPreisfalse ~= "green" then
				preis = preis + 550
				tachoPreis = 1
			end
		else
			if tachoPreisfalse == "green" then
				preis = preis - 550
				tachoPreis = 0
			end
		end
	end
	if tacho == 3 then
		guiSetVisible(g_tuning["img_tank"], false)
		guiSetVisible(g_tuning["img_tacho"], false)
		guiSetVisible(g_tuning["img_tank_green"], false)
		guiSetVisible(g_tuning["img_tacho_green"], false)
		guiSetVisible(g_tuning["img_tank_red"], true)
		guiSetVisible(g_tuning["img_tacho_red"], true)
		guiSetVisible(g_tuning["img_tank_blue"], false)
		guiSetVisible(g_tuning["img_tacho_blue"], false)
		setElementData(vehicle, "tacho", "red")
		if tachoPreis == 0 then
			if tachoPreisfalse ~= "red" then
				preis = preis + 550
				tachoPreis = 1
			end
		else
			if tachoPreisfalse == "red" then
				preis = preis - 550
				tachoPreis = 0
			end
		end
	end
	if tacho == 4 then
		guiSetVisible(g_tuning["img_tank"], false)
		guiSetVisible(g_tuning["img_tacho"], false)
		guiSetVisible(g_tuning["img_tank_green"], false)
		guiSetVisible(g_tuning["img_tacho_green"], false)
		guiSetVisible(g_tuning["img_tank_red"], false)
		guiSetVisible(g_tuning["img_tacho_red"], false)
		guiSetVisible(g_tuning["img_tank_blue"], true)
		guiSetVisible(g_tuning["img_tacho_blue"], true)
		setElementData(vehicle, "tacho", "blue")
		if tachoPreis == 0 then
			if tachoPreisfalse ~= "blue" then
				preis = preis + 550
				tachoPreis = 1
			end
		else
			if tachoPreisfalse == "blue" then
				preis = preis - 550
				tachoPreis = 0
			end
		end
	end
end
--Sicherheit
function TuningSafty()
	if source == g_tuning["button_safty_up"] then
		local safty = tonumber(guiGetText(g_tuning["label_safty"]))
		local currentsafty = tonumber(guiGetText(g_tuning["label_safty_current"]))
		if safty and currentsafty then
			guiSetEnabled(g_tuning["button_safty_down"], true)
			currentsafty = currentsafty + 1
			guiSetText(g_tuning["label_safty_current"], tostring(currentsafty))
			preis = preis + 200
			guiSetText(g_tuning["label_safty_add"], "+"..tostring(currentsafty - safty))
			if currentsafty == 10 then guiSetEnabled(g_tuning["button_safty_up"], false) end
		end	
	elseif source == g_tuning["button_safty_down"] then
		local safty = guiGetText(g_tuning["label_safty"])
		local currentsafty = guiGetText(g_tuning["label_safty_current"])
		if safty and currentsafty then
			guiSetEnabled(g_tuning["button_safty_up"], true)
			currentsafty = currentsafty - 1
			guiSetText(g_tuning["label_safty_add"], "+"..tostring(currentsafty - safty))
			guiSetText(g_tuning["label_safty_current"], tostring(currentsafty))
			preis = preis - 200
			if currentsafty - safty == 0 then guiSetEnabled(g_tuning["button_safty_down"], false) end
		end	
	end
end
--GPS
function TuningGPS()
	local veh = getPedOccupiedVehicle(getLocalPlayer())
	if source == g_tuning["gps_einbauen"] then
		setElementData(veh, "gps", true)
		if gpsPreis == 0 then
			preis = preis + 1000
			gpsPreis = 1
		end
	end
end

function drawTextGPS()
	dxDrawText("Das GPS System ist in diesem Fahrzeug schon eingebaut!",x/2-300 ,y/2,965.0,502.0,tocolor(255,0,0,255),2.0,"default","left","top",false,false,false)
end

function toggleTextGPS()
	if toggle_drawGPS == 0 then
		addEventHandler("onClientRender",getRootElement(), drawTextGPS)
		toggle_drawGPS = 1
		drawTimerGPS = setTimer ( toggleTextGPS, 2000, 5)
	else
		removeEventHandler("onClientRender",getRootElement(), drawTextGPS)
		toggle_drawGPS = 0
		if isTimer(drawTimerGPS) then
			killTimer(drawTimerGPS)
		end
	end
end
--Lichtfarbe
function TuningLightCol()
	local veh = getPedOccupiedVehicle(getLocalPlayer())
	if source == g_tuning["rot"] or source == g_tuning["gruen"] or source == g_tuning["blau"] then
		local col_rot = guiScrollBarGetScrollPosition(g_tuning["rot"])*(255/100)
		local col_gruen = guiScrollBarGetScrollPosition(g_tuning["gruen"])*(255/100)
		local col_blau = guiScrollBarGetScrollPosition(g_tuning["blau"])*(255/100)
		setVehicleHeadLightColor (veh, col_rot, col_gruen, col_blau)
		if lichtPreis == 0 then
			preis = preis + 180
			lichtPreis = 1
		end
	end
end
--Autofarbe
function TuningCarColor()
	local veh = getPedOccupiedVehicle(getLocalPlayer())
	local col, col2, col3, col4 = getVehicleColor ( veh )
	if source == g_tuning["color1"] then
	local color1 = guiGetText ( g_tuning["color1"] )
		if string.len(color1) > 0 then
			if col ~= tonumber(color1) then
				setVehicleColor ( veh, tonumber(color1), col2, col3, col4 )
				if colorPreis == 0 then
					preis = preis + 200
					colorPreis = 1
				end
			end
		end
	end
	if source == g_tuning["color2"] then
	local color2 = guiGetText ( g_tuning["color2"] )
		if string.len(color2) > 0 then
			if col2 ~= tonumber(color2) then
				setVehicleColor ( veh, col, tonumber(color2), col3, col4 )
				if colorPreis == 0 then
					preis = preis + 200
					colorPreis = 1
				end
			end
		end
	end
end
--Paintjob
function drawTextPaintjob()
	dxDrawText("F"..uuml.."r dieses Fahrzeug steht kein Paintjob zur ferf"..uuml.."gung!",x/2-300 ,y/2 ,965 ,502 ,tocolor(255,0,0,255),2.0,"default","left","top",false,false,false)
end

function toggleTextPaintjob()
	if toggle_drawPaintjob == 0 then
		addEventHandler("onClientRender",getRootElement(), drawTextPaintjob)
		toggle_drawPaintjob = 1
		drawTimer = setTimer ( toggleTextPaintjob, 1000, 5)
	else
		removeEventHandler("onClientRender",getRootElement(), drawTextPaintjob)
		toggle_drawPaintjob = 0
		if isTimer(drawTimer) then
			killTimer(drawTimer)
		end
	end
end

function TuningPaintjob()
	local veh = getPedOccupiedVehicle(getLocalPlayer())
	local old_paintjob = getVehiclePaintjob ( veh )
	if source == g_tuning["keinen"] then
		if tonumber(old_paintjob) ~= 3 then
			setVehiclePaintjob ( veh, 3 )
			if paintjobPreis == 0 then
				preis = preis + 450
				paintjobPreis = 1
			end
		end
	end
	if source == g_tuning["1"] then
		if tonumber(old_paintjob) ~= 1 then
			setVehiclePaintjob ( veh, 1 )
			if paintjobPreis == 0 then
				preis = preis + 450
				paintjobPreis = 1
			end	
		end
	end
	if source == g_tuning["2"] then
		if tonumber(old_paintjob) ~= 2 then
			setVehiclePaintjob ( veh, 2 )
			if paintjobPreis == 0 then
				preis = preis + 450
				paintjobPreis = 1
			end
		end
	end
	if source == g_tuning["3"] then
		if tonumber(old_paintjob) ~= 0 then
			setVehiclePaintjob ( veh, 0 )
			if paintjobPreis == 0 then
				preis = preis + 450
				paintjobPreis = 1
			end
		end
	end
end
--Kamera
function TuningCam()
	--Cam Normal
	if source == g_tuning["normal"] then
		if TuningCenter == "SF" then
			setCameraMatrix ( -1940.4921875, 250.515625, 34.4609375+2, -1936.8125, 247.1923828125, 33.4609375)
		end
		if TuningCenter == "LS" then
			setCameraMatrix ( 1038.68359375, -1013.3203125, 32.107528686523+2, 1041.6650390625, -1017.8232421875, 31.107528686523)
		end
		if TuningCenter == "LV" then
			setCameraMatrix ( 2382.6796875, 1055.0986328125, 10.8203125+2, 2386.720703125, 1050.802734375, 9.8203125)
		end
		if TuningCenter == "boat" then
			setCameraMatrix ( -2268.326171875, 2448.2978515625, -0.55000001192093+2, -2281.6572265625, 2449.2001953125, 0)
		end
		if TuningCenter == "flug" then
			setCameraMatrix ( 1274.904296875, 1316.7890625, 10.8203125+2, 1279.93359375, 1324.0634765625, 11.280610084534)
		end
	end
	
	--Cam Vorn
	if source == g_tuning["vorn"] then
		if TuningCenter == "SF" then
			setCameraMatrix ( -1936.8955078125, 253.1630859375, 34.4609375, -1936.8125, 247.1923828125, 33.4609375)
		end
		if TuningCenter == "LS" then
			setCameraMatrix ( 1041.5341796875, -1008.32421875, 32.073574066162, 1041.6650390625, -1017.8232421875, 31.107528686523)
		end
		if TuningCenter == "LV" then
			setCameraMatrix ( 2385.8359375, 1058.7744140625, 10.8203125, 2386.720703125, 1050.802734375, 9.8203125)
		end
		if TuningCenter == "boat" then
			setCameraMatrix ( -2272.3759765625, 2442.21484375, -0.55000001192093+2, -2281.6572265625, 2449.2001953125, 0)
		end
		if TuningCenter == "flug" then
			setCameraMatrix ( 1267.8681640625, 1323.9931640625, 10.812978744507, 1279.93359375, 1324.0634765625, 11.280610084534)
		end
	end
	
	--Cam Hinten
	if source == g_tuning["hinten"] then
		if TuningCenter == "SF" then
			setCameraMatrix ( -1936.455078125, 239.9404296875, 34.455051422119, -1936.8125, 247.1923828125, 33.4609375)
		end
		if TuningCenter == "LS" then
			setCameraMatrix ( 1041.8427734375, -1024.466796875, 32.107528686523, 1041.6650390625, -1017.8232421875, 31.107528686523)
		end
		if TuningCenter == "LV" then
			setCameraMatrix ( 2386.62890625, 1044.7626953125, 10.8203125, 2386.720703125, 1050.802734375, 9.8203125)
		end
		if TuningCenter == "boat" then
			setCameraMatrix ( -2294.0537109375, 2458.2880859375, -0.55000001192093+2, -2281.6572265625, 2449.2001953125, 0)
		end
		if TuningCenter == "flug" then
			setCameraMatrix ( 1293.8662109375, 1323.5283203125, 10.8203125, 1279.93359375, 1324.0634765625, 11.280610084534)
		end
	end
end
--[[[2011-01-22 20:58:40] autohausSpawn = { x =-2281.6572265625, y=2449.2001953125, z=-0.34817314147949, rx=359.62097167969, ry=359.79675292969, rz=227.31811523438}, 453
Coords:-2294.0537109375, 2458.2880859375, -0.55000001192093 Interior:0 Z-Angle227.54405212402
[2011-01-22 21:27:33] Coords:-2268.326171875, 2448.2978515625, -0.55000001192093 Interior:0 Z-Angle94.376739501953
[2011-01-22 21:27:43] Coords:-2272.3759765625, 2442.21484375, -0.55000001192093 Interior:0 Z-Angle49.255218505859

autohausSpawn = { x =, rx=359.43420410156, ry=359.99450683594, rz=89.818725585938}, 593
[2011-01-22 21:06:26] Coords:1267.8681640625, 1323.9931640625, 10.812978744507 Interior:0 Z-Angle268.90270996094
[2011-01-22 21:06:32] Coords:1274.904296875, 1316.7890625, 10.8203125 Interior:0 Z-Angle311.20074462891
[2011-01-22 21:06:41] Coords:1293.8662109375, 1323.5283203125, 10.8203125 Interior:0 Z-Angle87.817810058594--]]
upgradeName = {
[1000]="Spoiler Pro",
[1001]="Spoiler Win",
[1002]="Spoiler Drag",
[1003]="Spoiler Alpha",
[1004]="Lufteinlass Champ",
[1005]="Lufteinlass Fury",
[1006]="Lufteinlass Roof",
[1007]="Seitenschweller Rechts",
[1008]="Nitro 2x",
[1009]="Nitro 5x",
[1010]="Nitro 10x",
[1011]="Lufteinlass Race",
[1012]="Lufteinlass Worx",
[1013]="Scheinwerfer Rund",
[1014]="Spoiler Champ",
[1015]="Spoiler Race",
[1016]="Spoiler Worx",
[1017]="Seitenschweller Links",
[1018]="Auspuff Upswept",
[1019]="Auspuff Twin",
[1020]="Auspuff Large",
[1021]="Auspuff Medium",
[1022]="Auspuff Small",
[1023]="Spoiler Fury",
[1024]="Scheinwerfer Rund",
[1025]="Raeder Offroad",
[1026]="Seitenschweller Rechts Alien",
[1027]="Seitenschweller Links Alien",
[1028]="Auspuff Alien",
[1029]="Auspuff X-Flow",
[1030]="Seitenschweller Rechts X-Flow",
[1031]="Seitenschweller Links X-Flow",
[1032]="Dachlufteinlass Alien",
[1033]="Dachlufteinlass X-Flow",
[1034]="Spoiler Alien",
[1035]="Dachlufteinlass X-Flow",
[1036]="Seitenschweller Rechts Alien",
[1037]="Spoiler X-Flow",
[1038]="Dachlufteinlass Alien",
[1039]="Seitenschweller Links X-Flow",
[1040]="Seitenschweller Links Alien",
[1041]="Seitenschweller Rechts X-Flow",
[1042]="Seitenschweller Rechts Chrome",
[1043]="Spoiler Slamin",
[1044]="Spoiler Chrome",
[1045]="Spoiler X-Flow",
[1046]="Spoiler Alien",
[1047]="Seitenschweller Rechts Alien",
[1048]="Seitenschweller Rechts X-Flow",
[1049]="Spoiler Alien",
[1050]="Spoiler X-Flow",
[1051]="Seitenschweller Links Alien",
[1052]="Seitenschweller Links X-Flow",
[1053]="Dachlufteinlass X-Flow",
[1054]="Dachlufteinlass Alien",
[1055]="Dachlufteinlass Alien",
[1056]="Seitenschweller Rechts Alien",
[1057]="Seitenschweller Rechts X-Flow",
[1058]="Spoiler Alien",
[1059]="Auspuff X-Flow",
[1060]="Spoiler X-Flow",
[1061]="Dachlufteinlass X-Flow",
[1062]="Seitenschweller Links Alien",
[1063]="Seitenschweller Links X-Flow",
[1064]="Auspuff Alien",
[1065]="Auspuff Alien",
[1066]="Auspuff X-Flow",
[1067]="Dachlufteinlass Alien",
[1068]="Dachlufteinlass X-Flow",
[1069]="Seitenschweller Rechts Alien",
[1070]="Seitenschweller Rechts X-Flow",
[1071]="Seitenschweller Links Alien",
[1072]="Seitenschweller Links X-Flow",
[1073]="Raeder Shadow",
[1074]="Raeder Mega",
[1075]="Raeder Rimshine",
[1076]="Raeder Wires",
[1077]="Raeder Classic",
[1078]="Raeder Twist",
[1079]="Raeder Cutter",
[1080]="Raeder Switch",
[1081]="Raeder Grove",
[1082]="Raeder Import",
[1083]="Raeder Dollar",
[1084]="Raeder Trance",
[1085]="Raeder Atomic",
[1086]="Stereo",
[1087]="Hydraulik",
[1088]="Dachlufteinlass Alien",
[1089]="Auspuff X-Flow",
[1090]="Seitenschweller Rechts Alien",
[1091]="Dachlufteinlass X-Flow",
[1092]="Auspuff Alien",
[1093]="Seitenschweller Rechts X-Flow",
[1094]="Seitenschweller Links Alien",
[1095]="Seitenschweller Rechts X-Flow",
[1096]="Raeder Ahab",
[1097]="Raeder Virtual",
[1098]="Raeder Access",
[1099]="Seitenschweller Links Chrome",
[1100]="Grill Chrome",
[1101]="Seitenschweller Links Chrome-Flames",
[1102]="Seitenschweller Links Chrome-Strip",
[1103]="Dachlufteinlass Covertible",
[1104]="Auspuff Chrome",
[1105]="Auspuff Slamin",
[1106]="Seitenschweller Rechts Chrome-Arches",
[1107]="Seitenschweller Links Chrome-Strip",
[1108]="Seitenschweller Rechts Chrome-Strip",
[1109]="Chrome",
[1110]="Slamin",
[1111]="Little Sign?",
[1112]="Little Sign?",
[1113]="Auspuff Chrome",
[1114]="Auspuff Slamin",
[1115]="Grill Chrome",
[1116]="Grill Slamin",
[1117]="Sto"..szlig.."stange Chrome",
[1118]="Seitenschweller Rechts Chrome-Trim",
[1119]="Rechte Wheelcovers",
[1120]="Seitenschweller Links Chrome-Trim",
[1121]="Linke Wheelcovers",
[1122]="Seitenschweller Rechts Chrome-Flames",
[1123]="Leisten Chrome",
[1124]="Seitenschweller Links Chrome-Arches",
[1125]="Leisten Chrome",
[1126]="Auspuff Chrome",
[1127]="Auspuff Slamin",
[1128]="Vinyl Hardtop",
[1129]="Auspuff Chrome",
[1130]="Hardtop",
[1131]="Softtop",
[1132]="Auspuff Slamin",
[1133]="Seitenschweller Rechts Chrome",
[1134]="Seitenschweller Rechts Chrome",
[1135]="Auspuff Slamin",
[1136]="Auspuff Chrome",
[1137]="Seitenschweller Links Chrome",
[1138]="Spoiler Alien",
[1139]="Spoiler X-Flow",
[1140]="Sto"..szlig.."stange X-Flow",
[1141]="Sto"..szlig.."stange Alien",
[1142]="Lufteinlaesse Ovale",
[1143]="Lufteinlaesse Ovale",
[1144]="Lufteinlaesse Eckige",
[1145]="Lufteinlaesse Eckige",
[1146]="Spoiler X-Flow",
[1147]="Spoiler Alien",
[1148]="Hecksto"..szlig.."stange X-Flow",
[1149]="Hecksto"..szlig.."stange Alien",
[1150]="Hecksto"..szlig.."stange Alien",
[1151]="Hecksto"..szlig.."stange X-Flow",
[1152]="Sto"..szlig.."stange X-Flow",
[1153]="Sto"..szlig.."stange Alien",
[1154]="Hecksto"..szlig.."stange Alien",
[1155]="Sto"..szlig.."stange Alien",
[1156]="Hecksto"..szlig.."stange X-Flow",
[1157]="Sto"..szlig.."stange X-Flow",
[1158]="Spoiler X-Flow",
[1159]="Hecksto"..szlig.."stange Alien",
[1160]="Sto"..szlig.."stange Alien",
[1161]="Sto"..szlig.."stange X-Flow",
[1162]="Spoiler Alien",
[1163]="Spoiler X-Flow",
[1164]="Spoiler Alien",
[1165]="Sto"..szlig.."stange X-Flow",
[1166]="Sto"..szlig.."stange Alien",
[1167]="Hecksto"..szlig.."stange X-Flow",
[1168]="Hecksto"..szlig.."stange Alien",
[1169]="Sto"..szlig.."stange Alien",
[1170]="Sto"..szlig.."stange X-Flow",
[1171]="Sto"..szlig.."stange Alien",
[1172]="Sto"..szlig.."stange X-Flow",
[1173]="Sto"..szlig.."stange X-Flow",
[1174]="Sto"..szlig.."stange Chrome",
[1175]="Hecksto"..szlig.."stange Slamin",
[1176]="Sto"..szlig.."stange Chrome",
[1177]="Hecksto"..szlig.."stange Slamin",
[1178]="Hecksto"..szlig.."stange Slamin",
[1179]="Sto"..szlig.."stange Chrome",
[1180]="Hecksto"..szlig.."stange Chrome",
[1181]="Sto"..szlig.."stange Slamin",
[1182]="Sto"..szlig.."stange Chrome",
[1183]="Hecksto"..szlig.."stange Slamin",
[1184]="Hecksto"..szlig.."stange Chrome",
[1185]="Sto"..szlig.."stange Slamin",
[1186]="Hecksto"..szlig.."stange Slamin",
[1187]="Hecksto"..szlig.."stange Chrome",
[1188]="Sto"..szlig.."stange Slamin",
[1189]="Sto"..szlig.."stange Chrome",
[1190]="Sto"..szlig.."stange Slamin",
[1191]="Sto"..szlig.."stange Chrome",
[1192]="Hecksto"..szlig.."stange Chrome",
[1193]="Hecksto"..szlig.."stange Slamin"
}
