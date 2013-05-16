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



--Arbeitserlaubnis staticID 3
local function closeArbeitserlaubnis(button)
	if button == "left" then
		toggleArbeitserlaubnis(false)
	end
end

--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
function toggleArbeitserlaubnis(toggle, playername, datum)
	initalizeArbeitserlaubnisGUI()
	if toggle == true then
		showCursor(true)
		guiSetText(g_arbeitserlaubnisgui["text1"], "Arbeitserlaubnis für den Spieler "..playername.."\n\nDem Spieler "..playername.." wird es erlaubt, in ganz San Andreas legal, frei und ohne Einschränkungen zu arbeiten.\n\nIn Vertretung für den Präsidenten ")
		guiSetText(g_arbeitserlaubnisgui["text2"], "Die Stadtverwaltung\n\n"..tostring(datum))
		guiSetVisible(g_arbeitserlaubnisgui["window"], true)
		addEventHandler("onClientGUIClick", g_arbeitserlaubnisgui["window"], closeArbeitserlaubnis)
	else
		guiSetVisible(g_arbeitserlaubnisgui["window"], false)
		removeEventHandler("onClientGUIClick", g_arbeitserlaubnisgui["window"], closeArbeitserlaubnis)	
		showCursor(false)
	end
end

--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
function useNightVisionClient()
	if getCameraGoggleEffect() == "normal" then
		setCameraGoggleEffect("nightvision")
		showInfoMessage("Nachtsichtgerät aktiviert")
	else
		setCameraGoggleEffect("normal")
		showInfoMessage("Nachtsichtgerät dektiviert!")
	end
end

function useTermalVisionClient()
	if getCameraGoggleEffect() == "normal" then
		setCameraGoggleEffect("thermalvision")
		showInfoMessage("Infrarotkamera aktiviert")
	else
		setCameraGoggleEffect("normal")
		showInfoMessage("Infrarotkamera deaktiviert!")
	end
end

--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
local buttons = {}
table.insert(buttons, "q")
table.insert(buttons, "w")
table.insert(buttons, "e")
table.insert(buttons, "r")
table.insert(buttons, "z")
table.insert(buttons, "u")
table.insert(buttons, "i")
table.insert(buttons, "o")
table.insert(buttons, "p")
table.insert(buttons, "a")
table.insert(buttons, "s")
table.insert(buttons, "d")
table.insert(buttons, "f")
table.insert(buttons, "g")
table.insert(buttons, "h")
table.insert(buttons, "j")
table.insert(buttons, "c")
table.insert(buttons, "v")
table.insert(buttons, "n")
table.insert(buttons, "m")

local taskTimeLeft = 0
local tasksLeft = 0
local vehToCrack
local oldkey

local function stopCarCrackingItem(won)
	guiSetVisible(g_autodiebGUI["window"], false)
	removeEventHandler("onClientGeneralTimer", getRootElement(), onCarCrackTimer)
	if oldkey then unbindKey(oldkey, "down", newTaskCriminal) end
	
	taskTimeLeft = 0
	tasksLeft = 0
	oldkey = nil
	
	setElementFrozen(localPlayer, false)
	
	if won then
		--server.crackCarWin(vehToCrack)
		rpcCallServerFunction("crackCarWin", vehToCrack)
		
		showInfoMessage("Du hast es geschafft. Das Auto wurde geknackt.")
	else
		showInfoMessage("Du hast es nicht geschafft. Das Auto wurde nicht geknackt.")
	end
end

function newTaskCriminal()
	if oldkey then unbindKey(oldkey, "down", newTaskCriminal) end
	
	taskTimeLeft = 5
	tasksLeft = tasksLeft - 1
	
	guiSetText(g_autodiebGUI["timeleft"], "Restliche Zeit: "..taskTimeLeft.."\nVerbleibende Tasks: "..tasksLeft)
	
	if tasksLeft < 1 then
		stopCarCrackingItem(true)
	else
		local key = buttons[math.random(1, #buttons)]
		oldkey = key
		bindKey(key, "down", newTaskCriminal)
		
		guiSetText(g_autodiebGUI["topress"], "Button: "..oldkey)
	end	
end

function onCarCrackTimer()
	taskTimeLeft = taskTimeLeft - 1
	
	guiSetText(g_autodiebGUI["timeleft"], "Restliche Zeit: "..taskTimeLeft.."\nVerbleibende Tasks: "..tasksLeft)
	if taskTimeLeft == 0 then
		stopCarCrackingItem(false)
	end
end

function startCarCrackingItem(vehicle, howMany)
	initAutoDiebGUI()
	
	guiSetVisible(g_autodiebGUI["window"], true)
	
	vehToCrack = vehicle
	
	tasksLeft = howMany

	newTaskCriminal()
	
	addEventHandler("onClientGeneralTimer", getRootElement(), onCarCrackTimer)
	
	setElementFrozen(localPlayer, true)
	
end
