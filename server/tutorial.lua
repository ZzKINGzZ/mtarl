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



function startTutorial(playerSource)
	spawnPlayer(playerSource, 1433.9658203125, 2628.1533203125, 11.392612457275)
	setCameraTarget(playerSource, playerSource)
	local dimension = math.random(10000) + 1
	setElementDimension(playerSource, dimension)
	setElementPosition(playerSource, 1433.9658203125, 2628.1533203125, 11.392612457275)
	
	rpcCallClientFunction(playerSource, "startTutorial")
end
addCommandHandler("tutorial", startTutorial)

function endTutorial()
	local player = client
	
	setElementDimension(player, 0)
	setElementHealth(player, 100)
	setPlayerMoney(player, 500)
	setPedArmor(player, 0)
	
	setCameraTarget(player, player)
	fadeCamera(player, false)
	killPed(player)
	rpcCallClientFunction(player, "showLogin", true)
	
	-- Spawn player at spawnx, spawny, spawnz (values from Db)
	local result = mysql_query(g_mysql["connection"], "SELECT spawnx, spawny, spawnz, skin FROM players WHERE id = "..CORE:getPlayer(player):getUserID())
	local row = mysql_fetch_assoc(result)
	local spawnx, spawny, spawnz, skin = tonumber(row.spawnx), tonumber(row.spawny), tonumber(row.spawnz), tonumber(row.skin)
	if spawnx and spawny and spawnz and skin then -- Check if coordinates are valid (prevent possible warning)
		spawnPlayer(player, spawnx, spawny, spawnz, 0, skin)
	end
	mysql_free_result(result)
end
