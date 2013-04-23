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



--[[
[2010-12-06 19:34:05] Coords:-2698.12890625, 309.7265625, 4.3581476211548 Interior:0 Z-Angle81.297332763672
[2010-12-06 19:35:24] Coords:-2764.5146484375, 372.8037109375, 6.343391418457 Interior:0 Z-Angle271.01211547852
[2010-12-06 19:35:33] Coords:-2764.4970703125, 378.6318359375, 6.3390617370605 Interior:0 Z-Angle267.56787109375
[2010-12-06 19:36:45] Coords:-2711.9873046875, 319.7119140625, 4.3374991416931 Interior:0 Z-Angle271.16046142578
--]]

local maingates = {}
local gatestates = {}
gatestates[1] = false
gatestates[2] = false

local function parlamentInit()
	--Gates
	maingates[1] = createObject(986, -2704.921875, 299.88238525391, 5, 0, 0, 180.63287353516)
	setElementDoubleSided(maingates[1], true)
	maingates[2] = createObject(986, -2704.9108886719, 324.60775756836, 5, 0, 0, 180.90167236328)
	setElementDoubleSided(maingates[2], true)
	
	--Wachen
	local ped = createPed(166, -2764.5146484375, 372.8037109375, 6.343391418457, 271.01211547852)
	setPedRotation(ped, 271)
	giveWeapon(ped, 31, 500, true)
	setPedWeaponSlot(ped, 6)
	setPedFrozen(ped, true)
	local ped = createPed(165, -2764.4970703125, 378.6318359375, 6.3390617370605, 267.56787109375)
	setPedRotation(ped, 267)
	giveWeapon(ped, 31, 500, true)
	setPedWeaponSlot(ped, 6)
	setPedFrozen(ped, true)
	
	local ped = createPed(280, -2698.12890625, 309.7265625, 4.3581476211548, 81.297332763672)
	setPedRotation(ped, 81)
	giveWeapon(ped, 24, 500, true)
	setPedWeaponSlot(ped, 2)
	setPedFrozen(ped, true)
	local ped = createPed(286, -2711.9873046875, 319.7119140625, 4.3374991416931, 271.16046142578)
	setPedRotation(ped, 271)
	giveWeapon(ped, 25, 500, true)
	setPedWeaponSlot(ped, 3)
	setPedFrozen(ped, true)
end
addEventHandler('onResourceStart', getResourceRootElement(), parlamentInit)

local function parlamentCommandMoveGates(playerSource, commandName, gateID)
	if g_playerstat[playerSource]["Level"] == "Admin" then
		if not gateID then
			outputChatBox(g_colors["darkorange"].."Du musst ein Tor angeben!", playerSource, 0, 0, 0, true)
			return false
		end
		
		gateID = tonumber(gateID)
		
		if gateID > 2 or gateID < 1 then
			outputChatBox(g_colors["darkorange"].."Du musst ein Tor angeben, welches exestiert!", playerSource, 0, 0, 0, true)
			return false
		end
		
		if gateID == 1 then
			if gatestates[1] == false and gatestates[2] == false then
				moveObject(maingates[1], 7500, -2700.921875, 299.88238525391, 5, 0, 0, 0, "InOutQuad")
				gatestates[1] = true
				return true
			elseif gatestates[2] == false then
				moveObject(maingates[1], 7500, -2704.921875, 299.88238525391, 5, 0, 0, 0, "InOutQuad")
				gatestates[1] = false
				return true
			end
		end
		
		if gateID == 2 then
			if gatestates[2] == false and gatestates[1] == false then
				moveObject(maingates[2], 7500, -2700.9108886719, 324.60775756836, 5, 0, 0, 0, "InOutQuad")
				gatestates[2] = true
				return true
			elseif gatestates[1] == false then
				moveObject(maingates[2], 7500, -2704.9108886719, 324.60775756836, 5, 0, 0, 0, "InOutQuad")
				gatestates[2] = false
				return true
			end
		end		
		
	end
end
addCommandHandler("parlamentgate", parlamentCommandMoveGates)
