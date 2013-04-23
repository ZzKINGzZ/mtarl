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



local job = false

function toggleChefMenu(toggle, jobName)
	initalizeChefOptionsGUI()
	if toggle == true then		
		guiSetVisible(g_chefoptions["window"], true)
		showCursor(true)		
		addEventHandler('onClientGUIClick', g_chefoptions["window"], doChefOptionInput)
		job = jobName
	else
		guiSetVisible(g_chefoptions["window"], false)
		showCursor(false)		
		removeEventHandler('onClientGUIClick', g_chefoptions["window"], doChefOptionInput)
	end
end

function doChefOptionInput(button, state, x, y)
	if source == g_chefoptions["bewerbungen"] then
		toggleChefMenu(false)
		rpcCallServerFunction("toggleBewerbungMenu", true, job)
	elseif source == g_chefoptions["mitarbeiter"] then
		toggleChefMenu(false)
		rpcCallServerFunction("showRankMenu", job)
	elseif source == g_chefoptions["abort"] then
		toggleChefMenu(false)
	end
end
