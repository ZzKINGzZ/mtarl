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



local object
local thing = {}
local currentobject = {}

function setHouseBuildEnabled(toggle)
	initalizeHouseBuyGUI()
	if toggle == true then
		guiSetVisible(g_housebuygui["window"], true)
		showCursor(true)
		addEventHandler("onClientGUIClick", g_housebuygui["window"], houseBuildHandler)
		addEventHandler("onClientGUIComboBoxAccepted", g_housebuygui["combo"], houseBuildComboHandler)
	elseif toggle == false then
		guiSetVisible(g_housebuygui["window"], false)
		showCursor(false)
		removeEventHandler("onClientGUIClick", g_housebuygui["window"], houseBuildHandler)
		removeEventHandler("onClientGUIComboBoxAccepted", g_housebuygui["combo"], houseBuildComboHandler)
	end
end

function houseBuildHandler(button, state, x, y)	
	if source == g_housebuygui["abort"] then
		setHouseBuildEnabled(false)
		if object then
			destroyElement(object)
			object = nil
		end
	elseif source == g_housebuygui["select"] then
		local row, col = guiGridListGetSelectedItem(g_housebuygui["gridlist"])
		if col ~= -1 and row ~= -1 then
			local x, y, z = getPosInFrontOfPlayer(getLocalPlayer())
			object = createObject(thing[row]["modelid"], x, y, z)
			currentobject["preis"] = thing[row]["preis"]
			setElementInterior(object, getElementInterior(getLocalPlayer()))
			setElementDimension(object, getElementDimension(getLocalPlayer()))
			addEventHandler("onClientRender", getRootElement(), attachObjectToMouseHouse)
			setHouseBuildEnabled(false)
			toggleAllControls(false, true, false)
		end
	end
end

function houseBuildComboHandler()
	local seltyp = guiComboBoxGetSelected(g_housebuygui["combo"])
	if seltyp == 0 then
		fillBuildGridlistWithItems("Einrichtung")
	end
	if seltyp == 1 then
		fillBuildGridlistWithItems("Pflanzen")
	end
	if seltyp == 2 then
		fillBuildGridlistWithItems("Sonstiges")
	end
end

function fillBuildGridlistWithItems(types)
	thing = nil
	thing = {}
	
	guiGridListClear(g_housebuygui["gridlist"])
	
	if types == "Einrichtung" then
		addHouseBuyItem("2 Sitzer + Tisch", 2500, 2617)
		addHouseBuyItem("2 Sitzer Sofa + Tisch", 3500, 2572)
		addHouseBuyItem("Wohnzimmertisch", 2500, 2357)
		
		addHouseBuyItem("Couch", 1000, 2290)
		addHouseBuyItem("Couch", 840, 1766)
		addHouseBuyItem("Couch", 850, 1764)
		addHouseBuyItem("Couch", 500, 1763)
		addHouseBuyItem("Couch", 750, 1761)
		addHouseBuyItem("Couch", 800, 1760)
		addHouseBuyItem("Couch", 900, 1757)
		addHouseBuyItem("Couch", 1000, 1753)
		addHouseBuyItem("Couch", 1250, 1703)
		addHouseBuyItem("Couch", 1250, 1702)
		
		addHouseBuyItem("Sessel", 450, 1755)
		addHouseBuyItem("Sessel", 450, 1758)
		addHouseBuyItem("Sessel", 350, 1759)
		addHouseBuyItem("Sessel", 400, 1762)
		addHouseBuyItem("Sessel", 500, 1765)
		addHouseBuyItem("Sessel", 450, 1767)
		addHouseBuyItem("Sessel", 340, 1769)
		
		--[[addHouseBuyItem("Esstisch", 1200, 2219)
		addHouseBuyItem("Esstisch", 1250, 2218)
		addHouseBuyItem("Esstisch", 1100, 2217)
		addHouseBuyItem("Esstisch", 950, 2215)--]]
		
		addHouseBuyItem("Schrank", 300, 1740)
		addHouseBuyItem("Schrank", 450, 1741)
		addHouseBuyItem("Schrank", 500, 1743)
		addHouseBuyItem("Schrank", 250, 2095)
		
		addHouseBuyItem("Buecherregal", 650, 1742)
		addHouseBuyItem("Buecherregal", 500, 2161)
		
		addHouseBuyItem("Regal", 750, 2063)
		
		addHouseBuyItem("Kabinett", 1200, 2078)
		
		addHouseBuyItem("Küchenteil", 850, 2128)
		addHouseBuyItem("Küchenteil", 850, 2129)
		addHouseBuyItem("Küchenteil", 750, 2133)
		addHouseBuyItem("Küchenteil", 750, 2134)
		addHouseBuyItem("Küchenteil", 1200, 2137)
		addHouseBuyItem("Küchenteil", 1200, 2138)
		addHouseBuyItem("Küchenteil", 900, 2139)
		addHouseBuyItem("Küchenteil", 900, 2140)
		addHouseBuyItem("Küchenteil", 850, 2141)
		addHouseBuyItem("Küchenteil", 650, 2142)
		addHouseBuyItem("Küchenteil", 700, 2145)
		addHouseBuyItem("Küchenteil", 1000, 2159)
		addHouseBuyItem("Küchenteil", 1200, 2160)
		
		addHouseBuyItem("Bett", 500, 1700)
		addHouseBuyItem("Bett", 550, 1701)
		addHouseBuyItem("Bett", 650, 1725)
		addHouseBuyItem("Bett", 450, 1745)
		
		addHouseBuyItem("Bild", 250, 2289)
		addHouseBuyItem("Bild", 200, 2288)
		addHouseBuyItem("Bild", 300, 2287)
		addHouseBuyItem("Bild", 300, 2286)
		addHouseBuyItem("Bild", 185, 2284)
		addHouseBuyItem("Bild", 500, 2283)
		addHouseBuyItem("Bild", 450, 2282)
		addHouseBuyItem("Bild", 500, 2281)
		addHouseBuyItem("Bild", 350, 2280)
		addHouseBuyItem("Bild", 380, 2279)
		addHouseBuyItem("Bild", 200, 2278)
		addHouseBuyItem("Bild", 250, 2277)
		addHouseBuyItem("Bild", 600, 2257)
		
		addHouseBuyItem("Glass", 50, 1455)
		addHouseBuyItem("Fernseher", 150, 1518)
		addHouseBuyItem("Fernseher", 250, 1717)
		addHouseBuyItem("Fernseher", 200, 1747)
		--addHouseBuyItem("Fernseher", 270, 1725)
				
	elseif types == "Pflanzen" then
		addHouseBuyItem("Pflanze", 50, 948)
		addHouseBuyItem("Pflanze", 100, 949)
		addHouseBuyItem("Pflanze", 110, 950)
		addHouseBuyItem("Pflanze", 150, 2001)
		addHouseBuyItem("Pflanze", 150, 2010)
		addHouseBuyItem("Pflanze", 160, 2011)
		addHouseBuyItem("Pflanze", 90, 2194)
		addHouseBuyItem("Pflanze", 70, 2195)
		addHouseBuyItem("Pflanze", 50, 2240)
		addHouseBuyItem("Pflanze", 60, 2241)
		addHouseBuyItem("Pflanze", 30, 2245)
		addHouseBuyItem("Pflanze", 20, 2247)
		addHouseBuyItem("Pflanze", 15, 2249)
		addHouseBuyItem("Pflanze", 15, 2250)
		addHouseBuyItem("Pflanze", 10, 2251)
		addHouseBuyItem("Pflanze", 20, 2252)
		addHouseBuyItem("Pflanze", 40, 2253)
		addHouseBuyItem("Pflanze", 80, 14834)
		addHouseBuyItem("Pflanze", 90, 15038) 	
	
	elseif types == "Sonstiges" then
		addHouseBuyItem("Liege", 500, 1646)
		addHouseBuyItem("Liege", 450, 1647)
		
		addHouseBuyItem("Heizung", 300, 1738)
		
		addHouseBuyItem("Lavalampe", 1000, 2238)
		addHouseBuyItem("Stehlampe", 500, 2108)
	end
end

function addHouseBuyItem(name, preis, modelid)
	local row = guiGridListAddRow(g_housebuygui["gridlist"])
	thing[row] = {}
	thing[row]["name"] = name
	thing[row]["preis"] = preis
	thing[row]["modelid"] = modelid
	
	guiGridListSetItemText(g_housebuygui["gridlist"], row, g_housebuygui["Typ"], name, false, false)
	guiGridListSetItemText(g_housebuygui["gridlist"], row, g_housebuygui["Preis"], tostring(preis), false, false)
	guiGridListSetItemText(g_housebuygui["gridlist"], row, g_housebuygui["Modelid"], tostring(modelid), false, false)		
end

local sx, sy = guiGetScreenSize()
function attachObjectToMouseHouse()
	if object then
		dxDrawText("Pfeiltasten - Bewegen", sx - 150, sy / 30 * 24)
		dxDrawText("w/s - Höhe", sx - 150, sy / 30 * 25)
		dxDrawText("e/d - Rotation", sx - 150, sy / 30 * 26)
		dxDrawText("Enter - Kaufen", sx - 150, sy / 30 * 27)
		dxDrawText("Backspace- Abbrechen", sx - 150, sy / 30 * 28)


		local x, y, z = getElementPosition(object)
		local xx, yy, zz = getElementRotation(object)
		local speed = 0.008
		
		if getKeyState("lshift") then
			speed = speed * 2
		end
		
		if getKeyState("arrow_d") then
			setElementPosition(object, x, y - speed, z)
		end
		if getKeyState("arrow_u") then
			setElementPosition(object, x, y + speed, z)
		end
		if getKeyState("arrow_l") then
			setElementPosition(object, x - speed, y, z)
		end
		if getKeyState("arrow_r") then
			setElementPosition(object, x + speed, y, z)
		end	
		if getKeyState("w") then
			setElementPosition(object, x, y, z + speed)
		end	
		if getKeyState("s") then
			setElementPosition(object, x, y, z - speed)
		end
		if getKeyState("e") then
			setElementRotation(object, xx, yy, zz + speed * 20)
		end
		if getKeyState("d") then
			setElementRotation(object, xx, yy, zz - speed * 20)
		end	
		if getKeyState("enter") then
			removeEventHandler("onClientRender", getRootElement(), attachObjectToMouseHouse)
			showCursor(false)
			initalizePlayermenu()		
			toggleAllControls(true, true, false)
			--Sende Ergenis an den Server und verlange Geld :D
			rpcCallServerFunction("createHouseObject", getElementModel(object), tostring(x), tostring(y), tostring(z), tostring(xx), tostring(yy), tostring(zz), tostring(currentobject["preis"]))
			currentobject = nil
			currentobject = {}
			if object then
				destroyElement(object)
				object = nil
				toggleAllControls(true, true, false)
			end				
		end
		if getKeyState("backspace") then
			removeEventHandler("onClientRender", getRootElement(), attachObjectToMouseHouse)
			showCursor(false)
			toggleAllControls(true, true, false)
			setHouseBuildEnabled(true)
			currentobject = nil
			currentobject = {}
			if object then
				destroyElement(object)
				object = nil
				toggleAllControls(true, true, false)
			end				
		end		
	end
end

function setHouseEditBuildEnabled(bool)
	if bool == true then
		showCursor(true)
		addEventHandler("onClientRender", getRootElement(), checkClickAndAttachObject)
	else
		showCursor(false)
		removeEventHandler("onClientRender", getRootElement(), checkClickAndAttachObject)
	end
end

local attachedobjectedit = nil

function checkClickAndAttachObject()
	dxDrawText("Linke Maus - Objekt in der Nähe auswaehlen", sx - 150, sy / 30 * 22)
	dxDrawText("Rücktaste - Objekt löschen", sx - 150, sy / 30 * 23)
	dxDrawText("Pfeiltasten - Bewegen", sx - 150, sy / 30 * 24)
	dxDrawText("w/s - Höhe", sx - 150, sy / 30 * 25)
	dxDrawText("e/d - Rotation", sx - 150, sy / 30 * 26)
	dxDrawText("Enter - Neu setzen", sx - 150, sy / 30 * 27)
	
	if getKeyState("mouse1") then
		if attachedobjectedit then
			return false
		end
		
		local dist = 9999999999
		for i, object in ipairs(getElementsByType("object")) do
			if getElementDimension(object) == getElementDimension(getLocalPlayer()) then
				if getElementInterior(object) == getElementInterior(getLocalPlayer()) then
					if getElementData(object, "buildid") then
						local _, _, x, y, z = getCursorPosition()
						local ox, oy, oz = getElementPosition(object)
						local distance = getDistanceBetweenPoints3D(x, y, z, ox, oy, oz)
						if distance < dist then
							attachedobjectedit = object
							dist = distance
						end
					end	
				end
			end
		end
	end
	
	if attachedobjectedit then

		local x, y, z = getElementPosition(attachedobjectedit)
		local xx, yy, zz = getElementRotation(attachedobjectedit)
		local speed = 0.008
			
		if getKeyState("lshift") then
			speed = speed * 2
		end
		
		if getKeyState("arrow_d") then
			setElementPosition(attachedobjectedit, x, y - speed, z)
		end
		if getKeyState("arrow_u") then
			setElementPosition(attachedobjectedit, x, y + speed, z)
		end
		if getKeyState("arrow_l") then
			setElementPosition(attachedobjectedit, x - speed, y, z)
		end
		if getKeyState("arrow_r") then
			setElementPosition(attachedobjectedit, x + speed, y, z)
		end	
		if getKeyState("w") then
			setElementPosition(attachedobjectedit, x, y, z + speed)
		end	
		if getKeyState("s") then
			setElementPosition(attachedobjectedit, x, y, z - speed)
		end
		if getKeyState("e") then
			setElementRotation(attachedobjectedit, xx, yy, zz + speed * 20)
		end
		if getKeyState("d") then
			setElementRotation(attachedobjectedit, xx, yy, zz - speed * 20)
		end	

		--Neue Koords speichern
		if getKeyState("enter") then	
			if attachedobjectedit then
				rpcCallServerFunction("applyNewKoordEdit", attachedobjectedit, tostring(x), tostring(y), tostring(z), tostring(xx), tostring(yy), tostring(zz), false)
				setHouseEditBuildEnabled(false)
				attachedobjectedit = nil
				toggleAllControls(true, true, false)
			end	
		end
		--Oder Objekt löschen
		if getKeyState("backspace") then
			if attachedobjectedit then
				rpcCallServerFunction("applyNewKoordEdit", attachedobjectedit, tostring(x), tostring(y), tostring(z), tostring(xx), tostring(yy), tostring(zz), true)
				setHouseEditBuildEnabled(false)
				attachedobjectedit = nil
				toggleAllControls(true, true, false)				
			end
		end
	end	
end
