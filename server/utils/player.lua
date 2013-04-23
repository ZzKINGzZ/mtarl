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



function closestPlayer(playerSource)
	local prevdist = 10000000.0
	local prevplayer = false
	
	local playerx, playery, playerz = getElementPosition(playerSource)
	
	for i,player in ipairs(getElementsByType("player")) do 
		local otherx, othery, otherz = getElementPosition(player)
		local distance = getDistanceBetweenPoints3D(otherx, othery, otherz, playerx, playery, playerz)
		if distance < prevdist then
			if player ~= playerSource then
				prevdist = distance
				prevplayer = player
			end	
		end
	end
	
	return prevplayer, prevdist
end

function closestMarker(playerSource)
	local prevdist = 1000000000.0
	local prevvehicle = false
	
	local playerx, playery, playerz = getElementPosition(playerSource)
	
	for i, marker in ipairs(getElementsByType("marker")) do
		local otherx, othery, otherz = getElementPosition(marker)
		local distance = getDistanceBetweenPoints3D(otherx, othery, otherz, playerx, playery, playerz)
		if distance < prevdist then
			prevdist = distance
			prevmarker = marker
		end
	end
	
	return prevmarker, prevdist
end

function closestPickup(playerSource)
	local prevdist = 1000000000.0
	local prevvehicle = false
	
	local playerx, playery, playerz = getElementPosition(playerSource)
	
	for i, pickup in ipairs(getElementsByType("pickup")) do
		local otherx, othery, otherz = getElementPosition(pickup)
		local distance = getDistanceBetweenPoints3D(otherx, othery, otherz, playerx, playery, playerz)
		if distance < prevdist then
			prevdist = distance
			prevmarker = pickup
		end
	end
	
	return prevmarker, prevdist
end

function isPlayerInBall(playerSource, x, y, z, radius)
	local posx, posy, posz = getElementPosition(playerSource)
	local dif = getDistanceBetweenPoints3D(x, y, z, posx, posy, posz)
	
	if dif < radius then
		return true
	end
	return false
end

function getPlayerKey(player, vehicle)
	local id = 0
	--Wenn eine Vehicledata angegeben wird
	if isElement(vehicle) then
		if getElementType(vehicle) == "vehicle" then
			id = g_vehiclestat[vehicle]["ID"]
		end
	else
	--Wenn nur die ID angegeben wurde
		id = tonumber(vehicle)
	end
	
	return g_playerstat[player]["Key"][id]
end

function getPlayerFromString(userstring)
	if not userstring then return false end
	
	local returnplayer, howmuch = false, 0

	for i,player in ipairs(getElementsByType("player")) do 
		local playername = getPlayerName(player)
		local begin, ends = string.find(playername, userstring)
		
		if begin and ends then
			local sub = ends - begin
			if sub > howmuch then
				returnplayer = player
			end
		end
	end
	
	return returnplayer
end

function getPosInFrontOfPlayer(player, radius)
    radius = radius or 3
    local x, y, z = getElementPosition(player)
    local r = getPedRotation(player)
    return x + radius*math.cos(math.rad(r + 90)), y + radius*math.sin(math.rad(r + 90)), z
end
