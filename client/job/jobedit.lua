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



local job

function showJobEditWindow(toggle, sjob)
	if toggle == true then
		initalizeJobEditGUI()
		job = sjob
		guiSetVisible(g_jobeditgui["window"], true)	
		showCursor(true)
		
		guiGridListRemoveColumn(g_jobeditgui["playergridlist"], g_jobeditgui["playercol"])
		g_jobeditgui["playercol"] = guiGridListAddColumn(g_jobeditgui["playergridlist"], "Spieler", 1)
		guiGridListRemoveColumn(g_jobeditgui["rankgridlist"], g_jobeditgui["rankcol"])
		g_jobeditgui["rankcol"] = guiGridListAddColumn(g_jobeditgui["rankgridlist"], "Rank", 1)
		
		addEventHandler('onClientGUIClick', g_jobeditgui["window"], doJobEditInput)
	else
		guiSetVisible(g_jobeditgui["window"], false)
		removeEventHandler('onClientGUIClick', g_jobeditgui["window"], doJobEditInput)		
		showCursor(false)
	end
end

function fillJobEditGridlistWithPlayer(playername)
	local row = guiGridListAddRow(g_jobeditgui["playergridlist"])
	
	guiGridListSetItemText(g_jobeditgui["playergridlist"], row, g_jobeditgui["playercol"], playername, false, false)
end

function fillJobEditGridlistWithRank(rankname)
	local row = guiGridListAddRow(g_jobeditgui["rankgridlist"])
	
	guiGridListSetItemText(g_jobeditgui["rankgridlist"], row, g_jobeditgui["rankcol"], rankname, false, false)
end

function doJobEditInput(button, state, x, y)
	if button == "left" then
		if source == g_jobeditgui["accept"] then
			local row = guiGridListGetSelectedItem(g_jobeditgui["playergridlist"])
			local playername = guiGridListGetItemText(g_jobeditgui["playergridlist"], row, g_jobeditgui["playercol"])	

			local row2 = guiGridListGetSelectedItem(g_jobeditgui["rankgridlist"])
			local rankname = guiGridListGetItemText(g_jobeditgui["rankgridlist"], row2, g_jobeditgui["rankcol"])

			if playername and rankname and playername ~= " " and rankname ~= " " then
				--server.changePlayerJob(job, playername, rankname)
				rpcCallServerFunction("changePlayerJob", job, playername, rankname)
				showJobEditWindow(false)
			else
				outputChatBox("Du hast vergessen einen Spieler oder Rank auszuwaehlen!")
			end
		end
		if source == g_jobeditgui["abort"] then
			showJobEditWindow(false)
		end
	end
end
