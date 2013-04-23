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



local function stadtVerwaltungsGUIHandler(button)
	if button == "left" then
		if source == g_stadtgui["cancel"] then
			toggleStadtVerwaltungDokumente(false)
			return false
		end
		
		if source == g_stadtgui["do"] then
			local selected = guiComboBoxGetSelected(g_stadtgui["combo"])
			
			if selected then
				if selected ~= -1 then
					local theType = guiComboBoxGetItemText(g_stadtgui["combo"], selected)
					
					--server.stadtVerwaltungBeantragung(theType)
					rpcCallServerFunction("stadtVerwaltungsBeantragung", theType)
					
					toggleStadtVerwaltungDokumente(false)
				end
			end	
			return false
		end
	end
end

local function stadtVerwaltungsPreisUpdate()
	if guiComboBoxGetSelected(g_stadtgui["combo"]) == g_stadtgui["Personalausweis"] then
		guiSetText(g_stadtgui["preis"], "Preis: 50$")
	elseif 	guiComboBoxGetSelected(g_stadtgui["combo"]) == g_stadtgui["Arbeitserlaubnis"] then
		guiSetText(g_stadtgui["preis"], "Preis: 150$")
	end
end

function toggleStadtVerwaltungDokumente(toggle)
	initalizeStadtVerwaltungsGUI()
	if toggle then
		guiSetVisible(g_stadtgui["window"], true)
		showCursor(true)
		addEventHandler("onClientGUIClick", g_stadtgui["window"], stadtVerwaltungsGUIHandler)
		addEventHandler('onClientGUIComboBoxAccepted', g_stadtgui["combo"], stadtVerwaltungsPreisUpdate)
	else
		guiSetVisible(g_stadtgui["window"], false)
		showCursor(false)
		removeEventHandler("onClientGUIClick", g_stadtgui["window"], stadtVerwaltungsGUIHandler)
		removeEventHandler('onClientGUIComboBoxAccepted', g_stadtgui["combo"], stadtVerwaltungsPreisUpdate)
	end
end
