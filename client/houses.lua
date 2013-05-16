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



local currenthouseid = 0
local currentpostid = 0
local postlist = {}

function showHousesMenu(toggle, houseid)
	currenthouseid = houseid
	if toggle == true then
		guiSetVisible(g_housegui["window"], true)
		showCursor(true)
		addEventHandler('onClientGUIClick', g_housegui["window"], doHouseInput)
	elseif toggle == false then
		guiSetVisible(g_housegui["window"], false)
		showCursor(false)
		removeEventHandler('onClientGUIClick', g_housegui["window"], doHouseInput)
	end
end

function doHouseInput(button, state, x, y)
	if button == "left" then
		if source == g_housegui["schloss"] then
			--Abschließen
			rpcCallServerFunction("lockHouse", currenthouseid)
		elseif source == g_housegui["betreten"] then
			--Betreten
			rpcCallServerFunction("enterHouse", currenthouseid)
			showHousesMenu(false, currenthouseid)
		elseif source == g_housegui["abort"] then
			--Abbrechen
			showHousesMenu(false, currenthouseid)
		elseif source == g_housegui["post"] then
			--Briefkasten
			showHousesMenu(false, currenthouseid)		
			showPostMenu(true, currenthouseid)
		end
	end
end

function houseOwnerEnable(toggle)
	if toggle == true then
		guiSetEnabled(g_housegui["schloss"], true)
		guiSetEnabled(g_housegui["post"], true)
		--guiSetEnabled(g_housegui["items"], true)
	elseif toggle == false then
		guiSetEnabled(g_housegui["schloss"], false)
		guiSetEnabled(g_housegui["post"], false)
		--guiSetEnabled(g_housegui["items"], false)
	end
end

function showPostMenu(toggle)
	initalizePostGUI()
	if toggle == true then
		guiSetVisible(g_postgui["window"], true)
		addEventHandler("onClientGUIClick", g_postgui["window"], doPostInput)
		showCursor(true)
		guiGridListClear(g_postgui["gridlist"])	
		rpcCallServerFunction("getHousePost")
	elseif toggle == false then
		guiSetVisible(g_postgui["window"], false)
		removeEventHandler("onClientGUIClick", g_postgui["window"], doPostInput)
		showCursor(false)
	end	
end

function showReadPostMenu(toggle, houseid, postid)
	initalizePostReadGUI()
	if toggle == true then
		guiSetVisible(g_postreadgui["window"], true)
		addEventHandler("onClientGUIClick", g_postreadgui["window"], doReadPost)
		showCursor(true)
		rpcCallServerFunction("getHousePostRead", postid)
		currentpostid = postid
	elseif toggle == false then
		guiSetVisible(g_postreadgui["window"], false)
		removeEventHandler("onClientGUIClick", g_postreadgui["window"], doReadPost)
		showCursor(false)
		currentpostid = postid
		clearPostRead()	
	end
end


function doPostInput(button, state, x, y)
	if source == g_postgui["abort"] then
		showPostMenu(false, currenthouseid)
	elseif source == g_postgui["gridlist"] then
		local row, col = guiGridListGetSelectedItem(g_postgui["gridlist"])
		local postid = guiGridListGetItemText(g_postgui["gridlist"], row, g_postgui["colPostID"])
		if postid and postid ~= nil and postid ~= " " and postid ~= "" then
			showPostMenu(false, currenthouseid)
			showReadPostMenu(true, currenthouseid, tonumber(postid))
		end	
	end
end

function clearPostRead()
	guiSetText(g_postreadgui["title"], "Titel wird geladen...")
	guiSetText(g_postreadgui["nachricht"], "Nachricht wird geladen...")
end

function addPostTitle(id, from, titel)
	local row = guiGridListAddRow (g_postgui["gridlist"])
	guiGridListSetItemText(g_postgui["gridlist"], row, g_postgui["colPostID"], tostring(id), false, false)	
	guiGridListSetItemText(g_postgui["gridlist"], row, g_postgui["colFrom"], tostring(from), false, false)
	guiGridListSetItemText(g_postgui["gridlist"], row, g_postgui["colTitel"], tostring(titel), false, false)	
end

function addReadPost(titel, post)
	guiSetText(g_postreadgui["nachricht"], tostring(post))
	guiSetText(g_postreadgui["title"], tostring(titel))
end

function doReadPost(button, state, x, y)
	if source == g_postreadgui["back"] then
		showReadPostMenu(false, currenthouseid, 0)
		showPostMenu(true, currenthouseid)
	elseif source == g_postreadgui["delete"] then
		showReadPostMenu(false, currenthouseid, currentpostid)
		rpcCallServerFunction("deletePost", true, currentpostid)
	end
end
