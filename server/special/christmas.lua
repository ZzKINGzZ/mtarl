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



local function initChristmas()
	local x, y, z = 262.520, -1837.17, 3.56
	createObject ( 771, x + 2, y, z - 2 )
	createMarker ( x + 2, y, z + 8, "corona", 5, 200, 100, 0, 150 )
	createMarker ( x + 2, y, z + 9, "corona", 5, 0, 100, 100, 150 )
	createMarker ( x + 2, y, z + 10, "corona", 5, 0, 0, 50, 150 )
	createMarker ( x + 2, y, z + 10.5, "corona", 5, 150, 140, 130, 150 )
	createMarker ( x + 2, y, z + 11, "corona", 5, 250, 150, 50, 150 )
	createMarker ( x + 2, y, z + 12, "corona", 5, 0, 100, 100, 150 )
	createMarker ( x + 2, y, z + 13, "corona", 5, 200, 0, 200, 150 )
	createMarker ( x + 2, y, z + 14, "corona", 5, 100, 150, 255, 150 )
	createMarker ( x + 2, y, z + 14, "corona", 5, 120, 50, 0, 150 )
	createMarker ( x + 2, y, z + 14, "corona", 5, 100, 100, 0, 150 )
	createMarker ( x + 2, y, z + 15, "corona", 5, 0, 100, 50, 150 )
	createMarker ( x + 2, y, z + 16, "corona", 5, 200, 0, 50, 150 )
	createMarker ( x + 2, y, z + 17.5, "corona", 5, 0, 100, 0, 150 )
	createMarker ( x + 2, y, z + 18, "corona", 5, 2, 1, 21, 150 )
	createMarker ( x + 2, y, z + 18, "corona", 5, 20, 10, 110, 150 )
	createMarker ( x + 2, y, z + 19, "corona", 5, 10, 50, 100, 150 )
	createMarker ( x + 2, y, z + 20, "corona", 5, 0, 100, 100, 150 )
	createMarker ( x + 2, y, z + 22, "corona", 5, 200, 100, 10, 255 )
	createMarker ( x + 2, y, z + 4, "corona", 5, 200, 100, 0, 150 )
	createMarker ( x + 2, y, z + 5, "corona", 5, 0, 100, 100, 150 )
	createMarker ( x + 2, y, z + 6, "corona", 5, 0, 0, 50, 150 )
	createMarker ( x + 2, y, z + 6.5, "corona", 5, 150, 140, 130, 150 )
	createMarker ( x + 2, y, z + 6, "corona", 5, 250, 150, 50, 150 )
	createMarker ( x + 2, y, z + 10, "corona", 5, 0, 100, 100, 150 )
	createMarker ( x + 2, y, z + 13, "corona", 15, 200, 0, 200, 150 )
	createMarker ( x + 2, y, z + 15, "corona", 5, 100, 150, 255, 150 )
	createMarker ( x + 2, y, z + 23, "corona", 15, 120, 50, 0, 150 )
	createMarker ( x + 2, y, z + 23, "corona", 5, 100, 100, 0, 150 )
	createMarker ( x + 2, y, z + 24, "corona", 15, 0, 100, 50, 150 )
	createMarker ( x + 2, y, z + 25, "corona", 5, 200, 0, 50, 150 )
	createMarker ( x + 2, y, z + 25.5, "corona", 5, 0, 100, 0, 150 )
	createMarker ( x + 2, y, z + 26, "corona", 5, 2, 1, 21, 150 )
	createMarker ( x + 2, y, z + 26, "corona", 5, 20, 10, 110, 150 )
	createMarker ( x + 2, y, z + 25, "corona", 15, 10, 50, 100, 150 )
	createMarker ( x + 2, y, z + 4, "corona", 15, 0, 100, 100, 150 )
	createMarker ( x + 2, y, z + 6, "corona", 15, 200, 100, 10, 255 )
	
	createBlip(262.520, -1837.17, 3.56, 56, 3)
end
addEventHandler('onResourceStart', getResourceRootElement(), initChristmas)
