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



local function onChat(message, messageType)
	if not g_playerstat[source] then
		cancelEvent()
		return
	end
	
	if messageType == 2 then
		cancelEvent()
		for id, player in ipairs(getElementsByType("player")) do
			if g_playerstat[player]["Level"] == "Supporter" or g_playerstat[player]["Level"] == "Team" or g_playerstat[player]["Level"] == "Admin" then
				local msg = tostring("(Team) "..getPlayerName(source)..": "..message)
				outputChatBox(msg, player, 173, 255, 47, false)
			end
		end
	elseif messageType == 0 then
		cancelEvent()
		if g_playerstat[source]["un"] == 0 and g_playerstat[source]["jc"] == 0 then
			if g_playerstat[source]["Level"] == "Supporter" then
				local msg = tostring("#00FF00"..getPlayerName(source)..": #FFF5EE"..message)
				outputChatBox(msg, getRootElement(), 0, 0, 0, true)
				outputServerLog("CHAT: "..getPlayerName(source)..": "..message)
			elseif g_playerstat[source]["Level"] == "Team" then
				local msg = tostring("#FF8C00"..getPlayerName(source)..": #FFF5EE"..message)
				outputChatBox(msg, getRootElement(), 0, 0, 0, true)
				outputServerLog("CHAT: "..getPlayerName(source)..": "..message)
			elseif g_playerstat[source]["Level"] == "Admin" then
				local msg = tostring("#FF0000"..getPlayerName(source)..": #FFF5EE"..message)
				outputChatBox(msg, getRootElement(), 0, 0, 0, true)
				outputServerLog("CHAT: "..getPlayerName(source)..": "..message)
			else
				local msg = tostring("#FFF5EE"..getPlayerName(source)..": "..message)
				outputChatBox(msg, getRootElement(), 0, 0, 0, true)
				outputServerLog("CHAT: "..getPlayerName(source)..": "..message)
			end
		end
		if g_playerstat[source]["un"] == 1 then
			local px, py, pz = getElementPosition(source)
			for i,player in ipairs(getElementsByType("player")) do 
				local x, y, z = getElementPosition(player)
				if isPlayerInBall(player, px, py, pz, 25) then
					local msg = tostring("#F4A460 [UC]"..getPlayerName(source)..": "..message)
					outputChatBox(msg, player, 0, 0, 0, true)
					outputServerLog("UC: "..getPlayerName(source)..": "..message)
				end
			end
		end
		if g_playerstat[source]["jc"] == 1 then
			if isPlayerActiveInAnyJob(source) then
				local job = getPlayerActiveJob(source)
				for i,player in ipairs(getElementsByType("player")) do
					if job == getPlayerActiveJob(player) then
						local msg = tostring("#20B2AA [JC]"..getPlayerName(source)..": "..message)
						outputChatBox(msg, player, 0, 0, 0, true)
						outputServerLog("JC: "..getPlayerName(source)..": "..message)
					end
				end
			end
		end
	elseif messageType == 1 then
		if g_playerstat[source]["Level"] ~= "Supporter" or g_playerstat[source]["Level"] ~= "Team" or g_playerstat[source]["Level"] ~= "Admin" then
			cancelEvent()
		end
	end	
end
addEventHandler("onPlayerChat", getRootElement(), onChat)

function turnUmgebungsChat(playerSource, commandName)
	if g_playerstat[playerSource]["un"] == 0 then
		g_playerstat[playerSource]["un"] = 1
		g_playerstat[playerSource]["jc"] = 0
		outputChatBox(g_colors["green"].."Umgebungschat aktiviert!", playerSource, 255, 255, 255, true)
	else
		g_playerstat[playerSource]["un"] = 0
		outputChatBox(g_colors["green"].."Umgebungschat deaktiviert!", playerSource, 255, 255, 255, true)
	end
end
addCommandHandler("un", turnUmgebungsChat)
addCommandHandler("uc", turnUmgebungsChat)

function turnJobChat(playerSource, commandName)
	if g_playerstat[playerSource]["jc"] == 0 then
		g_playerstat[playerSource]["jc"] = 1
		g_playerstat[playerSource]["un"] = 0
		outputChatBox(g_colors["green"].."Jobchat aktiviert!", playerSource, 255, 255, 255, true)
	else
		g_playerstat[playerSource]["jc"] = 0
		outputChatBox(g_colors["green"].."Jobchat deaktiviert!", playerSource, 255, 255, 255, true)
	end
end
addCommandHandler("jc", turnJobChat)
