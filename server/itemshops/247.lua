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



local itemShop = {}

local function initalizeItemShops()
	
	itemShop[1] = createItemShop(-27.9482421875, -89.3935546875, 1003.546875, 18, 1)
	itemShop[2] = createItemShop(-28.2578125, -89.3564453125, 1003.546875, 18, 0)
	itemShop[3] = createItemShop(-23.677734375, -55.07421875, 1003.546875, 6, 2)
	itemShop[4] = createItemShop(-23.2353515625, -55.1015625, 1003.546875, 6, 6)
	itemShop[5] = createItemShop(-23.43359375, -55.142578125, 1003.546875, 6, 4)
	itemShop[6] = createItemShop(-28.044921875, -89.412109375, 1003.546875, 18, 2)
	itemShop[7] = createItemShop(-28.42578125, -89.2626953125, 1003.546875, 18, 3)
	itemShop[8] = createItemShop(-23.625, -55.1875, 1003.546875, 6, 0)
	itemShop[9] = createItemShop(-23.6513671875, -54.5283203125, 1003.546875, 6, 1)
	itemShop[10] = createItemShop(-23.5390625, -55.3828125, 1003.546875, 6, 5)
	
	for i, itemShop in pairs(itemShop) do
		addItemShopItem(itemShop, 17, 1800)	
		addItemShopItem(itemShop, 18, 1800)
		addItemShopItem(itemShop, 19, 75)
		addItemShopItem(itemShop, 20, 270)
	end
end
addEventHandler("onResourceStart", getResourceRootElement(), initalizeItemShops)
