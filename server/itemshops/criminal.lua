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



local function criminalShopItemBuy()

end

local function initCriminalShop()
	local ped = createPed(156, 414.05078125, -9.9814453125, 1001.8120117188, 185) 
	setElementInterior(ped, 2)
	setElementDimension(ped, 0)
	
	local shop = createItemShop(414.173828125, -11.4091796875, 1001.8120117188, 2, 0)
	addItemShopItem(shop, 4, 2000)
end
addEventHandler('onResourceStart', getResourceRootElement(), initCriminalShop)
