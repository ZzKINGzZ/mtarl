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



local water1 = {}
local waterk = {}
local waterp = {}


function startWaterPool()
	outputDebug("water.lua start...")
	--Pool mit Wasser gefüllt Haus gegenüber MadDoggs
	water1[1] = createWater(1328.705078125, -661.5302734375, 107.5, 1342.94921875, -661.4150390625, 107.5, 1329, -640, 107.5, 1347, -640, 107.5)
	water1[2] = createWater(1339.9208984375, -657.1396484375, 107.5, 1344.7578125, -657.9296875, 107.5, 1340.7900390625, -643.5751953125, 107.5, 1346.498046875, -646.357421875, 107.5)
	water1[3] = createWater(1326.826171875, -657.4091796875, 107.5, 1329.064453125, -658.49609375, 107.5, 1327.18359375, -646.94140625, 107.5, 1328.9140625, -647.1728515625, 107.5)	
	water1[4] = createWater(1324.5986328125, -653.4765625, 107.5, 1326.330078125, -653.3330078125, 107.5, 1323.421875, -646.9599609375, 107.5, 1326.359375, -647.0849609375, 107.5)	
	
	for i, water1 in ipairs(water1) do
		setWaterLevel(water1, 107.9) --Wasser wird auf höhe gesetzt
	end
	--Kanäle von LS geflutet
	waterk[1] = createWater(1334.1748046875, -1733.41015625, 1, 1452.2998046875, -1734.6220703125, 1, 1360.328125, -1272.44921875, 1, 1425.9384765625, -1290.88671875, 1)
	waterk[2] = createWater(1410.4462890625, -1767.8916015625, 1, 1495.1689453125, -1770.26171875, 1, 1410.9599609375, -1704.4833984375, 1, 1491.5615234375, -1708.8837890625, 1)
	waterk[18] = createWater(1495.1689453125, -1770.26171875, 1, 1583.5166015625, -1769.2412109375, 1, 1490.244140625, -1727.5546875, 1, 1578.30859375, -1727.064453125, 1)
	waterk[17] = createWater(1613.0048828125, -1742.93359375, 1, 1627.2529296875, -1746.0029296875, 1, 1609.966796875, -1665.2880859375, 1, 1624.568359375, -1665.6640625, 1)
	waterk[3] = createWater(1580.6318359375, -1808.8427734375, 1, 1678.8251953125, -1790.716796875, 1, 1578.3125, -1741.4580078125, 1, 1678.2919921875, -1671.802734375, 1)
	waterk[4] = createWater(1677.7607421875, -1822.8515625, 1, 1835.9013671875, -1827.8515625, 1, 1676.650390625, -1760.6748046875, 1 , 1837.62109375, -1799.65234375, 1)
	waterk[5] = createWater(1830.8857421875, -1876.3466796875, 1, 2004.7470703125, -1868.9208984375, 1, 1834.396484375, -1796.2939453125, 1 , 1990.2802734375, -1820.330078125, 1)
	waterk[6] = createWater(2002.4228515625, -1866.8525390625, 1, 2207.755859375, -1868.6435546875, 1, 2009.04296875, -1828.5087890625, 1 , 2215.0478515625, -1821.771484375, 1)
	waterk[7] = createWater(2206.7802734375, -1885.818359375, 1, 2412.173828125, -1883.505859375, 1, 2206.345703125, -1821.9697265625, 1 , 2414.4013671875, -1820.0341796875, 1)
	waterk[19] = createWater(2408.7705078125, -1883.4580078125, 1, 2418.6689453125, -1882.56640625, 1, 2410.259765625, -1823.162109375, 1 , 2419.14453125, -1821.8291015625, 1)
	waterk[8] = createWater(2414.044921875, -1882.8603515625, 1, 2624.3486328125, -1869.5478515625, 1, 2413.52734375, -1817.5595703125, 1 , 2624.173828125, -1815.361328125, 1)
	waterk[9] = createWater(2443.9580078125, -2057.1513671875, 1, 2548.7109375, -2060.2529296875, 1, 2434.0791015625, -2041.787109375, 1 , 2547.080078125, -2036.9296875, 1)
	waterk[10] = createWater(2536.2080078125, -2116.9384765625, 1, 2627.181640625, -2117.873046875, 1, 2539.53515625, -1879.8017578125, 1 , 2626.322265625, -1880.693359375, 1)
	waterk[11] = createWater(2538.6806640625, -1819.53125, 1, 2626.1318359375, -1819.541015625, 1, 2547.83203125, -1471.0751953125, 1 , 2626.078125, -1470.0322265625, 1)
	waterk[12] = createWater(2242.8837890625, -2238.5478515625, 1, 2329.3427734375, -2227.302734375, 1, 2197.8349609375, -2070.7705078125, 1 , 2275.33203125, -2042.6943359375, 1)
	waterk[13] = createWater(2160.400390625, -2147.568359375, 1, 2278.328125, -2129.07421875, 1, 2161.7099609375, -2034.3251953125, 1 , 2235.2275390625, -1987.6484375, 1)
	waterk[14] = createWater(2090.3359375, -2064.19921875, 1, 2204.6455078125, -2069.3056640625, 1, 2074.41796875, -1943.673828125, 1 , 2142.9599609375, -1922.6962890625, 1)
	waterk[15] = createWater(1949.9482421875, -1950.3525390625, 1, 2112.7119140625, -1960.251953125, 1, 1960.7529296875, -1865.3583984375, 1 , 2104.0029296875, -1872.2080078125, 1)
	waterk[16] = createWater(2054.9140625, -1986.1611328125, 1, 2146.19140625, -1984.0244140625, 1, 2049.6630859375, -1949.1650390625, 1 , 2136.2998046875, -1948.94140625, 1)
	
	for i, waterk in pairs(waterk) do
		setWaterLevel(waterk, 10) --Wasser wird auf höhe gesetzt
	end	
	
	--Pool LS (Schwimmbad)
	local poolWater = createWater ( 1867, -1444, 10, 1968, -1443, 10, 1867, -1372, 10, 1968, -1370, 10 )
	setWaterLevel (poolWater ,12.48 )
	
	--LV Pyramide
	
	waterp[1] = createWater(2236.37890625, 1202.1748046875, 7, 2418.2197265625, 1200.36328125, 7, 2235.611328125, 1220.7275390625, 7 , 2420.6484375, 1219.7529296875, 7)
	waterp[2] = createWater(2401.115234375, 1218.5341796875, 7, 2420.6484375, 1219.7529296875, 7, 2401.2236328125, 1347.5009765625, 7 , 2419.2900390625, 1346.8544921875, 7)
	waterp[3] = createWater(2233.6845703125, 1345.7314453125, 7, 2419.2900390625, 1346.8544921875, 7, 2234.404296875, 1364.703125, 7 , 2419.4677734375, 1366.4033203125, 7)

	for i, waterp in pairs(waterp) do
		setWaterLevel(waterp, 9.5) --Wasser wird auf höhe gesetzt
	end
end
addEventHandler("onResourceStart", getResourceRootElement(), startWaterPool)
