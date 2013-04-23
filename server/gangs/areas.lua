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



local size = 600
local x = -3000
local y = 3000 - size
local id = 1

gangAreaTable = {}

function createGangAreas()
	while id ~= 101 do
		local area = createRadarArea (x, y, size, size, 190, 190, 190, 155)
		gangAreaTable[area] = {}
		gangAreaTable[area]["id"] = id
		gangAreaTable[area]["gang"] = 4
		gangAreaTable[area]["attackable"] = true
		gangAreaTable[area]["war"] = false
		gangAreaTable[area]["warTime"] = 0
		gangAreaTable[area]["warGang"] = 0
		gangAreaTable[area]["flashing"] = -1
		gangAreaTable[area]["police"] = 0
		gangAreaTable[area]["santos"] = 0
		gangAreaTable[area]["venturas"] = 0
		gangAreaTable[area]["fiero"] = 0
		
		setElementVisibleTo(area, root, false)
		
		id = id + 1
		--Neu Koords berechnen ;)
		if x ~= 3000 - size then
			x = x + size
		else
			x = -3000
			y = y - size
		end
	end
end

function getPlayerGangRadarArea(playerSource)
	if playerSource then
		local x, y = getElementPosition(playerSource)
		if x and y then
			for i, area in ipairs(getElementsByType("radararea")) do
				if gangAreaTable[area] then
					if isInsideRadarArea(area, x, y) then
						return area
					end
				end
			end
		end
	end
end
