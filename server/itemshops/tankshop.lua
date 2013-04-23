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



local tankShop = {}

local function initalizeTankShops()
	
	tankShop[1] = createItemShop(2188.1572265625, 2469.5732421875, 11.2421875, 0, 0)
	tankShop[2] = createItemShop(2117.9072265625, 897.49609375, 11.1796875, 0, 0)
	tankShop[3] = createItemShop(1930.23828125, -1776.0361328125, 13.546875, 0, 0)
	tankShop[4] = createItemShop(999.9970703125, -920.1064453125, 42.328125, 0, 0)
	tankShop[5] = createItemShop(-79.423828125, -1169.490234375, 2.1629633903503, 0, 0)
	tankShop[6] = createItemShop(-1675.240234375, 431.9462890625, 7.1796875, 0, 0)
	tankShop[7] = createItemShop(-2032.484375, 161.2978515625, 29.046106338501, 0, 0)
	
	for i, tankShop in pairs(tankShop) do
		addItemShopItem(tankShop, 5, 10)
		addItemShopItem(tankShop, 6, 15)
		addItemShopItem(tankShop, 7, 10)
		addItemShopItem(tankShop, 8, 15)
		addItemShopItem(tankShop, 9, 10)
		addItemShopItem(tankShop, 10, 15)
		addItemShopItem(tankShop, 11, 10)
		addItemShopItem(tankShop, 12, 15)
		addItemShopItem(tankShop, 13, 10)
		addItemShopItem(tankShop, 14, 15)
		addItemShopItem(tankShop, 15, 10)
		addItemShopItem(tankShop, 16, 15)
	end
end
addEventHandler("onResourceStart", getResourceRootElement(), initalizeTankShops)
