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



local items = {}
local rows = {}
local staticItems = {}

function toggleItemMenu(toggle)
	if toggle then
		guiSetVisible(g_itemgui["window"], true)
		showCursor(true)
		addEventHandler("onClientGUIClick", g_itemgui["window"], itemGUIWindowClick)
	else
		guiSetVisible(g_itemgui["window"], false)
		showCursor(false)
		removeEventHandler("onClientGUIClick", g_itemgui["window"], itemGUIWindowClick)
	end
end

function rebuildItemList()
	items = nil
	items = {}
	rows = nil
	rows = {}
	staticItems = nil
	staticItems = {}
	if g_itemgui["grid"] then destroyElement(g_itemgui["grid"]) end
	g_itemgui["grid"] = guiCreateGridList(0.0337,0.053,0.7725,0.9276,true,g_itemgui["window"])
	guiGridListSetSortingEnabled(g_itemgui["grid"], false)
	g_itemgui["itemcol"] = guiGridListAddColumn(g_itemgui["grid"],"Item",0.7)
	g_itemgui["anzcol"] = guiGridListAddColumn(g_itemgui["grid"],"Anzahl",0.2)
end

function addItemToList(dynamicID, staticID, name, destroyable, useable, giveable, icon)
	items[dynamicID] = {}
	items[dynamicID]["name"] = name
	items[dynamicID]["destroyable"] = destroyable
	items[dynamicID]["useable"] = useable
	items[dynamicID]["giveable"] = giveable
	items[dynamicID]["icon"] = icon
	
	--[[local row = guiGridListAddRow(g_itemgui["grid"], g_itemgui["itemcol"])
	guiGridListSetItemText(g_itemgui["grid"], row, g_itemgui["itemcol"], name, false, false)
	rows[row] = dynamicID
	items[dynamicID]["row"] = row--]]
	
	if not staticItems[staticID] then
		local row = guiGridListAddRow(g_itemgui["grid"], g_itemgui["itemcol"])
		guiGridListSetItemText(g_itemgui["grid"], row, g_itemgui["itemcol"], name, false, false)
		guiGridListSetItemText(g_itemgui["grid"], row, g_itemgui["anzcol"], "1", false, true)
		
		staticItems[staticID] = {}
		staticItems[staticID]["row"] = row
		staticItems[staticID]["dynamicID"] = {}
		staticItems[staticID]["dynamicID"][dynamicID] = true
	else
		staticItems[staticID]["dynamicID"][dynamicID] = true
		
		local anz = 0
		for i, j in pairs(staticItems[staticID]["dynamicID"]) do
			anz = anz + 1
		end
		guiGridListSetItemText(g_itemgui["grid"], staticItems[staticID]["row"], g_itemgui["anzcol"], tostring(anz), false, true)
	end
	
	
end

function removeItemFromList(dynamicID)
	items[dynamicID] = nil
	
	local anz = 0
	local staticID = 0
	for i, item in pairs(staticItems) do
		if item["dynamicID"][dynamicID] then 
			item["dynamicID"][dynamicID] = nil
			staticID = i
		end
	end
	
	if staticID == 0 then return false end
	
	for i, item in pairs(staticItems[staticID]["dynamicID"]) do
		anz = anz + 1
	end

	if anz < 1 then
		guiGridListRemoveRow(g_itemgui["grid"], staticItems[staticID]["row"])
		staticItems[staticID] = nil
	else
		guiGridListSetItemText(g_itemgui["grid"], staticItems[staticID]["row"], g_itemgui["anzcol"], tostring(anz), false, true)
	end
end

local function bindToggleItemMenu()
	if guiGetVisible(g_itemgui["window"]) then
		toggleItemMenu(false)
		guiSetVisible(g_itemgui["use"], false)
		guiSetVisible(g_itemgui["destroy"], false)
		guiSetVisible(g_itemgui["give"], false)
	else
		toggleItemMenu(true)
		guiSetVisible(g_itemgui["use"], false)
		guiSetVisible(g_itemgui["destroy"], false)		
		guiSetVisible(g_itemgui["give"], false)		
	end
end

function bindItemKeys()
	bindKey("x", "down", bindToggleItemMenu)
end

function itemGUIWindowClick(button, state)
	if button == "left" then		
		local selectedRow = guiGridListGetSelectedItem(g_itemgui["grid"])
		if selectedRow then
			if selectedRow ~= -1 then
				local staticID = 0
				for staticIDs, item in pairs(staticItems) do
					if item["row"] == selectedRow then
						staticID = staticIDs
						break
					end
				end
				
				if staticID ~= 0 then
					local itemID = 0
					--Nur eine dynamicID getten
					
					for dynamicIDs, i in pairs(staticItems[staticID]["dynamicID"]) do
						itemID = dynamicIDs
						break
					end

					if itemID then
						guiStaticImageLoadImage(g_itemgui["itemimage"], "./files/images/"..items[itemID]["icon"]..".png")
						
						if items[itemID]["destroyable"] then guiSetVisible(g_itemgui["destroy"], true)
						else guiSetVisible(g_itemgui["destroy"], false) end
						
						if items[itemID]["useable"] then guiSetVisible(g_itemgui["use"], true)
						else guiSetVisible(g_itemgui["use"], false) end

						if items[itemID]["giveable"] then guiSetVisible(g_itemgui["give"], true)
						else guiSetVisible(g_itemgui["give"], false) end							

						if source == g_itemgui["use"] or source == g_itemgui["destroy"] or source == g_itemgui["give"] then
							if source == g_itemgui["destroy"] then
								local anz = 0
								for i, item in pairs(staticItems[staticID]["dynamicID"]) do
									anz = anz + 1
								end
								
								if anz < 2 then
									--server.onPlayerItemDestroy(itemID)
									rpcCallServerFunction("onPlayerItemDestroy", itemID)
								else
									toggleItemMenu(false)	
									showDeleteItemGUI(true, staticID, anz)
									return true
								end
							end
							--if source == g_itemgui["use"] then server.onPlayerItemUse(itemID) end
							if source == g_itemgui["use"] then rpcCallServerFunction("onPlayerItemUse", itemID) end
							--if source == g_itemgui["give"] then server.onPlayerItemGive(itemID) end
							if source == g_itemgui["give"] then rpcCallServerFunction("onPlayerItemGive" ,itemID) end
							toggleItemMenu(false)	
							return true
						end					
					end
				end
			end	
		end
	end
end


------------------
local maxanz = -1
local theStaticID= -1
local toDelete = 0

local function inputHandlerRemove(button)
	if button == "left" then
		--Abort
		if source == g_removeItemGUI["abort"] then
			showDeleteItemGUI(false)
			return false
		end
		
		--Zerstören
		if source == g_removeItemGUI["do"] then
			if toDelete > 0 then
				--server.onPlayerItemDestroy(theStaticID, toDelete, true)
				rpcCallServerFunction("onPlayerItemDestroy" ,theStaticID, toDelete, true)
			end
			showDeleteItemGUI(false)
		end
	end
end

local function doScrollingRemoveGUI()
	--outputChatBox(tostring(guiScrollBarGetScrollPosition(g_removeItemGUI["scrollbar"])))
	local anz = round(maxanz / 100 * guiScrollBarGetScrollPosition(g_removeItemGUI["scrollbar"]))
	guiSetText(g_removeItemGUI["anz"], anz.." / "..maxanz)
	toDelete = anz
end

function showDeleteItemGUI(toggle, staticID, anz)
	initRemoveItemGUI()
	if toggle then
		showCursor(true)
		guiSetVisible(g_removeItemGUI["window"], true)
		maxanz = anz
		theStaticID = staticID
		addEventHandler("onClientGUIClick", g_removeItemGUI["window"], inputHandlerRemove)
		addEventHandler("onClientGUIScroll", g_removeItemGUI["scrollbar"], doScrollingRemoveGUI)
		guiScrollBarSetScrollPosition(g_removeItemGUI["scrollbar"], 0)
		guiSetText(g_removeItemGUI["anz"], "0 / "..anz)
	else
		showCursor(false)
		guiSetVisible(g_removeItemGUI["window"], false)
		maxanz = -1
		theStaticID = -1
		toDelete = 0
		removeEventHandler("onClientGUIClick", g_removeItemGUI["window"], inputHandlerRemove)
		removeEventHandler("onClientGUIScroll", g_removeItemGUI["scrollbar"], doScrollingRemoveGUI)
	end
end
