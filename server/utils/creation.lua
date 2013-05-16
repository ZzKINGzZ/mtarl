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
	Author: Einstein
	Desc: Sinn der Funktion ist es, nurnoch eingeloggte Elemente oder MTA:RL Vehicles zu loopen. Das Loopen durch Variablen ist deutlich schneller als durch die Funktion.
--]]

local g_Creation_playerTable = {}
local g_Creation_vehicleTable = {}

--[[".."Überschreibende Funktionen]]
_getElementsByType = getElementsByType
function getElementsByType(elementtype)
	if elementtype == "player" then return g_Creation_playerTable
	elseif elementtype == "vehicle" then return g_Creation_vehicleTable
	else return _getElementsByType(elementtype) end
end

--Performance, perfomance, performance!

function creation_onPlayerLogin()
	table.insert(g_Creation_playerTable, source)
end
addEventHandler("onPlayerLoginMTARL", getRootElement(), creation_onPlayerLogin)

function creation_onPlayerLogout()
	for i, player in pairs(g_Creation_playerTable) do
		if player == source then
			table.remove(g_Creation_playerTable, i)
			break
		end
	end
end
addEventHandler("onPlayerLogoutMTARL", getRootElement(), creation_onPlayerLogout)

function creation_onVehicleCreate()
	table.insert(g_Creation_vehicleTable, source)
end
addEventHandler("onVehicleCreateMTARL", getRootElement(), creation_onVehicleCreate)

function creation_onVehicleDelete()
	for i, vehicle in pairs(g_Creation_vehicleTable) do
		if vehicle == source then
			table.remove(g_Creation_vehicleTable, i)
			break
		end
	end
end
addEventHandler("onVehicleDeleteMTARL", getRootElement(), creation_onVehicleDelete)
