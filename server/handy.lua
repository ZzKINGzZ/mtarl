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



rpcRegisterGlobalFunction("callNumber")
rpcRegisterGlobalFunction("endCall")

local activenumber = {}
local playercall = {}
g_handystat = {}
g_handystat["active"] = {}

function callNumber(number, typ) --typen old, new
	--Jobnummern
	local number = tostring(number)
	--Polizei
	if number == "110" then
		rpcCallClientFunction(client, "setCallCancel", false)
		rpcCallClientFunction(client, "setHandyText", "Rufe 110...", false)
		activenumber[client] = 110
		rpcCallClientFunction(client, "setCallCancel", true)
		local red, green, blue = getColorFromString(g_colors["lightblue"])
		g_playerstat[client]["Blip"] = createBlipAttachedTo(client, 0, 3, red, green, blue, 155, 0, 99999, client)
		setElementVisibleTo(g_playerstat[client]["Blip"], getRootElement(), false)
		setElementVisibleTo(g_playerstat[client]["Blip"], client, true)
		for i,player in ipairs(getElementsByType("player")) do 
			if isPlayerActiveInJob(player, 4) then
				setElementVisibleTo(g_playerstat[client]["Blip"], player, true)
				local l_playerX, l_playerY, l_playerZ = getElementPosition(player);
				outputChatBox(g_colors["lightblue"].."[Einsatzchat] "..getPlayerName(client).." hat die Polizei von "..g_colors["red"]..getZoneName(l_playerX, l_playerY, l_playerZ)..g_colors["lightblue"].." aus angefordert!", player, 0, 0, 0, true)
			end	
		end
		return false
	end
	
	--Feuerwehr
	if number == "112" then
		rpcCallClientFunction(client, "setCallCancel", false)
		rpcCallClientFunction(client, "setHandyText", "Rufe 112...", false)
		activenumber[client] = 112
		rpcCallClientFunction(client, "setCallCancel", true)
		local red, green, blue = getColorFromString(g_colors["red"])
		g_playerstat[client]["Blip"] = createBlipAttachedTo(client, 0, 3, red, green, blue, 155, 0, 99999, client)
		setElementVisibleTo(g_playerstat[client]["Blip"], getRootElement(), false)
		setElementVisibleTo(g_playerstat[client]["Blip"], client, true)
		for i,player in ipairs(getElementsByType("player")) do 
			if isPlayerActiveInJob(player, 1) then
				setElementVisibleTo(g_playerstat[client]["Blip"], player, true)
				local l_playerX, l_playerY, l_playerZ = getElementPosition(player);
				outputChatBox(g_colors["red"].."[Einsatzchat] "..getPlayerName(client).." hat die Feuerwehr von "..g_colors["orange"]..getZoneName(l_playerX, l_playerY, l_playerZ)..g_colors["red"].." aus angefordert!", player, 0, 0, 0, true)
			end	
		end				
		return false
	end
	
	--ADAC
	if number == "255" then
		rpcCallClientFunction(client, "setCallCancel", false)
		rpcCallClientFunction(client, "setHandyText", "Rufe 255...", false)
		activenumber[client] = 255
		rpcCallClientFunction(client, "setCallCancel", true)
		local red, green, blue = getColorFromString(g_colors["orange"])
		g_playerstat[client]["Blip"] = createBlipAttachedTo(client, 0, 3, red, green, blue, 155, 0, 99999, client)	
		setElementVisibleTo(g_playerstat[client]["Blip"], getRootElement(), false)
		setElementVisibleTo(g_playerstat[client]["Blip"], client, true)
		for i,player in ipairs(getElementsByType("player")) do 
			if isPlayerActiveInJob(player, 5) then
				setElementVisibleTo(g_playerstat[client]["Blip"], player, true)
				local l_playerX, l_playerY, l_playerZ = getElementPosition(player);
				outputChatBox(g_colors["orange"].."[Eingehender Anruf] "..getPlayerName(client).." hat den ADAC von "..g_colors["red"]..getZoneName(l_playerX, l_playerY, l_playerZ)..g_colors["orange"].." aus angefordert!", player, 0, 0, 0, true)
			end	
		end				
		return false
	end	
	
	--Taxi
	if number == "321" then
		rpcCallClientFunction(client, "setCallCancel", false)
		rpcCallClientFunction(client, "setHandyText", "Rufe 321...", false)
		activenumber[client] = 255
		rpcCallClientFunction(client, "setCallCancel", true)
		local red, green, blue = getColorFromString(g_colors["yellow"])
		g_playerstat[client]["Blip"] = createBlipAttachedTo(client, 0, 3, red, green, blue, 155, 0, 99999, client)
		setElementVisibleTo(g_playerstat[client]["Blip"], getRootElement(), false)
		setElementVisibleTo(g_playerstat[client]["Blip"], client, true)
		for i,player in ipairs(getElementsByType("player")) do 
			if isPlayerActiveInJob(player, 7) then
				setElementVisibleTo(g_playerstat[client]["Blip"], player, true)
				local l_playerX, l_playerY, l_playerZ = getElementPosition(player);
				outputChatBox(g_colors["yellow"].."[Eingehender Anruf] "..getPlayerName(client).." hat ein Taxi von "..g_colors["red"]..getZoneName(l_playerX, l_playerY, l_playerZ)..g_colors["yellow"].." aus angefordert!", player, 0, 0, 0, true)
			end	
		end				
		return false
	end	

	--Medic
	if number == "111" then
		rpcCallClientFunction(client, "setCallCancel", false)
		rpcCallClientFunction(client, "setHandyText", "Rufe 111...", false)
		activenumber[client] = 111
		rpcCallClientFunction(client, "setCallCancel", true)
		local red, green, blue = getColorFromString(g_colors["green"])
		g_playerstat[client]["Blip"] = createBlipAttachedTo(client, 0, 3, red, green, blue, 155, 0, 99999, client)
		setElementVisibleTo(g_playerstat[client]["Blip"], getRootElement(), false)
		setElementVisibleTo(g_playerstat[client]["Blip"], client, true)
		for i,player in ipairs(getElementsByType("player")) do 
			if isPlayerActiveInJob(player, 2) then
				setElementVisibleTo(g_playerstat[client]["Blip"], player, true)
				local l_playerX, l_playerY, l_playerZ = getElementPosition(player);
				outputChatBox(g_colors["green"].."[Eingehender Anruf] "..getPlayerName(client).." hat einen Medic von "..g_colors["red"]..getZoneName(l_playerX, l_playerY, l_playerZ)..g_colors["green"].." aus angefordert!", player, 0, 0, 0, true)
			end	
		end				
		return false
	end			
	
	--Easter Eggs
	if number == "5947" then
		local text = "<Tim0> Das liegt oestlich vom Aequator, du noob"
		rpcCallClientFunction(client, "setHandyText", text, false)
		activenumber[client] = 5947
		return false
	end
	
	--Pr"..uuml.."fe ob er sich selbst anruft oder andere
	if typ == "old" then
		if g_handystat["active"][tonumber(number)] then
			rpcCallClientFunction(client, "setCallCancel", false)
			rpcCallClientFunction(client, "setHandyText", "Rufe "..tostring(number).."...", false)	
			rpcCallClientFunction(client, "setCallCancel", true)
			local red = math.random(255)
			local green = math.random(255)
			local red = math.random(255)
			g_playerstat[client]["Blip"] = createBlipAttachedTo(client, 0, 3, red, green, blue, 155, 0, 99999, client)
			setElementVisibleTo(g_playerstat[client]["Blip"], getRootElement(), false)
			setElementVisibleTo(g_playerstat[client]["Blip"], g_handystat["active"][tonumber(number)], true)
			setElementVisibleTo(g_playerstat[client]["Blip"], client, true)
			outputChatBox(getPlayerName(client).." ruft dich an und ist f"..uuml.."r dich sichtbar!", g_handystat["active"][tonumber(number)], red, green, blue, false)
			outputChatBox(getPlayerName(g_handystat["active"][tonumber(number)]).." hat deinen Anruf angenommen!", client, red, green, blue, false)
			playercall[client] = 1
			activenumber[client] = tonumber(number)
		else
			rpcCallClientFunction(client, "setHandyText", "Kein Anschluss unter dieser Nummer!", false)	
		end
	end
	
end

function endCall()
	if not activenumber[client] then
		return false
	end
	
	--Verkehrs
	if activenumber[client] == 110 then
		activenumber[client] = nil
		if g_playerstat[client]["Blip"] then destroyElement(g_playerstat[client]["Blip"]) end
		g_playerstat[client]["Blip"] = nil
		for i,player in ipairs(getElementsByType("player")) do 
			if isPlayerActiveInJob(player, 4) then
				outputChatBox(g_colors["lightblue"]..getPlayerName(client).." ben"..ouml.."tigt die Verkehrspolizei nicht mehr", player, 0, 0, 0, true)
			end
		end
		return
	end	
		
	--Feuerwehr
	if activenumber[client] == 112 then
		activenumber[client] = nil
		if g_playerstat[client]["Blip"] then destroyElement(g_playerstat[client]["Blip"]) end
		g_playerstat[client]["Blip"] = nil
		for i,player in ipairs(getElementsByType("player")) do 
			if isPlayerActiveInJob(player, 1) then
				outputChatBox(g_colors["red"]..getPlayerName(client).." ben"..ouml.."tigt die Feuerwehr nicht mehr", player, 0, 0, 0, true)
			end
		end
		return
	end
	
	--ADAC
	if activenumber[client] == 255 then
		activenumber[client] = nil
		if g_playerstat[client]["Blip"] then destroyElement(g_playerstat[client]["Blip"]) end
		g_playerstat[client]["Blip"] = nil
		for i,player in ipairs(getElementsByType("player")) do 
			if isPlayerActiveInJob(player, 5) then
				outputChatBox(g_colors["orange"].."[Anruf]"..getPlayerName(client).." ben"..ouml.."tigt den ADAC nicht mehr", player, 0, 0, 0, true)
			end
		end
		return
	end	
	
	--Taxi
	if activenumber[client] == 321 then
		activenumber[client] = nil
		if g_playerstat[client]["Blip"] then destroyElement(g_playerstat[client]["Blip"]) end
		g_playerstat[client]["Blip"] = nil
		for i,player in ipairs(getElementsByType("player")) do 
			if isPlayerActiveInJob(player, 7) then
				outputChatBox(g_colors["yellow"].."[Anruf]"..getPlayerName(client).." ben"..ouml.."tigt den ADAC nicht mehr", player, 0, 0, 0, true)
			end
		end
		return
	end	
	
	--Medic
	if activenumber[client] == 111 then
		activenumber[client] = nil
		if g_playerstat[client]["Blip"] then destroyElement(g_playerstat[client]["Blip"]) end
		g_playerstat[client]["Blip"] = nil
		for i,player in ipairs(getElementsByType("player")) do 
			if isPlayerActiveInJob(player, 2) then
				outputChatBox(g_colors["green"].."[Anruf]"..getPlayerName(client).." ben"..ouml.."tigt keinen Medic mehr", player, 0, 0, 0, true)
			end
		end
		return
	end		
	
	if playercall[client] == 1 then
		if g_playerstat[client]["Blip"] then destroyElement(g_playerstat[client]["Blip"]) end
		g_playerstat[client]["Blip"] = nil
		playercall[client] = nil
		local playerinfo = g_handystat["active"][tonumber(activenumber[client])]
		if playerinfo then
			outputChatBox(g_colors["yellow"]..getPlayerName(client).." hat den Anruf beendet.", playerinfo, 0, 0, 0, true)
		end
		activenumber[client] = nil		
		return	
	end
	
	activenumber[client] = nil
end
