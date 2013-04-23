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



local toggle = false

function toggleAdminMenu()
	if toggle == false then
		toggle = true
		initalizeAdminGui()
		guiSetVisible(g_admingui["window"], true)
		showCursor(true)
		
		adminPlayerFillList()
		
		addEventHandler("onClientGUITabSwitched", g_admingui["window"], changeAdminTab)
		
		addEventHandler("onClientPlayerJoin", getRootElement(), updateAdminMenu)
		addEventHandler("onClientPlayerQuit", getRootElement(), updateAdminMenu)
		addEventHandler("onClientGUIChanged", g_admingui["tabPlayerSearch"], adminPlayerSearch)
		addEventHandler("onClientGUIClick", g_admingui["tabPlayerList"], adminPlayerClickList)
		addEventHandler("onClientGUIClick", g_admingui["window"], adminPlayerClickButton)
		
		addEventHandler("onClientGUIChanged", g_admingui["tabVehSearch"], adminVehSearch)
		addEventHandler("onClientGUIClick", g_admingui["tabVehList"], adminVehClickList)
		addEventHandler("onClientGUIClick", g_admingui["window"], adminVehClickButton)
		
		--addEventHandler("onClientGUIClick", g_admingui["tabWlButtonAdd"], adminWlClickButton)
		--addEventHandler("onClientGUIClick", g_admingui["tabWlButtonDel"], adminWlClickButton)
		
		addEventHandler("onClientGUIClick", g_admingui["tabPostButtonSend"], adminPostClickButton)
	elseif toggle == true then
		toggle = false
		guiSetVisible(g_admingui["window"], false)
		showCursor(false)
		adminPlayerClear()
		adminVehClear()
		adminWLClear()
		adminPostClear()
		
		removeEventHandler("onClientGUITabSwitched", g_admingui["window"], changeAdminTab)
		
		removeEventHandler("onClientPlayerJoin", getRootElement(), updateAdminMenu)
		removeEventHandler("onClientPlayerQuit", getRootElement(), updateAdminMenu)
		removeEventHandler("onClientGUIChanged", g_admingui["tabPlayerSearch"], adminPlayerSearch)
		removeEventHandler("onClientGUIClick", g_admingui["tabPlayerList"], adminPlayerClickList)
		removeEventHandler("onClientGUIClick", g_admingui["window"], adminPlayerClickButton)
		
		removeEventHandler("onClientGUIChanged", g_admingui["tabVehSearch"], adminVehSearch)
		removeEventHandler("onClientGUIClick", g_admingui["tabVehList"], adminVehClickList)
		removeEventHandler("onClientGUIClick", g_admingui["window"], adminVehClickButton)
		
		--removeEventHandler("onClientGUIClick", g_admingui["tabWlButtonAdd"], adminWlClickButton)
		--removeEventHandler("onClientGUIClick", g_admingui["tabWlButtonDel"], adminWlClickButton)
		
		removeEventHandler("onClientGUIClick", g_admingui["tabPostButtonSend"], adminPostClickButton)
		
		guiSetSelectedTab(g_admingui["tabPanel"], g_admingui["tabPlayer"])
	end
end

function updateAdminMenu()
	adminPlayerClear()
	adminPlayerFillList()
end

function adminPlayerClear()
	guiSetText(g_admingui["tabPlayerSearch"], "")
	guiSetText(g_admingui["tabPlayerName"], "")
	guiSetText(g_admingui["tabPlayerMoney"], "")
	guiSetText(g_admingui["tabPlayerBank"], "")
	guiSetText(g_admingui["tabPlayerHealth"], "")
	guiSetText(g_admingui["tabPlayerArmor"], "")
	guiSetText(g_admingui["tabPlayerSkin"], "")
	guiSetText(g_admingui["tabPlayerSerial"], "")
	guiSetText(g_admingui["tabPlayerIP"], "")
	guiSetText(g_admingui["tabPlayerVersion"], "")
	guiSetVisible(g_admingui["tabPlayerVehicle"], false)
	guiSetVisible(g_admingui["tabPlayerButtonCar"], false)
end

function adminVehClear()
	guiSetText(g_admingui["tabVehID"], "")
	guiSetText(g_admingui["tabVehName"], "")
	guiSetText(g_admingui["tabVehHealth"], "")
	guiSetText(g_admingui["tabVehKM"], "")
	guiSetText(g_admingui["tabVehOwner"], "")
	guiSetText(g_admingui["tabVehTemp"], "")
	guiSetText(g_admingui["tabVehTank"], "")
	guiSetText(g_admingui["tabVehProp"], "")
	guiSetText(g_admingui["tabVehPos"], "")
end

function adminWLClear()
	-- This two GUI elements are disabled, so disable they here, too
	-- guiSetText(g_admingui["tabWlAddEdit"], "")
	-- guiSetText(g_admingui["tabWlPinEdit"], "PIN:")
end

function adminPostClear()
	guiSetText(g_admingui["tabPostSenderEdit"], "MTA:RL Bot")
	guiSetText(g_admingui["tabPostSubjectEdit"], "")
	guiSetText(g_admingui["tabPostContentEdit"], "")
	guiSetText(g_admingui["tabPostErrorLabel"], "Fehler!")
	guiSetVisible(g_admingui["tabPostErrorLabel"], false)
end

function changeAdminTab(selectedTab)
	if selectedTab == g_admingui["tabVeh"] then
		adminVehFillList()
	elseif selectedTab == g_admingui["tabWL"] then
		guiGridListClear(g_admingui["tabWlList"])
		rpcCallServerFunction("adminGetWhitelist")	
	end	
end

function adminFillJobList(job)
	guiComboBoxAddItem(g_admingui["confirm3Job"], job)
end
