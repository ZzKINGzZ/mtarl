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



function initalizeFlightLizenz(toggle)
	initalizeFlightLizenzGUI()
	if toggle == true then
		guiSetVisible(g_flightlizenz["window"], true)
		showCursor(true)
		addEventHandler("onClientGUIClick", g_flightlizenz["window"], FlightLizenzHandler)
	else 
		guiSetVisible(g_flightlizenz["window"], false)
		showCursor(false)
		removeEventHandler("onClientGUIClick", g_flightlizenz["window"], FlightLizenzHandler)
	end
end

function FlightLizenzHandler(button)
	if button == "left" then
		--Button Abbrechen
		if source == g_flightlizenz["abbrechen"] then
			initalizeFlightLizenz(false)
			return
		end
		--Button OK
		if source == g_flightlizenz["ok"] then
			local toggle = true
			--server.setFlightLizenz(toggle)
			rpcCallServerFunction("setFlightLizenz", toggle)
			initalizeFlightLizenz(false)
			return
		end
	end
end
