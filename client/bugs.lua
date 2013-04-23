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



local function clickGUIHandler(button)
	if button == "left" then
		if source == g_bugGUI["schliessen"] then
			toggleBugMenu(false)
		end
		
		if source == g_bugGUI["absenden"] then
			local text = guiGetText(g_bugGUI["memo"])
			--server.sendBugReport(text)
			rpcCallServerFunction("sendBugReport", text)
			guiSetText(g_bugGUI["memo"], "")
			toggleBugMenu(false)
		end
	end
end

function toggleBugMenu(toggle)
	initBugReportGUI()
	if toggle == true then
		showCursor(true)
		guiSetVisible(g_bugGUI["window"], true)
		addEventHandler("onClientGUIClick", g_bugGUI["window"], clickGUIHandler)
		guiSetInputMode("no_binds")
	else
		showCursor(false)
		guiSetVisible(g_bugGUI["window"], false)
		removeEventHandler("onClientGUIClick", g_bugGUI["window"], clickGUIHandler)
		guiSetInputMode("no_binds_when_editing")
	end
end

local function bugMenuCommand(commandName)
	toggleBugMenu(true)
end

local function initBugMenu()
	addCommandHandler("bug", bugMenuCommand)
end
addEventHandler("onClientLogedInMTARL", getRootElement(), initBugMenu)
