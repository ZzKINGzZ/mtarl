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



function startCreateHouseClient(thePlayer)
	if thePlayer then
		initalizeCreateInteriorGUI()
		guiSetText ( g_cinterior["edit_user"], tostring(thePlayer) )
		guiSetVisible(g_cinterior["window"], true)
		addEventHandler("onClientGUIClick", g_cinterior["window"], CreateHouse)
		showCursor(true)
	end
end

function CreateHouse(button)
	if button == "left" then
		--Button Abbrechen
		if source == g_cinterior["button_ abbrechen"] then
			guiSetVisible(g_cinterior["window"], false)
			removeEventHandler("onClientGUIClick", g_cinterior["window"], CreateHouse)
			showCursor(false)
		end
		--Button Abbrechen
		if source == g_cinterior["button_ok"] then
			local groesse
			if guiRadioButtonGetSelected(g_cinterior["radio_1"]) then groesse = "S"
			elseif guiRadioButtonGetSelected(g_cinterior["radio_2"]) then groesse = "M"
			elseif guiRadioButtonGetSelected(g_cinterior["radio_3"]) then groesse = "L"
			elseif guiRadioButtonGetSelected(g_cinterior["radio_4"]) then groesse = "XL"
			end
			local preis = tonumber(guiGetText(g_cinterior["edit_preis"]))
			if preis and groesse then
				if preis > 0 then
					--server.createMaklerHouse(preis, groesse)
					rpcCallServerFunction("createMaklerHouse", preis, groesse)
				end
			else
				outputChatBox("Du hast keinen Preis angeben oder keine Gr"..ouml..""..szlig.."e ausgew"..auml.."hlt!", 255, 0, 0)
			end
			
			guiSetVisible(g_cinterior["window"], false)
			removeEventHandler("onClientGUIClick", g_cinterior["window"], CreateHouse)
			showCursor(false)
		end
	end
end
