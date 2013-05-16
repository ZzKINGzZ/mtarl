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



weaponTable = {}
weaponTable[1] = {
	id = 1,
	slot = 0,
	name = "Schlagring",
	preis = 550,
	category = 1,
	empty = false,
	public = true
}
weaponTable[2] = {
	id = 2,
	slot = 1,
	name = "Golfschlaeger",
	preis = 500,
	category = 1,
	empty = false,
	public = true
}
weaponTable[3] = {
	id = 3,
	slot = 1,
	name = "Schlagstock",
	preis = 250,
	category = 1,
	empty = false,
	public = false
}
weaponTable[4] = {
	id = 4,
	slot = 1,
	name = "Messer",
	preis = 250,
	category = 1,
	empty = false,
	public = false
}
weaponTable[5] = {
	id = 5,
	slot = 1,
	name = "Baseballschlaeger",
	preis = 500,
	category = 1,
	empty = false,
	public = true
}
weaponTable[6] = {
	id = 6,
	slot = 1,
	name = "Schaufel",
	preis = 50,
	category = 1,
	empty = false,
	public = true
}
weaponTable[7] = {
	id = 7,
	slot = 1,
	name = "Billiardschleager",
	preis = 100,
	category = 1,
	empty = false,
	public = true
}
weaponTable[8] = {
	id = 8,
	slot = 1,
	name = "Katana",
	preis = 200,
	category = 1,
	empty = false,
	public = true
}
weaponTable[9] = {
	id = 9,
	slot = 1,
	name = "Motorsaege",
	preis = 550,
	category = 1,
	empty = false,
	public = false
} 
weaponTable[10] = {
	id = 22,
	slot = 2,
	name = "Pistole",
	preis = 750,
	category = 2,
	empty = true,
	public = true
}
weaponTable[11] = {
	id = 23,
	slot = 2,
	name = "Pistole mit Schalldaempfer",
	preis = 850,
	category = 2,
	empty = true,
	public = true
}
weaponTable[12] = {
	id = 24,
	slot = 2,
	name = "Desert Eagle",
	preis = 950,
	category = 2,
	empty = true,
	public = true
}
weaponTable[13] = {
	id = 25,
	slot = 3,
	name = "Schrotflinte",
	preis = 1050,
	category = 3,
	empty = true,
	public = true
}
weaponTable[14] = {
	id = 26,
	slot = 3,
	name = "Abgesaegte Schrotflinte",
	preis = 1150,
	category = 3,
	empty = true,
	public = true
}
weaponTable[15] = {
	id = 27,
	slot = 3,
	name = "Spaz-12",
	preis = 1500,
	category = 3,
	empty = true,
	public = false
}
weaponTable[16] = {
	id = 28,
	slot = 4,
	name = "Uzi",
	preis = 950,
	category = 3,
	empty = true,
	public = true
}
weaponTable[17] = {
	id = 29,
	slot = 4,
	name = "MP5",
	preis = 1000,
	category = 3,
	empty = true,
	public = true
}
weaponTable[18] = {
	id = 32,
	slot = 4,
	name = "TEC-9",
	preis = 1050,
	category = 3,
	empty = true,
	public = true
}
weaponTable[19] = {
	id = 30,
	slot = 5,
	name = "AK-47",
	preis = 1950,
	category = 3,
	empty = true,
	public = false
}
weaponTable[20] = {
	id = 31,
	slot = 5,
	name = "M4",
	preis = 1950,
	category = 3,
	empty = true,
	public = false
}
weaponTable[21] = {
	id = 33,
	slot = 6,
	name = "Country Rifle",
	preis = 1750,
	category = 3,
	empty = true,
	public = false
}
weaponTable[22] = {
	id = 34,
	slot = 6,
	name = "Sniper Rifle",
	preis = 1750,
	category = 3,
	empty = true,
	public = false
}
weaponTable[23] = {
	id = 35,
	slot = 7,
	name = "Raketenwerfer",
	preis = 3550,
	category = 3,
	empty = true,
	public = false
}
weaponTable[24] = {
	id = 36,
	slot = 7,
	name = "Waermesuchender Raketenwerfer",
	preis = 5000,
	category = 3,
	empty = true,
	public = false
}
weaponTable[25] = {
	id = 37,
	slot = 7,
	name = "Flammenwerfer",
	preis = 2100,
	category = 3,
	empty = true,
	public = false
}
weaponTable[26] = {
	id = 38,
	slot = 7,
	name = "Minigun",
	preis = 5000,
	category = 3,
	empty = true,
	public = false
}
weaponTable[27] = {
	id = 16,
	slot = 8,
	name = "Granate",
	preis = 50,
	category = 3,
	empty = true,
	public = false
}
weaponTable[28] = {
	id = 17,
	slot = 8,
	name = "Traenengas",
	preis = 50,
	category = 3,
	empty = true,
	public = false
}
weaponTable[29] = {
	id = 18,
	slot = 8,
	name = "Molotov Cocktail",
	preis = 70,
	category = 3,
	empty = true,
	public = false
}
weaponTable[30] = {
	id = 39,
	slot = 8,
	name = "Sprengladung",
	preis = 100,
	category = 3,
	empty = true,
	public = false
}
weaponTable[31] = {
	id = 41,
	slot = 9,
	name = "Sprühdose",
	preis = 10,
	category = 1,
	empty = true,
	public = false
}
weaponTable[32] = {
	id = 42,
	slot = 9,
	name = "Feuerlöscher",
	preis = 220,
	category = 1,
	empty = true,
	public = false
}
weaponTable[33] = {
	id = 43,
	slot = 9,
	name = "Kamera",
	preis = 30,
	category = 1,
	empty = true,
	public = false
}
weaponTable[34] = {
	id = 10,
	slot = 10,
	name = "Doldo (lang)",
	preis = 55,
	category = 1,
	empty = false,
	public = true
} 
weaponTable[35] = {
	id = 11,
	slot = 10,
	name = "Dildo (kurz)",
	preis = 45,
	category = 1,
	empty = false,
	public = true
} 
weaponTable[36] = {
	id = 12,
	slot = 10,
	name = "Vibrator",
	preis = 65,
	category = 1,
	empty = false,
	public = true
} 
weaponTable[37] = {
	id = 14,
	slot = 10,
	name = "Blumen",
	preis = 7,
	category = 1,
	empty = false,
	public = false
}
weaponTable[38] = {
	id = 15,
	slot = 10,
	name = "Rohrstock",
	preis = 11,
	category = 1,
	empty = true,
	public = false --Network Trouble beim aufnehmen!
}
weaponTable[39] = {
	id = 44,
	slot = 11,
	name = "Nachtsichtgerät",
	preis = 550,
	category = 1,
	empty = false,
	public = false
}
weaponTable[40] = {
	id = 45,
	slot = 11,
	name = "Inrarotgerät",
	preis = 550,
	category = 1,
	empty = false,
	public = false
}
weaponTable[41] = {
	id = 46,
	slot = 11,
	name = "Fallschirm",
	preis = 250,
	category = 1,
	empty = false,
	public = false
}
weaponTable[42] = {
	id = 47,
	slot = 12,
	name = "Satchel Detonator",
	preis = 600,
	category = 1,
	empty = false,
	public = false
}
