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



function initalizeSpielmenu()
	bindKey("F2", "down", activateSpielMenu)
end	
addEventHandler('onClientResourceStart', getResourceRootElement(getThisResource()), initalizeSpielmenu)

function togglePlayerMenu(toggle)
	if toggle == true then
		guiSetVisible(g_spielmenu["window"], true)
		showCursor(true)
	else
		guiSetVisible(g_spielmenu["window"], false)
		showCursor(false)
	end
end

function activateSpielMenu(key, keyState)
	if not guiGetVisible(g_spielmenu["window"]) then
		togglePlayerMenu(true)
	else
		togglePlayerMenu(false)
	end	
end

function addPartei(partei, sitze)
	local text = guiGetText(g_spielmenu["parteienLabel"])
	text = text.."
"..partei.." mit "
	if sitze == 1 then
		text = text .. "1 Sitz"
	else
		text = text .. sitze .. " Sitzen"
	end
	guiSetText(g_spielmenu["parteienLabel"], text)
end

function addWahlPartei(parteiname)
	--initalizeWahlGUI()
	--outputChatBox(parteiname)
	guiComboBoxAddItem(g_wahlengui["combo"], parteiname)
end

function wahlePartei(button, state, x, y)
	if source == g_wahlengui["wahlen"] then 
		if button == "left" then
			local partei = guiComboBoxGetSelected(g_wahlengui["combo"])
			if partei ~= nil and partei ~= -1 then
				server.wahlPartei(guiComboBoxGetItemText(g_wahlengui["combo"], partei))
				toggleWahlen(false)
			end	
		end
	end	
end

function toggleWahlen(toggle)
	initalizeWahlGUI()
	if toggle == true then
		guiSetVisible(g_wahlengui["window"] , true)
		showCursor(true)
		addEventHandler('onClientGUIClick', g_wahlengui["wahlen"], wahlePartei)
	else
		guiSetVisible(g_wahlengui["window"] , false)
		showCursor(false)
		removeEventHandler('onClientGUIClick', g_wahlengui["wahlen"], wahlePartei)
	end
end
