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



local adminButtonClicked
local adminPlayerName
local adminPlayerCarID

function adminPlayerFillList()
	guiGridListClear(g_admingui["tabPlayerList"])
	if g_admingui["tabPlayerListCol"] then
		for id, player in ipairs(getElementsByType("player")) do
			rowp = guiGridListAddRow ( g_admingui["tabPlayerList"] )
			guiGridListSetItemText ( g_admingui["tabPlayerList"], rowp, g_admingui["tabPlayerListCol"], getPlayerName(player), false, false )
		end
	end
end

function adminPlayerSearch()
	if source == g_admingui["tabPlayerSearch"] then
		guiGridListClear(g_admingui["tabPlayerList"])
		local text = guiGetText(source)
		if text == "" then
			adminPlayerFillList()
		else
			for id, player in ipairs ( getElementsByType ( "player" ) ) do
				if (string.find(string.upper(getPlayerName(player)),string.upper(text),1,true)) then
					rowp = guiGridListAddRow ( g_admingui["tabPlayerList"] )
					guiGridListSetItemText ( g_admingui["tabPlayerList"], rowp, g_admingui["tabPlayerListCol"], getPlayerName(player), false, false )
				end
			end
		end 
	end
end

function adminPlayerClickList(button, state)
	if source == g_admingui["tabPlayerList"] then
		local player = guiGridListGetSelectedItem(g_admingui["tabPlayerList"])
		if player then
			local playername = guiGridListGetItemText(g_admingui["tabPlayerList"], player, 1)
			if playername then
				if playername ~= " " and playername ~= "" then
					rpcCallServerFunction("adminGetPlayerInfo", playername)
				end
			end
		end
	end
end

function adminFillPlayerInfo(name, money, bank, health, armor, skin, serial, veh, ip, version, carid, x, y, z)
	guiSetText (g_admingui["tabPlayerName"], tostring(name))
	guiSetText (g_admingui["tabPlayerMoney"], tostring(money).."$")
	guiSetText (g_admingui["tabPlayerBank"], tostring(bank).."$")
	guiSetText (g_admingui["tabPlayerHealth"], tostring(math.floor(health)).."%")
	guiSetText (g_admingui["tabPlayerArmor"], tostring(math.floor(armor)).."%")
	guiSetText (g_admingui["tabPlayerSkin"], tostring(skin))
	guiSetText (g_admingui["tabPlayerSerial"], tostring(serial))
	guiSetText (g_admingui["tabPlayerIP"], tostring(ip))
	guiSetText (g_admingui["tabPlayerVersion"], tostring(version))
	guiSetText (g_admingui["tabPlayerPos"], "X = "..tostring(x)..", Y = "..tostring(y)..", Z = "..tostring(z))
	if veh == true then
		guiSetVisible(g_admingui["tabPlayerVehicle"], false)
		guiSetVisible(g_admingui["tabPlayerButtonCar"], true)
		adminPlayerCarID = tonumber(carid)
	else
		guiSetVisible(g_admingui["tabPlayerVehicle"], true)
		guiSetVisible(g_admingui["tabPlayerButtonCar"], false)
	end
end

function adminPlayerClickButton(button, state)
	local name = guiGetText (g_admingui["tabPlayerName"])
	if name then
		if name ~= " " and name ~= "" then
			adminPlayerName = guiGetText (g_admingui["tabPlayerName"])
			if source == g_admingui["tabPlayerButtonBan"] then
				initalizeAdminGuiConfirm1()
				addEventHandler("onClientGUIClick", g_admingui["windowConfirm1"], adminPlayerClickButtonConfirm)
				addEventHandler("onClientGUIChanged", g_admingui["confirmReason1"], adminPlayerReasonChange)
				guiSetVisible(g_admingui["windowConfirm1"], true)
				guiSetVisible(g_admingui["window"], false)
				guiSetText(g_admingui["confirm1Text"], "M"..ouml.."chtest du den Spieler "..name.." wirklich Banen?")
				adminButtonClicked = "Ban"
			elseif source == g_admingui["tabPlayerButtonKick"] then
				initalizeAdminGuiConfirm1()
				addEventHandler("onClientGUIClick", g_admingui["windowConfirm1"], adminPlayerClickButtonConfirm)
				addEventHandler("onClientGUIChanged", g_admingui["confirm1Reason"], adminPlayerReasonChange)
				guiSetVisible(g_admingui["windowConfirm1"], true)
				guiSetVisible(g_admingui["window"], false)
				guiSetText(g_admingui["confirm1Text"], "M"..ouml.."chtest du den Spieler "..name.." wirklich Kicken?")
				adminButtonClicked = "Kick"
			elseif source == g_admingui["tabPlayerButtonMute"] then
				initalizeAdminGuiConfirm2()
				addEventHandler("onClientGUIClick", g_admingui["windowConfirm2"], adminPlayerClickButtonConfirm)
				guiSetVisible(g_admingui["windowConfirm2"], true)
				guiSetVisible(g_admingui["window"], false)
				guiSetText(g_admingui["confirm2Text"], "M"..ouml.."chtest du den Spieler "..name.." wirklich Muten/Entmuten?")
				adminButtonClicked = "Mute"
			elseif source == g_admingui["tabPlayerButtonJob"] then
				initalizeAdminGuiConfirm3()
				addEventHandler("onClientGUIClick", g_admingui["windowConfirm3"], adminPlayerClickButtonConfirm)
				addEventHandler("onClientGUIChanged", g_admingui["confirm3JobRank"], adminPlayerJobChange)
				addEventHandler("onClientGUIComboBoxAccepted", g_admingui["confirm3Job"], adminPlayerJobChange)
				guiSetVisible(g_admingui["windowConfirm3"], true)
				guiSetVisible(g_admingui["window"], false)
				guiSetText(g_admingui["confirm3Text"], "M"..ouml.."chtest du den Spieler "..name.." wirklich in einenem Job hinzuf"..uuml.."gen?")
				adminButtonClicked = "Job"
			elseif source == g_admingui["tabPlayerButtonFreeze"] then
				initalizeAdminGuiConfirm2()
				addEventHandler("onClientGUIClick", g_admingui["windowConfirm2"], adminPlayerClickButtonConfirm)
				guiSetVisible(g_admingui["windowConfirm2"], true)
				guiSetVisible(g_admingui["window"], false)
				guiSetText(g_admingui["confirm2Text"], "M"..ouml.."chtest du den Spieler "..name.." wirklich Freezen/Enzfreezen?")
				adminButtonClicked = "Freeze"
			elseif source == g_admingui["tabPlayerButtonMoney"] then
				initalizeAdminGuiConfirm4()
				addEventHandler("onClientGUIClick", g_admingui["windowConfirm4"], adminPlayerClickButtonConfirm)
				addEventHandler("onClientGUIChanged", g_admingui["confirm4Reason"], adminPlayerMoneyChange)
				addEventHandler("onClientGUIChanged", g_admingui["confirm4Amount"], adminPlayerMoneyChange)
				guiSetVisible(g_admingui["windowConfirm4"], true)
				guiSetVisible(g_admingui["window"], false)
				guiSetText(g_admingui["confirm4Text"], "M"..ouml.."chtest du den Spieler "..name.." wirklich Geld geben?")
				adminButtonClicked = "Money"
			elseif source == g_admingui["tabPlayerButtonSpawn"] then
				initalizeAdminGuiConfirm2()
				addEventHandler("onClientGUIClick", g_admingui["windowConfirm2"], adminPlayerClickButtonConfirm)
				guiSetVisible(g_admingui["windowConfirm2"], true)
				guiSetVisible(g_admingui["window"], false)
				guiSetText(g_admingui["confirm2Text"], "M"..ouml.."chtest du den Spawn von "..name.." wirklich speichern?")
				adminButtonClicked = "Spawn"
			elseif source == g_admingui["tabPlayerButtonHealth"] then
				initalizeAdminGuiConfirm2()
				addEventHandler("onClientGUIClick", g_admingui["windowConfirm2"], adminPlayerClickButtonConfirm)
				guiSetVisible(g_admingui["windowConfirm2"], true)
				guiSetVisible(g_admingui["window"], false)
				guiSetText(g_admingui["confirm2Text"], "M"..ouml.."chtest du den Spieler "..name.." wirklich heilen?")
				adminButtonClicked = "Health"
			elseif source == g_admingui["tabPlayerButtonTeam"] then
				initalizeAdminGuiConfirm8()
				addEventHandler("onClientGUIClick", g_admingui["windowConfirm8"], adminPlayerClickButtonConfirm)
				addEventHandler("onClientGUIComboBoxAccepted", g_admingui["confirm8Team"], adminPlayerTeamChange)
				guiSetVisible(g_admingui["windowConfirm8"], true)
				guiSetVisible(g_admingui["window"], false)
				guiSetText(g_admingui["confirm8Text"], "M"..ouml.."chtest du den Spieler "..name.." wirklich zum Team hinzuf"..uuml.."gen?")
				adminButtonClicked = "Team"
			elseif source == g_admingui["tabPlayerButtonCar"] then
				guiSetSelectedTab (g_admingui["tabPanel"], g_admingui["tabVeh"])
				local count = guiGridListGetRowCount(g_admingui["tabVehList"]) - 1
				for veh = 0, count, 1 do
					local vehID = guiGridListGetItemText(g_admingui["tabVehList"], veh, 1)
					if tonumber(vehID) == tonumber(adminPlayerCarID) then
						guiGridListSetSelectedItem (g_admingui["tabVehList"], veh, 1)
						triggerEvent("onClientGUIClick", g_admingui["tabVehList"])
						break
					end
				end
			end
		end
	end
end

function adminPlayerClickButtonConfirm(button, state)
	if source == g_admingui["confirm1ButtonYes"] then
		local reason = guiGetText(g_admingui["confirm1Reason"])
		rpcCallServerFunction("adminPlayerFunction", adminPlayerName, adminButtonClicked, reason)
		removeEventHandler("onClientGUIClick", g_admingui["windowConfirm1"], adminPlayerClickButtonConfirm)
		removeEventHandler("onClientGUIChanged", g_admingui["confirm1Reason"], adminPlayerReasonChange)
		guiSetEnabled(g_admingui["confirm1ButtonYes"], false)
		guiSetText(g_admingui["confirm1Reason"],"")
		guiSetVisible(g_admingui["windowConfirm1"], false)
		guiSetVisible(g_admingui["window"], true)
	elseif source == g_admingui["confirm1ButtonNo"] then
		removeEventHandler("onClientGUIClick", g_admingui["windowConfirm1"], adminPlayerClickButtonConfirm)
		removeEventHandler("onClientGUIChanged", g_admingui["confirm1Reason"], adminPlayerReasonChange)
		guiSetEnabled(g_admingui["confirm1ButtonYes"], false)
		guiSetText(g_admingui["confirm1Reason"],"")
		guiSetVisible(g_admingui["windowConfirm1"], false)
		guiSetVisible(g_admingui["window"], true)
	elseif source == g_admingui["confirm2ButtonYes"] then
		rpcCallServerFunction("adminPlayerFunction", adminPlayerName, adminButtonClicked)
		removeEventHandler("onClientGUIClick", g_admingui["windowConfirm2"], adminPlayerClickButtonConfirm)
		guiSetVisible(g_admingui["windowConfirm2"], false)
		guiSetVisible(g_admingui["window"], true)
	elseif source == g_admingui["confirm2ButtonNo"] then
		removeEventHandler("onClientGUIClick", g_admingui["windowConfirm2"], adminPlayerClickButtonConfirm)
		guiSetVisible(g_admingui["windowConfirm2"], false)
		guiSetVisible(g_admingui["window"], true)
	elseif source == g_admingui["confirm3ButtonYes"] then
		local rank = tonumber(guiGetText(g_admingui["confirm3JobRank"]))
		local job = guiComboBoxGetItemText (g_admingui["confirm3Job"], guiComboBoxGetSelected (g_admingui["confirm3Job"]))
		rpcCallServerFunction("adminPlayerFunction", adminPlayerName, adminButtonClicked, nil, job, rank)
		removeEventHandler("onClientGUIClick", g_admingui["windowConfirm3"], adminPlayerClickButtonConfirm)
		removeEventHandler("onClientGUIChanged", g_admingui["confirm3JobRank"], adminPlayerJobChange)
		removeEventHandler("onClientGUIComboBoxAccepted", g_admingui["confirm3Job"], adminPlayerJobChange)
		guiSetText(g_admingui["confirm3JobRank"],"")
		guiSetEnabled(g_admingui["confirm3ButtonYes"], false)
		guiSetVisible(g_admingui["windowConfirm3"], false)
		guiSetVisible(g_admingui["window"], true)
	elseif source == g_admingui["confirm3ButtonNo"] then
		removeEventHandler("onClientGUIClick", g_admingui["windowConfirm3"], adminPlayerClickButtonConfirm)
		removeEventHandler("onClientGUIChanged", g_admingui["confirm3JobRank"], adminPlayerJobChange)
		removeEventHandler("onClientGUIComboBoxAccepted", g_admingui["confirm3Job"], adminPlayerJobChange)
		guiSetText(g_admingui["confirm3JobRank"],"")
		guiSetEnabled(g_admingui["confirm3ButtonYes"], false)
		guiSetVisible(g_admingui["windowConfirm3"], false)
		guiSetVisible(g_admingui["window"], true)
	elseif source == g_admingui["confirm4ButtonYes"] then
		local reason = guiGetText(g_admingui["confirm4Reason"])
		local amount = tonumber(guiGetText(g_admingui["confirm4Amount"]))
		rpcCallServerFunction("adminPlayerFunction", adminPlayerName, adminButtonClicked, reason, nil, nil, amount)
		removeEventHandler("onClientGUIClick", g_admingui["windowConfirm4"], adminPlayerClickButtonConfirm)
		removeEventHandler("onClientGUIChanged", g_admingui["confirm4Reason"], adminPlayerMoneyChange)
		removeEventHandler("onClientGUIChanged", g_admingui["confirm4Amount"], adminPlayerMoneyChange)
		guiSetText(g_admingui["confirm4Reason"],"")
		guiSetText(g_admingui["confirm4Amount"],"")
		guiSetEnabled(g_admingui["confirm4ButtonYes"], false)
		guiSetVisible(g_admingui["windowConfirm4"], false)
		guiSetVisible(g_admingui["window"], true)
	elseif source == g_admingui["confirm4ButtonNo"] then
		removeEventHandler("onClientGUIClick", g_admingui["windowConfirm4"], adminPlayerClickButtonConfirm)
		removeEventHandler("onClientGUIChanged", g_admingui["confirm4Reason"], adminPlayerMoneyChange)
		removeEventHandler("onClientGUIChanged", g_admingui["confirm4Amount"], adminPlayerMoneyChange)
		guiSetText(g_admingui["confirm4Reason"],"")
		guiSetText(g_admingui["confirm4Amount"],"")
		guiSetEnabled(g_admingui["confirm4ButtonYes"], false)
		guiSetVisible(g_admingui["windowConfirm4"], false)
		guiSetVisible(g_admingui["window"], true)
		
	elseif source == g_admingui["confirm8ButtonYes"] then
		local rank = guiComboBoxGetItemText(g_admingui["confirm8Team"], guiComboBoxGetSelected(g_admingui["confirm8Team"]))
		rpcCallServerFunction("adminPlayerFunction", adminPlayerName, adminButtonClicked, nil, nil, rank, nil)
		removeEventHandler("onClientGUIClick", g_admingui["windowConfirm4"], adminPlayerClickButtonConfirm)
		removeEventHandler("onClientGUIComboBoxAccepted", g_admingui["confirm8Team"], adminTeamJobChange)
		guiSetEnabled(g_admingui["confirm8ButtonYes"], false)
		guiSetVisible(g_admingui["windowConfirm8"], false)
		guiSetVisible(g_admingui["window"], true)
	elseif source == g_admingui["confirm8ButtonNo"] then
		removeEventHandler("onClientGUIClick", g_admingui["windowConfirm8"], adminPlayerClickButtonConfirm)
		removeEventHandler("onClientGUIComboBoxAccepted", g_admingui["confirm8Team"], adminPlayerTeamChange)
		guiSetEnabled(g_admingui["confirm8ButtonYes"], false)
		guiSetVisible(g_admingui["windowConfirm8"], false)
		guiSetVisible(g_admingui["window"], true)
	end
end

function adminPlayerReasonChange()
	if source == g_admingui["confirm1Reason"] then
		local text = guiGetText(g_admingui["confirm1Reason"])
		if text then
			local length = string.len(text)
			if length > 3 then
				guiSetEnabled(g_admingui["confirm1ButtonYes"], true)
			else
				guiSetEnabled(g_admingui["confirm1ButtonYes"], false)
			end
		end
	end
end

function adminPlayerJobChange()
	if source == g_admingui["confirm3JobRank"] then
		local rank = tonumber(guiGetText(g_admingui["confirm3JobRank"]))
		if rank then
			if rank >= 0 then
				local job = guiComboBoxGetSelected (g_admingui["confirm3Job"])
				if job then
					if job ~= -1 then
						guiSetEnabled(g_admingui["confirm3ButtonYes"], true)
					end
				end
			else
				guiSetEnabled(g_admingui["confirm3ButtonYes"], false)
			end
		end
	elseif source == g_admingui["confirm3Job"] then
		local job = guiComboBoxGetSelected (g_admingui["confirm3Job"])
		if job then
			if job ~= -1 then
				local rank = tonumber(guiGetText(g_admingui["confirm3JobRank"]))
				if rank then
					if rank >= 0 then
						guiSetEnabled(g_admingui["confirm3ButtonYes"], true)
					end
				end
			else
				guiSetEnabled(g_admingui["confirm3ButtonYes"], false)
			end
		end
	end
end

function adminPlayerMoneyChange()
	if source == g_admingui["confirm4Reason"] then
		local text = guiGetText(g_admingui["confirm4Reason"])
		if text then
			local length = string.len(text)
			if length > 3 then
				local amount = tonumber(guiGetText(g_admingui["confirm4Amount"]))
				if amount then
					if amount >= 0 then
						guiSetEnabled(g_admingui["confirm4ButtonYes"], true)
					end
				end
			else
				guiSetEnabled(g_admingui["confirm4ButtonYes"], false)
			end
		end
	elseif source == g_admingui["confirm4Amount"] then
		local amount = tonumber(guiGetText(g_admingui["confirm4Amount"]))
		if amount then
			if amount >= 0 then
				local text = guiGetText(g_admingui["confirm4Reason"])
				if text then
					local length = string.len(text)
					if length > 3 then
						guiSetEnabled(g_admingui["confirm4ButtonYes"], true)
					end
				end
			else
				guiSetEnabled(g_admingui["confirm4ButtonYes"], false)
			end
		end
	end
end

function adminPlayerTeamChange()
	if source == g_admingui["confirm8Team"] then
		local rank = guiComboBoxGetSelected (g_admingui["confirm8Team"])
		if rank then
			if rank ~= -1 then
				guiSetEnabled(g_admingui["confirm8ButtonYes"], true)
			else
				guiSetEnabled(g_admingui["confirm8ButtonYes"], false)
			end
		end
	end
end
