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



server = setmetatable(
	{},
	{
		__index = function(t, k)
			t[k] = function(...) triggerServerEvent('onServerCall', getResourceRootElement(getThisResource()), k, tostring(math.random(255, 999)), ...) end
			return t[k]
		end
	}
)

	addEvent('onClientCall', true)
	addEventHandler('onClientCall', getResourceRootElement(getThisResource()),
		function(fnName, ...)
			local fn = _G[fnName]
			if fn then
				fn(...)
			else
				outputDebugString('Attempt to remote call nonexisting function "' .. fnName .. '"', 1)
			end
		end,
		false
	)
	
function string:split(delimiter)
	local result = {}
	local from  = 1
	local delim_from, delim_to = string.find(self, delimiter, from )
	while delim_from do
		table.insert(result, string.sub(self, from , delim_from-1))
		from  = delim_to + 1
		delim_from, delim_to = string.find(self, delimiter, from)
	end
	table.insert(result, string.sub(self, from))
	return result
end	

function getPosInFrontOfPlayer(player, radius)
    radius = radius or 3
    local x, y, z = getElementPosition(player)
    local r = getPedRotation(player)
    return x + radius*math.cos(math.rad(r + 90)), y + radius*math.sin(math.rad(r + 90)), z
end

function explode(div,str)
	if div and str then
		if (div=='') then return false end
			local pos,arr = 0,{}
			for st,sp in function() return string.find(str,div,pos,true) end do
				table.insert(arr,string.sub(str,pos,st-1))
				pos = sp + 1
			end
		table.insert(arr,string.sub(str,pos))
		return arr
	end
	return false
end

function setElementToGround(element)
	local x, y, z =  getElementPosition (element)
	local dis = getElementDistanceFromCentreOfMassToBaseOfModel (element)
	if x and y and z and dis then
		setElementPosition (element, x, y, z-dis)
	end
end

function round(number)
	return math.floor(number + 0.5)
end

function getPositionFromElementAtOffset(element,x,y,z)
	if not x or not y or not z then      
		return x, y, z   
	end        
	local matrix = getElementMatrix (element)
	local offX = x * matrix[1][1] + y * matrix[2][1] + z * matrix[3][1] + matrix[4][1]
	local offY = x * matrix[1][2] + y * matrix[2][2] + z * matrix[3][2] + matrix[4][2]
	local offZ = x * matrix[1][3] + y * matrix[2][3] + z * matrix[3][3] + matrix[4][3]
	return offX, offY, offZ
end

function getVehicleWheelPosition(vehicle, wheel)
	local x, y, z = 0, 0, 0
	local minX, minY, minZ, maxX, maxY, maxZ = getElementBoundingBox(vehicle)
	if wheel == 1 then
		x, y, z = getPositionFromElementAtOffset(vehicle, minX, maxY, minZ)
	elseif wheel == 2 then
		x, y, z = getPositionFromElementAtOffset(vehicle, minX, -maxY, minZ)		
	elseif wheel == 3 then
		x, y, z = getPositionFromElementAtOffset(vehicle, maxX, maxY, minZ)
	elseif wheel == 4 then
		x, y, z = getPositionFromElementAtOffset(vehicle, maxX, -maxY, minZ)
	end	 
	return x, y, z
end
