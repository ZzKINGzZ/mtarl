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



local players = 0
local onlineTime = "Keine Daten vorhanden!"
local maxPlayers = "0"

function initalizeScoreboard()
	bindKey("tab", "both", toggleScoreboardByKey)
end
addEventHandler("onClientResourceStart", getResourceRootElement(), initalizeScoreboard)

function setServerOnlineTime(time)
	onlineTime = time
end

function setServerMaxPlayers(players)
	maxPlayers = tostring(players)
end

function toggleScoreboardByKey(key, keyState)
	if key == "tab" then
		if keyState == "down" then
			showScoreboard()
		else
			unshowScoreboard()
		end
	end
end

function showScoreboard()
	guiSetVisible(g_scoreboard["window"], true)
	g_scoreboard["gridlist"] = guiCreateGridList(0.0181,0.1204,0.9638,0.8464, true, g_scoreboard["window"])
	guiGridListSetSelectionMode(g_scoreboard["gridlist"], 1)
	local name = guiGridListAddColumn(g_scoreboard["gridlist"], "Name", 0.2)
	local handy = guiGridListAddColumn(g_scoreboard["gridlist"], "Handynummer", 0.2)
	local dienst = guiGridListAddColumn(g_scoreboard["gridlist"], "Dienst", 0.2)
	local online = guiGridListAddColumn(g_scoreboard["gridlist"], "Online seit", 0.2)
	local ping = guiGridListAddColumn(g_scoreboard["gridlist"], "Ping", 0.17)
	
	for i, player in ipairs(getElementsByType("player")) do
		players = players + 1
		guiSetText(g_scoreboard["label_spieler"], "Spieler: "..players.."/"..maxPlayers)
		guiSetText(g_scoreboard["label_online"], "MTA:RL gestartet seit: "..onlineTime)		
		
		local curDienst = getElementData(player, "ScoreboardDienst")
		local onlineSince = getElementData(player, "ScoreboardOnline")
		
		if curDienst and onlineSince then
			local row = guiGridListAddRow(g_scoreboard["gridlist"])
		
			guiGridListSetItemText(g_scoreboard["gridlist"], row, name, getPlayerName(player), false, false)
			guiGridListSetItemColor(g_scoreboard["gridlist"], row, name, getElementData(player, "ScoreboardNameR"), getElementData(player, "ScoreboardNameG"), getElementData(player, "ScoreboardNameB"))

			guiGridListSetItemText(g_scoreboard["gridlist"], row, dienst, curDienst, false, false)
			guiGridListSetItemColor(g_scoreboard["gridlist"], row, dienst, getElementData(player, "ScoreboardDienstR"), getElementData(player, "ScoreboardDienstG"), getElementData(player, "ScoreboardDienstB"))
			
			guiGridListSetItemText(g_scoreboard["gridlist"], row, online, onlineSince, false, false)
			guiGridListSetItemText(g_scoreboard["gridlist"], row, ping, tostring(getPlayerPing(player)), false, false)
			guiGridListSetItemText(g_scoreboard["gridlist"], row, handy, getElementData(player, "ScoreboardHandynummer"), false, false)
		end
	end
end

function unshowScoreboard()
	guiSetVisible(g_scoreboard["window"], false)
	if g_scoreboard["gridlist"] then destroyElement(g_scoreboard["gridlist"]) end
	players = 0
end
