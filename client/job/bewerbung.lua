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



local textcache
local theJob

function toggleBewerbungsMenu(toggle, job)
	initalizeChefBewerbungsMenu()
	if toggle == true then		
		guiSetVisible(g_bewerbungViewer["window"], true)
		showCursor(true)
		textcache = {}
		addEventHandler("onClientGUIClick", g_bewerbungViewer["window"], bewerbungsHandler)
		g_bewerbungViewer["spielername"] = guiGridListAddColumn(g_bewerbungViewer["gridlist"], "Spielername", 0.9)
		theJob = job
	else
		guiGridListRemoveColumn(g_bewerbungViewer["gridlist"], g_bewerbungViewer["spielername"])
		guiSetVisible(g_bewerbungViewer["window"], false)
		showCursor(false)
		textcache = nil
		theJob = nil
		removeEventHandler('onClientGUIClick', g_bewerbungViewer["window"], bewerbungsHandler)
	end
end

function fillBewerbungsGridList(playername, text)
	--g_bewerbungViewer["gridlist"]

	if not textcache[playername] then
		local row = guiGridListAddRow(g_bewerbungViewer["gridlist"])

		guiGridListSetItemText(g_bewerbungViewer["gridlist"], row, g_bewerbungViewer["spielername"], tostring(playername), false, false)
		
		textcache[playername] = text
	end
end

function bewerbungsHandler(button, state, x, y)
	if button == "left" then
		if source == g_bewerbungViewer["gridlist"] then
			local item = guiGridListGetSelectedItems(g_bewerbungViewer["gridlist"])
			if item ~= nil and item[1] ~= nil and item[1]["row"] ~= nil then
				local playername = guiGridListGetItemText(g_bewerbungViewer["gridlist"], item[1]["row"], g_bewerbungViewer["spielername"])
				if playername then
					guiSetText(g_bewerbungViewer["text"], textcache[playername])
					return 
				end
			end	
		end
		
		if source == g_bewerbungViewer["close"] then
			toggleBewerbungsMenu(false)
			return
		end
		
		if source == g_bewerbungViewer["accept"] then
			--Bewerbung annehmen
			--guiGridListRemoveRow
			local item = guiGridListGetSelectedItems(g_bewerbungViewer["gridlist"])
			if item ~= nil and item[1] ~= nil and item[1]["row"] ~= nil then
				local playername = guiGridListGetItemText(g_bewerbungViewer["gridlist"], item[1]["row"], g_bewerbungViewer["spielername"])
				if playername then
					rpcCallServerFunction("handleBewerbung", true, playername, theJob)
					
					guiGridListRemoveRow(g_bewerbungViewer["gridlist"], item[1]["row"])
					guiSetText(g_bewerbungViewer["text"], " ")
					return 
				end	
			end	
		end
		
		if source == g_bewerbungViewer["decline"] then
			--Bewerbung ablehnen
			local item = guiGridListGetSelectedItems(g_bewerbungViewer["gridlist"])
			if item ~= nil and item[1] ~= nil and item[1]["row"] ~= nil then
				local playername = guiGridListGetItemText(g_bewerbungViewer["gridlist"], item[1]["row"], g_bewerbungViewer["spielername"])
				if playername then
					rpcCallServerFunction("handleBewerbung", false, playername, theJob)
					
					guiGridListRemoveRow(g_bewerbungViewer["gridlist"], item[1]["row"])
					guiSetText(g_bewerbungViewer["text"], " ")
					return
				end	
			end	
		end
	end
end
