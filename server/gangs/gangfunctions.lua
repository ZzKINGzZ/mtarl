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



g_gangstat = {}

function initalizeGangs()
	createGangAreas()
	local gangs = mysql_query(g_mysql["connection"], "SELECT * FROM `gangs`")
	if gangs then
		while true do
			local row = mysql_fetch_assoc(gangs)
			if not row then break end
			
			local id = tonumber(row["id"])
			g_gangstat[id] = {}
			g_gangstat[id]["money"] = tonumber(row["money"])
			
			if row["areas"] then
				local areas = table.load(row["areas"])
				for areaID, value in pairs(areas) do
					for i, area in ipairs(getElementsByType("radararea")) do
						if gangAreaTable[area] then					
							if gangAreaTable[area]["id"] == areaID then
								gangAreaTable[area]["gang"] = id
								if id == 100 then
									setRadarAreaColor(area, 105, 105, 105, 155)
								elseif id == 101 then
									setRadarAreaColor(area, 0, 139, 69, 155)
								elseif id == 102 then
									setRadarAreaColor(area, 0, 206, 209, 155)
								end
							end
						end
					end
				end
			end
		end
		mysql_free_result(gangs)	
	end		
end
addEventHandler("onResourceStart", resourceRoot, initalizeGangs)

function deinitalizeGangs()
	createGangAreas()
	local gangs = mysql_query(g_mysql["connection"], "SELECT * FROM `gangs`")
	if gangs then
		while true do
			local row = mysql_fetch_assoc(gangs)
			if not row then break end
			
			local id = tonumber(row["id"])			
			if id then
				local gangArea = {}
				for i, area in ipairs(getElementsByType("radararea")) do
					if gangAreaTable[area] then
						if gangAreaTable[area]["gang"] == id then
							local areaID = gangAreaTable[area]["id"]
							gangArea[areaID] = true
						end
					end
				end
				local areas = table.save(gangArea)
				local money = g_gangstat[id]["money"]
			
				mysql_query(g_mysql["connection"], "UPDATE `gangs` SET `areas` = '"..areas.."', `money` = '"..money.."' WHERE `id` = "..id.." LIMIT 1;")
			end
		end
		mysql_free_result(gangs)	
	end		
end
addEventHandler("onResourceStop", resourceRoot, deinitalizeGangs)

function startGangWar(area, gang)
	if area and gang then
		if not gangAreaTable[area]["war"] then
			if gangAreaTable[area]["gang"] ~= gang then
				local opponents = 0
				for i, player in ipairs(getElementsByType("player")) do
					if isPlayerActiveInJob(player, gangAreaTable[area]["gang"]) then
						opponents = opponents + 1
						sendPlayerInfo(player, "Ein Gebiet deiner Gang wird angegriffen!", true)
					end
				end
				if gangAreaTable[area]["gang"] == 4 then
					opponents = 5
				end
				if opponents > 4 then
					gangAreaTable[area]["warGang"] = gang
					gangAreaTable[area]["war"] = true
					gangAreaTable[area]["warTime"] = 0
					setGangAreaFlashing(area, true)
					return true
				end
			end
		end
	end
end

function stopGangWar(area, newGang, oldGang)
	if newGang then
		gangAreaTable[area]["war"] = false
		gangAreaTable[area]["gang"] = newGang
		gangAreaTable[area]["attackable"] = false
		
		if newGang == 100 then
			setRadarAreaColor(area, 105, 105, 105, 155)
		elseif newGang == 101 then
			setRadarAreaColor(area, 0, 139, 69, 155)
		elseif newGang == 102 then
			setRadarAreaColor(area, 0, 206, 209, 155)
		elseif newGang == 4 then
			-- setRadarAreaColor(area, 190, 190, 190, 155)
			gangAreaTable[area]["gang"] = false
			setRadarAreaColor(area, 190, 190, 190, 155)
		end
		setGangAreaFlashing(area, false)
		
		for i, player in ipairs(getElementsByType("player")) do
			if isPlayerActiveInJob(player, newGang) then
				sendPlayerInfo(player, "Der Gangwar wurde erfolgreich beendet!", true)
			elseif isPlayerActiveInJob(player, oldGang) then
				sendPlayerInfo(player, "Der Gangwar wurde verloren!", true)
			end
		end
	else
		gangAreaTable[area]["war"] = false
		gangAreaTable[area]["attackable"] = false
		setGangAreaFlashing(area, false)
	end
end

function setGangAreaFlashing(area, bool)
	if bool == true then
		gangAreaTable[area]["flashing"] = 1
	else
		gangAreaTable[area]["flashing"] = -1
		local gang = gangAreaTable[area]["gang"]
		if gang == 100 then
			setRadarAreaColor(area, 105, 105, 105, 155)
		elseif gang == 101 then
			setRadarAreaColor(area, 0, 139, 69, 155)
		elseif gang == 102 then
			setRadarAreaColor(area, 0, 206, 209, 155)
		elseif gang == 4 then
			setRadarAreaColor(area, 190, 190, 190, 155)
		end
	end
end

function addGangMoney(gang, amount)
	if gang and amount then
		g_gangstat[gang]["money"] = g_gangstat[gang]["money"] + tonumber(amount)
	end
end

function payOutGangMoney(playerSource, commandName, amount)
	local gang = getPlayerActiveJob(playerSource)
	if gang and amount then
		if amount > 0 then
			addGangMoney(gang, -amount)
			givePlayerMoney(playerSource, amount)
		end
	end
end
addCommandHandler("gangmoney", payOutGangMoney)

function gangStartWar(playerSource, commandName)
	local gang = getPlayerActiveJob(playerSource)
	local area = getPlayerGangRadarArea(playerSource)
	if isGangJob(gang) or gang == 4 then
		if area then
			
			local policeMembers = 0
			for i, player in ipairs(getElementsByType("player")) do
				if isPlayerActiveInJob(player, 4) then
					policeMembers = policeMembers + 1
					g_playerstat[player][area] = true				
				end
			end
			
			local gangMembers = 0
			if gang ~= 100 then
				for i, player in ipairs(getElementsByType("player")) do
					if isPlayerActiveInJob(player, 100) then --venturas
						gangMembers = gangMembers + 1
						g_playerstat[player][area] = true
					end
				end
			elseif gang ~= 101 then
				for i, player in ipairs(getElementsByType("player")) do
					if isPlayerActiveInJob(player, 101) then --santos
						gangMembers = gangMembers + 1
						g_playerstat[player][area] = true
					end
				end
			elseif gang ~= 102 then
				for i, player in ipairs(getElementsByType("player")) do
					if isPlayerActiveInJob(player, 102) then --fiero
						gangMembers = gangMembers + 1
						g_playerstat[player][area] = true
					end
				end
			end
			
			if policeMembers >= 1 and gangMembers >= 1 then
				local war = startGangWar(area, gang)
				if war then
					for i, player in ipairs(getElementsByType("player")) do
						if isPlayerActiveInJob(player, gang) then
							sendPlayerInfo(playerSource, "Gangwar gestartet!", true)						
						end
					end
				else
					sendPlayerInfo(playerSource, "Zurzeit ist ein Gangwar nicht möglich!", true)
				end
			else
				sendPlayerInfo(playerSource, "Zurzeit ist ein Gangwar nicht möglich, da mindestets ein Polizist und ein Mitglied einer gegenerischen Gang online sein muss!", true)
			end
		end
	end
end
addCommandHandler("war", gangStartWar)

function gangWarTimer()
	for i, area in ipairs(getElementsByType("radararea")) do
		if gangAreaTable[area] then
			if gangAreaTable[area]["flashing"] ~= -1 then
				if gangAreaTable[area]["flashing"] == 1 then
					gangAreaTable[area]["flashing"] = 2
					setRadarAreaColor(area, 255, 0, 0, 155)
				else
					gangAreaTable[area]["flashing"] = 1
					local gang = gangAreaTable[area]["gang"]
					if gang == 100 then
						setRadarAreaColor(area, 105, 105, 105, 155)
					elseif gang == 101 then
						setRadarAreaColor(area, 0, 139, 69, 155)
					elseif gang == 102 then
						setRadarAreaColor(area, 0, 206, 209, 155)
					elseif gang == 4 then
						setRadarAreaColor(area, 190, 190, 190, 155)
					end
				end
			end
			if gangAreaTable[area]["war"] then
				if gangAreaTable[area]["warTime"] ~= 600 then
					gangAreaTable[area]["warTime"] = gangAreaTable[area]["warTime"] + 1
					gangAreaTable[area]["police"] = 0
					gangAreaTable[area]["santos"] = 0
					gangAreaTable[area]["venturas"] = 0
					gangAreaTable[area]["fiero"] = 0

					for i, player in ipairs(getElementsByType("player")) do
						if g_playerstat[player][area] then
							if isPlayerActiveInJob(player, 100) then --venturas
								gangAreaTable[area]["venturas"] = gangAreaTable[area]["venturas"] + 1		
							end
							if isPlayerActiveInJob(player, 101) then --santos
								gangAreaTable[area]["santos"] = gangAreaTable[area]["santos"] + 1	
							end
							if isPlayerActiveInJob(player, 102) then --fiero
								gangAreaTable[area]["fiero"] = gangAreaTable[area]["fiero"] + 1	
							end
							if isPlayerActiveInJob(player, 4) then --police
								gangAreaTable[area]["police"] = gangAreaTable[area]["police"] + 1	
							end
						end

						if isPlayerActiveInJob(player, gangAreaTable[area]["gang"]) or isPlayerActiveInJob(player, gangAreaTable[area]["warGang"]) then
							if g_playerstat[player][area] then
								if getPlayerGangRadarArea(player) == area then
									for i, playerGang in ipairs(getElementsByType("player")) do
										setElementVisibleTo(g_playerstat[player]["Jobblib"], playerGang, true)
									end
								else
									for i, playerGang in ipairs(getElementsByType("player")) do
										setElementVisibleTo(g_playerstat[player]["Jobblib"], playerGang, false)
									end
								end
							end
						end
					end

					if gangAreaTable[area]["venturas"] > 0 then
						if gangAreaTable[area]["santos"] == 0 and gangAreaTable[area]["fiero"] == 0 and gangAreaTable[area]["police"] == 0 then
							stopGangWar(area, 100, gangAreaTable[area]["gang"])
						end
					end
					if gangAreaTable[area]["santos"] > 0 then
						if gangAreaTable[area]["venturas"] == 0 and gangAreaTable[area]["fiero"] == 0 and gangAreaTable[area]["police"] == 0 then
							stopGangWar(area, 101, gangAreaTable[area]["gang"])
						end
					end
					if gangAreaTable[area]["fiero"] > 0 then
						if gangAreaTable[area]["santos"] == 0 and gangAreaTable[area]["venturas"] == 0 and gangAreaTable[area]["police"] == 0 then
							stopGangWar(area, 102, gangAreaTable[area]["gang"])
						end
					end
					if gangAreaTable[area]["police"] > 0 then
						if gangAreaTable[area]["santos"] == 0 and gangAreaTable[area]["fiero"] == 0 and gangAreaTable[area]["venturas"] == 0 then
							stopGangWar(area, 4, gangAreaTable[area]["gang"])
						end
					end
				else
					stopGangWar(area, gangAreaTable[area]["warGang"], gangAreaTable[area]["gang"])
				end
			end
		end
	end
end
addEventHandler("onGeneralTimer", root, gangWarTimer)

function getLeftPlayersInGangArea(area)
	local players = {}
	for i, player in ipairs(getElementsByType("player")) do
		if getPlayerGangRadarArea(player) == area then
			table.insert(players, player)
		end
	end
	return players
end

function gangDayFinish()
	for i, area in ipairs(getElementsByType("radararea")) do
		if gangAreaTable[area] then
			gangAreaTable[area]["attackable"] = true
			
			if gangAreaTable[area]["gang"] ~= 4 then
				local gang = gangAreaTable[area]["gang"]
				addGangMoney(gang, 100)
			end
		end
	end
end
addEventHandler("onDayFinished", root, gangDayFinish)


function gangOnPlayerDead()
	local area = getPlayerGangRadarArea(source)
	if g_playerstat[source][area] then
		g_playerstat[source][area] = nil
	end
end
addEventHandler("onPlayerWasted", getRootElement(), gangOnPlayerDead)
