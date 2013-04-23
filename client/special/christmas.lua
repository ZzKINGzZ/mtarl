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



local colshape
local song 

local function colShapeHit(element)
	if element == localPlayer then
		if song then destroyElement(song) end
		song = playSound3D("http://files.the-reallife-network.de/mtarl/server/weihnachten/jinglebells.mp3", 262.520, -1837.17, 3, true)
		--setSoundMaxDistance(song, 35)
	end
end

local function colShapeLeave(element)
	if element == localPlayer then
		if song then destroyElement(song) end
	end	
end

local function initChristmas()
	colshape = createColCircle(262.520, -1837.17, 40)
	addEventHandler("onClientColShapeHit", getRootElement(), colShapeHit)
	addEventHandler("onClientColShapeLeave", getRootElement(), colShapeLeave)
	showInfoMessage("Frohe Weihnachen. Viel Spass beim Testen. Auf der Minimap haben wir dir gleich den weihnachtlichsten Standort in San Andreas markiert. ;)")
end
addEventHandler("onClientLogedInMTARL", getRootElement(), initChristmas)
