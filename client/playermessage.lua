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



local timersec = 5

local function clickHandler(button)
	if button == "left" then
		toggleInfoMenu(false)
	end
end

function toggleInfoMenu(toggle, timer)
	if toggle then
		if not guiGetVisible(g_infomenu["window"]) then
			guiSetVisible(g_infomenu["window"], true)
			bindKey("enter", "down", deactivateInfoMenu)
			showPlayerHudComponent("ammo", false)
			showPlayerHudComponent("armour", false)
			showPlayerHudComponent("breath", false)
			showPlayerHudComponent("clock", false)
			showPlayerHudComponent("health", false)
			showPlayerHudComponent("money", false)
			showPlayerHudComponent("weapon", false)
			showChat(false)
			
			if not timer then
				addEventHandler("onClientGUIClick", g_infomenu["button"], clickHandler)
				showCursor(true)
			end
		end
	else
		if guiGetVisible(g_infomenu["window"]) then
			showCursor(false)
			guiSetVisible(g_infomenu["window"], false)
			unbindKey("enter", "down", deactivateInfoMenu)
			showPlayerHudComponent("ammo", true)
			showPlayerHudComponent("armour", true)
			showPlayerHudComponent("breath", true)
			showPlayerHudComponent("clock", true)
			showPlayerHudComponent("health", true)
			showPlayerHudComponent("money", true)
			showPlayerHudComponent("weapon", true)
			showChat(true)
		end
	end
end

function deactivateInfoMenu()
	toggleInfoMenu(false)
end

function infoMenuTimer()
	if timersec ~= 0 then
		timersec = timersec - 1
	else
		toggleInfoMenu(false)
		timersec = 5
	end
end
addEventHandler("onClientGeneralTimer", localPlayer, infoMenuTimer)

function showInfoMessage(message, timer)
	if message then
		guiSetText(g_infomenu["text"], message)
		local text = guiGetText(g_Playermenugui["playerMessage"]).."
 
"..message
		guiSetText(g_Playermenugui["playerMessage"], text)
		if timer then
			guiSetVisible(g_infomenu["button"], false)
			toggleInfoMenu(true, true)
			timersec = 5
		else
			guiSetVisible(g_infomenu["button"], true)
			toggleInfoMenu(true, false)
		end
	end	
end
