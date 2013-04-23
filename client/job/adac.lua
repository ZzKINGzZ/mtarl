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



local points = 0
local state = "hoch"
local done

function adacStartMiniGame(loss, car)
	initalizeADACGui()
	points = tonumber(loss)
	guiSetVisible(g_ADACgui["Progress"], true)
	guiSetVisible(g_ADACgui["Taste"], true)
	state = "hoch"
	done = 0
	guiSetText(g_ADACgui["Taste"], "Hoch!")
	bindKey("arrow_u", "down", adacMiniGameHandler)
	bindKey("arrow_d", "down", adacMiniGameHandler)
	toggleAllControls(false, true, false)
end

function adacStopMiniGame()
	points = 0
	guiSetVisible(g_ADACgui["Progress"], false)
	guiSetVisible(g_ADACgui["Taste"], false)
	state = "hoch"
	guiSetText(g_ADACgui["Taste"], "")
	unbindKey("arrow_u", "down", adacMiniGameHandler)
	unbindKey("arrow_d", "down", adacMiniGameHandler)	
	toggleAllControls(true, true, false)
end

function adacMiniGameHandler(key, keyState)
	
	if key == "arrow_d" then
		if state == "runter" then
			done = done + 1
			state = "hoch"
			guiSetText(g_ADACgui["Taste"], "Hoch!")
		end		
	elseif key == "arrow_u" then
		if state == "hoch" then
			done = done + 1
			state = "runter"
			guiSetText(g_ADACgui["Taste"], "Runter!")
		end	
	end
	
	guiProgressBarSetProgress(g_ADACgui["Progress"], 100/points*done)
	
	if points == done then
		rpcCallServerFunction("adacRepairVehicleDone", points)
		adacStopMiniGame()
	end
end
