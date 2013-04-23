--Copyright 2008-2013 Einstein & Werni
--
--Diese Datei ist Bestandteil von mtarl.
--
--mtarl ist freie Software:
--Sie k√∂nnen weiterverteilen und/oder modifizieren unter den Bedingungen
--der GNU General Public License, wie von der Free Software Foundation,
--entweder gem√§√ü Version 3 der Lizenz oder (nach Ihrer Option) jeder
--sp√§teren Version ver√∂ffentlicht.
--
--mtarl wird verteilt, in der Hoffnung, dass es n√ºtzlich sein wird, aber
--ohne jede Garantie; ohne selbst der stillschweigenden Garantie der
--Marktg√§ngigkeit oder Eignung f√ºr einen bestimmten Zweck. Finden Sie unter
--der GNU General Public License f√ºr weitere Details.
--
--Eine Kopie der GNU General Public License finden Sie unter: http://www.gnu.org/licenses/gpl.txt



--Funktionen weiter unten
local streetTable = {}

streetTable.ew = {}
streetTable.sn = {}

streetTable.ew[1] = {
	name = "Herlo"..szlig.."sohnstra"..szlig.."e",
	x = 5.0 
}
streetTable.ew[2] = {
	name = "Krautbreite",
	x = 10.0 
}
streetTable.ew[3] = {
	name = "F"..auml.."rberstra"..szlig.."e",
	x = 15.0 
}
streetTable.ew[4] = {
	name = "Schletterplatz",
	x = 20.0 
}
streetTable.ew[5] = {
	name = "Gro"..szlig.."mannstra"..szlig.."e",
	x = 25.0 
}
streetTable.ew[6] = {
	name = "Haselstra"..szlig.."e",
	x = 30.0 
}
streetTable.ew[7] = {
	name = "Freirodaer Weg",
	x = 35.0 
}
streetTable.ew[8] = {
	name = "Kippenbergstra"..szlig.."e",
	x = 40.0 
}
streetTable.ew[9] = {
	name = "Wilhelm-Seyfferth-Stra"..szlig.."e",
	x = 45.0 
}
streetTable.ew[10] = {
	name = "Mistelbogen",
	x = 50.0 
}
streetTable.ew[11] = {
	name = "Hirschfelder Stra"..szlig.."e",
	x = 55.0 
}
streetTable.ew[12] = {
	name = "Feldahornweg",
	x = 60.0 
}
streetTable.ew[13] = {
	name = "G"..ouml.."bschelwitzer Stra"..szlig.."e",
	x = 65.0 
}
streetTable.ew[14] = {
	name = "Kanalstra"..szlig.."e",
	x = 70.0 
}
streetTable.ew[15] = {
	name = "Clara-Wieck-Stra"..szlig.."e",
	x = 75.0 
}
streetTable.ew[16] = {
	name = "Zu den G"..auml.."rten",
	x = 80.0 
}
streetTable.ew[17] = {
	name = "Eitingonstra"..szlig.."e",
	x = 85.0 
}
streetTable.ew[18] = {
	name = "Kr"..ouml.."nerstra"..szlig.."e",
	x = 90.0 
}
streetTable.ew[19] = {
	name = "Am Feld",
	x = 95.0 
}
streetTable.ew[20] = {
	name = "Graf-Zeppelin-Ring",
	x = 100.0 
}
streetTable.ew[21] = {
	name = "Sch"..ouml.."nauer Landstra"..szlig.."e",
	x = 105.0 
}
streetTable.ew[22] = {
	name = "Voigtstra"..szlig.."e",
	x = 110.0 
}
streetTable.ew[23] = {
	name = "Max-Metzger-Stra"..szlig.."e",
	x = 115.0 
}
streetTable.ew[24] = {
	name = "Puschstra"..szlig.."e",
	x = 120.0 
}
streetTable.ew[25] = {
	name = "Lilienweg",
	x = 125.0 
}
streetTable.ew[26] = {
	name = "Roscherstra"..szlig.."e",
	x = 130.0 
}
streetTable.ew[27] = {
	name = "Nimrodstra"..szlig.."e",
	x = 135.0 
}
streetTable.ew[28] = {
	name = "Am R"..ouml.."schenhof",
	x = 140.0 
}
streetTable.ew[29] = {
	name = "Kurze Stra"..szlig.."e",
	x = 145.0 
}
streetTable.ew[30] = {
	name = "Rothenburger Stra"..szlig.."e",
	x = 150.0 
}
streetTable.ew[31] = {
	name = "Funkenburgstra"..szlig.."e",
	x = 155.0 
}
streetTable.ew[32] = {
	name = "Mottelerstra"..szlig.."e",
	x = 160.0 
}
streetTable.ew[33] = {
	name = "Forsetistra"..szlig.."e",
	x = 165.0 
}
streetTable.ew[34] = {
	name = "Lene-Voigt-Stra"..szlig.."e",
	x = 170.0 
}
streetTable.ew[35] = {
	name = "Froschweg",
	x = 175.0 
}
streetTable.ew[36] = {
	name = "Bahnweg",
	x = 180.0 
}
streetTable.ew[37] = {
	name = "Schrammsteinstra"..szlig.."e",
	x = 185.0 
}
streetTable.ew[38] = {
	name = "Paul-Ernst-Stra"..szlig.."e",
	x = 190.0 
}
streetTable.ew[39] = {
	name = "Tieckstra"..szlig.."e",
	x = 195.0 
}
streetTable.ew[40] = {
	name = "H"..auml.."ndelstra"..szlig.."e",
	x = 200.0 
}
streetTable.ew[41] = {
	name = "Edlichstra"..szlig.."e",
	x = 205.0 
}
streetTable.ew[42] = {
	name = "Am Feldrain",
	x = 210.0 
}
streetTable.ew[43] = {
	name = "Wendenstra"..szlig.."e",
	x = 215.0 
}
streetTable.ew[44] = {
	name = "Ranftsche Gasse",
	x = 220.0 
}
streetTable.ew[45] = {
	name = "Hickmannstra"..szlig.."e",
	x = 225.0 
}
streetTable.ew[46] = {
	name = "Cletzener Weg",
	x = 230.0 
}
streetTable.ew[47] = {
	name = "Wasserwerksweg",
	x = 235.0 
}
streetTable.ew[48] = {
	name = "Albert-Vollsack-Stra"..szlig.."e",
	x = 240.0 
}
streetTable.ew[49] = {
	name = "An der Kirchgasse",
	x = 245.0 
}
streetTable.ew[50] = {
	name = "Wacholderweg",
	x = 250.0 
}
streetTable.ew[51] = {
	name = "Schwimmerstra"..szlig.."e",
	x = 255.0 
}
streetTable.ew[52] = {
	name = "Reiterallee",
	x = 260.0 
}
streetTable.ew[53] = {
	name = "Achatstra"..szlig.."e",
	x = 265.0 
}
streetTable.ew[54] = {
	name = "Zschortauer Stra"..szlig.."e",
	x = 270.0 
}
streetTable.ew[55] = {
	name = "Nietzschestra"..szlig.."e",
	x = 275.0 
}
streetTable.ew[56] = {
	name = "Kupfergasse",
	x = 280.0 
}
streetTable.ew[57] = {
	name = "P"..uuml.."chauer Stra"..szlig.."e",
	x = 285.0 
}
streetTable.ew[58] = {
	name = "Rippachtalstra"..szlig.."e",
	x = 290.0 
}
streetTable.ew[59] = {
	name = "Apoldaer Weg",
	x = 295.0 
}
streetTable.ew[60] = {
	name = "Malvenweg",
	x = 300.0 
}
streetTable.ew[61] = {
	name = "Holsteinstra"..szlig.."e",
	x = 305.0 
}
streetTable.ew[62] = {
	name = "Neuer Ring",
	x = 310.0 
}
streetTable.ew[63] = {
	name = "Biberpfad",
	x = 315.0 
}
streetTable.ew[64] = {
	name = "Paulinerweg",
	x = 320.0 
}
streetTable.ew[65] = {
	name = "Denkmalsallee",
	x = 325.0 
}
streetTable.ew[66] = {
	name = "Stieglitzweg",
	x = 330.0 
}
streetTable.ew[67] = {
	name = "Max-Liebermann-Stra"..szlig.."e",
	x = 335.0 
}
streetTable.ew[68] = {
	name = "Ohmweg",
	x = 340.0 
}
streetTable.ew[69] = {
	name = "Anna-Kuhnow-Stra"..szlig.."e",
	x = 345.0 
}
streetTable.ew[70] = {
	name = "Am Wiesenblick",
	x = 350.0 
}
streetTable.ew[71] = {
	name = "Neubauernstra"..szlig.."e",
	x = 355.0 
}
streetTable.ew[72] = {
	name = "Andersenweg",
	x = 360.0 
}
streetTable.ew[73] = {
	name = "Rodelandstra"..szlig.."e",
	x = 365.0 
}
streetTable.ew[74] = {
	name = "Willmar-Schwabe-Ring",
	x = 370.0 
}
streetTable.ew[75] = {
	name = "Rembrandtplatz",
	x = 375.0 
}
streetTable.ew[76] = {
	name = "Richard-Springer-Weg",
	x = 380.0 
}
streetTable.ew[77] = {
	name = "Miltitzer Allee",
	x = 385.0 
}
streetTable.ew[78] = {
	name = "Am kleinen Feld",
	x = 390.0 
}
streetTable.ew[79] = {
	name = "Zweenfurther Stra"..szlig.."e",
	x = 395.0 
}
streetTable.ew[80] = {
	name = "Rudolph-Herrmann-Stra"..szlig.."e",
	x = 400.0 
}
streetTable.ew[81] = {
	name = "Wieselsteig",
	x = 405.0 
}
streetTable.ew[82] = {
	name = "Carlebachstra"..szlig.."e",
	x = 410.0 
}
streetTable.ew[83] = {
	name = "Zerbster Stra"..szlig.."e",
	x = 415.0 
}
streetTable.ew[84] = {
	name = "B"..ouml.."cklinweg",
	x = 420.0 
}
streetTable.ew[85] = {
	name = "L"..ouml.."nsstra"..szlig.."e",
	x = 425.0 
}
streetTable.ew[86] = {
	name = "Froschk"..ouml.."nigweg",
	x = 430.0 
}
streetTable.ew[87] = {
	name = "T"..auml.."ubchenweg",
	x = 435.0 
}
streetTable.ew[88] = {
	name = "G"..uuml.."nselstra"..szlig.."e",
	x = 440.0 
}
streetTable.ew[89] = {
	name = "Dieselstra"..szlig.."e",
	x = 445.0 
}
streetTable.ew[90] = {
	name = "Kastanienweg",
	x = 450.0 
}
streetTable.ew[91] = {
	name = "Gr"..ouml.."pplerstra"..szlig.."e",
	x = 455.0 
}
streetTable.ew[92] = {
	name = "Steinstra"..szlig.."e",
	x = 460.0 
}
streetTable.ew[93] = {
	name = "Am Wegekreuz",
	x = 465.0 
}
streetTable.ew[94] = {
	name = "P"..ouml.."ppigstra"..szlig.."e",
	x = 470.0 
}
streetTable.ew[95] = {
	name = "Hofer Stra"..szlig.."e",
	x = 475.0 
}
streetTable.ew[96] = {
	name = "Hommelweg",
	x = 480.0 
}
streetTable.ew[97] = {
	name = "Windscheidstra"..szlig.."e",
	x = 485.0 
}
streetTable.ew[98] = {
	name = "Am Gothischen Bad",
	x = 490.0 
}
streetTable.ew[99] = {
	name = "Kurt-Schumacher-Stra"..szlig.."e",
	x = 495.0 
}
streetTable.ew[100] = {
	name = "Gr"..uuml.."nfinkenweg",
	x = 500.0 
}
streetTable.ew[101] = {
	name = "Sturmweg",
	x = 505.0 
}
streetTable.ew[102] = {
	name = "Wendlerstra"..szlig.."e",
	x = 510.0 
}
streetTable.ew[103] = {
	name = "Reginenstra"..szlig.."e",
	x = 515.0 
}
streetTable.ew[104] = {
	name = "Markthallenstra"..szlig.."e",
	x = 520.0 
}
streetTable.ew[105] = {
	name = "Am Fl"..ouml..""..szlig.."gen",
	x = 525.0 
}
streetTable.ew[106] = {
	name = "Torweg",
	x = 530.0 
}
streetTable.ew[107] = {
	name = "Klarastra"..szlig.."e",
	x = 535.0 
}
streetTable.ew[108] = {
	name = "K"..ouml.."hraer Stra"..szlig.."e",
	x = 540.0 
}
streetTable.ew[109] = {
	name = "Heinrich-Oelerich-Stra"..szlig.."e",
	x = 545.0 
}
streetTable.ew[110] = {
	name = "Diesterwegstra"..szlig.."e",
	x = 550.0 
}
streetTable.ew[111] = {
	name = "Sophienstra"..szlig.."e",
	x = 555.0 
}
streetTable.ew[112] = {
	name = "Nibelungenring",
	x = 560.0 
}
streetTable.ew[113] = {
	name = "Barbarastra"..szlig.."e",
	x = 565.0 
}
streetTable.ew[114] = {
	name = "Sachsenlinie",
	x = 570.0 
}
streetTable.ew[115] = {
	name = "Sommerfelder Stra"..szlig.."e",
	x = 575.0 
}
streetTable.ew[116] = {
	name = "Freiberger Stra"..szlig.."e",
	x = 580.0 
}
streetTable.ew[117] = {
	name = "Querweg",
	x = 585.0 
}
streetTable.ew[118] = {
	name = "Albrechtshainer Stra"..szlig.."e",
	x = 590.0 
}
streetTable.ew[119] = {
	name = "Webergasse",
	x = 595.0 
}
streetTable.ew[120] = {
	name = "Walter-Heinze-Stra"..szlig.."e",
	x = 600.0 
}
streetTable.ew[121] = {
	name = "R"..uuml.."bezahlweg",
	x = 605.0 
}
streetTable.ew[122] = {
	name = "Buchfinkenweg",
	x = 610.0 
}
streetTable.ew[123] = {
	name = "Elsteraue",
	x = 615.0 
}
streetTable.ew[124] = {
	name = "Rotdornstra"..szlig.."e",
	x = 620.0 
}
streetTable.ew[125] = {
	name = "Mahlmannstra"..szlig.."e",
	x = 625.0 
}
streetTable.ew[126] = {
	name = "Schomburgkstra"..szlig.."e",
	x = 630.0 
}
streetTable.ew[127] = {
	name = "Gildemeisterring",
	x = 635.0 
}
streetTable.ew[128] = {
	name = "Am Turnplatz",
	x = 640.0 
}
streetTable.ew[129] = {
	name = "Teerosenweg",
	x = 645.0 
}
streetTable.ew[130] = {
	name = "An der Parthe",
	x = 650.0 
}
streetTable.ew[131] = {
	name = "Zwergenweg",
	x = 655.0 
}
streetTable.ew[132] = {
	name = "Louise-Otto-Peters-Allee",
	x = 660.0 
}
streetTable.ew[133] = {
	name = "Lilienthalstra"..szlig.."e",
	x = 665.0 
}
streetTable.ew[134] = {
	name = "Walter-Markov-Ring",
	x = 670.0 
}
streetTable.ew[135] = {
	name = "Am Sandberg",
	x = 675.0 
}
streetTable.ew[136] = {
	name = "Turnerstra"..szlig.."e",
	x = 680.0 
}
streetTable.ew[137] = {
	name = "Junghan"..szlig.."stra"..szlig.."e",
	x = 685.0 
}
streetTable.ew[138] = {
	name = "Knesebeckstra"..szlig.."e",
	x = 690.0 
}
streetTable.ew[139] = {
	name = "Ilse-Decho-Weg",
	x = 695.0 
}
streetTable.ew[140] = {
	name = "Carpzovstra"..szlig.."e",
	x = 700.0 
}
streetTable.ew[141] = {
	name = "Ludwig-Hupfeld-Stra"..szlig.."e",
	x = 705.0 
}
streetTable.ew[142] = {
	name = "Christianstra"..szlig.."e",
	x = 710.0 
}
streetTable.ew[143] = {
	name = "Pansastra"..szlig.."e",
	x = 715.0 
}
streetTable.ew[144] = {
	name = "Phoenixweg",
	x = 720.0 
}
streetTable.ew[145] = {
	name = "Harnackstra"..szlig.."e",
	x = 725.0 
}
streetTable.ew[146] = {
	name = "Am Keulenberg",
	x = 730.0 
}
streetTable.ew[147] = {
	name = "Gustav-Adolf-Stra"..szlig.."e",
	x = 735.0 
}
streetTable.ew[148] = {
	name = "Lindenstra"..szlig.."e",
	x = 740.0 
}
streetTable.ew[149] = {
	name = "Stauffacherweg",
	x = 745.0 
}
streetTable.ew[150] = {
	name = "Oel"..szlig.."nerstra"..szlig.."e",
	x = 750.0 
}
streetTable.ew[151] = {
	name = "P"..ouml.."rstener Stra"..szlig.."e",
	x = 755.0 
}
streetTable.ew[152] = {
	name = "Reinhold-Kr"..uuml.."ger-Stra"..szlig.."e",
	x = 760.0 
}
streetTable.ew[153] = {
	name = "Pappelblick",
	x = 765.0 
}
streetTable.ew[154] = {
	name = "Zur Bauernwiese",
	x = 770.0 
}
streetTable.ew[155] = {
	name = "Huttenstra"..szlig.."e",
	x = 775.0 
}
streetTable.ew[156] = {
	name = "Theodor-Voigt-Stra"..szlig.."e",
	x = 780.0 
}
streetTable.ew[157] = {
	name = "Obludastra"..szlig.."e",
	x = 785.0 
}
streetTable.ew[158] = {
	name = "Dorotheenplatz",
	x = 790.0 
}
streetTable.ew[159] = {
	name = "Theobald-Beer-Stra"..szlig.."e",
	x = 795.0 
}
streetTable.ew[160] = {
	name = "D"..auml.."umlingsweg",
	x = 800.0 
}
streetTable.ew[161] = {
	name = "Plau"..szlig.."iger Weg",
	x = 805.0 
}
streetTable.ew[162] = {
	name = "Eva-Maria-Buch-Stra"..szlig.."e",
	x = 810.0 
}
streetTable.ew[163] = {
	name = "Leibnitzstra"..szlig.."e",
	x = 815.0 
}
streetTable.ew[164] = {
	name = "Thomas-Mann-Stra"..szlig.."e",
	x = 820.0 
}
streetTable.ew[165] = {
	name = "Kohlenstra"..szlig.."e",
	x = 825.0 
}
streetTable.ew[166] = {
	name = "Singdrosselweg",
	x = 830.0 
}
streetTable.ew[167] = {
	name = "Goldsternstra"..szlig.."e",
	x = 835.0 
}
streetTable.ew[168] = {
	name = "Max-Reger-Allee",
	x = 840.0 
}
streetTable.ew[169] = {
	name = "Egelstra"..szlig.."e",
	x = 845.0 
}
streetTable.ew[170] = {
	name = "Engelmannstra"..szlig.."e",
	x = 850.0 
}
streetTable.ew[171] = {
	name = "Gro"..szlig.."er Brockhaus",
	x = 855.0 
}
streetTable.ew[172] = {
	name = "Gewandg"..auml..""..szlig.."chen",
	x = 860.0 
}
streetTable.ew[173] = {
	name = "Kipsdorfer Weg",
	x = 865.0 
}
streetTable.ew[174] = {
	name = "K"..ouml.."nneritzstra"..szlig.."e",
	x = 870.0 
}
streetTable.ew[175] = {
	name = "Hohentichelnstra"..szlig.."e",
	x = 875.0 
}
streetTable.ew[176] = {
	name = "Himbeerweg",
	x = 880.0 
}
streetTable.ew[177] = {
	name = "Neue Stra"..szlig.."e",
	x = 885.0 
}
streetTable.ew[178] = {
	name = "M"..ouml.."ckernsche Stra"..szlig.."e",
	x = 890.0 
}
streetTable.ew[179] = {
	name = "M"..uuml.."hlgrabenweg",
	x = 895.0 
}
streetTable.ew[180] = {
	name = "Raustra"..szlig.."e",
	x = 900.0 
}
streetTable.ew[181] = {
	name = "Oberhofer Weg",
	x = 905.0 
}
streetTable.ew[182] = {
	name = "Theresienstra"..szlig.."e",
	x = 910.0 
}
streetTable.ew[183] = {
	name = "Neuenburger Weg",
	x = 915.0 
}
streetTable.ew[184] = {
	name = "B"..ouml.."sdorfer Ring",
	x = 920.0 
}
streetTable.ew[185] = {
	name = "Hasenpfad",
	x = 925.0 
}
streetTable.ew[186] = {
	name = "Grabenweg",
	x = 930.0 
}
streetTable.ew[187] = {
	name = "Weimarer Stra"..szlig.."e",
	x = 935.0 
}
streetTable.ew[188] = {
	name = "Wilhelm-Wundt-Platz",
	x = 940.0 
}
streetTable.ew[189] = {
	name = "Paul-List-Stra"..szlig.."e",
	x = 945.0 
}
streetTable.ew[190] = {
	name = "Gustav-Schwabe-Platz",
	x = 950.0 
}
streetTable.ew[191] = {
	name = "Klingenstra"..szlig.."e",
	x = 955.0 
}
streetTable.ew[192] = {
	name = "Leanderweg",
	x = 960.0 
}
streetTable.ew[193] = {
	name = "K"..uuml.."chenholzallee",
	x = 965.0 
}
streetTable.ew[194] = {
	name = "Am Tore",
	x = 970.0 
}
streetTable.ew[195] = {
	name = "Linkelstra"..szlig.."e",
	x = 975.0 
}
streetTable.ew[196] = {
	name = "Blumenstra"..szlig.."e",
	x = 980.0 
}
streetTable.ew[197] = {
	name = "Gottfried-Keller-Stra"..szlig.."e",
	x = 985.0 
}
streetTable.ew[198] = {
	name = "L"..ouml..""..szlig.."niger Stra"..szlig.."e",
	x = 990.0 
}
streetTable.ew[199] = {
	name = "Verdistra"..szlig.."e",
	x = 995.0 
}
streetTable.ew[200] = {
	name = "Zum Schwinderplan",
	x = 1000.0 
}
streetTable.ew[201] = {
	name = "Lomonossowstra"..szlig.."e",
	x = 1005.0 
}
streetTable.ew[202] = {
	name = "Kuhturmstra"..szlig.."e",
	x = 1010.0 
}
streetTable.ew[203] = {
	name = "Lichtenbergweg",
	x = 1015.0 
}
streetTable.ew[204] = {
	name = "Eidechsenweg",
	x = 1020.0 
}
streetTable.ew[205] = {
	name = "Shukowstra"..szlig.."e",
	x = 1025.0 
}
streetTable.ew[206] = {
	name = "Karl-Blechen-Stra"..szlig.."e",
	x = 1030.0 
}
streetTable.ew[207] = {
	name = "Weidlichstra"..szlig.."e",
	x = 1035.0 
}
streetTable.ew[208] = {
	name = "Hainburger Weg",
	x = 1040.0 
}
streetTable.ew[209] = {
	name = "Ro"..szlig.."bachstra"..szlig.."e",
	x = 1045.0 
}
streetTable.ew[210] = {
	name = "Seilerweg",
	x = 1050.0 
}
streetTable.ew[211] = {
	name = "Mothesstra"..szlig.."e",
	x = 1055.0 
}
streetTable.ew[212] = {
	name = "Pelzgasse",
	x = 1060.0 
}
streetTable.ew[213] = {
	name = "Altes Dorf",
	x = 1065.0 
}
streetTable.ew[214] = {
	name = "Halberst"..auml.."dter Stra"..szlig.."e",
	x = 1070.0 
}
streetTable.ew[215] = {
	name = "Am Dorfteich",
	x = 1075.0 
}
streetTable.ew[216] = {
	name = "Wei"..szlig.."dornweg",
	x = 1080.0 
}
streetTable.ew[217] = {
	name = "Am Sportforum",
	x = 1085.0 
}
streetTable.ew[218] = {
	name = "Spittastra"..szlig.."e",
	x = 1090.0 
}
streetTable.ew[219] = {
	name = "Georg-Schwarz-Stra"..szlig.."e",
	x = 1095.0 
}
streetTable.ew[220] = {
	name = "Dantestra"..szlig.."e",
	x = 1100.0 
}
streetTable.ew[221] = {
	name = "Matth"..auml.."ikirchhof",
	x = 1105.0 
}
streetTable.ew[222] = {
	name = "Sandberg",
	x = 1110.0 
}
streetTable.ew[223] = {
	name = "CalderÛnweg",
	x = 1115.0 
}
streetTable.ew[224] = {
	name = "Mecklenburger Stra"..szlig.."e",
	x = 1120.0 
}
streetTable.ew[225] = {
	name = "Lerchengrund",
	x = 1125.0 
}
streetTable.ew[226] = {
	name = "Dittrichstra"..szlig.."e",
	x = 1130.0 
}
streetTable.ew[227] = {
	name = "Sandweg",
	x = 1135.0 
}
streetTable.ew[228] = {
	name = "Peilickestra"..szlig.."e",
	x = 1140.0 
}
streetTable.ew[229] = {
	name = "Seffnerstra"..szlig.."e",
	x = 1145.0 
}
streetTable.ew[230] = {
	name = "Kreuzstra"..szlig.."e",
	x = 1150.0 
}
streetTable.ew[231] = {
	name = "Zum Frischemarkt",
	x = 1155.0 
}
streetTable.ew[232] = {
	name = "Moosbeerweg",
	x = 1160.0 
}
streetTable.ew[233] = {
	name = "Koburger Stra"..szlig.."e",
	x = 1165.0 
}
streetTable.ew[234] = {
	name = "Ulmer Stra"..szlig.."e",
	x = 1170.0 
}
streetTable.ew[235] = {
	name = "Forststra"..szlig.."e",
	x = 1175.0 
}
streetTable.ew[236] = {
	name = "Rietzschkegrund",
	x = 1180.0 
}
streetTable.ew[237] = {
	name = "Am Bahnhof",
	x = 1185.0 
}
streetTable.ew[238] = {
	name = "Friedrich-List-Platz",
	x = 1190.0 
}
streetTable.ew[239] = {
	name = "Jonsdorfer Stra"..szlig.."e",
	x = 1195.0 
}
streetTable.ew[240] = {
	name = "Klabundweg",
	x = 1200.0 
}
streetTable.ew[241] = {
	name = "Thomaskirchhof",
	x = 1205.0 
}
streetTable.ew[242] = {
	name = "Nienborgstra"..szlig.."e",
	x = 1210.0 
}
streetTable.ew[243] = {
	name = "B"..auml.."stleinstra"..szlig.."e",
	x = 1215.0 
}
streetTable.ew[244] = {
	name = "K"..ouml.."rnerplatz",
	x = 1220.0 
}
streetTable.ew[245] = {
	name = "Michaelisstra"..szlig.."e",
	x = 1225.0 
}
streetTable.ew[246] = {
	name = "Cleudner Stra"..szlig.."e",
	x = 1230.0 
}
streetTable.ew[247] = {
	name = "Ehrenberger Stra"..szlig.."e",
	x = 1235.0 
}
streetTable.ew[248] = {
	name = "Zwergasternweg",
	x = 1240.0 
}
streetTable.ew[249] = {
	name = "P"..ouml.."sgrabenweg",
	x = 1245.0 
}
streetTable.ew[250] = {
	name = "Amalienstra"..szlig.."e",
	x = 1250.0 
}
streetTable.ew[251] = {
	name = "Rittergutsstra"..szlig.."e",
	x = 1255.0 
}
streetTable.ew[252] = {
	name = "Heimteichstra"..szlig.."e",
	x = 1260.0 
}
streetTable.ew[253] = {
	name = "W"..ouml.."llnerstra"..szlig.."e",
	x = 1265.0 
}
streetTable.ew[254] = {
	name = "Elsbethstra"..szlig.."e",
	x = 1270.0 
}
streetTable.ew[255] = {
	name = "Flei"..szlig.."nerstra"..szlig.."e",
	x = 1275.0 
}
streetTable.ew[256] = {
	name = "Dombrowskistra"..szlig.."e",
	x = 1280.0 
}
streetTable.ew[257] = {
	name = "Turmgutstra"..szlig.."e",
	x = 1285.0 
}
streetTable.ew[258] = {
	name = "Zadestra"..szlig.."e",
	x = 1290.0 
}
streetTable.ew[259] = {
	name = "Telemannstra"..szlig.."e",
	x = 1295.0 
}
streetTable.ew[260] = {
	name = "Agricolastra"..szlig.."e",
	x = 1300.0 
}
streetTable.ew[261] = {
	name = "Zuckelhausener Ring",
	x = 1305.0 
}
streetTable.ew[262] = {
	name = "Probstheidaer Stra"..szlig.."e",
	x = 1310.0 
}
streetTable.ew[263] = {
	name = "Marsweg",
	x = 1315.0 
}
streetTable.ew[264] = {
	name = "Faradaystra"..szlig.."e",
	x = 1320.0 
}
streetTable.ew[265] = {
	name = "Lobensteiner Stra"..szlig.."e",
	x = 1325.0 
}
streetTable.ew[266] = {
	name = "D"..uuml.."rnsteiner Weg",
	x = 1330.0 
}
streetTable.ew[267] = {
	name = "Ludolf-Colditz-Stra"..szlig.."e",
	x = 1335.0 
}
streetTable.ew[268] = {
	name = "Schmutzlerstra"..szlig.."e",
	x = 1340.0 
}
streetTable.ew[269] = {
	name = "An der Lautsche",
	x = 1345.0 
}
streetTable.ew[270] = {
	name = "Happweg",
	x = 1350.0 
}
streetTable.ew[271] = {
	name = "Thierschstra"..szlig.."e",
	x = 1355.0 
}
streetTable.ew[272] = {
	name = "L"..auml.."hnestra"..szlig.."e",
	x = 1360.0 
}
streetTable.ew[273] = {
	name = "Salamanderstra"..szlig.."e",
	x = 1365.0 
}
streetTable.ew[274] = {
	name = "Windm"..uuml.."hlenweg",
	x = 1370.0 
}
streetTable.ew[275] = {
	name = "Am Exer",
	x = 1375.0 
}
streetTable.ew[276] = {
	name = "Leutzscher Allee",
	x = 1380.0 
}
streetTable.ew[277] = {
	name = "Hohenrodaer Weg",
	x = 1385.0 
}
streetTable.ew[278] = {
	name = "Wachsmuthstra"..szlig.."e",
	x = 1390.0 
}
streetTable.ew[279] = {
	name = "Morgensternstra"..szlig.."e",
	x = 1395.0 
}
streetTable.ew[280] = {
	name = "Wendelin-Hipler-Weg",
	x = 1400.0 
}
streetTable.ew[281] = {
	name = "Gr"..uuml.."ner Weg",
	x = 1405.0 
}
streetTable.ew[282] = {
	name = "Karl-Tauchnitz-Stra"..szlig.."e",
	x = 1410.0 
}
streetTable.ew[283] = {
	name = "Zwiebelweg",
	x = 1415.0 
}
streetTable.ew[284] = {
	name = "Coblenzer Stra"..szlig.."e",
	x = 1420.0 
}
streetTable.ew[285] = {
	name = "Pr"..uuml.."nstra"..szlig.."e",
	x = 1425.0 
}
streetTable.ew[286] = {
	name = "Defoestra"..szlig.."e",
	x = 1430.0 
}
streetTable.ew[287] = {
	name = "Zum Wasserturm",
	x = 1435.0 
}
streetTable.ew[288] = {
	name = "Am Eselshaus",
	x = 1440.0 
}
streetTable.ew[289] = {
	name = "Rankestra"..szlig.."e",
	x = 1445.0 
}
streetTable.ew[290] = {
	name = "Schweinfurter Stra"..szlig.."e",
	x = 1450.0 
}
streetTable.ew[291] = {
	name = "Regensburger Stra"..szlig.."e",
	x = 1455.0 
}
streetTable.ew[292] = {
	name = "Salzg"..auml..""..szlig.."chen",
	x = 1460.0 
}
streetTable.ew[293] = {
	name = "Porschestra"..szlig.."e",
	x = 1465.0 
}
streetTable.ew[294] = {
	name = "Watestra"..szlig.."e",
	x = 1470.0 
}
streetTable.ew[295] = {
	name = "Anzengruberstra"..szlig.."e",
	x = 1475.0 
}
streetTable.ew[296] = {
	name = "Seiffener Stra"..szlig.."e",
	x = 1480.0 
}
streetTable.ew[297] = {
	name = "Volckmarstra"..szlig.."e",
	x = 1485.0 
}
streetTable.ew[298] = {
	name = "Tauchaer Stra"..szlig.."e",
	x = 1490.0 
}
streetTable.ew[299] = {
	name = "Binsengrund",
	x = 1495.0 
}
streetTable.ew[300] = {
	name = "Stormstra"..szlig.."e",
	x = 1500.0 
}
streetTable.ew[301] = {
	name = "Trufanowstra"..szlig.."e",
	x = 1505.0 
}
streetTable.ew[302] = {
	name = "Ernestistra"..szlig.."e",
	x = 1510.0 
}
streetTable.ew[303] = {
	name = "Kleine Promenade",
	x = 1515.0 
}
streetTable.ew[304] = {
	name = "Bahnhofstra"..szlig.."e",
	x = 1520.0 
}
streetTable.ew[305] = {
	name = "Stephaniplatz",
	x = 1525.0 
}
streetTable.ew[306] = {
	name = "Palmstra"..szlig.."e",
	x = 1530.0 
}
streetTable.ew[307] = {
	name = "Bormannstra"..szlig.."e",
	x = 1535.0 
}
streetTable.ew[308] = {
	name = "Gerlindeweg",
	x = 1540.0 
}
streetTable.ew[309] = {
	name = "Breiteweg",
	x = 1545.0 
}
streetTable.ew[310] = {
	name = "Wernerstra"..szlig.."e",
	x = 1550.0 
}
streetTable.ew[311] = {
	name = "Friedrichshafner Stra"..szlig.."e",
	x = 1555.0 
}
streetTable.ew[312] = {
	name = "Ringstra"..szlig.."e",
	x = 1560.0 
}
streetTable.ew[313] = {
	name = "Pettenkoferstra"..szlig.."e",
	x = 1565.0 
}
streetTable.ew[314] = {
	name = "Reineckestra"..szlig.."e",
	x = 1570.0 
}
streetTable.ew[315] = {
	name = "Augustenstra"..szlig.."e",
	x = 1575.0 
}
streetTable.ew[316] = {
	name = "Ortrunweg",
	x = 1580.0 
}
streetTable.ew[317] = {
	name = "Am Osthang",
	x = 1585.0 
}
streetTable.ew[318] = {
	name = "Brambacher Stra"..szlig.."e",
	x = 1590.0 
}
streetTable.ew[319] = {
	name = "Georg-Maurer-Stra"..szlig.."e",
	x = 1595.0 
}
streetTable.ew[320] = {
	name = "Wilhelm-Leuschner-Platz",
	x = 1600.0 
}
streetTable.ew[321] = {
	name = "H"..auml.."nischstra"..szlig.."e",
	x = 1605.0 
}
streetTable.ew[322] = {
	name = "Paul-Flechsig-Stra"..szlig.."e",
	x = 1610.0 
}
streetTable.ew[323] = {
	name = "Stralsunder Stra"..szlig.."e",
	x = 1615.0 
}
streetTable.ew[324] = {
	name = "Am Meilenstein",
	x = 1620.0 
}
streetTable.ew[325] = {
	name = "Weidenhofweg",
	x = 1625.0 
}
streetTable.ew[326] = {
	name = "Leostra"..szlig.."e",
	x = 1630.0 
}
streetTable.ew[327] = {
	name = "Platz des 20. Juli 1944",
	x = 1635.0 
}
streetTable.ew[328] = {
	name = "Lange Trift",
	x = 1640.0 
}
streetTable.ew[329] = {
	name = "Jordanstra"..szlig.."e",
	x = 1645.0 
}
streetTable.ew[330] = {
	name = "H"..ouml.."ltystra"..szlig.."e",
	x = 1650.0 
}
streetTable.ew[331] = {
	name = "Kurt-Eisner-Stra"..szlig.."e",
	x = 1655.0 
}
streetTable.ew[332] = {
	name = "Wustmannstra"..szlig.."e",
	x = 1660.0 
}
streetTable.ew[333] = {
	name = "Prellerstra"..szlig.."e",
	x = 1665.0 
}
streetTable.ew[334] = {
	name = "An den Pferdnerkabeln",
	x = 1670.0 
}
streetTable.ew[335] = {
	name = "Jakobiwinkel",
	x = 1675.0 
}
streetTable.ew[336] = {
	name = "Sasstra"..szlig.."e",
	x = 1680.0 
}
streetTable.ew[337] = {
	name = "Egon-Erwin-Kisch-Weg",
	x = 1685.0 
}
streetTable.ew[338] = {
	name = "Handelsstra"..szlig.."e",
	x = 1690.0 
}
streetTable.ew[339] = {
	name = "Igelstra"..szlig.."e",
	x = 1695.0 
}
streetTable.ew[340] = {
	name = "BMW-Allee",
	x = 1700.0 
}
streetTable.ew[341] = {
	name = "Rodelbahn",
	x = 1705.0 
}
streetTable.ew[342] = {
	name = "Am krummen Graben",
	x = 1710.0 
}
streetTable.ew[343] = {
	name = "Nordplatz",
	x = 1715.0 
}
streetTable.ew[344] = {
	name = "M"..ouml.."lkauer Dorfplatz",
	x = 1720.0 
}
streetTable.ew[345] = {
	name = "Baunackstra"..szlig.."e",
	x = 1725.0 
}
streetTable.ew[346] = {
	name = "Humboldtstra"..szlig.."e",
	x = 1730.0 
}
streetTable.ew[347] = {
	name = "Bausestra"..szlig.."e",
	x = 1735.0 
}
streetTable.ew[348] = {
	name = "Bontjes-van-Beek-Stra"..szlig.."e",
	x = 1740.0 
}
streetTable.ew[349] = {
	name = "Gr"..uuml.."ne Gasse",
	x = 1745.0 
}
streetTable.ew[350] = {
	name = "Dybwadstra"..szlig.."e",
	x = 1750.0 
}
streetTable.ew[351] = {
	name = "Kresseweg",
	x = 1755.0 
}
streetTable.ew[352] = {
	name = "Liliensteinstra"..szlig.."e",
	x = 1760.0 
}
streetTable.ew[353] = {
	name = "Fasanenh"..ouml.."he",
	x = 1765.0 
}
streetTable.ew[354] = {
	name = "G"..uuml.."ntheritzer Weg",
	x = 1770.0 
}
streetTable.ew[355] = {
	name = "Plau"..szlig.."iger Stra"..szlig.."e",
	x = 1775.0 
}
streetTable.ew[356] = {
	name = "Gerte",
	x = 1780.0 
}
streetTable.ew[357] = {
	name = "Reiherweg",
	x = 1785.0 
}
streetTable.ew[358] = {
	name = "Nu"..szlig.."baumweg",
	x = 1790.0 
}
streetTable.ew[359] = {
	name = "Volksgartenstra"..szlig.."e",
	x = 1795.0 
}
streetTable.ew[360] = {
	name = "Erlenweg",
	x = 1800.0 
}
streetTable.ew[361] = {
	name = "Rosestra"..szlig.."e",
	x = 1805.0 
}
streetTable.ew[362] = {
	name = "Schongauerstra"..szlig.."e",
	x = 1810.0 
}
streetTable.ew[363] = {
	name = "Barbussestra"..szlig.."e",
	x = 1815.0 
}
streetTable.ew[364] = {
	name = "Malteserstra"..szlig.."e",
	x = 1820.0 
}
streetTable.ew[365] = {
	name = "Portitzer Allee",
	x = 1825.0 
}
streetTable.ew[366] = {
	name = "Am Bauernsteg",
	x = 1830.0 
}
streetTable.ew[367] = {
	name = "Simsonplatz",
	x = 1835.0 
}
streetTable.ew[368] = {
	name = "Kirchweg",
	x = 1840.0 
}
streetTable.ew[369] = {
	name = "Jungfernstiege",
	x = 1845.0 
}
streetTable.ew[370] = {
	name = "Knorrstra"..szlig.."e",
	x = 1850.0 
}
streetTable.ew[371] = {
	name = "Ritter-Pflugk-Stra"..szlig.."e",
	x = 1855.0 
}
streetTable.ew[372] = {
	name = "Elisabethstra"..szlig.."e",
	x = 1860.0 
}
streetTable.ew[373] = {
	name = "Ratzelstra"..szlig.."e",
	x = 1865.0 
}
streetTable.ew[374] = {
	name = "Kolmstra"..szlig.."e",
	x = 1870.0 
}
streetTable.ew[375] = {
	name = "Kindstra"..szlig.."e",
	x = 1875.0 
}
streetTable.ew[376] = {
	name = "Angerstra"..szlig.."e",
	x = 1880.0 
}
streetTable.ew[377] = {
	name = "Ulmenweg",
	x = 1885.0 
}
streetTable.ew[378] = {
	name = "Sosaer Stra"..szlig.."e",
	x = 1890.0 
}
streetTable.ew[379] = {
	name = "Wiesenblumenweg",
	x = 1895.0 
}
streetTable.ew[380] = {
	name = "Selneckerstra"..szlig.."e",
	x = 1900.0 
}
streetTable.ew[381] = {
	name = "Elli-Voigt-Stra"..szlig.."e",
	x = 1905.0 
}
streetTable.ew[382] = {
	name = "Gerstenweg",
	x = 1910.0 
}
streetTable.ew[383] = {
	name = "Wiesengrund",
	x = 1915.0 
}
streetTable.ew[384] = {
	name = "Hainstra"..szlig.."e",
	x = 1920.0 
}
streetTable.ew[385] = {
	name = "Brodauer Weg",
	x = 1925.0 
}
streetTable.ew[386] = {
	name = "Brandvorwerkstra"..szlig.."e",
	x = 1930.0 
}
streetTable.ew[387] = {
	name = "Portitzer Winkel",
	x = 1935.0 
}
streetTable.ew[388] = {
	name = "Bautzmannstra"..szlig.."e",
	x = 1940.0 
}
streetTable.ew[389] = {
	name = "Gottfried-Rentzsch-Weg",
	x = 1945.0 
}
streetTable.ew[390] = {
	name = "Preu"..szlig.."enseite",
	x = 1950.0 
}
streetTable.ew[391] = {
	name = "Gottschedstra"..szlig.."e",
	x = 1955.0 
}
streetTable.ew[392] = {
	name = "Erhardstra"..szlig.."e",
	x = 1960.0 
}
streetTable.ew[393] = {
	name = "Karolusstra"..szlig.."e",
	x = 1965.0 
}
streetTable.ew[394] = {
	name = "Prof.-Dr.-Koch-Stra"..szlig.."e",
	x = 1970.0 
}
streetTable.ew[395] = {
	name = "Freirodaer Stra"..szlig.."e",
	x = 1975.0 
}
streetTable.ew[396] = {
	name = "Elstergarten",
	x = 1980.0 
}
streetTable.ew[397] = {
	name = "H"..auml.."uslergasse",
	x = 1985.0 
}
streetTable.ew[398] = {
	name = "Barfu"..szlig.."g"..auml..""..szlig.."chen",
	x = 1990.0 
}
streetTable.ew[399] = {
	name = "Heidelberger Stra"..szlig.."e",
	x = 1995.0 
}
streetTable.ew[400] = {
	name = "Waldmeisterweg",
	x = 2000.0 
}
streetTable.ew[401] = {
	name = "Naumburger Stra"..szlig.."e",
	x = 2005.0 
}
streetTable.ew[402] = {
	name = "Baalsdorfer Stra"..szlig.."e",
	x = 2010.0 
}
streetTable.ew[403] = {
	name = "Uhrigstra"..szlig.."e",
	x = 2015.0 
}
streetTable.ew[404] = {
	name = "Am Klosterfeld",
	x = 2020.0 
}
streetTable.ew[405] = {
	name = "An der M"..uuml.."hle",
	x = 2025.0 
}
streetTable.ew[406] = {
	name = "Diderotstra"..szlig.."e",
	x = 2030.0 
}
streetTable.ew[407] = {
	name = "Pr"..ouml.."ttitzer Weg",
	x = 2035.0 
}
streetTable.ew[408] = {
	name = "Am Alten M"..uuml.."hlgraben",
	x = 2040.0 
}
streetTable.ew[409] = {
	name = "Morellenweg",
	x = 2045.0 
}
streetTable.ew[410] = {
	name = "Thomasiusstra"..szlig.."e",
	x = 2050.0 
}
streetTable.ew[411] = {
	name = "Kleiner Zipfel",
	x = 2055.0 
}
streetTable.ew[412] = {
	name = "Curiestra"..szlig.."e",
	x = 2060.0 
}
streetTable.ew[413] = {
	name = "Scheumannstra"..szlig.."e",
	x = 2065.0 
}
streetTable.ew[414] = {
	name = "Ahornstra"..szlig.."e",
	x = 2070.0 
}
streetTable.ew[415] = {
	name = "Ihmelsstra"..szlig.."e",
	x = 2075.0 
}
streetTable.ew[416] = {
	name = "Am Kanal",
	x = 2080.0 
}
streetTable.ew[417] = {
	name = "Sperlingsgrund",
	x = 2085.0 
}
streetTable.ew[418] = {
	name = "Entsbergerstra"..szlig.."e",
	x = 2090.0 
}
streetTable.ew[419] = {
	name = "Fr"..ouml.."schelstra"..szlig.."e",
	x = 2095.0 
}
streetTable.ew[420] = {
	name = "Jahnallee",
	x = 2100.0 
}
streetTable.ew[421] = {
	name = "Neuburghausener Weg",
	x = 2105.0 
}
streetTable.ew[422] = {
	name = "Falladastra"..szlig.."e",
	x = 2110.0 
}
streetTable.ew[423] = {
	name = "Arthur-Polenz-Stra"..szlig.."e",
	x = 2115.0 
}
streetTable.ew[424] = {
	name = "Pappelhof",
	x = 2120.0 
}
streetTable.ew[425] = {
	name = "Baumgarten-Crusius-Stra"..szlig.."e",
	x = 2125.0 
}
streetTable.ew[426] = {
	name = "AmpËreweg",
	x = 2130.0 
}
streetTable.ew[427] = {
	name = "Elfenweg",
	x = 2135.0 
}
streetTable.ew[428] = {
	name = "Winkelstra"..szlig.."e",
	x = 2140.0 
}
streetTable.ew[429] = {
	name = "Leinestra"..szlig.."e",
	x = 2145.0 
}
streetTable.ew[430] = {
	name = "L"..uuml.."tzschenaer Stra"..szlig.."e",
	x = 2150.0 
}
streetTable.ew[431] = {
	name = "Bei der Kr"..auml.."henh"..uuml.."tte",
	x = 2155.0 
}
streetTable.ew[432] = {
	name = "T"..auml.."schnerstra"..szlig.."e",
	x = 2160.0 
}
streetTable.ew[433] = {
	name = "Tannenweg",
	x = 2165.0 
}
streetTable.ew[434] = {
	name = "Karlstra"..szlig.."e",
	x = 2170.0 
}
streetTable.ew[435] = {
	name = "Idastra"..szlig.."e",
	x = 2175.0 
}
streetTable.ew[436] = {
	name = "Torgauer Platz",
	x = 2180.0 
}
streetTable.ew[437] = {
	name = "Walter-G"..uuml.."nther-Weg",
	x = 2185.0 
}
streetTable.ew[438] = {
	name = "Am Hallischen Tor",
	x = 2190.0 
}
streetTable.ew[439] = {
	name = "Max-Planck-Stra"..szlig.."e",
	x = 2195.0 
}
streetTable.ew[440] = {
	name = "Arthur-Thiele-Weg",
	x = 2200.0 
}
streetTable.ew[441] = {
	name = "Saalecker Stra"..szlig.."e",
	x = 2205.0 
}
streetTable.ew[442] = {
	name = "Kiewer Stra"..szlig.."e",
	x = 2210.0 
}
streetTable.ew[443] = {
	name = "Zillstra"..szlig.."e",
	x = 2215.0 
}
streetTable.ew[444] = {
	name = "Mariannenstra"..szlig.."e",
	x = 2220.0 
}
streetTable.ew[445] = {
	name = "Am Fl"..uuml.."gelrad",
	x = 2225.0 
}
streetTable.ew[446] = {
	name = "Sportplatzstra"..szlig.."e",
	x = 2230.0 
}
streetTable.ew[447] = {
	name = "Saxoniastra"..szlig.."e",
	x = 2235.0 
}
streetTable.ew[448] = {
	name = "Donarstra"..szlig.."e",
	x = 2240.0 
}
streetTable.ew[449] = {
	name = "Kosakenweg",
	x = 2245.0 
}
streetTable.ew[450] = {
	name = "Johannaparkweg",
	x = 2250.0 
}
streetTable.ew[451] = {
	name = "Nerchauer Stra"..szlig.."e",
	x = 2255.0 
}
streetTable.ew[452] = {
	name = "Kamelienweg",
	x = 2260.0 
}
streetTable.ew[453] = {
	name = "Ostheimstra"..szlig.."e",
	x = 2265.0 
}
streetTable.ew[454] = {
	name = "Losinskiweg",
	x = 2270.0 
}
streetTable.ew[455] = {
	name = "Br"..uuml.."ckenstra"..szlig.."e",
	x = 2275.0 
}
streetTable.ew[456] = {
	name = "Kossaer Stra"..szlig.."e",
	x = 2280.0 
}
streetTable.ew[457] = {
	name = "Erich-Weinert-Stra"..szlig.."e",
	x = 2285.0 
}
streetTable.ew[458] = {
	name = "K"..ouml.."tzschauer Stra"..szlig.."e",
	x = 2290.0 
}
streetTable.ew[459] = {
	name = "Ernst-Schneller-Stra"..szlig.."e",
	x = 2295.0 
}
streetTable.ew[460] = {
	name = "Ahornweg",
	x = 2300.0 
}
streetTable.ew[461] = {
	name = "Orchideenweg",
	x = 2305.0 
}
streetTable.ew[462] = {
	name = "Am Schenkberg",
	x = 2310.0 
}
streetTable.ew[463] = {
	name = "Gr"..uuml.."nauer Allee",
	x = 2315.0 
}
streetTable.ew[464] = {
	name = "T"..ouml.."pferstra"..szlig.."e",
	x = 2320.0 
}
streetTable.ew[465] = {
	name = "Ro"..szlig.."stra"..szlig.."e",
	x = 2325.0 
}
streetTable.ew[466] = {
	name = "Saalfelder Stra"..szlig.."e",
	x = 2330.0 
}
streetTable.ew[467] = {
	name = "Goldacher Stra"..szlig.."e",
	x = 2335.0 
}
streetTable.ew[468] = {
	name = "William-Zipperer-Stra"..szlig.."e",
	x = 2340.0 
}
streetTable.ew[469] = {
	name = "Grenzstra"..szlig.."e",
	x = 2345.0 
}
streetTable.ew[470] = {
	name = "Oskar-Calov-Stra"..szlig.."e",
	x = 2350.0 
}
streetTable.ew[471] = {
	name = "An der Luppe",
	x = 2355.0 
}
streetTable.ew[472] = {
	name = "Kickerlingsberg",
	x = 2360.0 
}
streetTable.ew[473] = {
	name = "Zollikoferstra"..szlig.."e",
	x = 2365.0 
}
streetTable.ew[474] = {
	name = "Schuhmacherg"..auml..""..szlig.."chen",
	x = 2370.0 
}
streetTable.ew[475] = {
	name = "Liebertwolkwitzer Markt",
	x = 2375.0 
}
streetTable.ew[476] = {
	name = "Oberdorfstra"..szlig.."e",
	x = 2380.0 
}
streetTable.ew[477] = {
	name = "Parthenstra"..szlig.."e",
	x = 2385.0 
}
streetTable.ew[478] = {
	name = "Zum Alten Wasserwerk",
	x = 2390.0 
}
streetTable.ew[479] = {
	name = "Dahlienstra"..szlig.."e",
	x = 2395.0 
}
streetTable.ew[480] = {
	name = "Herrmann-Meyer-Stra"..szlig.."e",
	x = 2400.0 
}
streetTable.ew[481] = {
	name = "Arno-Nitzsche-Stra"..szlig.."e",
	x = 2405.0 
}
streetTable.ew[482] = {
	name = "Schlehdornweg",
	x = 2410.0 
}
streetTable.ew[483] = {
	name = "Vordere Schlobachstra"..szlig.."e",
	x = 2415.0 
}
streetTable.ew[484] = {
	name = "B"..uuml.."ttnerweg",
	x = 2420.0 
}
streetTable.ew[485] = {
	name = "Diamantstra"..szlig.."e",
	x = 2425.0 
}
streetTable.ew[486] = {
	name = "Veilchenweg",
	x = 2430.0 
}
streetTable.ew[487] = {
	name = "Arthur-Winkler-Stra"..szlig.."e",
	x = 2435.0 
}
streetTable.ew[488] = {
	name = "Dorettenring",
	x = 2440.0 
}
streetTable.ew[489] = {
	name = "Mittelring",
	x = 2445.0 
}
streetTable.ew[490] = {
	name = "Burghausener Stra"..szlig.."e",
	x = 2450.0 
}
streetTable.ew[491] = {
	name = "Zur Loberaue",
	x = 2455.0 
}
streetTable.ew[492] = {
	name = "K"..ouml.."nigsteinstra"..szlig.."e",
	x = 2460.0 
}
streetTable.ew[493] = {
	name = "B"..auml.."rlauchweg",
	x = 2465.0 
}
streetTable.ew[494] = {
	name = "Anton-Zickmantel-Stra"..szlig.."e",
	x = 2470.0 
}
streetTable.ew[495] = {
	name = "Rosenstra"..szlig.."e",
	x = 2475.0 
}
streetTable.ew[496] = {
	name = "Stauffenbergstra"..szlig.."e",
	x = 2480.0 
}
streetTable.ew[497] = {
	name = "Kreuzdornstra"..szlig.."e",
	x = 2485.0 
}
streetTable.ew[498] = {
	name = "Eythraer Weg",
	x = 2490.0 
}
streetTable.ew[499] = {
	name = "Hugo-Junkers-Stra"..szlig.."e",
	x = 2495.0 
}
streetTable.ew[500] = {
	name = "Edvard-Grieg-Allee",
	x = 2500.0 
}
streetTable.ew[501] = {
	name = "Zum Winkel",
	x = 2505.0 
}
streetTable.ew[502] = {
	name = "Breitschuhstra"..szlig.."e",
	x = 2510.0 
}
streetTable.ew[503] = {
	name = "Papierm"..uuml.."hlstra"..szlig.."e",
	x = 2515.0 
}
streetTable.ew[504] = {
	name = "Lionstra"..szlig.."e",
	x = 2520.0 
}
streetTable.ew[505] = {
	name = "Hilligerstra"..szlig.."e",
	x = 2525.0 
}
streetTable.ew[506] = {
	name = "Aue",
	x = 2530.0 
}
streetTable.ew[507] = {
	name = "Friedrich-Naumann-Stra"..szlig.."e",
	x = 2535.0 
}
streetTable.ew[508] = {
	name = "Elsastra"..szlig.."e",
	x = 2540.0 
}
streetTable.ew[509] = {
	name = "Rosenweg",
	x = 2545.0 
}
streetTable.ew[510] = {
	name = "Amselweg",
	x = 2550.0 
}
streetTable.ew[511] = {
	name = "L"..ouml.."wenzahnweg",
	x = 2555.0 
}
streetTable.ew[512] = {
	name = "Immenstra"..szlig.."e",
	x = 2560.0 
}
streetTable.ew[513] = {
	name = "Arnikaweg",
	x = 2565.0 
}
streetTable.ew[514] = {
	name = "Hermundurenstra"..szlig.."e",
	x = 2570.0 
}
streetTable.ew[515] = {
	name = "Tschechenbogen",
	x = 2575.0 
}
streetTable.ew[516] = {
	name = "Zum Kleewinkel",
	x = 2580.0 
}
streetTable.ew[517] = {
	name = "Pater-Gordian-Stra"..szlig.."e",
	x = 2585.0 
}
streetTable.ew[518] = {
	name = "Schenkendorfstra"..szlig.."e",
	x = 2590.0 
}
streetTable.ew[519] = {
	name = "Reichsbahnerstra"..szlig.."e",
	x = 2595.0 
}
streetTable.ew[520] = {
	name = "Goetheweg",
	x = 2600.0 
}
streetTable.ew[521] = {
	name = "Travniker Stra"..szlig.."e",
	x = 2605.0 
}
streetTable.ew[522] = {
	name = "Kleiststra"..szlig.."e",
	x = 2610.0 
}
streetTable.ew[523] = {
	name = "Cranachstra"..szlig.."e",
	x = 2615.0 
}
streetTable.ew[524] = {
	name = "Am Geleinholz",
	x = 2620.0 
}
streetTable.ew[525] = {
	name = "Schkeitbarer Weg",
	x = 2625.0 
}
streetTable.ew[526] = {
	name = "Johannes-R.-Becher-Stra"..szlig.."e",
	x = 2630.0 
}
streetTable.ew[527] = {
	name = "Friedrich-List-Stra"..szlig.."e",
	x = 2635.0 
}
streetTable.ew[528] = {
	name = "Blumenweg",
	x = 2640.0 
}
streetTable.ew[529] = {
	name = "Leipziger Stra"..szlig.."e",
	x = 2645.0 
}
streetTable.ew[530] = {
	name = "St"..ouml.."ckelplatz",
	x = 2650.0 
}
streetTable.ew[531] = {
	name = "Wiederitzscher Stra"..szlig.."e",
	x = 2655.0 
}
streetTable.ew[532] = {
	name = "L"..auml.."rchenweg",
	x = 2660.0 
}
streetTable.ew[533] = {
	name = "P"..ouml.."gnerstra"..szlig.."e",
	x = 2665.0 
}
streetTable.ew[534] = {
	name = "Ritterstra"..szlig.."e",
	x = 2670.0 
}
streetTable.ew[535] = {
	name = "Walnu"..szlig.."weg",
	x = 2675.0 
}
streetTable.ew[536] = {
	name = "Logauweg",
	x = 2680.0 
}
streetTable.ew[537] = {
	name = "Connewitzer Stra"..szlig.."e",
	x = 2685.0 
}
streetTable.ew[538] = {
	name = "Norderneyer Weg",
	x = 2690.0 
}
streetTable.ew[539] = {
	name = "Hillerstra"..szlig.."e",
	x = 2695.0 
}
streetTable.ew[540] = {
	name = "Poserstra"..szlig.."e",
	x = 2700.0 
}
streetTable.ew[541] = {
	name = "Maienweg",
	x = 2705.0 
}
streetTable.ew[542] = {
	name = "Bernhard-G"..ouml.."ring-Stra"..szlig.."e",
	x = 2710.0 
}
streetTable.ew[543] = {
	name = "Rennbahnweg",
	x = 2715.0 
}
streetTable.ew[544] = {
	name = "Wilhelm-Sammet-Stra"..szlig.."e",
	x = 2720.0 
}
streetTable.ew[545] = {
	name = "Friedrich-Ebert-Stra"..szlig.."e",
	x = 2725.0 
}
streetTable.ew[546] = {
	name = "Nagelstra"..szlig.."e",
	x = 2730.0 
}
streetTable.ew[547] = {
	name = "Calaustra"..szlig.."e",
	x = 2735.0 
}
streetTable.ew[548] = {
	name = "Adolf-Koppe-Stra"..szlig.."e",
	x = 2740.0 
}
streetTable.ew[549] = {
	name = "Fasanenh"..uuml.."gel",
	x = 2745.0 
}
streetTable.ew[550] = {
	name = "Untere Eichst"..auml.."dtstra"..szlig.."e",
	x = 2750.0 
}
streetTable.ew[551] = {
	name = "Dauthestra"..szlig.."e",
	x = 2755.0 
}
streetTable.ew[552] = {
	name = "Pflaumenallee",
	x = 2760.0 
}
streetTable.ew[553] = {
	name = "N"..uuml.."rnberger Stra"..szlig.."e",
	x = 2765.0 
}
streetTable.ew[554] = {
	name = "Ferdinand-Jost-Stra"..szlig.."e",
	x = 2770.0 
}
streetTable.ew[555] = {
	name = "Bahnhofsallee",
	x = 2775.0 
}
streetTable.ew[556] = {
	name = "Coppistra"..szlig.."e",
	x = 2780.0 
}
streetTable.ew[557] = {
	name = "Im Birkengrund",
	x = 2785.0 
}
streetTable.ew[558] = {
	name = "Benedixstra"..szlig.."e",
	x = 2790.0 
}
streetTable.ew[559] = {
	name = "Wolffstra"..szlig.."e",
	x = 2795.0 
}
streetTable.ew[560] = {
	name = "Kohlgartenweg",
	x = 2800.0 
}
streetTable.ew[561] = {
	name = "Fontanestra"..szlig.."e",
	x = 2805.0 
}
streetTable.ew[562] = {
	name = "Lucknerstra"..szlig.."e",
	x = 2810.0 
}
streetTable.ew[563] = {
	name = "Schw"..auml.."grichenstra"..szlig.."e",
	x = 2815.0 
}
streetTable.ew[564] = {
	name = "An der M"..auml.."rchenwiese",
	x = 2820.0 
}
streetTable.ew[565] = {
	name = "Reinhardtstra"..szlig.."e",
	x = 2825.0 
}
streetTable.ew[566] = {
	name = "Radiusstra"..szlig.."e",
	x = 2830.0 
}
streetTable.ew[567] = {
	name = "J.-C.-Hinrichs-Stra"..szlig.."e",
	x = 2835.0 
}
streetTable.ew[568] = {
	name = "Alter Amtshof",
	x = 2840.0 
}
streetTable.ew[569] = {
	name = "G"..auml.."rtnereiweg",
	x = 2845.0 
}
streetTable.ew[570] = {
	name = "George-B"..auml.."hr-Stra"..szlig.."e",
	x = 2850.0 
}
streetTable.ew[571] = {
	name = "Seidengasse",
	x = 2855.0 
}
streetTable.ew[572] = {
	name = "Mei"..szlig.."ner Stra"..szlig.."e",
	x = 2860.0 
}
streetTable.ew[573] = {
	name = "Zur Wei"..szlig.."en Mark",
	x = 2865.0 
}
streetTable.ew[574] = {
	name = "Beipertstra"..szlig.."e",
	x = 2870.0 
}
streetTable.ew[575] = {
	name = "Thomas-M"..uuml.."ntzer-Stra"..szlig.."e",
	x = 2875.0 
}
streetTable.ew[576] = {
	name = "Am Alten Flugfeld",
	x = 2880.0 
}
streetTable.ew[577] = {
	name = "Gregoryplatz",
	x = 2885.0 
}
streetTable.ew[578] = {
	name = "Schauerstra"..szlig.."e",
	x = 2890.0 
}
streetTable.ew[579] = {
	name = "Arminiushof",
	x = 2895.0 
}
streetTable.ew[580] = {
	name = "Amselnest",
	x = 2900.0 
}
streetTable.ew[581] = {
	name = "Herzberger Stra"..szlig.."e",
	x = 2905.0 
}
streetTable.ew[582] = {
	name = "Gr"..uuml.."ner Winkel",
	x = 2910.0 
}
streetTable.ew[583] = {
	name = "Hohenthalstra"..szlig.."e",
	x = 2915.0 
}
streetTable.ew[584] = {
	name = "Seehausener Stra"..szlig.."e",
	x = 2920.0 
}
streetTable.ew[585] = {
	name = "Belterstra"..szlig.."e",
	x = 2925.0 
}
streetTable.ew[586] = {
	name = "Sonnenblumenweg",
	x = 2930.0 
}
streetTable.ew[587] = {
	name = "Baaderstra"..szlig.."e",
	x = 2935.0 
}
streetTable.ew[588] = {
	name = "Hempelstra"..szlig.."e",
	x = 2940.0 
}
streetTable.ew[589] = {
	name = "Knauthainer Stra"..szlig.."e",
	x = 2945.0 
}
streetTable.ew[590] = {
	name = "Brandensteinstra"..szlig.."e",
	x = 2950.0 
}
streetTable.ew[591] = {
	name = "Hamburger Stra"..szlig.."e",
	x = 2955.0 
}
streetTable.ew[592] = {
	name = "Albrecht-D"..uuml.."rer-Platz",
	x = 2960.0 
}
streetTable.ew[593] = {
	name = "Neuer Weg",
	x = 2965.0 
}
streetTable.ew[594] = {
	name = "Am Rain",
	x = 2970.0 
}
streetTable.ew[595] = {
	name = "Siedlereck",
	x = 2975.0 
}
streetTable.ew[596] = {
	name = "Fucikstra"..szlig.."e",
	x = 2980.0 
}
streetTable.ew[597] = {
	name = "Hessenstra"..szlig.."e",
	x = 2985.0 
}
streetTable.ew[598] = {
	name = "Tresckowstra"..szlig.."e",
	x = 2990.0 
}
streetTable.ew[599] = {
	name = "G"..ouml.."hrenzer Weg",
	x = 2995.0 
}
streetTable.ew[600] = {
	name = "D"..ouml.."lziger Weg",
	x = 3000.0 
}
streetTable.ew[601] = {
	name = "Cradefelder Stra"..szlig.."e",
	x = 3005.0 
}
streetTable.ew[602] = {
	name = "Konrad-Hagen-Platz",
	x = 3010.0 
}
streetTable.ew[603] = {
	name = "Windorfer Stra"..szlig.."e",
	x = 3015.0 
}
streetTable.ew[604] = {
	name = "Wunderlichstra"..szlig.."e",
	x = 3020.0 
}
streetTable.ew[605] = {
	name = "Auguste-Schmidt-Stra"..szlig.."e",
	x = 3025.0 
}
streetTable.ew[606] = {
	name = "Am Sonnenwinkel",
	x = 3030.0 
}
streetTable.ew[607] = {
	name = "Teichmannstra"..szlig.."e",
	x = 3035.0 
}
streetTable.ew[608] = {
	name = "M"..uuml.."llerring",
	x = 3040.0 
}
streetTable.ew[609] = {
	name = "M"..ouml.."ckernscher Weg",
	x = 3045.0 
}
streetTable.ew[610] = {
	name = "M"..uuml.."hlweg",
	x = 3050.0 
}
streetTable.ew[611] = {
	name = "Witkowskistra"..szlig.."e",
	x = 3055.0 
}
streetTable.ew[612] = {
	name = "Kohrener Stra"..szlig.."e",
	x = 3060.0 
}
streetTable.ew[613] = {
	name = "Thierbacher Stra"..szlig.."e",
	x = 3065.0 
}
streetTable.ew[614] = {
	name = "Friedrich-Wolf-Stra"..szlig.."e",
	x = 3070.0 
}
streetTable.ew[615] = {
	name = "Badergasse",
	x = 3075.0 
}
streetTable.ew[616] = {
	name = "Tintlingsweg",
	x = 3080.0 
}
streetTable.ew[617] = {
	name = "Blankenburger Stra"..szlig.."e",
	x = 3085.0 
}
streetTable.ew[618] = {
	name = "Katzstra"..szlig.."e",
	x = 3090.0 
}
streetTable.ew[619] = {
	name = "Arno-Bruchardt-Stra"..szlig.."e",
	x = 3095.0 
}
streetTable.ew[620] = {
	name = "Zum F"..ouml.."rderturm",
	x = 3100.0 
}
streetTable.ew[621] = {
	name = "Schweizerbogen",
	x = 3105.0 
}
streetTable.ew[622] = {
	name = "Freiligrathplatz",
	x = 3110.0 
}
streetTable.ew[623] = {
	name = "An der Fasanerie",
	x = 3115.0 
}
streetTable.ew[624] = {
	name = "Erfurter Stra"..szlig.."e",
	x = 3120.0 
}
streetTable.ew[625] = {
	name = "B"..ouml.."senbergstra"..szlig.."e",
	x = 3125.0 
}
streetTable.ew[626] = {
	name = "Lessingstra"..szlig.."e",
	x = 3130.0 
}
streetTable.ew[627] = {
	name = "Dresdner Stra"..szlig.."e",
	x = 3135.0 
}
streetTable.ew[628] = {
	name = "Zur Schule",
	x = 3140.0 
}
streetTable.ew[629] = {
	name = "Geschwister-Scholl-Stra"..szlig.."e",
	x = 3145.0 
}
streetTable.ew[630] = {
	name = "Gerberstra"..szlig.."e",
	x = 3150.0 
}
streetTable.ew[631] = {
	name = "Zimmerstra"..szlig.."e",
	x = 3155.0 
}
streetTable.ew[632] = {
	name = "Hohe Stra"..szlig.."e",
	x = 3160.0 
}
streetTable.ew[633] = {
	name = "Dankwartstra"..szlig.."e",
	x = 3165.0 
}
streetTable.ew[634] = {
	name = "Bodenreformweg",
	x = 3170.0 
}
streetTable.ew[635] = {
	name = "Weigelienstra"..szlig.."e",
	x = 3175.0 
}
streetTable.ew[636] = {
	name = "St"..ouml.."ckelstra"..szlig.."e",
	x = 3180.0 
}
streetTable.ew[637] = {
	name = "Hans-Marchwitza-Stra"..szlig.."e",
	x = 3185.0 
}
streetTable.ew[638] = {
	name = "An der Hauptstra"..szlig.."e",
	x = 3190.0 
}
streetTable.ew[639] = {
	name = "Lazarusstra"..szlig.."e",
	x = 3195.0 
}
streetTable.ew[640] = {
	name = "Georg-Schumann-Stra"..szlig.."e",
	x = 3200.0 
}
streetTable.ew[641] = {
	name = "An der Tabaksm"..uuml.."hle",
	x = 3205.0 
}
streetTable.ew[642] = {
	name = "Stahmelner H"..ouml.."he",
	x = 3210.0 
}
streetTable.ew[643] = {
	name = "Sch"..ouml.."nauer Stra"..szlig.."e",
	x = 3215.0 
}
streetTable.ew[644] = {
	name = "Kleine Gartenstra"..szlig.."e",
	x = 3220.0 
}
streetTable.ew[645] = {
	name = "Hedwig-Burgheim-Stra"..szlig.."e",
	x = 3225.0 
}
streetTable.ew[646] = {
	name = "Franz-Schlobach-Stra"..szlig.."e",
	x = 3230.0 
}
streetTable.ew[647] = {
	name = "Paul-Schneider-Stra"..szlig.."e",
	x = 3235.0 
}
streetTable.ew[648] = {
	name = "Coppiplatz",
	x = 3240.0 
}
streetTable.ew[649] = {
	name = "Heinrich-Budde-Stra"..szlig.."e",
	x = 3245.0 
}
streetTable.ew[650] = {
	name = "M"..uuml.."hligstra"..szlig.."e",
	x = 3250.0 
}
streetTable.ew[651] = {
	name = "Mitschurinstra"..szlig.."e",
	x = 3255.0 
}
streetTable.ew[652] = {
	name = "Lagerhofstra"..szlig.."e",
	x = 3260.0 
}
streetTable.ew[653] = {
	name = "Zeisigweg",
	x = 3265.0 
}
streetTable.ew[654] = {
	name = "Rochlitzstra"..szlig.."e",
	x = 3270.0 
}
streetTable.ew[655] = {
	name = "Walter-K"..ouml.."hn-Stra"..szlig.."e",
	x = 3275.0 
}
streetTable.ew[656] = {
	name = "Sigismundstra"..szlig.."e",
	x = 3280.0 
}
streetTable.ew[657] = {
	name = "Bremer Weg",
	x = 3285.0 
}
streetTable.ew[658] = {
	name = "Kiebitzstra"..szlig.."e",
	x = 3290.0 
}
streetTable.ew[659] = {
	name = "Lermontowstra"..szlig.."e",
	x = 3295.0 
}
streetTable.ew[660] = {
	name = "Sportplatzweg",
	x = 3300.0 
}
streetTable.ew[661] = {
	name = "Sperlingsgasse",
	x = 3305.0 
}
streetTable.ew[662] = {
	name = "Heisenbergstra"..szlig.."e",
	x = 3310.0 
}
streetTable.ew[663] = {
	name = "Corotweg",
	x = 3315.0 
}
streetTable.ew[664] = {
	name = "Hugo-Krone-Platz",
	x = 3320.0 
}
streetTable.ew[665] = {
	name = "Bl"..uuml.."cherstra"..szlig.."e",
	x = 3325.0 
}
streetTable.ew[666] = {
	name = "Gerichtsweg",
	x = 3330.0 
}
streetTable.ew[667] = {
	name = "Lobst"..auml.."dter Stra"..szlig.."e",
	x = 3335.0 
}
streetTable.ew[668] = {
	name = "Althener Stra"..szlig.."e",
	x = 3340.0 
}
streetTable.ew[669] = {
	name = "Baumeyerstra"..szlig.."e",
	x = 3345.0 
}
streetTable.ew[670] = {
	name = "Untere M"..uuml.."hlenstra"..szlig.."e",
	x = 3350.0 
}
streetTable.ew[671] = {
	name = "Gottleubaer Stra"..szlig.."e",
	x = 3355.0 
}
streetTable.ew[672] = {
	name = "Zehmenstra"..szlig.."e",
	x = 3360.0 
}
streetTable.ew[673] = {
	name = "Sorbenstra"..szlig.."e",
	x = 3365.0 
}
streetTable.ew[674] = {
	name = "Rehbacher Anger",
	x = 3370.0 
}
streetTable.ew[675] = {
	name = "Miltenberger Stra"..szlig.."e",
	x = 3375.0 
}
streetTable.ew[676] = {
	name = "Wiedebachstra"..szlig.."e",
	x = 3380.0 
}
streetTable.ew[677] = {
	name = "Hammerstra"..szlig.."e",
	x = 3385.0 
}
streetTable.ew[678] = {
	name = "Lampestra"..szlig.."e",
	x = 3390.0 
}
streetTable.ew[679] = {
	name = "Stra"..szlig.."e der Einheit",
	x = 3395.0 
}
streetTable.ew[680] = {
	name = "Lavendelweg",
	x = 3400.0 
}
streetTable.ew[681] = {
	name = "Heinrich-Mann-Weg",
	x = 3405.0 
}
streetTable.ew[682] = {
	name = "T"..auml.."schners Garten",
	x = 3410.0 
}
streetTable.ew[683] = {
	name = "Lobelienweg",
	x = 3415.0 
}
streetTable.ew[684] = {
	name = "Sternbachstra"..szlig.."e",
	x = 3420.0 
}
streetTable.ew[685] = {
	name = "Apostelstra"..szlig.."e",
	x = 3425.0 
}
streetTable.ew[686] = {
	name = "Charlottenstra"..szlig.."e",
	x = 3430.0 
}
streetTable.ew[687] = {
	name = "Gudrunstra"..szlig.."e",
	x = 3435.0 
}
streetTable.ew[688] = {
	name = "Am Doppeladler",
	x = 3440.0 
}
streetTable.ew[689] = {
	name = "Flemmingstra"..szlig.."e",
	x = 3445.0 
}
streetTable.ew[690] = {
	name = "Schillerplatz",
	x = 3450.0 
}
streetTable.ew[691] = {
	name = "Lipinskistra"..szlig.."e",
	x = 3455.0 
}
streetTable.ew[692] = {
	name = "Schwarzdornweg",
	x = 3460.0 
}
streetTable.ew[693] = {
	name = "An der Weide",
	x = 3465.0 
}
streetTable.ew[694] = {
	name = "Hasenholzweg",
	x = 3470.0 
}
streetTable.ew[695] = {
	name = "Eichbergstra"..szlig.."e",
	x = 3475.0 
}
streetTable.ew[696] = {
	name = "Seehausener Allee",
	x = 3480.0 
}
streetTable.ew[697] = {
	name = "R"..ouml.."ntgenstra"..szlig.."e",
	x = 3485.0 
}
streetTable.ew[698] = {
	name = "Denkmalsblick",
	x = 3490.0 
}
streetTable.ew[699] = {
	name = "Karl-H"..auml.."rting-Stra"..szlig.."e",
	x = 3495.0 
}
streetTable.ew[700] = {
	name = "Am Zuckmantel",
	x = 3500.0 
}
streetTable.ew[701] = {
	name = "Alte Holzhausener Stra"..szlig.."e",
	x = 3505.0 
}
streetTable.ew[702] = {
	name = "Am Viadukt",
	x = 3510.0 
}
streetTable.ew[703] = {
	name = "Schmiedegasse",
	x = 3515.0 
}
streetTable.ew[704] = {
	name = "Rolf-Axen-Stra"..szlig.."e",
	x = 3520.0 
}
streetTable.ew[705] = {
	name = "Lewienstra"..szlig.."e",
	x = 3525.0 
}
streetTable.ew[706] = {
	name = "Am Lindeneck",
	x = 3530.0 
}
streetTable.ew[707] = {
	name = "P"..ouml.."ppelmannstra"..szlig.."e",
	x = 3535.0 
}
streetTable.ew[708] = {
	name = "Karl-Heine-Stra"..szlig.."e",
	x = 3540.0 
}
streetTable.ew[709] = {
	name = "Bistumsweg",
	x = 3545.0 
}
streetTable.ew[710] = {
	name = "H"..uuml.."fnerstra"..szlig.."e",
	x = 3550.0 
}
streetTable.ew[711] = {
	name = "Christian-Ferkel-Stra"..szlig.."e",
	x = 3555.0 
}
streetTable.ew[712] = {
	name = "Wachbergallee",
	x = 3560.0 
}
streetTable.ew[713] = {
	name = "Pohlestra"..szlig.."e",
	x = 3565.0 
}
streetTable.ew[714] = {
	name = "Fasanenweg",
	x = 3570.0 
}
streetTable.ew[715] = {
	name = "Rosenowstra"..szlig.."e",
	x = 3575.0 
}
streetTable.ew[716] = {
	name = "Andreasstra"..szlig.."e",
	x = 3580.0 
}
streetTable.ew[717] = {
	name = "Krostitzer Weg",
	x = 3585.0 
}
streetTable.ew[718] = {
	name = "Kunadstra"..szlig.."e",
	x = 3590.0 
}
streetTable.ew[719] = {
	name = "Erika-von-Brockdorff-Stra"..szlig.."",
	x = 3595.0 
}
streetTable.ew[720] = {
	name = "Bussardweg",
	x = 3600.0 
}
streetTable.ew[721] = {
	name = "Konradstra"..szlig.."e",
	x = 3605.0 
}
streetTable.ew[722] = {
	name = "Herrenallee",
	x = 3610.0 
}
streetTable.ew[723] = {
	name = "Wiskenstra"..szlig.."e",
	x = 3615.0 
}
streetTable.ew[724] = {
	name = "Br"..uuml.."derstra"..szlig.."e",
	x = 3620.0 
}
streetTable.ew[725] = {
	name = "Rathausring",
	x = 3625.0 
}
streetTable.ew[726] = {
	name = "Stefan-Zweig-Stra"..szlig.."e",
	x = 3630.0 
}
streetTable.ew[727] = {
	name = "Langhansstra"..szlig.."e",
	x = 3635.0 
}
streetTable.ew[728] = {
	name = "Gontscharowstra"..szlig.."e",
	x = 3640.0 
}
streetTable.ew[729] = {
	name = "Kleine Gartensiedlung",
	x = 3645.0 
}
streetTable.ew[730] = {
	name = "Taubestra"..szlig.."e",
	x = 3650.0 
}
streetTable.ew[731] = {
	name = "Martinsbogen",
	x = 3655.0 
}
streetTable.ew[732] = {
	name = "Jahnweg",
	x = 3660.0 
}
streetTable.ew[733] = {
	name = "Birkhahnsteig",
	x = 3665.0 
}
streetTable.ew[734] = {
	name = "Friedrichstra"..szlig.."e",
	x = 3670.0 
}
streetTable.ew[735] = {
	name = "Franckestra"..szlig.."e",
	x = 3675.0 
}
streetTable.ew[736] = {
	name = "Elsterstra"..szlig.."e",
	x = 3680.0 
}
streetTable.ew[737] = {
	name = "Waldplatz",
	x = 3685.0 
}
streetTable.ew[738] = {
	name = "Dufourstra"..szlig.."e",
	x = 3690.0 
}
streetTable.ew[739] = {
	name = "Heiterblickallee",
	x = 3695.0 
}
streetTable.ew[740] = {
	name = "Gau"..szlig.."stra"..szlig.."e",
	x = 3700.0 
}
streetTable.ew[741] = {
	name = "Verl"..auml.."ngerte Schwedenstra"..szlig.."e",
	x = 3705.0 
}
streetTable.ew[742] = {
	name = "Czermaks Garten",
	x = 3710.0 
}
streetTable.ew[743] = {
	name = "An den Birken",
	x = 3715.0 
}
streetTable.ew[744] = {
	name = "Sch"..ouml.."nauer Ring",
	x = 3720.0 
}
streetTable.ew[745] = {
	name = "Heinrich-Mann-Stra"..szlig.."e",
	x = 3725.0 
}
streetTable.ew[746] = {
	name = "Gedikestra"..szlig.."e",
	x = 3730.0 
}
streetTable.ew[747] = {
	name = "Lauschaer Weg",
	x = 3735.0 
}
streetTable.ew[748] = {
	name = "Berggartenweg",
	x = 3740.0 
}
streetTable.ew[749] = {
	name = "Meisenweg",
	x = 3745.0 
}
streetTable.ew[750] = {
	name = "Seifertshainer Stra"..szlig.."e",
	x = 3750.0 
}
streetTable.ew[751] = {
	name = "Sporerg"..auml..""..szlig.."chen",
	x = 3755.0 
}
streetTable.ew[752] = {
	name = "Cervantesweg",
	x = 3760.0 
}
streetTable.ew[753] = {
	name = "Neudorfgasse",
	x = 3765.0 
}
streetTable.ew[754] = {
	name = "Fasanenpfad",
	x = 3770.0 
}
streetTable.ew[755] = {
	name = "Schulgasse",
	x = 3775.0 
}
streetTable.ew[756] = {
	name = "Jacobstra"..szlig.."e",
	x = 3780.0 
}
streetTable.ew[757] = {
	name = "Lindengasse",
	x = 3785.0 
}
streetTable.ew[758] = {
	name = "Feuerbachweg",
	x = 3790.0 
}
streetTable.ew[759] = {
	name = "Paul-Gruner-Stra"..szlig.."e",
	x = 3795.0 
}
streetTable.ew[760] = {
	name = "Auerbachstra"..szlig.."e",
	x = 3800.0 
}
streetTable.ew[761] = {
	name = "Opferweg",
	x = 3805.0 
}
streetTable.ew[762] = {
	name = "Mistelbacher Weg",
	x = 3810.0 
}
streetTable.ew[763] = {
	name = "Obere M"..uuml.."hlenstra"..szlig.."e",
	x = 3815.0 
}
streetTable.ew[764] = {
	name = "Am Schaukelgraben",
	x = 3820.0 
}
streetTable.ew[765] = {
	name = "Poetenweg",
	x = 3825.0 
}
streetTable.ew[766] = {
	name = "Dornbergerstra"..szlig.."e",
	x = 3830.0 
}
streetTable.ew[767] = {
	name = "Prinzenweg",
	x = 3835.0 
}
streetTable.ew[768] = {
	name = "Eisenacher Stra"..szlig.."e",
	x = 3840.0 
}
streetTable.ew[769] = {
	name = "Erdmannstra"..szlig.."e",
	x = 3845.0 
}
streetTable.ew[770] = {
	name = "Demetriusweg",
	x = 3850.0 
}
streetTable.ew[771] = {
	name = "Holunderbogen",
	x = 3855.0 
}
streetTable.ew[772] = {
	name = "S"..uuml.."dblick",
	x = 3860.0 
}
streetTable.ew[773] = {
	name = "Raiffeisenstra"..szlig.."e",
	x = 3865.0 
}
streetTable.ew[774] = {
	name = "Rudolph-Sack-Stra"..szlig.."e",
	x = 3870.0 
}
streetTable.ew[775] = {
	name = "Nordweg",
	x = 3875.0 
}
streetTable.ew[776] = {
	name = "Paul-Gerhardt-Weg",
	x = 3880.0 
}
streetTable.ew[777] = {
	name = "Bergerstra"..szlig.."e",
	x = 3885.0 
}
streetTable.ew[778] = {
	name = "Gebr"..uuml.."der-Weber-Weg",
	x = 3890.0 
}
streetTable.ew[779] = {
	name = "Crusiusstra"..szlig.."e",
	x = 3895.0 
}
streetTable.ew[780] = {
	name = "Kochstra"..szlig.."e",
	x = 3900.0 
}
streetTable.ew[781] = {
	name = "Bonhoefferstra"..szlig.."e",
	x = 3905.0 
}
streetTable.ew[782] = {
	name = "L"..uuml.."tzner Plan",
	x = 3910.0 
}
streetTable.ew[783] = {
	name = "St"..uuml.."nzer Weg",
	x = 3915.0 
}
streetTable.ew[784] = {
	name = "Einsteinstra"..szlig.."e",
	x = 3920.0 
}
streetTable.ew[785] = {
	name = "Martin-Herrmann-Stra"..szlig.."e",
	x = 3925.0 
}
streetTable.ew[786] = {
	name = "Zur S"..auml.."gem"..uuml.."hle",
	x = 3930.0 
}
streetTable.ew[787] = {
	name = "Polluxweg",
	x = 3935.0 
}
streetTable.ew[788] = {
	name = "Gleitsmannstra"..szlig.."e",
	x = 3940.0 
}
streetTable.ew[789] = {
	name = "Postreitergasse",
	x = 3945.0 
}
streetTable.ew[790] = {
	name = "Dennewitzer Stra"..szlig.."e",
	x = 3950.0 
}
streetTable.ew[791] = {
	name = "Am Gundorfer Teich",
	x = 3955.0 
}
streetTable.ew[792] = {
	name = "Rohrteichstra"..szlig.."e",
	x = 3960.0 
}
streetTable.ew[793] = {
	name = "Spalierweg",
	x = 3965.0 
}
streetTable.ew[794] = {
	name = "B"..ouml.."ttcherweg",
	x = 3970.0 
}
streetTable.ew[795] = {
	name = "Jadassohnstra"..szlig.."e",
	x = 3975.0 
}
streetTable.ew[796] = {
	name = "Grasweg",
	x = 3980.0 
}
streetTable.ew[797] = {
	name = "Diakonissenstra"..szlig.."e",
	x = 3985.0 
}
streetTable.ew[798] = {
	name = "Alte Theklaer Stra"..szlig.."e",
	x = 3990.0 
}
streetTable.ew[799] = {
	name = "Mitschurinring",
	x = 3995.0 
}
streetTable.ew[800] = {
	name = "Alte D"..uuml.."bener Landstra"..szlig.."e",
	x = 4000.0 
}
streetTable.ew[801] = {
	name = "Breite Allee",
	x = 4005.0 
}
streetTable.ew[802] = {
	name = "Heilbronner Stra"..szlig.."e",
	x = 4010.0 
}
streetTable.ew[803] = {
	name = "Ziegeleiweg",
	x = 4015.0 
}
streetTable.ew[804] = {
	name = "Wasserturmweg",
	x = 4020.0 
}
streetTable.ew[805] = {
	name = "Zum Auwald",
	x = 4025.0 
}
streetTable.ew[806] = {
	name = "Radefelder Stra"..szlig.."e",
	x = 4030.0 
}
streetTable.ew[807] = {
	name = "Albert-Schweitzer-Stra"..szlig.."e",
	x = 4035.0 
}
streetTable.ew[808] = {
	name = "Gretschelstra"..szlig.."e",
	x = 4040.0 
}
streetTable.ew[809] = {
	name = "Zum Althener Sportplatz",
	x = 4045.0 
}
streetTable.ew[810] = {
	name = "Radefelder Allee",
	x = 4050.0 
}
streetTable.ew[811] = {
	name = "Erlanger Stra"..szlig.."e",
	x = 4055.0 
}
streetTable.ew[812] = {
	name = "Adolf-Damaschke-Stra"..szlig.."e",
	x = 4060.0 
}
streetTable.ew[813] = {
	name = "Georgiring",
	x = 4065.0 
}
streetTable.ew[814] = {
	name = "Gartengrund",
	x = 4070.0 
}
streetTable.ew[815] = {
	name = "Engertstra"..szlig.."e",
	x = 4075.0 
}
streetTable.ew[816] = {
	name = "Wildbuschweg",
	x = 4080.0 
}
streetTable.ew[817] = {
	name = "Zur Ziegelei",
	x = 4085.0 
}
streetTable.ew[818] = {
	name = "Ernst-Sommerlath-Weg",
	x = 4090.0 
}
streetTable.ew[819] = {
	name = "Reiskestra"..szlig.."e",
	x = 4095.0 
}
streetTable.ew[820] = {
	name = "Salzhandelsstra"..szlig.."e",
	x = 4100.0 
}
streetTable.ew[821] = {
	name = "Kutscherweg",
	x = 4105.0 
}
streetTable.ew[822] = {
	name = "Rembrandtstra"..szlig.."e",
	x = 4110.0 
}
streetTable.ew[823] = {
	name = "Hirzelstra"..szlig.."e",
	x = 4115.0 
}
streetTable.ew[824] = {
	name = "Sch"..ouml.."nauer Lachen",
	x = 4120.0 
}
streetTable.ew[825] = {
	name = "Kurt-Weill-Stra"..szlig.."e",
	x = 4125.0 
}
streetTable.ew[826] = {
	name = "Glockenstra"..szlig.."e",
	x = 4130.0 
}
streetTable.ew[827] = {
	name = "Verl"..auml.."ngerte Max-Liebermann-Stra"..szlig.."e",
	x = 4135.0 
}
streetTable.ew[828] = {
	name = "Nikolai-Rumjanzew-Stra"..szlig.."e",
	x = 4140.0 
}
streetTable.ew[829] = {
	name = "Th"..auml.."rigenstra"..szlig.."e",
	x = 4145.0 
}
streetTable.ew[830] = {
	name = "Gontardweg",
	x = 4150.0 
}
streetTable.ew[831] = {
	name = Auml.."u"..szlig.."erer Zeisigweg",
	x = 4155.0 
}
streetTable.ew[832] = {
	name = "Thiemstra"..szlig.."e",
	x = 4160.0 
}
streetTable.ew[833] = {
	name = "Buschenaustra"..szlig.."e",
	x = 4165.0 
}
streetTable.ew[834] = {
	name = "Arthur-Heidrich-Platz",
	x = 4170.0 
}
streetTable.ew[835] = {
	name = "Tucholskystra"..szlig.."e",
	x = 4175.0 
}
streetTable.ew[836] = {
	name = "Fl"..ouml..""..szlig.."enstra"..szlig.."e",
	x = 4180.0 
}
streetTable.ew[837] = {
	name = "Forchheimer Stra"..szlig.."e",
	x = 4185.0 
}
streetTable.ew[838] = {
	name = "Martinsplatz",
	x = 4190.0 
}
streetTable.ew[839] = {
	name = "Feldblumenweg",
	x = 4195.0 
}
streetTable.ew[840] = {
	name = "Am Eichenbogen",
	x = 4200.0 
}
streetTable.ew[841] = {
	name = "An der Kegelbahn",
	x = 4205.0 
}
streetTable.ew[842] = {
	name = "Klingerplatz",
	x = 4210.0 
}
streetTable.ew[843] = {
	name = "Lumumbastra"..szlig.."e",
	x = 4215.0 
}
streetTable.ew[844] = {
	name = "M"..ouml.."biusplatz",
	x = 4220.0 
}
streetTable.ew[845] = {
	name = "Dorfstra"..szlig.."e",
	x = 4225.0 
}
streetTable.ew[846] = {
	name = "Au"..szlig.."enring",
	x = 4230.0 
}
streetTable.ew[847] = {
	name = "Cottaweg",
	x = 4235.0 
}
streetTable.ew[848] = {
	name = "Margeritenweg",
	x = 4240.0 
}
streetTable.ew[849] = {
	name = "Eigene Scholle",
	x = 4245.0 
}
streetTable.ew[850] = {
	name = "Wilhelm-Liebknecht-Platz",
	x = 4250.0 
}
streetTable.ew[851] = {
	name = "Stuttgarter Allee",
	x = 4255.0 
}
streetTable.ew[852] = {
	name = "Gustav-Mahler-Stra"..szlig.."e",
	x = 4260.0 
}
streetTable.ew[853] = {
	name = "Kleinp"..ouml.."snaer Anger",
	x = 4265.0 
}
streetTable.ew[854] = {
	name = "Kopernikusstra"..szlig.."e",
	x = 4270.0 
}
streetTable.ew[855] = {
	name = "Stra"..szlig.."e am See",
	x = 4275.0 
}
streetTable.ew[856] = {
	name = "Gemeindeamtsstra"..szlig.."e",
	x = 4280.0 
}
streetTable.ew[857] = {
	name = "Siriusweg",
	x = 4285.0 
}
streetTable.ew[858] = {
	name = "Wodanstra"..szlig.."e",
	x = 4290.0 
}
streetTable.ew[859] = {
	name = "An der Passage",
	x = 4295.0 
}
streetTable.ew[860] = {
	name = "Bergweg",
	x = 4300.0 
}
streetTable.ew[861] = {
	name = "K"..ouml.."mmlitzer Weg",
	x = 4305.0 
}
streetTable.ew[862] = {
	name = "Zur Kuhweide",
	x = 4310.0 
}
streetTable.ew[863] = {
	name = "Kregelstra"..szlig.."e",
	x = 4315.0 
}
streetTable.ew[864] = {
	name = "Am Bahngraben",
	x = 4320.0 
}
streetTable.ew[865] = {
	name = "Sandgrubenweg",
	x = 4325.0 
}
streetTable.ew[866] = {
	name = "Prinz-Eugen-Stra"..szlig.."e",
	x = 4330.0 
}
streetTable.ew[867] = {
	name = "Sellerh"..auml.."user Stra"..szlig.."e",
	x = 4335.0 
}
streetTable.ew[868] = {
	name = "P"..ouml.."litzstra"..szlig.."e",
	x = 4340.0 
}
streetTable.ew[869] = {
	name = "Am Parkteich",
	x = 4345.0 
}
streetTable.ew[870] = {
	name = "Am Weiher",
	x = 4350.0 
}
streetTable.ew[871] = {
	name = "Am Niederholz",
	x = 4355.0 
}
streetTable.ew[872] = {
	name = "Gustav-Scheibe-Stra"..szlig.."e",
	x = 4360.0 
}
streetTable.ew[873] = {
	name = "Gotenstra"..szlig.."e",
	x = 4365.0 
}
streetTable.ew[874] = {
	name = "Suhler Stra"..szlig.."e",
	x = 4370.0 
}
streetTable.ew[875] = {
	name = "An der Kirschallee",
	x = 4375.0 
}
streetTable.ew[876] = {
	name = "Lauchst"..auml.."dter Stra"..szlig.."e",
	x = 4380.0 
}
streetTable.ew[877] = {
	name = "Zur Lindenh"..ouml.."he",
	x = 4385.0 
}
streetTable.ew[878] = {
	name = "An der Feuerwehr",
	x = 4390.0 
}
streetTable.ew[879] = {
	name = "Eichenweg",
	x = 4395.0 
}
streetTable.ew[880] = {
	name = "Karl-Vogel-Stra"..szlig.."e",
	x = 4400.0 
}
streetTable.ew[881] = {
	name = "Franzosenallee",
	x = 4405.0 
}
streetTable.ew[882] = {
	name = "Schwindstra"..szlig.."e",
	x = 4410.0 
}
streetTable.ew[883] = {
	name = "Edisonstra"..szlig.."e",
	x = 4415.0 
}
streetTable.ew[884] = {
	name = "Seitenweg",
	x = 4420.0 
}
streetTable.ew[885] = {
	name = "Kuhturmallee",
	x = 4425.0 
}
streetTable.ew[886] = {
	name = "Klenaustra"..szlig.."e",
	x = 4430.0 
}
streetTable.ew[887] = {
	name = "Goethestra"..szlig.."e",
	x = 4435.0 
}
streetTable.ew[888] = {
	name = "Dachauer Stra"..szlig.."e",
	x = 4440.0 
}
streetTable.ew[889] = {
	name = "D"..uuml.."bener Landstra"..szlig.."e",
	x = 4445.0 
}
streetTable.ew[890] = {
	name = "Akeleiweg",
	x = 4450.0 
}
streetTable.ew[891] = {
	name = "Crottendorfer Stra"..szlig.."e",
	x = 4455.0 
}
streetTable.ew[892] = {
	name = "Melker Weg",
	x = 4460.0 
}
streetTable.ew[893] = {
	name = "Kapellenstra"..szlig.."e",
	x = 4465.0 
}
streetTable.ew[894] = {
	name = "Weinbergstra"..szlig.."e",
	x = 4470.0 
}
streetTable.ew[895] = {
	name = "Eberlestra"..szlig.."e",
	x = 4475.0 
}
streetTable.ew[896] = {
	name = "Jaspisstra"..szlig.."e",
	x = 4480.0 
}
streetTable.ew[897] = {
	name = "W"..uuml.."rzburger Stra"..szlig.."e",
	x = 4485.0 
}
streetTable.ew[898] = {
	name = "Martin-Drucker-Stra"..szlig.."e",
	x = 4490.0 
}
streetTable.ew[899] = {
	name = "M"..ouml.."rikestra"..szlig.."e",
	x = 4495.0 
}
streetTable.ew[900] = {
	name = "An der Meusdorfer H"..ouml.."he",
	x = 4500.0 
}
streetTable.ew[901] = {
	name = "Rosentalgasse",
	x = 4505.0 
}
streetTable.ew[902] = {
	name = "Rotfuchsstra"..szlig.."e",
	x = 4510.0 
}
streetTable.ew[903] = {
	name = "Plau"..szlig.."iger Dorfstra"..szlig.."e",
	x = 4515.0 
}
streetTable.ew[904] = {
	name = "Lochmannstra"..szlig.."e",
	x = 4520.0 
}
streetTable.ew[905] = {
	name = "Alter Marktweg",
	x = 4525.0 
}
streetTable.ew[906] = {
	name = "An der Alten M"..uuml.."hle",
	x = 4530.0 
}
streetTable.ew[907] = {
	name = "Stroganowweg",
	x = 4535.0 
}
streetTable.ew[908] = {
	name = "Schandauer Weg",
	x = 4540.0 
}
streetTable.ew[909] = {
	name = "Gra"..szlig.."dorfer Stra"..szlig.."e",
	x = 4545.0 
}
streetTable.ew[910] = {
	name = "Dreiecksweg",
	x = 4550.0 
}
streetTable.ew[911] = {
	name = "Aurelienstra"..szlig.."e",
	x = 4555.0 
}
streetTable.ew[912] = {
	name = "G"..ouml.."rlitzer Stra"..szlig.."e",
	x = 4560.0 
}
streetTable.ew[913] = {
	name = "Brunhildstra"..szlig.."e",
	x = 4565.0 
}
streetTable.ew[914] = {
	name = "Werkst"..auml.."ttenweg",
	x = 4570.0 
}
streetTable.ew[915] = {
	name = "Leuckartstra"..szlig.."e",
	x = 4575.0 
}
streetTable.ew[916] = {
	name = "Hortensienweg",
	x = 4580.0 
}
streetTable.ew[917] = {
	name = "Porzellangasse",
	x = 4585.0 
}
streetTable.ew[918] = {
	name = "Gohliser Stra"..szlig.."e",
	x = 4590.0 
}
streetTable.ew[919] = {
	name = "Zum Birkenw"..auml.."ldchen",
	x = 4595.0 
}
streetTable.ew[920] = {
	name = "Tiefe Stra"..szlig.."e",
	x = 4600.0 
}
streetTable.ew[921] = {
	name = "Lindenthaler Stra"..szlig.."e",
	x = 4605.0 
}
streetTable.ew[922] = {
	name = "Lange Stra"..szlig.."e",
	x = 4610.0 
}
streetTable.ew[923] = {
	name = "An der Spitze",
	x = 4615.0 
}
streetTable.ew[924] = {
	name = "Plantagenweg",
	x = 4620.0 
}
streetTable.ew[925] = {
	name = "H"..auml.."nicher M"..uuml.."hle",
	x = 4625.0 
}
streetTable.ew[926] = {
	name = "Hersvelder Stra"..szlig.."e",
	x = 4630.0 
}
streetTable.ew[927] = {
	name = "Maria-Grollmu"..szlig.."-Stra"..szlig.."e",
	x = 4635.0 
}
streetTable.ew[928] = {
	name = "Am P"..ouml.."sgraben",
	x = 4640.0 
}
streetTable.ew[929] = {
	name = "Kasseler Stra"..szlig.."e",
	x = 4645.0 
}
streetTable.ew[930] = {
	name = "Blanchardweg",
	x = 4650.0 
}
streetTable.ew[931] = {
	name = "Wollk"..auml.."mmereistra"..szlig.."e",
	x = 4655.0 
}
streetTable.ew[932] = {
	name = "Wichernstra"..szlig.."e",
	x = 4660.0 
}
streetTable.ew[933] = {
	name = "Am Brunnen",
	x = 4665.0 
}
streetTable.ew[934] = {
	name = "Hellriegelstra"..szlig.."e",
	x = 4670.0 
}
streetTable.ew[935] = {
	name = "Marienplatz",
	x = 4675.0 
}
streetTable.ew[936] = {
	name = "M"..uuml.."hlparkweg",
	x = 4680.0 
}
streetTable.ew[937] = {
	name = "St"..ouml.."tteritzer Landstra"..szlig.."e",
	x = 4685.0 
}
streetTable.ew[938] = {
	name = "D"..uuml.."rrplatz",
	x = 4690.0 
}
streetTable.ew[939] = {
	name = "Kursdorfer Weg",
	x = 4695.0 
}
streetTable.ew[940] = {
	name = "Ambrosius-Barth-Platz",
	x = 4700.0 
}
streetTable.ew[941] = {
	name = "Renftstra"..szlig.."e",
	x = 4705.0 
}
streetTable.ew[942] = {
	name = "Schlesierstra"..szlig.."e",
	x = 4710.0 
}
streetTable.ew[943] = {
	name = "Cohnheimstra"..szlig.."e",
	x = 4715.0 
}
streetTable.ew[944] = {
	name = "Prager Stra"..szlig.."e",
	x = 4720.0 
}
streetTable.ew[945] = {
	name = "Alte Seehausener Stra"..szlig.."e",
	x = 4725.0 
}
streetTable.ew[946] = {
	name = "Wilhelm-His-Stra"..szlig.."e",
	x = 4730.0 
}
streetTable.ew[947] = {
	name = "Lausener Dorfplatz",
	x = 4735.0 
}
streetTable.ew[948] = {
	name = "Rousseaustra"..szlig.."e",
	x = 4740.0 
}
streetTable.ew[949] = {
	name = "Drescherweg",
	x = 4745.0 
}
streetTable.ew[950] = {
	name = "Annaberger Stra"..szlig.."e",
	x = 4750.0 
}
streetTable.ew[951] = {
	name = "Weinbrennerstra"..szlig.."e",
	x = 4755.0 
}
streetTable.ew[952] = {
	name = "L"..ouml.."hrstra"..szlig.."e",
	x = 4760.0 
}
streetTable.ew[953] = {
	name = "Bogislawstra"..szlig.."e",
	x = 4765.0 
}
streetTable.ew[954] = {
	name = "Bussestra"..szlig.."e",
	x = 4770.0 
}
streetTable.ew[955] = {
	name = "Packhofstra"..szlig.."e",
	x = 4775.0 
}
streetTable.ew[956] = {
	name = "Haynaer Weg",
	x = 4780.0 
}
streetTable.ew[957] = {
	name = "Gustav-Adolf-Allee",
	x = 4785.0 
}
streetTable.ew[958] = {
	name = "Farnweg",
	x = 4790.0 
}
streetTable.ew[959] = {
	name = "Seebenischer Stra"..szlig.."e",
	x = 4795.0 
}
streetTable.ew[960] = {
	name = "Prof.-Andreas-Schubert-Stra"..szlig.."e",
	x = 4800.0 
}
streetTable.ew[961] = {
	name = Auml.."u"..szlig.."ere Raustra"..szlig.."e",
	x = 4805.0 
}
streetTable.ew[962] = {
	name = "Stra"..szlig.."e der 53",
	x = 4810.0 
}
streetTable.ew[963] = {
	name = "Staffelsteinstra"..szlig.."e",
	x = 4815.0 
}
streetTable.ew[964] = {
	name = "Steffensstra"..szlig.."e",
	x = 4820.0 
}
streetTable.ew[965] = {
	name = "Am Silo",
	x = 4825.0 
}
streetTable.ew[966] = {
	name = "Kurt-Huber-Weg",
	x = 4830.0 
}
streetTable.ew[967] = {
	name = "Katzmannstra"..szlig.."e",
	x = 4835.0 
}
streetTable.ew[968] = {
	name = "Stollberger Stra"..szlig.."e",
	x = 4840.0 
}
streetTable.ew[969] = {
	name = "Dochturowweg",
	x = 4845.0 
}
streetTable.ew[970] = {
	name = "Nachtigallenweg",
	x = 4850.0 
}
streetTable.ew[971] = {
	name = "Magdeburger Stra"..szlig.."e",
	x = 4855.0 
}
streetTable.ew[972] = {
	name = "Paul-Heyse-Stra"..szlig.."e",
	x = 4860.0 
}
streetTable.ew[973] = {
	name = "Kehrwieder",
	x = 4865.0 
}
streetTable.ew[974] = {
	name = "Karl-Mannsfeld-Stra"..szlig.."e",
	x = 4870.0 
}
streetTable.ew[975] = {
	name = "Ponickaustra"..szlig.."e",
	x = 4875.0 
}
streetTable.ew[976] = {
	name = "Morungenstra"..szlig.."e",
	x = 4880.0 
}
streetTable.ew[977] = {
	name = "Krokerstra"..szlig.."e",
	x = 4885.0 
}
streetTable.ew[978] = {
	name = "Zolaweg",
	x = 4890.0 
}
streetTable.ew[979] = {
	name = "Sch"..ouml.."nbergstra"..szlig.."e",
	x = 4895.0 
}
streetTable.ew[980] = {
	name = "L"..uuml.."tzowstra"..szlig.."e",
	x = 4900.0 
}
streetTable.ew[981] = {
	name = "Aprikosenweg",
	x = 4905.0 
}
streetTable.ew[982] = {
	name = "Viaduktweg",
	x = 4910.0 
}
streetTable.ew[983] = {
	name = "Harbigweg",
	x = 4915.0 
}
streetTable.ew[984] = {
	name = "Brackestra"..szlig.."e",
	x = 4920.0 
}
streetTable.ew[985] = {
	name = "Dammteichweg",
	x = 4925.0 
}
streetTable.ew[986] = {
	name = "Eberpfad",
	x = 4930.0 
}
streetTable.ew[987] = {
	name = "Witzlebenstra"..szlig.."e",
	x = 4935.0 
}
streetTable.ew[988] = {
	name = "Apelsteinweg",
	x = 4940.0 
}
streetTable.ew[989] = {
	name = "Hildeweg",
	x = 4945.0 
}
streetTable.ew[990] = {
	name = "Auf dem Colmberg",
	x = 4950.0 
}
streetTable.ew[991] = {
	name = "Vivaldistra"..szlig.."e",
	x = 4955.0 
}
streetTable.ew[992] = {
	name = "Am Hohen Graben",
	x = 4960.0 
}
streetTable.ew[993] = {
	name = "Petzscher Stra"..szlig.."e",
	x = 4965.0 
}
streetTable.ew[994] = {
	name = "Im Zipfel",
	x = 4970.0 
}
streetTable.ew[995] = {
	name = "Otto-Adam-Stra"..szlig.."e",
	x = 4975.0 
}
streetTable.ew[996] = {
	name = "Geyerstra"..szlig.."e",
	x = 4980.0 
}
streetTable.ew[997] = {
	name = "Hussitenstra"..szlig.."e",
	x = 4985.0 
}
streetTable.ew[998] = {
	name = "Liviastra"..szlig.."e",
	x = 4990.0 
}
streetTable.ew[999] = {
	name = "Deutsche Einheit",
	x = 4995.0 
}
streetTable.ew[1000] = {
	name = "Braustra"..szlig.."e",
	x = 5000.0 
}
streetTable.ew[1001] = {
	name = "Quedlinburger Stra"..szlig.."e",
	x = 5005.0 
}
streetTable.ew[1002] = {
	name = "Leo-Tolstoi-Stra"..szlig.."e",
	x = 5010.0 
}
streetTable.ew[1003] = {
	name = "Rudolf-Breitscheid-Stra"..szlig.."e",
	x = 5015.0 
}
streetTable.ew[1004] = {
	name = "Zu den Drei Kugeln",
	x = 5020.0 
}
streetTable.ew[1005] = {
	name = "Landhausstra"..szlig.."e",
	x = 5025.0 
}
streetTable.ew[1006] = {
	name = "Gletschersteinstra"..szlig.."e",
	x = 5030.0 
}
streetTable.ew[1007] = {
	name = "Winzerweg",
	x = 5035.0 
}
streetTable.ew[1008] = {
	name = "Gleisstra"..szlig.."e",
	x = 5040.0 
}
streetTable.ew[1009] = {
	name = "Am Dorfplatz",
	x = 5045.0 
}
streetTable.ew[1010] = {
	name = "Fritz-Simonis-Stra"..szlig.."e",
	x = 5050.0 
}
streetTable.ew[1011] = {
	name = "Johann-Adolf-Stra"..szlig.."e",
	x = 5055.0 
}
streetTable.ew[1012] = {
	name = "Gartenwinkel",
	x = 5060.0 
}
streetTable.ew[1013] = {
	name = "Colmbergsiedlung",
	x = 5065.0 
}
streetTable.ew[1014] = {
	name = "Harkortstra"..szlig.."e",
	x = 5070.0 
}
streetTable.ew[1015] = {
	name = "Karl-Winkler-Stra"..szlig.."e",
	x = 5075.0 
}
streetTable.ew[1016] = {
	name = "Industriestra"..szlig.."e",
	x = 5080.0 
}
streetTable.ew[1017] = {
	name = "D"..uuml.."rrstra"..szlig.."e",
	x = 5085.0 
}
streetTable.ew[1018] = {
	name = "Hermann-Brade-Stra"..szlig.."e",
	x = 5090.0 
}
streetTable.ew[1019] = {
	name = "Gundermannstra"..szlig.."e",
	x = 5095.0 
}
streetTable.ew[1020] = {
	name = "Kastorweg",
	x = 5100.0 
}
streetTable.ew[1021] = {
	name = "Wielandstra"..szlig.."e",
	x = 5105.0 
}
streetTable.ew[1022] = {
	name = "Baumschulenweg",
	x = 5110.0 
}
streetTable.ew[1023] = {
	name = "Italiaanderstra"..szlig.."e",
	x = 5115.0 
}
streetTable.ew[1024] = {
	name = "Berberitzenstra"..szlig.."e",
	x = 5120.0 
}
streetTable.ew[1025] = {
	name = "Birkenweg",
	x = 5125.0 
}
streetTable.ew[1026] = {
	name = "Auenhainer Stra"..szlig.."e",
	x = 5130.0 
}
streetTable.ew[1027] = {
	name = "Onckenstra"..szlig.."e",
	x = 5135.0 
}
streetTable.ew[1028] = {
	name = "Geraer Stra"..szlig.."e",
	x = 5140.0 
}
streetTable.ew[1029] = {
	name = "Gorbitzer Stra"..szlig.."e",
	x = 5145.0 
}
streetTable.ew[1030] = {
	name = "An der Burgaue",
	x = 5150.0 
}
streetTable.ew[1031] = {
	name = "Titaniaweg",
	x = 5155.0 
}
streetTable.ew[1032] = {
	name = "Giebnerstra"..szlig.."e",
	x = 5160.0 
}
streetTable.ew[1033] = {
	name = "Karl-Marx-Platz",
	x = 5165.0 
}
streetTable.ew[1034] = {
	name = "Eisenberger Ring",
	x = 5170.0 
}
streetTable.ew[1035] = {
	name = "Josephinenstra"..szlig.."e",
	x = 5175.0 
}
streetTable.ew[1036] = {
	name = "Carl-Hampel-Platz",
	x = 5180.0 
}
streetTable.ew[1037] = {
	name = "Th"..uuml.."ringer Stra"..szlig.."e",
	x = 5185.0 
}
streetTable.ew[1038] = {
	name = "Augustusplatz",
	x = 5190.0 
}
streetTable.ew[1039] = {
	name = "Auenstra"..szlig.."e",
	x = 5195.0 
}
streetTable.ew[1040] = {
	name = "Wiesenwinkel",
	x = 5200.0 
}
streetTable.ew[1041] = {
	name = "Marcher Stra"..szlig.."e",
	x = 5205.0 
}
streetTable.ew[1042] = {
	name = "Erich-Zeigner-Allee",
	x = 5210.0 
}
streetTable.ew[1043] = {
	name = "An den Platanen",
	x = 5215.0 
}
streetTable.ew[1044] = {
	name = "Wilhelmstra"..szlig.."e",
	x = 5220.0 
}
streetTable.ew[1045] = {
	name = "Oschatzer Stra"..szlig.."e",
	x = 5225.0 
}
streetTable.ew[1046] = {
	name = "Martin-Luther-Ring",
	x = 5230.0 
}
streetTable.ew[1047] = {
	name = "Riesaer Stra"..szlig.."e",
	x = 5235.0 
}
streetTable.ew[1048] = {
	name = "K"..auml.."the-Kollwitz-Stra"..szlig.."e",
	x = 5240.0 
}
streetTable.ew[1049] = {
	name = "Gotzkowskystra"..szlig.."e",
	x = 5245.0 
}
streetTable.ew[1050] = {
	name = "Bertha-Beckmann-Weg",
	x = 5250.0 
}
streetTable.ew[1051] = {
	name = "Carl-Maria-von-Weber-Stra"..szlig.."e",
	x = 5255.0 
}
streetTable.ew[1052] = {
	name = "Johann-Eck-Stra"..szlig.."e",
	x = 5260.0 
}
streetTable.ew[1053] = {
	name = "Untere Nordstra"..szlig.."e",
	x = 5265.0 
}
streetTable.ew[1054] = {
	name = "Wintzingerodeweg",
	x = 5270.0 
}
streetTable.ew[1055] = {
	name = "Wolteritzer Weg",
	x = 5275.0 
}
streetTable.ew[1056] = {
	name = "Leiblweg",
	x = 5280.0 
}
streetTable.ew[1057] = {
	name = "Nieritzstra"..szlig.."e",
	x = 5285.0 
}
streetTable.ew[1058] = {
	name = "An der Eisenbahn",
	x = 5290.0 
}
streetTable.ew[1059] = {
	name = "Wettiner Stra"..szlig.."e",
	x = 5295.0 
}
streetTable.ew[1060] = {
	name = "M"..ouml.."biusstra"..szlig.."e",
	x = 5300.0 
}
streetTable.ew[1061] = {
	name = "Klempererstra"..szlig.."e",
	x = 5305.0 
}
streetTable.ew[1062] = {
	name = "Stifterstra"..szlig.."e",
	x = 5310.0 
}
streetTable.ew[1063] = {
	name = "Beuchaer Stra"..szlig.."e",
	x = 5315.0 
}
streetTable.ew[1064] = {
	name = "Leupoldstra"..szlig.."e",
	x = 5320.0 
}
streetTable.ew[1065] = {
	name = "Rietzschkeweg",
	x = 5325.0 
}
streetTable.ew[1066] = {
	name = "Am Wasserwerk",
	x = 5330.0 
}
streetTable.ew[1067] = {
	name = "Gottschallstra"..szlig.."e",
	x = 5335.0 
}
streetTable.ew[1068] = {
	name = "Saphirstra"..szlig.."e",
	x = 5340.0 
}
streetTable.ew[1069] = {
	name = "Mommsenstra"..szlig.."e",
	x = 5345.0 
}
streetTable.ew[1070] = {
	name = "Thomasgasse",
	x = 5350.0 
}
streetTable.ew[1071] = {
	name = "Sch"..uuml.."tzstra"..szlig.."e",
	x = 5355.0 
}
streetTable.ew[1072] = {
	name = "Am "..Uuml.."bergang",
	x = 5360.0 
}
streetTable.ew[1073] = {
	name = "Jungmannstra"..szlig.."e",
	x = 5365.0 
}
streetTable.ew[1074] = {
	name = "Maigl"..ouml.."ckchenweg",
	x = 5370.0 
}
streetTable.ew[1075] = {
	name = "Hermelinstra"..szlig.."e",
	x = 5375.0 
}
streetTable.ew[1076] = {
	name = "Emil-M"..auml.."rz-Stra"..szlig.."e",
	x = 5380.0 
}
streetTable.ew[1077] = {
	name = "Berggartenstra"..szlig.."e",
	x = 5385.0 
}
streetTable.ew[1078] = {
	name = "Otto-Runki-Platz",
	x = 5390.0 
}
streetTable.ew[1079] = {
	name = "Zillerstra"..szlig.."e",
	x = 5395.0 
}
streetTable.ew[1080] = {
	name = "Oberholzstra"..szlig.."e",
	x = 5400.0 
}
streetTable.ew[1081] = {
	name = "Stockartstra"..szlig.."e",
	x = 5405.0 
}
streetTable.ew[1082] = {
	name = "Alter Kirchweg",
	x = 5410.0 
}
streetTable.ew[1083] = {
	name = "Manetstra"..szlig.."e",
	x = 5415.0 
}
streetTable.ew[1084] = {
	name = "Wieselstra"..szlig.."e",
	x = 5420.0 
}
streetTable.ew[1085] = {
	name = "Leonhard-Frank-Stra"..szlig.."e",
	x = 5425.0 
}
streetTable.ew[1086] = {
	name = "M"..ouml.."lkauer Stra"..szlig.."e",
	x = 5430.0 
}
streetTable.ew[1087] = {
	name = "Kuhnaustra"..szlig.."e",
	x = 5435.0 
}
streetTable.ew[1088] = {
	name = "Naunhofer Stra"..szlig.."e",
	x = 5440.0 
}
streetTable.ew[1089] = {
	name = "Gerhardstra"..szlig.."e",
	x = 5445.0 
}
streetTable.ew[1090] = {
	name = "Breisgaustra"..szlig.."e",
	x = 5450.0 
}
streetTable.ew[1091] = {
	name = "Breunsdorffstra"..szlig.."e",
	x = 5455.0 
}
streetTable.ew[1092] = {
	name = "Schulstra"..szlig.."e",
	x = 5460.0 
}
streetTable.ew[1093] = {
	name = "Holbergstra"..szlig.."e",
	x = 5465.0 
}
streetTable.ew[1094] = {
	name = "Berkaer Weg",
	x = 5470.0 
}
streetTable.ew[1095] = {
	name = "Sylter Stra"..szlig.."e",
	x = 5475.0 
}
streetTable.ew[1096] = {
	name = "Deutsches Heim",
	x = 5480.0 
}
streetTable.ew[1097] = {
	name = "Markranst"..auml.."dter Stra"..szlig.."e",
	x = 5485.0 
}
streetTable.ew[1098] = {
	name = "Schr"..auml.."gweg",
	x = 5490.0 
}
streetTable.ew[1099] = {
	name = "Undinenweg",
	x = 5495.0 
}
streetTable.ew[1100] = {
	name = "Kulkwitzer Stra"..szlig.."e",
	x = 5500.0 
}
streetTable.ew[1101] = {
	name = "Alte Stra"..szlig.."e",
	x = 5505.0 
}
streetTable.ew[1102] = {
	name = "Mauersbergerstra"..szlig.."e",
	x = 5510.0 
}
streetTable.ew[1103] = {
	name = "Permoserstra"..szlig.."e",
	x = 5515.0 
}
streetTable.ew[1104] = {
	name = "Pfaffenweg",
	x = 5520.0 
}
streetTable.ew[1105] = {
	name = "Kr"..auml.."tzbergstra"..szlig.."e",
	x = 5525.0 
}
streetTable.ew[1106] = {
	name = "Humperdinckstra"..szlig.."e",
	x = 5530.0 
}
streetTable.ew[1107] = {
	name = "Otto-Engert-Stra"..szlig.."e",
	x = 5535.0 
}
streetTable.ew[1108] = {
	name = "Plo"..szlig.."stra"..szlig.."e",
	x = 5540.0 
}
streetTable.ew[1109] = {
	name = "Seestra"..szlig.."e",
	x = 5545.0 
}
streetTable.ew[1110] = {
	name = "Marienbrunnenstra"..szlig.."e",
	x = 5550.0 
}
streetTable.ew[1111] = {
	name = "Am Gutspark",
	x = 5555.0 
}
streetTable.ew[1112] = {
	name = "Inselstra"..szlig.."e",
	x = 5560.0 
}
streetTable.ew[1113] = {
	name = "Hoffmannstra"..szlig.."e",
	x = 5565.0 
}
streetTable.ew[1114] = {
	name = "Verrinaweg",
	x = 5570.0 
}
streetTable.ew[1115] = {
	name = "Kaulbachweg",
	x = 5575.0 
}
streetTable.ew[1116] = {
	name = "Robert-Blum-Platz",
	x = 5580.0 
}
streetTable.ew[1117] = {
	name = "Ursula-G"..ouml.."tze-Stra"..szlig.."e",
	x = 5585.0 
}
streetTable.ew[1118] = {
	name = "Karlsruher Stra"..szlig.."e",
	x = 5590.0 
}
streetTable.ew[1119] = {
	name = "Heinrich-Heine-Stra"..szlig.."e",
	x = 5595.0 
}
streetTable.ew[1120] = {
	name = "Frankenweg",
	x = 5600.0 
}
streetTable.ew[1121] = {
	name = "Gro"..szlig.."p"..ouml.."snaer Stra"..szlig.."e",
	x = 5605.0 
}
streetTable.ew[1122] = {
	name = "Robert-Hanf-Weg",
	x = 5610.0 
}
streetTable.ew[1123] = {
	name = "Teubnerstra"..szlig.."e",
	x = 5615.0 
}
streetTable.ew[1124] = {
	name = "Amselstra"..szlig.."e",
	x = 5620.0 
}
streetTable.ew[1125] = {
	name = "Pfarrholzstra"..szlig.."e",
	x = 5625.0 
}
streetTable.ew[1126] = {
	name = "An der Elster",
	x = 5630.0 
}
streetTable.ew[1127] = {
	name = "Zwetschgenweg",
	x = 5635.0 
}
streetTable.ew[1128] = {
	name = "Rathenaustra"..szlig.."e",
	x = 5640.0 
}
streetTable.ew[1129] = {
	name = "Bernadotteweg",
	x = 5645.0 
}
streetTable.ew[1130] = {
	name = "Luz-Long-Weg",
	x = 5650.0 
}
streetTable.ew[1131] = {
	name = "Schletterstra"..szlig.."e",
	x = 5655.0 
}
streetTable.ew[1132] = {
	name = "Glafeystra"..szlig.."e",
	x = 5660.0 
}
streetTable.ew[1133] = {
	name = "L"..uuml.."tzner Stra"..szlig.."e",
	x = 5665.0 
}
streetTable.ew[1134] = {
	name = "Lichtenfelser Stra"..szlig.."e",
	x = 5670.0 
}
streetTable.ew[1135] = {
	name = "Lorenzstra"..szlig.."e",
	x = 5675.0 
}
streetTable.ew[1136] = {
	name = "Heuweg",
	x = 5680.0 
}
streetTable.ew[1137] = {
	name = "Kamenzer Stra"..szlig.."e",
	x = 5685.0 
}
streetTable.ew[1138] = {
	name = "Karl-B"..uuml.."cher-Stra"..szlig.."e",
	x = 5690.0 
}
streetTable.ew[1139] = {
	name = "Werkst"..auml.."ttenstra"..szlig.."e",
	x = 5695.0 
}
streetTable.ew[1140] = {
	name = "Kutschbachweg",
	x = 5700.0 
}
streetTable.ew[1141] = {
	name = "Eduardstra"..szlig.."e",
	x = 5705.0 
}
streetTable.ew[1142] = {
	name = "Amstetter Weg",
	x = 5710.0 
}
streetTable.ew[1143] = {
	name = "Am Volksgut",
	x = 5715.0 
}
streetTable.ew[1144] = {
	name = "Teslastra"..szlig.."e",
	x = 5720.0 
}
streetTable.ew[1145] = {
	name = "Rehwagenstra"..szlig.."e",
	x = 5725.0 
}
streetTable.ew[1146] = {
	name = "Wehrmannstra"..szlig.."e",
	x = 5730.0 
}
streetTable.ew[1147] = {
	name = "Mascovstra"..szlig.."e",
	x = 5735.0 
}
streetTable.ew[1148] = {
	name = "Peter-Breuer-Weg",
	x = 5740.0 
}
streetTable.ew[1149] = {
	name = "Zum Waldbad",
	x = 5745.0 
}
streetTable.ew[1150] = {
	name = "Geranienweg",
	x = 5750.0 
}
streetTable.ew[1151] = {
	name = "Deiwitzweg",
	x = 5755.0 
}
streetTable.ew[1152] = {
	name = "Edmond-Kaiser-Stra"..szlig.."e",
	x = 5760.0 
}
streetTable.ew[1153] = {
	name = "Renkwitzstra"..szlig.."e",
	x = 5765.0 
}
streetTable.ew[1154] = {
	name = "Rietzschkewiesen",
	x = 5770.0 
}
streetTable.ew[1155] = {
	name = "Haselnussweg",
	x = 5775.0 
}
streetTable.ew[1156] = {
	name = "Naschmarkt",
	x = 5780.0 
}
streetTable.ew[1157] = {
	name = "Hahnekamm",
	x = 5785.0 
}
streetTable.ew[1158] = {
	name = "Stra"..szlig.."bergerstra"..szlig.."e",
	x = 5790.0 
}
streetTable.ew[1159] = {
	name = "Hauffweg",
	x = 5795.0 
}
streetTable.ew[1160] = {
	name = "Watzdorfstra"..szlig.."e",
	x = 5800.0 
}
streetTable.ew[1161] = {
	name = "Bernhardiplatz",
	x = 5805.0 
}
streetTable.ew[1162] = {
	name = "Adenauerallee",
	x = 5810.0 
}
streetTable.ew[1163] = {
	name = "Neuscherbitzer Gasse",
	x = 5815.0 
}
streetTable.ew[1164] = {
	name = "Goldrutenweg",
	x = 5820.0 
}
streetTable.ew[1165] = {
	name = "Apitzschgasse",
	x = 5825.0 
}
streetTable.ew[1166] = {
	name = "Simsonstra"..szlig.."e",
	x = 5830.0 
}
streetTable.ew[1167] = {
	name = "Thietmarstra"..szlig.."e",
	x = 5835.0 
}
streetTable.ew[1168] = {
	name = "Hildburgstra"..szlig.."e",
	x = 5840.0 
}
streetTable.ew[1169] = {
	name = "Kleinp"..ouml.."snaer Stra"..szlig.."e",
	x = 5845.0 
}
streetTable.ew[1170] = {
	name = "Reichpietschstra"..szlig.."e",
	x = 5850.0 
}
streetTable.ew[1171] = {
	name = "Joachim-Gottschalk-Weg",
	x = 5855.0 
}
streetTable.ew[1172] = {
	name = "Robert-Volkmann-Stra"..szlig.."e",
	x = 5860.0 
}
streetTable.ew[1173] = {
	name = "Littstra"..szlig.."e",
	x = 5865.0 
}
streetTable.ew[1174] = {
	name = "Sachsenseite",
	x = 5870.0 
}
streetTable.ew[1175] = {
	name = "H"..auml.."hnelstra"..szlig.."e",
	x = 5875.0 
}
streetTable.ew[1176] = {
	name = "Steinpilzweg",
	x = 5880.0 
}
streetTable.ew[1177] = {
	name = "D"..auml.."hnhardtstra"..szlig.."e",
	x = 5885.0 
}
streetTable.ew[1178] = {
	name = "Hermann-Schein-Stra"..szlig.."e",
	x = 5890.0 
}
streetTable.ew[1179] = {
	name = "Olbrichtstra"..szlig.."e",
	x = 5895.0 
}
streetTable.ew[1180] = {
	name = "Salomonstra"..szlig.."e",
	x = 5900.0 
}
streetTable.ew[1181] = {
	name = "Jouleweg",
	x = 5905.0 
}
streetTable.ew[1182] = {
	name = "Dr.-Margarete-Blank-Stra"..szlig.."e",
	x = 5910.0 
}
streetTable.ew[1183] = {
	name = "Kissinger Stra"..szlig.."e",
	x = 5915.0 
}
streetTable.ew[1184] = {
	name = "M"..uuml.."ckenhainer Weg",
	x = 5920.0 
}
streetTable.ew[1185] = {
	name = "R"..uuml.."ckertstra"..szlig.."e",
	x = 5925.0 
}
streetTable.ew[1186] = {
	name = "Triftweg",
	x = 5930.0 
}
streetTable.ew[1187] = {
	name = "Brahestra"..szlig.."e",
	x = 5935.0 
}
streetTable.ew[1188] = {
	name = "Max-Pommer-Stra"..szlig.."e",
	x = 5940.0 
}
streetTable.ew[1189] = {
	name = "Waldstra"..szlig.."e",
	x = 5945.0 
}
streetTable.ew[1190] = {
	name = "Kirschbergstra"..szlig.."e",
	x = 5950.0 
}
streetTable.ew[1191] = {
	name = "Fliederhof",
	x = 5955.0 
}
streetTable.ew[1192] = {
	name = "Koloniestra"..szlig.."e",
	x = 5960.0 
}
streetTable.ew[1193] = {
	name = "Str"..uuml.."mpellstra"..szlig.."e",
	x = 5965.0 
}
streetTable.ew[1194] = {
	name = "Defreggerweg",
	x = 5970.0 
}
streetTable.ew[1195] = {
	name = "Kurt-H"..auml.."nselmann-Weg",
	x = 5975.0 
}
streetTable.ew[1196] = {
	name = "Lausicker Stra"..szlig.."e",
	x = 5980.0 
}
streetTable.ew[1197] = {
	name = "An der Streuobstwiese",
	x = 5985.0 
}
streetTable.ew[1198] = {
	name = "Les-Epesses-Stra"..szlig.."e",
	x = 5990.0 
}
streetTable.ew[1199] = {
	name = "Gellertplatz",
	x = 5995.0 
}
streetTable.ew[1200] = {
	name = "Kamillenweg",
	x = 6000.0 
}
streetTable.sn[1] = {
	name = "Tulpenweg",
	y = 5.0 
}
streetTable.sn[2] = {
	name = "J"..ouml.."hst"..auml.."dter Stra"..szlig.."e",
	y = 10.0 
}
streetTable.sn[3] = {
	name = "Fuchspfad",
	y = 15.0 
}
streetTable.sn[4] = {
	name = "Hans-Weigel-Stra"..szlig.."e",
	y = 20.0 
}
streetTable.sn[5] = {
	name = "Schachtstra"..szlig.."e",
	y = 25.0 
}
streetTable.sn[6] = {
	name = "Schwarzenbergweg",
	y = 30.0 
}
streetTable.sn[7] = {
	name = "Am Eichberg",
	y = 35.0 
}
streetTable.sn[8] = {
	name = "Lamprechtstra"..szlig.."e",
	y = 40.0 
}
streetTable.sn[9] = {
	name = "Zaucheweg",
	y = 45.0 
}
streetTable.sn[10] = {
	name = "Stentzlerstra"..szlig.."e",
	y = 50.0 
}
streetTable.sn[11] = {
	name = "Lotterstra"..szlig.."e",
	y = 55.0 
}
streetTable.sn[12] = {
	name = "Ahorngasse",
	y = 60.0 
}
streetTable.sn[13] = {
	name = "Hans-Driesch-Stra"..szlig.."e",
	y = 65.0 
}
streetTable.sn[14] = {
	name = "Diezmannstra"..szlig.."e",
	y = 70.0 
}
streetTable.sn[15] = {
	name = "Nonnenstra"..szlig.."e",
	y = 75.0 
}
streetTable.sn[16] = {
	name = "Ro"..szlig.."marktstra"..szlig.."e",
	y = 80.0 
}
streetTable.sn[17] = {
	name = "Buchenweg",
	y = 85.0 
}
streetTable.sn[18] = {
	name = "Eichh"..ouml.."rnchenweg",
	y = 90.0 
}
streetTable.sn[19] = {
	name = "Wangerooger Weg",
	y = 95.0 
}
streetTable.sn[20] = {
	name = "Mosenthinstra"..szlig.."e",
	y = 100.0 
}
streetTable.sn[21] = {
	name = "Florian-Geyer-Platz",
	y = 105.0 
}
streetTable.sn[22] = {
	name = "Friedrich-Dittes-Stra"..szlig.."e",
	y = 110.0 
}
streetTable.sn[23] = {
	name = "Schiebestra"..szlig.."e",
	y = 115.0 
}
streetTable.sn[24] = {
	name = "Wachauer Stra"..szlig.."e",
	y = 120.0 
}
streetTable.sn[25] = {
	name = "Mohnweg",
	y = 125.0 
}
streetTable.sn[26] = {
	name = "Salzstra"..szlig.."e",
	y = 130.0 
}
streetTable.sn[27] = {
	name = "Brommeweg",
	y = 135.0 
}
streetTable.sn[28] = {
	name = "Keplerstra"..szlig.."e",
	y = 140.0 
}
streetTable.sn[29] = {
	name = "Theodor-Neubauer-Stra"..szlig.."e",
	y = 145.0 
}
streetTable.sn[30] = {
	name = "Wilhelm-Michel-Stra"..szlig.."e",
	y = 150.0 
}
streetTable.sn[31] = {
	name = "Hohenheidaer Stra"..szlig.."e",
	y = 155.0 
}
streetTable.sn[32] = {
	name = "Augustinerstra"..szlig.."e",
	y = 160.0 
}
streetTable.sn[33] = {
	name = "Pohlentzstra"..szlig.."e",
	y = 165.0 
}
streetTable.sn[34] = {
	name = "Lindenthaler Hauptstra"..szlig.."e",
	y = 170.0 
}
streetTable.sn[35] = {
	name = "Rodinweg",
	y = 175.0 
}
streetTable.sn[36] = {
	name = "Friedensstra"..szlig.."e",
	y = 180.0 
}
streetTable.sn[37] = {
	name = "Renoirstra"..szlig.."e",
	y = 185.0 
}
streetTable.sn[38] = {
	name = "Mockauer Stra"..szlig.."e",
	y = 190.0 
}
streetTable.sn[39] = {
	name = "Ludwig-Thoma-Weg",
	y = 195.0 
}
streetTable.sn[40] = {
	name = "L"..ouml.."bauer Stra"..szlig.."e",
	y = 200.0 
}
streetTable.sn[41] = {
	name = "Zur Alten Sandgrube",
	y = 205.0 
}
streetTable.sn[42] = {
	name = "Ottostra"..szlig.."e",
	y = 210.0 
}
streetTable.sn[43] = {
	name = "Eigenheimstra"..szlig.."e",
	y = 215.0 
}
streetTable.sn[44] = {
	name = "Salzmannstra"..szlig.."e",
	y = 220.0 
}
streetTable.sn[45] = {
	name = "Wittestra"..szlig.."e",
	y = 225.0 
}
streetTable.sn[46] = {
	name = "Dornr"..ouml.."schenweg",
	y = 230.0 
}
streetTable.sn[47] = {
	name = "Ranst"..auml.."dter Steinweg",
	y = 235.0 
}
streetTable.sn[48] = {
	name = "Mechlerstra"..szlig.."e",
	y = 240.0 
}
streetTable.sn[49] = {
	name = "Mittelstra"..szlig.."e",
	y = 245.0 
}
streetTable.sn[50] = {
	name = "Zirkonstra"..szlig.."e",
	y = 250.0 
}
streetTable.sn[51] = {
	name = "S"..uuml.."dtangente",
	y = 255.0 
}
streetTable.sn[52] = {
	name = "Jack-London-Weg",
	y = 260.0 
}
streetTable.sn[53] = {
	name = "Borkumer Weg",
	y = 265.0 
}
streetTable.sn[54] = {
	name = "Georg-Gro"..szlig.."e-Stra"..szlig.."e",
	y = 270.0 
}
streetTable.sn[55] = {
	name = "Westplatz",
	y = 275.0 
}
streetTable.sn[56] = {
	name = "Mozartstra"..szlig.."e",
	y = 280.0 
}
streetTable.sn[57] = {
	name = "Oldenburger Stra"..szlig.."e",
	y = 285.0 
}
streetTable.sn[58] = {
	name = "Zum W"..auml.."ldchen",
	y = 290.0 
}
streetTable.sn[59] = {
	name = "Mainzer Stra"..szlig.."e",
	y = 295.0 
}
streetTable.sn[60] = {
	name = "Osten-Sacken-Weg",
	y = 300.0 
}
streetTable.sn[61] = {
	name = "Gr"..uuml.."nauer Blick",
	y = 305.0 
}
streetTable.sn[62] = {
	name = "Feldweg",
	y = 310.0 
}
streetTable.sn[63] = {
	name = "Probsteistra"..szlig.."e",
	y = 315.0 
}
streetTable.sn[64] = {
	name = "Kleeweg",
	y = 320.0 
}
streetTable.sn[65] = {
	name = "K"..ouml.."rnerstra"..szlig.."e",
	y = 325.0 
}
streetTable.sn[66] = {
	name = "H"..uuml.."fferstra"..szlig.."e",
	y = 330.0 
}
streetTable.sn[67] = {
	name = "Leopoldstra"..szlig.."e",
	y = 335.0 
}
streetTable.sn[68] = {
	name = "Eythstra"..szlig.."e",
	y = 340.0 
}
streetTable.sn[69] = {
	name = "Gmundener Weg",
	y = 345.0 
}
streetTable.sn[70] = {
	name = "Franz-Flemming-Stra"..szlig.."e",
	y = 350.0 
}
streetTable.sn[71] = {
	name = "Wilsnacker Stra"..szlig.."e",
	y = 355.0 
}
streetTable.sn[72] = {
	name = "Grauwackeweg",
	y = 360.0 
}
streetTable.sn[73] = {
	name = "Marschnerstra"..szlig.."e",
	y = 365.0 
}
streetTable.sn[74] = {
	name = "Elsterweg",
	y = 370.0 
}
streetTable.sn[75] = {
	name = "Friedrich-Bosse-Stra"..szlig.."e",
	y = 375.0 
}
streetTable.sn[76] = {
	name = "Stresemannstra"..szlig.."e",
	y = 380.0 
}
streetTable.sn[77] = {
	name = "Erich-K"..ouml.."hn-Stra"..szlig.."e",
	y = 385.0 
}
streetTable.sn[78] = {
	name = "Nollendorfstra"..szlig.."e",
	y = 390.0 
}
streetTable.sn[79] = {
	name = "Primavesistra"..szlig.."e",
	y = 395.0 
}
streetTable.sn[80] = {
	name = "Richard-Strauss-Platz",
	y = 400.0 
}
streetTable.sn[81] = {
	name = "Schimmelstra"..szlig.."e",
	y = 405.0 
}
streetTable.sn[82] = {
	name = "Odermannstra"..szlig.."e",
	y = 410.0 
}
streetTable.sn[83] = {
	name = "Zum Sonnenblick",
	y = 415.0 
}
streetTable.sn[84] = {
	name = "Basedowstra"..szlig.."e",
	y = 420.0 
}
streetTable.sn[85] = {
	name = "Schopenhauerstra"..szlig.."e",
	y = 425.0 
}
streetTable.sn[86] = {
	name = "Plovdiver Stra"..szlig.."e",
	y = 430.0 
}
streetTable.sn[87] = {
	name = "Schirmerstra"..szlig.."e",
	y = 435.0 
}
streetTable.sn[88] = {
	name = "Georgplatz",
	y = 440.0 
}
streetTable.sn[89] = {
	name = "Am Sperrtor",
	y = 445.0 
}
streetTable.sn[90] = {
	name = "Raimundstra"..szlig.."e",
	y = 450.0 
}
streetTable.sn[91] = {
	name = "Johannisallee",
	y = 455.0 
}
streetTable.sn[92] = {
	name = "Franz-Mehring-Stra"..szlig.."e",
	y = 460.0 
}
streetTable.sn[93] = {
	name = "Goldgl"..ouml.."ckchenstra"..szlig.."e",
	y = 465.0 
}
streetTable.sn[94] = {
	name = "Amazonstra"..szlig.."e",
	y = 470.0 
}
streetTable.sn[95] = {
	name = "Gartenweg",
	y = 475.0 
}
streetTable.sn[96] = {
	name = "Nernststra"..szlig.."e",
	y = 480.0 
}
streetTable.sn[97] = {
	name = "Talstra"..szlig.."e",
	y = 485.0 
}
streetTable.sn[98] = {
	name = "Volbedingstra"..szlig.."e",
	y = 490.0 
}
streetTable.sn[99] = {
	name = "Bautzner Stra"..szlig.."e",
	y = 495.0 
}
streetTable.sn[100] = {
	name = "Reuningstra"..szlig.."e",
	y = 500.0 
}
streetTable.sn[101] = {
	name = "Am Ochsenwinkel",
	y = 505.0 
}
streetTable.sn[102] = {
	name = "Ferdinand-Gruner-Stra"..szlig.."e",
	y = 510.0 
}
streetTable.sn[103] = {
	name = "Gartenstra"..szlig.."e",
	y = 515.0 
}
streetTable.sn[104] = {
	name = "Stannebeinplatz",
	y = 520.0 
}
streetTable.sn[105] = {
	name = "Miltitzer Weg",
	y = 525.0 
}
streetTable.sn[106] = {
	name = "Steinbergstra"..szlig.."e",
	y = 530.0 
}
streetTable.sn[107] = {
	name = "Sternheimstra"..szlig.."e",
	y = 535.0 
}
streetTable.sn[108] = {
	name = "Parkallee",
	y = 540.0 
}
streetTable.sn[109] = {
	name = "Sch"..uuml.."tzenhausstra"..szlig.."e",
	y = 545.0 
}
streetTable.sn[110] = {
	name = "Carl-Munde-Stra"..szlig.."e",
	y = 550.0 
}
streetTable.sn[111] = {
	name = "Mannheimer Stra"..szlig.."e",
	y = 555.0 
}
streetTable.sn[112] = {
	name = "Heckenweg",
	y = 560.0 
}
streetTable.sn[113] = {
	name = "Am Angerteich",
	y = 565.0 
}
streetTable.sn[114] = {
	name = "Thomas-Wagner-Stra"..szlig.."e",
	y = 570.0 
}
streetTable.sn[115] = {
	name = "Gerhard-Ellrodt-Stra"..szlig.."e",
	y = 575.0 
}
streetTable.sn[116] = {
	name = "Pflugkstra"..szlig.."e",
	y = 580.0 
}
streetTable.sn[117] = {
	name = "Lindennaundorfer Weg",
	y = 585.0 
}
streetTable.sn[118] = {
	name = "Hohle Gasse",
	y = 590.0 
}
streetTable.sn[119] = {
	name = "Otto-Schmiedt-Stra"..szlig.."e",
	y = 595.0 
}
streetTable.sn[120] = {
	name = "Lukasstra"..szlig.."e",
	y = 600.0 
}
streetTable.sn[121] = {
	name = "Pirolweg",
	y = 605.0 
}
streetTable.sn[122] = {
	name = "Wolfener Stra"..szlig.."e",
	y = 610.0 
}
streetTable.sn[123] = {
	name = "Helgol"..auml.."nder Weg",
	y = 615.0 
}
streetTable.sn[124] = {
	name = "Am Tanzplan",
	y = 620.0 
}
streetTable.sn[125] = {
	name = "Am Sommerfeld",
	y = 625.0 
}
streetTable.sn[126] = {
	name = "Stockmannstra"..szlig.."e",
	y = 630.0 
}
streetTable.sn[127] = {
	name = "Feuerbachstra"..szlig.."e",
	y = 635.0 
}
streetTable.sn[128] = {
	name = "Zu den Wiesen",
	y = 640.0 
}
streetTable.sn[129] = {
	name = "K"..ouml.."stritzer Stra"..szlig.."e",
	y = 645.0 
}
streetTable.sn[130] = {
	name = "Engelsdorfer Park",
	y = 650.0 
}
streetTable.sn[131] = {
	name = "Knaurstra"..szlig.."e",
	y = 655.0 
}
streetTable.sn[132] = {
	name = "Ziegelstra"..szlig.."e",
	y = 660.0 
}
streetTable.sn[133] = {
	name = "Raschwitzer Stra"..szlig.."e",
	y = 665.0 
}
streetTable.sn[134] = {
	name = "Georg-Herwegh-Stra"..szlig.."e",
	y = 670.0 
}
streetTable.sn[135] = {
	name = "Am Sportpark",
	y = 675.0 
}
streetTable.sn[136] = {
	name = "Majakowskistra"..szlig.."e",
	y = 680.0 
}
streetTable.sn[137] = {
	name = "Hauschildstra"..szlig.."e",
	y = 685.0 
}
streetTable.sn[138] = {
	name = "Dinterstra"..szlig.."e",
	y = 690.0 
}
streetTable.sn[139] = {
	name = "Adelgunde-Gottsched-W",
	y = 695.0 
}
streetTable.sn[140] = {
	name = "Grenzweg",
	y = 700.0 
}
streetTable.sn[141] = {
	name = "Eibenweg",
	y = 705.0 
}
streetTable.sn[142] = {
	name = "An den Theklafeldern",
	y = 710.0 
}
streetTable.sn[143] = {
	name = Auml.."u"..szlig.."ere Friedrich-Naumann-Stra"..szlig.."e",
	y = 715.0 
}
streetTable.sn[144] = {
	name = "Basteistra"..szlig.."e",
	y = 720.0 
}
streetTable.sn[145] = {
	name = "Goerdelerring",
	y = 725.0 
}
streetTable.sn[146] = {
	name = "Neunkirchener Stra"..szlig.."e",
	y = 730.0 
}
streetTable.sn[147] = {
	name = "Falkensteinstra"..szlig.."e",
	y = 735.0 
}
streetTable.sn[148] = {
	name = "B"..uuml.."hringstra"..szlig.."e",
	y = 740.0 
}
streetTable.sn[149] = {
	name = "Stahmelner Stra"..szlig.."e",
	y = 745.0 
}
streetTable.sn[150] = {
	name = "Burgstra"..szlig.."e",
	y = 750.0 
}
streetTable.sn[151] = {
	name = "An der Trift",
	y = 755.0 
}
streetTable.sn[152] = {
	name = "Gartenbogen",
	y = 760.0 
}
streetTable.sn[153] = {
	name = "Finkengrund",
	y = 765.0 
}
streetTable.sn[154] = {
	name = "Gustav-K"..uuml.."hn-Stra"..szlig.."e",
	y = 770.0 
}
streetTable.sn[155] = {
	name = "Leibnizstra"..szlig.."e",
	y = 775.0 
}
streetTable.sn[156] = {
	name = "An der Schule",
	y = 780.0 
}
streetTable.sn[157] = {
	name = "Hirseweg",
	y = 785.0 
}
streetTable.sn[158] = {
	name = "Kremser Weg",
	y = 790.0 
}
streetTable.sn[159] = {
	name = "Wittenberger Stra"..szlig.."e",
	y = 795.0 
}
streetTable.sn[160] = {
	name = "Blausternweg",
	y = 800.0 
}
streetTable.sn[161] = {
	name = "Christian-Schmid-Stra"..szlig.."e",
	y = 805.0 
}
streetTable.sn[162] = {
	name = "Lupinenweg",
	y = 810.0 
}
streetTable.sn[163] = {
	name = "Am Kellerberg",
	y = 815.0 
}
streetTable.sn[164] = {
	name = "Gotthelfstra"..szlig.."e",
	y = 820.0 
}
streetTable.sn[165] = {
	name = "Ulrichstra"..szlig.."e",
	y = 825.0 
}
streetTable.sn[166] = {
	name = "Beuthstra"..szlig.."e",
	y = 830.0 
}
streetTable.sn[167] = {
	name = "K"..auml.."rrnerstra"..szlig.."e",
	y = 835.0 
}
streetTable.sn[168] = {
	name = "Im Limburgerpark",
	y = 840.0 
}
streetTable.sn[169] = {
	name = "Tschammerstra"..szlig.."e",
	y = 845.0 
}
streetTable.sn[170] = {
	name = "Hummelstra"..szlig.."e",
	y = 850.0 
}
streetTable.sn[171] = {
	name = "Turmweg",
	y = 855.0 
}
streetTable.sn[172] = {
	name = "Lindenpark",
	y = 860.0 
}
streetTable.sn[173] = {
	name = "Offenburger Stra"..szlig.."e",
	y = 865.0 
}
streetTable.sn[174] = {
	name = "An der Br"..uuml.."cke",
	y = 870.0 
}
streetTable.sn[175] = {
	name = "Zweifelstra"..szlig.."e",
	y = 875.0 
}
streetTable.sn[176] = {
	name = "Giordano-Bruno-Stra"..szlig.."e",
	y = 880.0 
}
streetTable.sn[177] = {
	name = "Paul-Michael-Stra"..szlig.."e",
	y = 885.0 
}
streetTable.sn[178] = {
	name = "Hainbuchenstra"..szlig.."e",
	y = 890.0 
}
streetTable.sn[179] = {
	name = "Schulweg",
	y = 895.0 
}
streetTable.sn[180] = {
	name = "Eisenbahnstra"..szlig.."e",
	y = 900.0 
}
streetTable.sn[181] = {
	name = "Baumwollgasse",
	y = 905.0 
}
streetTable.sn[182] = {
	name = "Fichtestra"..szlig.."e",
	y = 910.0 
}
streetTable.sn[183] = {
	name = "Dorstigstra"..szlig.."e",
	y = 915.0 
}
streetTable.sn[184] = {
	name = "Posastra"..szlig.."e",
	y = 920.0 
}
streetTable.sn[185] = {
	name = "Friedrich-Schmidt-Stra"..szlig.."e",
	y = 925.0 
}
streetTable.sn[186] = {
	name = "Neue Linie",
	y = 930.0 
}
streetTable.sn[187] = {
	name = "Matthissonstra"..szlig.."e",
	y = 935.0 
}
streetTable.sn[188] = {
	name = "Ellernweg",
	y = 940.0 
}
streetTable.sn[189] = {
	name = "Herrnhuter Stra"..szlig.."e",
	y = 945.0 
}
streetTable.sn[190] = {
	name = "Gottschalkstra"..szlig.."e",
	y = 950.0 
}
streetTable.sn[191] = {
	name = "Beethovenstra"..szlig.."e",
	y = 955.0 
}
streetTable.sn[192] = {
	name = "Ariostiweg",
	y = 960.0 
}
streetTable.sn[193] = {
	name = "Christian-Wille-Weg",
	y = 965.0 
}
streetTable.sn[194] = {
	name = "Eduard-von-Hartmann-Stra"..szlig.."e",
	y = 970.0 
}
streetTable.sn[195] = {
	name = "Zum Kalten Born",
	y = 975.0 
}
streetTable.sn[196] = {
	name = "Rietzschkebogen",
	y = 980.0 
}
streetTable.sn[197] = {
	name = "Max-Borsdorf-Stra"..szlig.."e",
	y = 985.0 
}
streetTable.sn[198] = {
	name = "Torstensonring",
	y = 990.0 
}
streetTable.sn[199] = {
	name = "Gellertstra"..szlig.."e",
	y = 995.0 
}
streetTable.sn[200] = {
	name = "Ernst-Hasse-Stra"..szlig.."e",
	y = 1000.0 
}
streetTable.sn[201] = {
	name = "Hirtenholzstra"..szlig.."e",
	y = 1005.0 
}
streetTable.sn[202] = {
	name = "Etzelstra"..szlig.."e",
	y = 1010.0 
}
streetTable.sn[203] = {
	name = "Jupiterstra"..szlig.."e",
	y = 1015.0 
}
streetTable.sn[204] = {
	name = "Salzweg",
	y = 1020.0 
}
streetTable.sn[205] = {
	name = "Auerhahnsteig",
	y = 1025.0 
}
streetTable.sn[206] = {
	name = "Schillerstra"..szlig.."e",
	y = 1030.0 
}
streetTable.sn[207] = {
	name = "Borsdorfer Stra"..szlig.."e",
	y = 1035.0 
}
streetTable.sn[208] = {
	name = "Dittrichring",
	y = 1040.0 
}
streetTable.sn[209] = {
	name = "St"..uuml.."nz-M"..ouml.."lkauer Weg",
	y = 1045.0 
}
streetTable.sn[210] = {
	name = "Unterer Sandweg",
	y = 1050.0 
}
streetTable.sn[211] = {
	name = "Beckerstra"..szlig.."e",
	y = 1055.0 
}
streetTable.sn[212] = {
	name = "Ludwigstra"..szlig.."e",
	y = 1060.0 
}
streetTable.sn[213] = {
	name = "Klosterneuburger Weg",
	y = 1065.0 
}
streetTable.sn[214] = {
	name = "Libellenstra"..szlig.."e",
	y = 1070.0 
}
streetTable.sn[215] = {
	name = "Heimdallstra"..szlig.."e",
	y = 1075.0 
}
streetTable.sn[216] = {
	name = "Kantor-Hase-Stra"..szlig.."e",
	y = 1080.0 
}
streetTable.sn[217] = {
	name = "Hofmeisterstra"..szlig.."e",
	y = 1085.0 
}
streetTable.sn[218] = {
	name = "Corinthstra"..szlig.."e",
	y = 1090.0 
}
streetTable.sn[219] = {
	name = "Quasnitzer H"..ouml.."he",
	y = 1095.0 
}
streetTable.sn[220] = {
	name = "Alexis-Schumann-Platz",
	y = 1100.0 
}
streetTable.sn[221] = {
	name = "Zum Apelstein",
	y = 1105.0 
}
streetTable.sn[222] = {
	name = "W"..ouml.."bbeliner Stra"..szlig.."e",
	y = 1110.0 
}
streetTable.sn[223] = {
	name = "Adamsweg",
	y = 1115.0 
}
streetTable.sn[224] = {
	name = "Rackwitzer Stra"..szlig.."e",
	y = 1120.0 
}
streetTable.sn[225] = {
	name = "Max-Reger-Stra"..szlig.."e",
	y = 1125.0 
}
streetTable.sn[226] = {
	name = "Auerbachplatz",
	y = 1130.0 
}
streetTable.sn[227] = {
	name = "Schnorrstra"..szlig.."e",
	y = 1135.0 
}
streetTable.sn[228] = {
	name = "B"..uuml.."rgerstra"..szlig.."e",
	y = 1140.0 
}
streetTable.sn[229] = {
	name = "Ziolkowskistra"..szlig.."e",
	y = 1145.0 
}
streetTable.sn[230] = {
	name = "Chamissoweg",
	y = 1150.0 
}
streetTable.sn[231] = {
	name = "Moschelesstra"..szlig.."e",
	y = 1155.0 
}
streetTable.sn[232] = {
	name = "Spetlakstra"..szlig.."e",
	y = 1160.0 
}
streetTable.sn[233] = {
	name = "Bucksdorffstra"..szlig.."e",
	y = 1165.0 
}
streetTable.sn[234] = {
	name = "Br"..ouml.."sigkestra"..szlig.."e",
	y = 1170.0 
}
streetTable.sn[235] = {
	name = "V·clav-Neumann-Stra"..szlig.."e",
	y = 1175.0 
}
streetTable.sn[236] = {
	name = "Fregestra"..szlig.."e",
	y = 1180.0 
}
streetTable.sn[237] = {
	name = "Naund"..ouml.."rfchen",
	y = 1185.0 
}
streetTable.sn[238] = {
	name = "Menckestra"..szlig.."e",
	y = 1190.0 
}
streetTable.sn[239] = {
	name = "Elsterberg",
	y = 1195.0 
}
streetTable.sn[240] = {
	name = "Brandiser Stra"..szlig.."e",
	y = 1200.0 
}
streetTable.sn[241] = {
	name = "Kriemhildstra"..szlig.."e",
	y = 1205.0 
}
streetTable.sn[242] = {
	name = "Hedwigstra"..szlig.."e",
	y = 1210.0 
}
streetTable.sn[243] = {
	name = "Siegfriedstra"..szlig.."e",
	y = 1215.0 
}
streetTable.sn[244] = {
	name = "Arndtstra"..szlig.."e",
	y = 1220.0 
}
streetTable.sn[245] = {
	name = "Spohrstra"..szlig.."e",
	y = 1225.0 
}
streetTable.sn[246] = {
	name = "Hildegardstra"..szlig.."e",
	y = 1230.0 
}
streetTable.sn[247] = {
	name = "Holteistra"..szlig.."e",
	y = 1235.0 
}
streetTable.sn[248] = {
	name = "Am Alten Bahnhof",
	y = 1240.0 
}
streetTable.sn[249] = {
	name = "Am Fischerhaus",
	y = 1245.0 
}
streetTable.sn[250] = {
	name = "Schwedenstra"..szlig.."e",
	y = 1250.0 
}
streetTable.sn[251] = {
	name = "Zschampertaue",
	y = 1255.0 
}
streetTable.sn[252] = {
	name = "Schinkelstra"..szlig.."e",
	y = 1260.0 
}
streetTable.sn[253] = {
	name = "Ilmenauer Weg",
	y = 1265.0 
}
streetTable.sn[254] = {
	name = "Preu"..szlig.."erg"..auml..""..szlig.."chen",
	y = 1270.0 
}
streetTable.sn[255] = {
	name = "Fraunhoferstra"..szlig.."e",
	y = 1275.0 
}
streetTable.sn[256] = {
	name = "Threnaer Stra"..szlig.."e",
	y = 1280.0 
}
streetTable.sn[257] = {
	name = "Oberl"..auml.."uterstra"..szlig.."e",
	y = 1285.0 
}
streetTable.sn[258] = {
	name = "Otto-Militzer-Stra"..szlig.."e",
	y = 1290.0 
}
streetTable.sn[259] = {
	name = "Felsenbirnenstra"..szlig.."e",
	y = 1295.0 
}
streetTable.sn[260] = {
	name = "Birkenstra"..szlig.."e",
	y = 1300.0 
}
streetTable.sn[261] = {
	name = "Am langen Felde",
	y = 1305.0 
}
streetTable.sn[262] = {
	name = "Josephstra"..szlig.."e",
	y = 1310.0 
}
streetTable.sn[263] = {
	name = "Am Hasenberg",
	y = 1315.0 
}
streetTable.sn[264] = {
	name = "Fichtesiedlung",
	y = 1320.0 
}
streetTable.sn[265] = {
	name = "Rotk"..auml.."ppchenweg",
	y = 1325.0 
}
streetTable.sn[266] = {
	name = "Endnerstra"..szlig.."e",
	y = 1330.0 
}
streetTable.sn[267] = {
	name = "Gr"..uuml.."newaldstra"..szlig.."e",
	y = 1335.0 
}
streetTable.sn[268] = {
	name = "Ganghoferstra"..szlig.."e",
	y = 1340.0 
}
streetTable.sn[269] = {
	name = "Markkleeberger Stra"..szlig.."e",
	y = 1345.0 
}
streetTable.sn[270] = {
	name = "Katharinenstra"..szlig.."e",
	y = 1350.0 
}
streetTable.sn[271] = {
	name = "Weheweg",
	y = 1355.0 
}
streetTable.sn[272] = {
	name = "August-Scheibe-Stra"..szlig.."e",
	y = 1360.0 
}
streetTable.sn[273] = {
	name = "J"..ouml.."cherstra"..szlig.."e",
	y = 1365.0 
}
streetTable.sn[274] = {
	name = "Alfred-K"..auml.."stner-Stra"..szlig.."e",
	y = 1370.0 
}
streetTable.sn[275] = {
	name = "Arnst"..auml.."dter Kehre",
	y = 1375.0 
}
streetTable.sn[276] = {
	name = "Smaragdstra"..szlig.."e",
	y = 1380.0 
}
streetTable.sn[277] = {
	name = "Hans-Beimler-Stra"..szlig.."e",
	y = 1385.0 
}
streetTable.sn[278] = {
	name = "Rietschelstra"..szlig.."e",
	y = 1390.0 
}
streetTable.sn[279] = {
	name = "Schellingstra"..szlig.."e",
	y = 1395.0 
}
streetTable.sn[280] = {
	name = "Zur Alten B"..auml.."ckerei",
	y = 1400.0 
}
streetTable.sn[281] = {
	name = "Judith-Auer-Stra"..szlig.."e",
	y = 1405.0 
}
streetTable.sn[282] = {
	name = "An der Alten Post",
	y = 1410.0 
}
streetTable.sn[283] = {
	name = "R"..uuml.."digerstra"..szlig.."e",
	y = 1415.0 
}
streetTable.sn[284] = {
	name = "Neue Leipziger Stra"..szlig.."e",
	y = 1420.0 
}
streetTable.sn[285] = {
	name = "Hauckstra"..szlig.."e",
	y = 1425.0 
}
streetTable.sn[286] = {
	name = "Pittlerstra"..szlig.."e",
	y = 1430.0 
}
streetTable.sn[287] = {
	name = "Weidmannweg",
	y = 1435.0 
}
streetTable.sn[288] = {
	name = "Hinter der Kirche",
	y = 1440.0 
}
streetTable.sn[289] = {
	name = "Am Pfefferbr"..uuml.."ckchen",
	y = 1445.0 
}
streetTable.sn[290] = {
	name = "Senefelderstra"..szlig.."e",
	y = 1450.0 
}
streetTable.sn[291] = {
	name = "Karl-Ferlemann-Stra"..szlig.."e",
	y = 1455.0 
}
streetTable.sn[292] = {
	name = "Am alten Gasthof",
	y = 1460.0 
}
streetTable.sn[293] = {
	name = "Antonienstra"..szlig.."e",
	y = 1465.0 
}
streetTable.sn[294] = {
	name = "Pufendorfstra"..szlig.."e",
	y = 1470.0 
}
streetTable.sn[295] = {
	name = "Berthastra"..szlig.."e",
	y = 1475.0 
}
streetTable.sn[296] = {
	name = "Zum Lippenplan",
	y = 1480.0 
}
streetTable.sn[297] = {
	name = "H"..uuml.."nerfeldstra"..szlig.."e",
	y = 1485.0 
}
streetTable.sn[298] = {
	name = "Freisinger Weg",
	y = 1490.0 
}
streetTable.sn[299] = {
	name = "Tannenwaldstra"..szlig.."e",
	y = 1495.0 
}
streetTable.sn[300] = {
	name = "G"..auml.."rtnergasse",
	y = 1500.0 
}
streetTable.sn[301] = {
	name = "Markgrafenstra"..szlig.."e",
	y = 1505.0 
}
streetTable.sn[302] = {
	name = "Kolpingweg",
	y = 1510.0 
}
streetTable.sn[303] = {
	name = "Annenstra"..szlig.."e",
	y = 1515.0 
}
streetTable.sn[304] = {
	name = "Hartriegelstra"..szlig.."e",
	y = 1520.0 
}
streetTable.sn[305] = {
	name = "Paul-Kl"..ouml.."psch-Stra"..szlig.."e",
	y = 1525.0 
}
streetTable.sn[306] = {
	name = "Lenzstra"..szlig.."e",
	y = 1530.0 
}
streetTable.sn[307] = {
	name = "Goetheplatz",
	y = 1535.0 
}
streetTable.sn[308] = {
	name = "Ludwig-Beck-Stra"..szlig.."e",
	y = 1540.0 
}
streetTable.sn[309] = {
	name = "Osth"..ouml.."he",
	y = 1545.0 
}
streetTable.sn[310] = {
	name = "Brahmsplatz",
	y = 1550.0 
}
streetTable.sn[311] = {
	name = "Delitzscher Stra"..szlig.."e",
	y = 1555.0 
}
streetTable.sn[312] = {
	name = "Klingerweg",
	y = 1560.0 
}
streetTable.sn[313] = {
	name = "Weickmannweg",
	y = 1565.0 
}
streetTable.sn[314] = {
	name = "Am Ring",
	y = 1570.0 
}
streetTable.sn[315] = {
	name = "Otto-Thiele-Stra"..szlig.."e",
	y = 1575.0 
}
streetTable.sn[316] = {
	name = "G"..uuml.."ldengossaer Stra"..szlig.."e",
	y = 1580.0 
}
streetTable.sn[317] = {
	name = "D"..ouml.."sner Weg",
	y = 1585.0 
}
streetTable.sn[318] = {
	name = "Amselh"..ouml.."he",
	y = 1590.0 
}
streetTable.sn[319] = {
	name = "Trinitatisstra"..szlig.."e",
	y = 1595.0 
}
streetTable.sn[320] = {
	name = "G"..uuml.."terbahnhofstra"..szlig.."e",
	y = 1600.0 
}
streetTable.sn[321] = {
	name = "Nordstra"..szlig.."e",
	y = 1605.0 
}
streetTable.sn[322] = {
	name = "Walter-Barth-Stra"..szlig.."e",
	y = 1610.0 
}
streetTable.sn[323] = {
	name = "Kastanienstra"..szlig.."e",
	y = 1615.0 
}
streetTable.sn[324] = {
	name = "Emil-Kluge-Stra"..szlig.."e",
	y = 1620.0 
}
streetTable.sn[325] = {
	name = "Dortmunder Stra"..szlig.."e",
	y = 1625.0 
}
streetTable.sn[326] = {
	name = "Falkenweg",
	y = 1630.0 
}
streetTable.sn[327] = {
	name = "An der Merseburger Stra",
	y = 1635.0 
}
streetTable.sn[328] = {
	name = "Marmontstra"..szlig.."e",
	y = 1640.0 
}
streetTable.sn[329] = {
	name = "Kaninchensteig",
	y = 1645.0 
}
streetTable.sn[330] = {
	name = "Curschmannstra"..szlig.."e",
	y = 1650.0 
}
streetTable.sn[331] = {
	name = "St"..ouml.."rmthaler Stra"..szlig.."e",
	y = 1655.0 
}
streetTable.sn[332] = {
	name = "Kieler Stra"..szlig.."e",
	y = 1660.0 
}
streetTable.sn[333] = {
	name = "Huberstra"..szlig.."e",
	y = 1665.0 
}
streetTable.sn[334] = {
	name = "Bretschneiderstra"..szlig.."e",
	y = 1670.0 
}
streetTable.sn[335] = {
	name = "Iltispfad",
	y = 1675.0 
}
streetTable.sn[336] = {
	name = "Kolbestra"..szlig.."e",
	y = 1680.0 
}
streetTable.sn[337] = {
	name = "Dietzgenstra"..szlig.."e",
	y = 1685.0 
}
streetTable.sn[338] = {
	name = Ouml.."lhafenstra"..szlig.."e",
	y = 1690.0 
}
streetTable.sn[339] = {
	name = "An der Badeanlage",
	y = 1695.0 
}
streetTable.sn[340] = {
	name = "Im Lindengrund",
	y = 1700.0 
}
streetTable.sn[341] = {
	name = "An der Kotsche",
	y = 1705.0 
}
streetTable.sn[342] = {
	name = "Am Exerzierplatz",
	y = 1710.0 
}
streetTable.sn[343] = {
	name = "Ro"..szlig.."m"..auml..""..szlig.."lerstra"..szlig.."e",
	y = 1715.0 
}
streetTable.sn[344] = {
	name = "M"..uuml.."hlstra"..szlig.."e",
	y = 1720.0 
}
streetTable.sn[345] = {
	name = "Stephanstra"..szlig.."e",
	y = 1725.0 
}
streetTable.sn[346] = {
	name = "Liebigstra"..szlig.."e",
	y = 1730.0 
}
streetTable.sn[347] = {
	name = "Kornblumenweg",
	y = 1735.0 
}
streetTable.sn[348] = {
	name = "Hermannstra"..szlig.."e",
	y = 1740.0 
}
streetTable.sn[349] = {
	name = "Zur Alten Weintraube",
	y = 1745.0 
}
streetTable.sn[350] = {
	name = "Wenckstra"..szlig.."e",
	y = 1750.0 
}
streetTable.sn[351] = {
	name = "Am Stausee",
	y = 1755.0 
}
streetTable.sn[352] = {
	name = "Schwylststra"..szlig.."e",
	y = 1760.0 
}
streetTable.sn[353] = {
	name = "Frickestra"..szlig.."e",
	y = 1765.0 
}
streetTable.sn[354] = {
	name = "Hendelweg",
	y = 1770.0 
}
streetTable.sn[355] = {
	name = "Korolenkostra"..szlig.."e",
	y = 1775.0 
}
streetTable.sn[356] = {
	name = "Am Rennsteig",
	y = 1780.0 
}
streetTable.sn[357] = {
	name = "Hinter dem Zuckelhausener Ring",
	y = 1785.0 
}
streetTable.sn[358] = {
	name = "Auenseestra"..szlig.."e",
	y = 1790.0 
}
streetTable.sn[359] = {
	name = "Wurzner Stra"..szlig.."e",
	y = 1795.0 
}
streetTable.sn[360] = {
	name = "Am Pfarrfelde",
	y = 1800.0 
}
streetTable.sn[361] = {
	name = "Auguste-Schulze-Stra"..szlig.."e",
	y = 1805.0 
}
streetTable.sn[362] = {
	name = "Cr"..ouml.."berner Stra"..szlig.."e",
	y = 1810.0 
}
streetTable.sn[363] = {
	name = "Erich-Thiele-Stra"..szlig.."e",
	y = 1815.0 
}
streetTable.sn[364] = {
	name = "Hubertusstra"..szlig.."e",
	y = 1820.0 
}
streetTable.sn[365] = {
	name = "Schneeballweg",
	y = 1825.0 
}
streetTable.sn[366] = {
	name = "Bisamstra"..szlig.."e",
	y = 1830.0 
}
streetTable.sn[367] = {
	name = "Schlegelstra"..szlig.."e",
	y = 1835.0 
}
streetTable.sn[368] = {
	name = "G"..uuml.."ntherstra"..szlig.."e",
	y = 1840.0 
}
streetTable.sn[369] = {
	name = "Nu"..szlig.."baumallee",
	y = 1845.0 
}
streetTable.sn[370] = {
	name = "Im D"..ouml.."litzer Holz",
	y = 1850.0 
}
streetTable.sn[371] = {
	name = "Ostplatz",
	y = 1855.0 
}
streetTable.sn[372] = {
	name = "Die Linie",
	y = 1860.0 
}
streetTable.sn[373] = {
	name = "Hainveilchenweg",
	y = 1865.0 
}
streetTable.sn[374] = {
	name = "Am J"..auml.."gerhaus",
	y = 1870.0 
}
streetTable.sn[375] = {
	name = "Gortschakoffweg",
	y = 1875.0 
}
streetTable.sn[376] = {
	name = "Wolkenweg",
	y = 1880.0 
}
streetTable.sn[377] = {
	name = "Hentschelweg",
	y = 1885.0 
}
streetTable.sn[378] = {
	name = "K"..ouml.."bisstra"..szlig.."e",
	y = 1890.0 
}
streetTable.sn[379] = {
	name = "Auf der H"..ouml.."he",
	y = 1895.0 
}
streetTable.sn[380] = {
	name = "Basilikumweg",
	y = 1900.0 
}
streetTable.sn[381] = {
	name = "Feldstra"..szlig.."e",
	y = 1905.0 
}
streetTable.sn[382] = {
	name = "Hohmannstra"..szlig.."e",
	y = 1910.0 
}
streetTable.sn[383] = {
	name = "Rinckartstra"..szlig.."e",
	y = 1915.0 
}
streetTable.sn[384] = {
	name = "G"..auml.."nsebl"..uuml.."mchenweg",
	y = 1920.0 
}
streetTable.sn[385] = {
	name = "D"..ouml.."rrienstra"..szlig.."e",
	y = 1925.0 
}
streetTable.sn[386] = {
	name = "G"..ouml.."hrenzer Stra"..szlig.."e",
	y = 1930.0 
}
streetTable.sn[387] = {
	name = "Am Hufeisen",
	y = 1935.0 
}
streetTable.sn[388] = {
	name = "Zum Harfenacker",
	y = 1940.0 
}
streetTable.sn[389] = {
	name = "Am G"..uuml.."terring",
	y = 1945.0 
}
streetTable.sn[390] = {
	name = "Hardenbergstra"..szlig.."e",
	y = 1950.0 
}
streetTable.sn[391] = {
	name = "Sch"..ouml.."fflerweg",
	y = 1955.0 
}
streetTable.sn[392] = {
	name = "Nathanaelstra"..szlig.."e",
	y = 1960.0 
}
streetTable.sn[393] = {
	name = "Jahnstra"..szlig.."e",
	y = 1965.0 
}
streetTable.sn[394] = {
	name = "Am Lindenhof",
	y = 1970.0 
}
streetTable.sn[395] = {
	name = "Wertheimer Stra"..szlig.."e",
	y = 1975.0 
}
streetTable.sn[396] = {
	name = "Claudiusstra"..szlig.."e",
	y = 1980.0 
}
streetTable.sn[397] = {
	name = "Christoph-Probst-Stra"..szlig.."e",
	y = 1985.0 
}
streetTable.sn[398] = {
	name = "Hauptmannstra"..szlig.."e",
	y = 1990.0 
}
streetTable.sn[399] = {
	name = "An der Wendeschleife",
	y = 1995.0 
}
streetTable.sn[400] = {
	name = "Sommerlindenstra"..szlig.."e",
	y = 2000.0 
}
streetTable.sn[401] = {
	name = "Teichgr"..auml.."berstra"..szlig.."e",
	y = 2005.0 
}
streetTable.sn[402] = {
	name = "Nonnenm"..uuml.."hlgasse",
	y = 2010.0 
}
streetTable.sn[403] = {
	name = "Am Teich",
	y = 2015.0 
}
streetTable.sn[404] = {
	name = "Burgplatz",
	y = 2020.0 
}
streetTable.sn[405] = {
	name = "Th"..uuml.."nenstra"..szlig.."e",
	y = 2025.0 
}
streetTable.sn[406] = {
	name = "An der Telle",
	y = 2030.0 
}
streetTable.sn[407] = {
	name = "Hermann-Liebmann-Stra"..szlig.."e",
	y = 2035.0 
}
streetTable.sn[408] = {
	name = "Carusstra"..szlig.."e",
	y = 2040.0 
}
streetTable.sn[409] = {
	name = "Hallesche Stra"..szlig.."e",
	y = 2045.0 
}
streetTable.sn[410] = {
	name = "Hohenheidaer Weg",
	y = 2050.0 
}
streetTable.sn[411] = {
	name = "Hopfenweg",
	y = 2055.0 
}
streetTable.sn[412] = {
	name = "Krakauer Stra"..szlig.."e",
	y = 2060.0 
}
streetTable.sn[413] = {
	name = "Stra"..szlig.."e des 18. Oktober",
	y = 2065.0 
}
streetTable.sn[414] = {
	name = "Tellweg",
	y = 2070.0 
}
streetTable.sn[415] = {
	name = "Sterntalerweg",
	y = 2075.0 
}
streetTable.sn[416] = {
	name = "Demmeringstra"..szlig.."e",
	y = 2080.0 
}
streetTable.sn[417] = {
	name = "Oelsnitzer Stra"..szlig.."e",
	y = 2085.0 
}
streetTable.sn[418] = {
	name = "Kuntzschmannstra"..szlig.."e",
	y = 2090.0 
}
streetTable.sn[419] = {
	name = "Grillenstra"..szlig.."e",
	y = 2095.0 
}
streetTable.sn[420] = {
	name = "Sachsenh"..ouml.."he",
	y = 2100.0 
}
streetTable.sn[421] = {
	name = "M"..uuml.."hlbergsiedlung",
	y = 2105.0 
}
streetTable.sn[422] = {
	name = "Preu"..szlig.."enstra"..szlig.."e",
	y = 2110.0 
}
streetTable.sn[423] = {
	name = "Werfelstra"..szlig.."e",
	y = 2115.0 
}
streetTable.sn[424] = {
	name = "Ostrowskistra"..szlig.."e",
	y = 2120.0 
}
streetTable.sn[425] = {
	name = "Johann-Jakob-Weber-Platz",
	y = 2125.0 
}
streetTable.sn[426] = {
	name = "Liebensteiner Weg",
	y = 2130.0 
}
streetTable.sn[427] = {
	name = "Kurt-Krah-Stra"..szlig.."e",
	y = 2135.0 
}
streetTable.sn[428] = {
	name = "Emilienstra"..szlig.."e",
	y = 2140.0 
}
streetTable.sn[429] = {
	name = "Karlst"..auml.."dter Stra"..szlig.."e",
	y = 2145.0 
}
streetTable.sn[430] = {
	name = "Heinrichstra"..szlig.."e",
	y = 2150.0 
}
streetTable.sn[431] = {
	name = "Willi-Bredel-Stra"..szlig.."e",
	y = 2155.0 
}
streetTable.sn[432] = {
	name = "Papitzer Stra"..szlig.."e",
	y = 2160.0 
}
streetTable.sn[433] = {
	name = "Topasstra"..szlig.."e",
	y = 2165.0 
}
streetTable.sn[434] = {
	name = "Penckstra"..szlig.."e",
	y = 2170.0 
}
streetTable.sn[435] = {
	name = "Davidstra"..szlig.."e",
	y = 2175.0 
}
streetTable.sn[436] = {
	name = "Lindenauer Markt",
	y = 2180.0 
}
streetTable.sn[437] = {
	name = "K"..ouml.."rnerweg",
	y = 2185.0 
}
streetTable.sn[438] = {
	name = "Wildentensteig",
	y = 2190.0 
}
streetTable.sn[439] = {
	name = "K"..uuml.."mmelweg",
	y = 2195.0 
}
streetTable.sn[440] = {
	name = "Zu den Bruchwiesen",
	y = 2200.0 
}
streetTable.sn[441] = {
	name = "Finkenweg",
	y = 2205.0 
}
streetTable.sn[442] = {
	name = "Forstweg",
	y = 2210.0 
}
streetTable.sn[443] = {
	name = "Damaschkebogen",
	y = 2215.0 
}
streetTable.sn[444] = {
	name = "Friedrich-Ludwig-Jahn-Str",
	y = 2220.0 
}
streetTable.sn[445] = {
	name = "St"..uuml.."nzer Stra"..szlig.."e",
	y = 2225.0 
}
streetTable.sn[446] = {
	name = "Safranweg",
	y = 2230.0 
}
streetTable.sn[447] = {
	name = "Semmelweisstra"..szlig.."e",
	y = 2235.0 
}
streetTable.sn[448] = {
	name = "Steinweg",
	y = 2240.0 
}
streetTable.sn[449] = {
	name = "Freundschaftsring",
	y = 2245.0 
}
streetTable.sn[450] = {
	name = "Simildenstra"..szlig.."e",
	y = 2250.0 
}
streetTable.sn[451] = {
	name = "Zaucheblick",
	y = 2255.0 
}
streetTable.sn[452] = {
	name = "Riemannstra"..szlig.."e",
	y = 2260.0 
}
streetTable.sn[453] = {
	name = "Auenblickstra"..szlig.."e",
	y = 2265.0 
}
streetTable.sn[454] = {
	name = "Konstantinstra"..szlig.."e",
	y = 2270.0 
}
streetTable.sn[455] = {
	name = "Friederikenstra"..szlig.."e",
	y = 2275.0 
}
streetTable.sn[456] = {
	name = "Johannisplatz",
	y = 2280.0 
}
streetTable.sn[457] = {
	name = "Waldkerbelstra"..szlig.."e",
	y = 2285.0 
}
streetTable.sn[458] = {
	name = "Bleichertstra"..szlig.."e",
	y = 2290.0 
}
streetTable.sn[459] = {
	name = "Schwarzackerstra"..szlig.."e",
	y = 2295.0 
}
streetTable.sn[460] = {
	name = "Holzh"..auml.."user Stra"..szlig.."e",
	y = 2300.0 
}
streetTable.sn[461] = {
	name = "Schneiderstra"..szlig.."e",
	y = 2305.0 
}
streetTable.sn[462] = {
	name = "Storchenweg",
	y = 2310.0 
}
streetTable.sn[463] = {
	name = "Potschkaustra"..szlig.."e",
	y = 2315.0 
}
streetTable.sn[464] = {
	name = "Am Markt",
	y = 2320.0 
}
streetTable.sn[465] = {
	name = "Am Rodeland",
	y = 2325.0 
}
streetTable.sn[466] = {
	name = "Julian-Marchlewski-Stra"..szlig.."e",
	y = 2330.0 
}
streetTable.sn[467] = {
	name = "Reichsstra"..szlig.."e",
	y = 2335.0 
}
streetTable.sn[468] = {
	name = "Kn"..ouml.."flerstra"..szlig.."e",
	y = 2340.0 
}
streetTable.sn[469] = {
	name = "Garskestra"..szlig.."e",
	y = 2345.0 
}
streetTable.sn[470] = {
	name = "Atriumstra"..szlig.."e",
	y = 2350.0 
}
streetTable.sn[471] = {
	name = "Philipp-Rosenthal-Stra"..szlig.."e",
	y = 2355.0 
}
streetTable.sn[472] = {
	name = "Zum Kleingartenpark",
	y = 2360.0 
}
streetTable.sn[473] = {
	name = "Am Sch"..auml.."ferh"..uuml.."gel",
	y = 2365.0 
}
streetTable.sn[474] = {
	name = "Luchspfad",
	y = 2370.0 
}
streetTable.sn[475] = {
	name = "Yorckstra"..szlig.."e ",
	y = 2375.0 
}
streetTable.sn[476] = {
	name = "Rotheplatz",
	y = 2380.0 
}
streetTable.sn[477] = {
	name = "Sperontesstra"..szlig.."e",
	y = 2385.0 
}
streetTable.sn[478] = {
	name = "Viktoriastra"..szlig.."e",
	y = 2390.0 
}
streetTable.sn[479] = {
	name = "Giselherstra"..szlig.."e",
	y = 2395.0 
}
streetTable.sn[480] = {
	name = "Buchener Stra"..szlig.."e",
	y = 2400.0 
}
streetTable.sn[481] = {
	name = "Alte Salzstra"..szlig.."e",
	y = 2405.0 
}
streetTable.sn[482] = {
	name = "Am Bischofsholz",
	y = 2410.0 
}
streetTable.sn[483] = {
	name = "Cocciusstra"..szlig.."e",
	y = 2415.0 
}
streetTable.sn[484] = {
	name = "Pommernstra"..szlig.."e",
	y = 2420.0 
}
streetTable.sn[485] = {
	name = "An der Bahn",
	y = 2425.0 
}
streetTable.sn[486] = {
	name = "Voltairestra"..szlig.."e",
	y = 2430.0 
}
streetTable.sn[487] = {
	name = "Hauptstra"..szlig.."e",
	y = 2435.0 
}
streetTable.sn[488] = {
	name = "Gersterstra"..szlig.."e",
	y = 2440.0 
}
streetTable.sn[489] = {
	name = "Teichweg",
	y = 2445.0 
}
streetTable.sn[490] = {
	name = "Luckaer Stra"..szlig.."e",
	y = 2450.0 
}
streetTable.sn[491] = {
	name = "Gutenbergplatz",
	y = 2455.0 
}
streetTable.sn[492] = {
	name = "Alexander-Alesius-Stra"..szlig.."e",
	y = 2460.0 
}
streetTable.sn[493] = {
	name = "Weidenweg",
	y = 2465.0 
}
streetTable.sn[494] = {
	name = "D"..ouml.."belner Stra"..szlig.."e",
	y = 2470.0 
}
streetTable.sn[495] = {
	name = "Am Hirtenhaus",
	y = 2475.0 
}
streetTable.sn[496] = {
	name = "Sommerfelder Weg",
	y = 2480.0 
}
streetTable.sn[497] = {
	name = "Dorotheenring",
	y = 2485.0 
}
streetTable.sn[498] = {
	name = "Bischofstra"..szlig.."e",
	y = 2490.0 
}
streetTable.sn[499] = {
	name = "Neust"..auml.."dter Markt",
	y = 2495.0 
}
streetTable.sn[500] = {
	name = "Cichoriusstra"..szlig.."e",
	y = 2500.0 
}
streetTable.sn[501] = {
	name = "Barclayweg",
	y = 2505.0 
}
streetTable.sn[502] = {
	name = "Eilenburger Stra"..szlig.."e",
	y = 2510.0 
}
streetTable.sn[503] = {
	name = "Lemseler Weg",
	y = 2515.0 
}
streetTable.sn[504] = {
	name = "Ammernweg",
	y = 2520.0 
}
streetTable.sn[505] = {
	name = "Zeumerstra"..szlig.."e",
	y = 2525.0 
}
streetTable.sn[506] = {
	name = "Hoyerstra"..szlig.."e",
	y = 2530.0 
}
streetTable.sn[507] = {
	name = "Sch"..ouml.."nauer Allee",
	y = 2535.0 
}
streetTable.sn[508] = {
	name = "Espenhainer Stra"..szlig.."e",
	y = 2540.0 
}
streetTable.sn[509] = {
	name = "Zsch"..ouml.."lkauer Weg",
	y = 2545.0 
}
streetTable.sn[510] = {
	name = "Am G"..auml.."nseanger",
	y = 2550.0 
}
streetTable.sn[511] = {
	name = "Aschenbr"..ouml.."delweg",
	y = 2555.0 
}
streetTable.sn[512] = {
	name = "Cunnersdorfer Stra"..szlig.."e",
	y = 2560.0 
}
streetTable.sn[513] = {
	name = "Johannes-Weyrauch-Platz",
	y = 2565.0 
}
streetTable.sn[514] = {
	name = "Albrecht-D"..uuml.."rer-Weg",
	y = 2570.0 
}
streetTable.sn[515] = {
	name = "Wildschweinpfad",
	y = 2575.0 
}
streetTable.sn[516] = {
	name = "Kohlgartenstra"..szlig.."e",
	y = 2580.0 
}
streetTable.sn[517] = {
	name = "Abrahamstra"..szlig.."e",
	y = 2585.0 
}
streetTable.sn[518] = {
	name = "Helenenstra"..szlig.."e",
	y = 2590.0 
}
streetTable.sn[519] = {
	name = "Mittelweg",
	y = 2595.0 
}
streetTable.sn[520] = {
	name = "Schlotterbeckstra"..szlig.."e",
	y = 2600.0 
}
streetTable.sn[521] = {
	name = "Aschaffenburger Stra"..szlig.."e",
	y = 2605.0 
}
streetTable.sn[522] = {
	name = "Zur Lehmbahn",
	y = 2610.0 
}
streetTable.sn[523] = {
	name = "Platanenstra"..szlig.."e",
	y = 2615.0 
}
streetTable.sn[524] = {
	name = "W"..auml.."chterstra"..szlig.."e",
	y = 2620.0 
}
streetTable.sn[525] = {
	name = "Rotbuchenweg",
	y = 2625.0 
}
streetTable.sn[526] = {
	name = "Am M"..uuml.."ckenschl"..ouml..""..szlig.."chen",
	y = 2630.0 
}
streetTable.sn[527] = {
	name = "Waldrebenweg",
	y = 2635.0 
}
streetTable.sn[528] = {
	name = "Gorkistra"..szlig.."e",
	y = 2640.0 
}
streetTable.sn[529] = {
	name = "An der G"..auml.."rtnerei",
	y = 2645.0 
}
streetTable.sn[530] = {
	name = "Dieskaustra"..szlig.."e",
	y = 2650.0 
}
streetTable.sn[531] = {
	name = "Am Sonneneck",
	y = 2655.0 
}
streetTable.sn[532] = {
	name = "Fuchshainer Stra"..szlig.."e",
	y = 2660.0 
}
streetTable.sn[533] = {
	name = "Jupp-M"..uuml.."ller-Stra"..szlig.."e",
	y = 2665.0 
}
streetTable.sn[534] = {
	name = "Anton-Bruckner-Allee",
	y = 2670.0 
}
streetTable.sn[535] = {
	name = "Glesiener Stra"..szlig.."e",
	y = 2675.0 
}
streetTable.sn[536] = {
	name = "Schr"..ouml.."terstra"..szlig.."e",
	y = 2680.0 
}
streetTable.sn[537] = {
	name = "Herbert-Thiele-Stra"..szlig.."e",
	y = 2685.0 
}
streetTable.sn[538] = {
	name = "Feldlerchenweg",
	y = 2690.0 
}
streetTable.sn[539] = {
	name = "Ungerstra"..szlig.."e",
	y = 2695.0 
}
streetTable.sn[540] = {
	name = "Kr"..ouml.."belstra"..szlig.."e",
	y = 2700.0 
}
streetTable.sn[541] = {
	name = "Clemens-Thieme-Stra"..szlig.."e",
	y = 2705.0 
}
streetTable.sn[542] = {
	name = "Zweinaundorfer Stra"..szlig.."e",
	y = 2710.0 
}
streetTable.sn[543] = {
	name = "Schreberstra"..szlig.."e",
	y = 2715.0 
}
streetTable.sn[544] = {
	name = "Erlenstra"..szlig.."e",
	y = 2720.0 
}
streetTable.sn[545] = {
	name = "Schmiedeberger Stra"..szlig.."e",
	y = 2725.0 
}
streetTable.sn[546] = {
	name = "Hartungstra"..szlig.."e",
	y = 2730.0 
}
streetTable.sn[547] = {
	name = "Wilhelm-Plesse-Stra"..szlig.."e",
	y = 2735.0 
}
streetTable.sn[548] = {
	name = "Hotherstra"..szlig.."e",
	y = 2740.0 
}
streetTable.sn[549] = {
	name = "Frankenheimer Weg",
	y = 2745.0 
}
streetTable.sn[550] = {
	name = "Schl"..ouml..""..szlig.."chenweg",
	y = 2750.0 
}
streetTable.sn[551] = {
	name = "Fritz-Reuter-Stra"..szlig.."e",
	y = 2755.0 
}
streetTable.sn[552] = {
	name = "Fabrikstra"..szlig.."e",
	y = 2760.0 
}
streetTable.sn[553] = {
	name = "Wetzelweg",
	y = 2765.0 
}
streetTable.sn[554] = {
	name = "Hornissenwinkel",
	y = 2770.0 
}
streetTable.sn[555] = {
	name = "T"..uuml.."rkisstra"..szlig.."e",
	y = 2775.0 
}
streetTable.sn[556] = {
	name = "Teschstra"..szlig.."e",
	y = 2780.0 
}
streetTable.sn[557] = {
	name = "An den Tierkliniken",
	y = 2785.0 
}
streetTable.sn[558] = {
	name = "Fechnerstra"..szlig.."e",
	y = 2790.0 
}
streetTable.sn[559] = {
	name = "Tschernyschewskistra"..szlig.."e",
	y = 2795.0 
}
streetTable.sn[560] = {
	name = "Feldhasenweg",
	y = 2800.0 
}
streetTable.sn[561] = {
	name = "Liechtensteinstra"..szlig.."e",
	y = 2805.0 
}
streetTable.sn[562] = {
	name = "Wasserwerkstra"..szlig.."e",
	y = 2810.0 
}
streetTable.sn[563] = {
	name = "Natonekstra"..szlig.."e",
	y = 2815.0 
}
streetTable.sn[564] = {
	name = "Weigandtweg",
	y = 2820.0 
}
streetTable.sn[565] = {
	name = "Amselgrund",
	y = 2825.0 
}
streetTable.sn[566] = {
	name = "Bechsteinweg",
	y = 2830.0 
}
streetTable.sn[567] = {
	name = "Theodor-Heuss-Stra"..szlig.."e",
	y = 2835.0 
}
streetTable.sn[568] = {
	name = "Karl-Rothe-Stra"..szlig.."e",
	y = 2840.0 
}
streetTable.sn[569] = {
	name = "Virchowstra"..szlig.."e",
	y = 2845.0 
}
streetTable.sn[570] = {
	name = "Zwickauer Stra"..szlig.."e",
	y = 2850.0 
}
streetTable.sn[571] = {
	name = "Uferstra"..szlig.."e",
	y = 2855.0 
}
streetTable.sn[572] = {
	name = "Teichstra"..szlig.."e",
	y = 2860.0 
}
streetTable.sn[573] = {
	name = "Am K"..uuml.."nstlerbogen",
	y = 2865.0 
}
streetTable.sn[574] = {
	name = "Falterstra"..szlig.."e",
	y = 2870.0 
}
streetTable.sn[575] = {
	name = "Sabinenstra"..szlig.."e",
	y = 2875.0 
}
streetTable.sn[576] = {
	name = "Kiesgrubenstra"..szlig.."e",
	y = 2880.0 
}
streetTable.sn[577] = {
	name = "Rosenholzweg",
	y = 2885.0 
}
streetTable.sn[578] = {
	name = "Torgauer Stra"..szlig.."e",
	y = 2890.0 
}
streetTable.sn[579] = {
	name = "Schmetterlingsweg",
	y = 2895.0 
}
streetTable.sn[580] = {
	name = "An der Rehwiese",
	y = 2900.0 
}
streetTable.sn[581] = {
	name = "Fliederweg",
	y = 2905.0 
}
streetTable.sn[582] = {
	name = "Wincklerstra"..szlig.."e",
	y = 2910.0 
}
streetTable.sn[583] = {
	name = "Gie"..szlig.."erstra"..szlig.."e",
	y = 2915.0 
}
streetTable.sn[584] = {
	name = "Bachenpfad",
	y = 2920.0 
}
streetTable.sn[585] = {
	name = "Ernst-Th"..auml.."lmann-Platz",
	y = 2925.0 
}
streetTable.sn[586] = {
	name = "Heinrich-Schmidt-Stra"..szlig.."e",
	y = 2930.0 
}
streetTable.sn[587] = {
	name = "Carl-HinnÈ-Stra"..szlig.."e",
	y = 2935.0 
}
streetTable.sn[588] = {
	name = "Gutenbergstra"..szlig.."e",
	y = 2940.0 
}
streetTable.sn[589] = {
	name = "Heinrothstra"..szlig.."e",
	y = 2945.0 
}
streetTable.sn[590] = {
	name = "Rosmarinweg",
	y = 2950.0 
}
streetTable.sn[591] = {
	name = "Benediktusstra"..szlig.."e",
	y = 2955.0 
}
streetTable.sn[592] = {
	name = "Klo"..szlig.."stra"..szlig.."e",
	y = 2960.0 
}
streetTable.sn[593] = {
	name = "Pfarrweg",
	y = 2965.0 
}
streetTable.sn[594] = {
	name = "Hans-Grade-Stra"..szlig.."e",
	y = 2970.0 
}
streetTable.sn[595] = {
	name = "Am Ritterschl"..ouml..""..szlig.."chen",
	y = 2975.0 
}
streetTable.sn[596] = {
	name = "Innenring",
	y = 2980.0 
}
streetTable.sn[597] = {
	name = "Martinstra"..szlig.."e",
	y = 2985.0 
}
streetTable.sn[598] = {
	name = "Viertelsweg",
	y = 2990.0 
}
streetTable.sn[599] = {
	name = "Pitschkestra"..szlig.."e",
	y = 2995.0 
}
streetTable.sn[600] = {
	name = "Wegastra"..szlig.."e",
	y = 3000.0 
}
streetTable.sn[601] = {
	name = "Uhlandweg",
	y = 3005.0 
}
streetTable.sn[602] = {
	name = "Ernst-Keil-Stra"..szlig.."e",
	y = 3010.0 
}
streetTable.sn[603] = {
	name = "Ernst-Meier-Stra"..szlig.."e",
	y = 3015.0 
}
streetTable.sn[604] = {
	name = "Pfaffensteinstra"..szlig.."e",
	y = 3020.0 
}
streetTable.sn[605] = {
	name = "Wachtelsteig",
	y = 3025.0 
}
streetTable.sn[606] = {
	name = "Primelweg",
	y = 3030.0 
}
streetTable.sn[607] = {
	name = "Am Park",
	y = 3035.0 
}
streetTable.sn[608] = {
	name = "Am Hohlweg",
	y = 3040.0 
}
streetTable.sn[609] = {
	name = "Melanchthonstra"..szlig.."e",
	y = 3045.0 
}
streetTable.sn[610] = {
	name = "Buchenwaldstra"..szlig.."e",
	y = 3050.0 
}
streetTable.sn[611] = {
	name = "Wintergartenstra"..szlig.."e",
	y = 3055.0 
}
streetTable.sn[612] = {
	name = "Ringweg",
	y = 3060.0 
}
streetTable.sn[613] = {
	name = "Karl-Helbig-Stra"..szlig.."e",
	y = 3065.0 
}
streetTable.sn[614] = {
	name = "Richard-Wagner-Platz",
	y = 3070.0 
}
streetTable.sn[615] = {
	name = "Am M"..uuml.."hlengrund",
	y = 3075.0 
}
streetTable.sn[616] = {
	name = "Sch"..ouml.."nbachstra"..szlig.."e",
	y = 3080.0 
}
streetTable.sn[617] = {
	name = "Wognaundorfer Gasse",
	y = 3085.0 
}
streetTable.sn[618] = {
	name = "Lortzingstra"..szlig.."e",
	y = 3090.0 
}
streetTable.sn[619] = {
	name = "Erikenstra"..szlig.."e",
	y = 3095.0 
}
streetTable.sn[620] = {
	name = "Zwenkauer Stra"..szlig.."e",
	y = 3100.0 
}
streetTable.sn[621] = {
	name = "Schreiberstra"..szlig.."e",
	y = 3105.0 
}
streetTable.sn[622] = {
	name = "Triftsiedlung",
	y = 3110.0 
}
streetTable.sn[623] = {
	name = "Schneewittchenweg",
	y = 3115.0 
}
streetTable.sn[624] = {
	name = "Kirchstra"..szlig.."e",
	y = 3120.0 
}
streetTable.sn[625] = {
	name = "Perlpilzweg",
	y = 3125.0 
}
streetTable.sn[626] = {
	name = "Baumeister-G"..uuml.."nther-Stra"..szlig.."e",
	y = 3130.0 
}
streetTable.sn[627] = {
	name = "Ecksteinstra"..szlig.."e",
	y = 3135.0 
}
streetTable.sn[628] = {
	name = "Arthur-Hoffmann-Stra"..szlig.."e",
	y = 3140.0 
}
streetTable.sn[629] = {
	name = "Saarl"..auml.."nder Stra"..szlig.."e",
	y = 3145.0 
}
streetTable.sn[630] = {
	name = "Drosselnest",
	y = 3150.0 
}
streetTable.sn[631] = {
	name = "Ahlfeldstra"..szlig.."e",
	y = 3155.0 
}
streetTable.sn[632] = {
	name = "Seipelweg",
	y = 3160.0 
}
streetTable.sn[633] = {
	name = "Goldschmidtstra"..szlig.."e",
	y = 3165.0 
}
streetTable.sn[634] = {
	name = "Richard-Leisebein-Stra"..szlig.."e",
	y = 3170.0 
}
streetTable.sn[635] = {
	name = "Tennstedter Weg",
	y = 3175.0 
}
streetTable.sn[636] = {
	name = "Gundorfer Stra"..szlig.."e",
	y = 3180.0 
}
streetTable.sn[637] = {
	name = "Husemannstra"..szlig.."e",
	y = 3185.0 
}
streetTable.sn[638] = {
	name = "Gogolstra"..szlig.."e",
	y = 3190.0 
}
streetTable.sn[639] = {
	name = "Krokusweg",
	y = 3195.0 
}
streetTable.sn[640] = {
	name = "Zentralstra"..szlig.."e",
	y = 3200.0 
}
streetTable.sn[641] = {
	name = "Balzacstra"..szlig.."e",
	y = 3205.0 
}
streetTable.sn[642] = {
	name = "Samuel-Lampel-Stra"..szlig.."e",
	y = 3210.0 
}
streetTable.sn[643] = {
	name = "Lintacherstra"..szlig.."e",
	y = 3215.0 
}
streetTable.sn[644] = {
	name = "Bernsteinstra"..szlig.."e",
	y = 3220.0 
}
streetTable.sn[645] = {
	name = "Engelsdorfer Stra"..szlig.."e",
	y = 3225.0 
}
streetTable.sn[646] = {
	name = "Corneliusweg",
	y = 3230.0 
}
streetTable.sn[647] = {
	name = "Hertzstra"..szlig.."e",
	y = 3235.0 
}
streetTable.sn[648] = {
	name = "Elisabeth-Schumacher-Stra",
	y = 3240.0 
}
streetTable.sn[649] = {
	name = "B"..ouml.."ttcherg"..auml..""..szlig.."chen",
	y = 3245.0 
}
streetTable.sn[650] = {
	name = "Mockauer Ring",
	y = 3250.0 
}
streetTable.sn[651] = {
	name = "Frommannstra"..szlig.."e",
	y = 3255.0 
}
streetTable.sn[652] = {
	name = "Seitengasse",
	y = 3260.0 
}
streetTable.sn[653] = {
	name = "Drei-Linden-H"..ouml.."he",
	y = 3265.0 
}
streetTable.sn[654] = {
	name = "Kohlweg",
	y = 3270.0 
}
streetTable.sn[655] = {
	name = "Kurt-Kresse-Stra"..szlig.."e",
	y = 3275.0 
}
streetTable.sn[656] = {
	name = "Eichlerstra"..szlig.."e",
	y = 3280.0 
}
streetTable.sn[657] = {
	name = "Oswald-Kahnt-Ring",
	y = 3285.0 
}
streetTable.sn[658] = {
	name = "Breite Stra"..szlig.."e",
	y = 3290.0 
}
streetTable.sn[659] = {
	name = "Louise-Otto-Peters-Platz",
	y = 3295.0 
}
streetTable.sn[660] = {
	name = "Thaerstra"..szlig.."e",
	y = 3300.0 
}
streetTable.sn[661] = {
	name = "Ansbacher Stra"..szlig.."e",
	y = 3305.0 
}
streetTable.sn[662] = {
	name = "Don-Carlos-Stra"..szlig.."e",
	y = 3310.0 
}
streetTable.sn[663] = {
	name = "Klingerstra"..szlig.."e",
	y = 3315.0 
}
streetTable.sn[664] = {
	name = "D"..ouml.."llingstra"..szlig.."e",
	y = 3320.0 
}
streetTable.sn[665] = {
	name = "Eichendorffstra"..szlig.."e",
	y = 3325.0 
}
streetTable.sn[666] = {
	name = "Am Wassergraben",
	y = 3330.0 
}
streetTable.sn[667] = {
	name = "Melscher Stra"..szlig.."e",
	y = 3335.0 
}
streetTable.sn[668] = {
	name = "Bahnstra"..szlig.."e",
	y = 3340.0 
}
streetTable.sn[669] = {
	name = "R"..auml.."pitzer Stra"..szlig.."e",
	y = 3345.0 
}
streetTable.sn[670] = {
	name = "Alte Dorfstra"..szlig.."e",
	y = 3350.0 
}
streetTable.sn[671] = {
	name = "Ackerweg",
	y = 3355.0 
}
streetTable.sn[672] = {
	name = "An der Sch"..auml.."ferei",
	y = 3360.0 
}
streetTable.sn[673] = {
	name = "Hartmannweg",
	y = 3365.0 
}
streetTable.sn[674] = {
	name = "Lercheninsel",
	y = 3370.0 
}
streetTable.sn[675] = {
	name = "Heinrich-B"..uuml.."chner-Stra"..szlig.."e",
	y = 3375.0 
}
streetTable.sn[676] = {
	name = "Kirchplatz",
	y = 3380.0 
}
streetTable.sn[677] = {
	name = "An den Krutschen",
	y = 3385.0 
}
streetTable.sn[678] = {
	name = "Alexanderstra"..szlig.."e",
	y = 3390.0 
}
streetTable.sn[679] = {
	name = "Landsberger Stra"..szlig.."e",
	y = 3395.0 
}
streetTable.sn[680] = {
	name = "Sigebandweg",
	y = 3400.0 
}
streetTable.sn[681] = {
	name = "B"..ouml.."hmestra"..szlig.."e",
	y = 3405.0 
}
streetTable.sn[682] = {
	name = "Breitkopfstra"..szlig.."e",
	y = 3410.0 
}
streetTable.sn[683] = {
	name = "Am L"..ouml.."segraben",
	y = 3415.0 
}
streetTable.sn[684] = {
	name = "Paunsdorfer Allee",
	y = 3420.0 
}
streetTable.sn[685] = {
	name = "CÈzanneweg",
	y = 3425.0 
}
streetTable.sn[686] = {
	name = "Christian-Grunert-Stra"..szlig.."e",
	y = 3430.0 
}
streetTable.sn[687] = {
	name = "Fortunabadstra"..szlig.."e",
	y = 3435.0 
}
streetTable.sn[688] = {
	name = "Theodor-Kunz-Ring",
	y = 3440.0 
}
streetTable.sn[689] = {
	name = "Haselweg",
	y = 3445.0 
}
streetTable.sn[690] = {
	name = "Luftschiffstra"..szlig.."e",
	y = 3450.0 
}
streetTable.sn[691] = {
	name = "Lerchenrain",
	y = 3455.0 
}
streetTable.sn[692] = {
	name = "Emmausstra"..szlig.."e",
	y = 3460.0 
}
streetTable.sn[693] = {
	name = "Audorfstra"..szlig.."e",
	y = 3465.0 
}
streetTable.sn[694] = {
	name = "Lindenallee",
	y = 3470.0 
}
streetTable.sn[695] = {
	name = "Rathausstra"..szlig.."e",
	y = 3475.0 
}
streetTable.sn[696] = {
	name = "Gutshofstra"..szlig.."e",
	y = 3480.0 
}
streetTable.sn[697] = {
	name = "Seeweg",
	y = 3485.0 
}
streetTable.sn[698] = {
	name = "Neust"..auml.."dter Stra"..szlig.."e",
	y = 3490.0 
}
streetTable.sn[699] = {
	name = "Narsdorfer Stra"..szlig.."e",
	y = 3495.0 
}
streetTable.sn[700] = {
	name = "Markt",
	y = 3500.0 
}
streetTable.sn[701] = {
	name = "Messe-Allee",
	y = 3505.0 
}
streetTable.sn[702] = {
	name = "Blochstra"..szlig.."e",
	y = 3510.0 
}
streetTable.sn[703] = {
	name = "Asternweg",
	y = 3515.0 
}
streetTable.sn[704] = {
	name = "Riedelstra"..szlig.."e",
	y = 3520.0 
}
streetTable.sn[705] = {
	name = "Friedhofstra"..szlig.."e",
	y = 3525.0 
}
streetTable.sn[706] = {
	name = "Triftstra"..szlig.."e",
	y = 3530.0 
}
streetTable.sn[707] = {
	name = "Graffstra"..szlig.."e",
	y = 3535.0 
}
streetTable.sn[708] = {
	name = "Franz-Schubert-Platz",
	y = 3540.0 
}
streetTable.sn[709] = {
	name = "Schorndorfer Weg",
	y = 3545.0 
}
streetTable.sn[710] = {
	name = "H"..auml.."u"..szlig.."erstra"..szlig.."e",
	y = 3550.0 
}
streetTable.sn[711] = {
	name = "Im Grunde",
	y = 3555.0 
}
streetTable.sn[712] = {
	name = "Scheibenholzweg",
	y = 3560.0 
}
streetTable.sn[713] = {
	name = "Steinberger Stra"..szlig.."e",
	y = 3565.0 
}
streetTable.sn[714] = {
	name = "Zum Feld",
	y = 3570.0 
}
streetTable.sn[715] = {
	name = "Gustav-Esche-Stra"..szlig.."e",
	y = 3575.0 
}
streetTable.sn[716] = {
	name = "B"..ouml.."hlitzer M"..uuml.."hle",
	y = 3580.0 
}
streetTable.sn[717] = {
	name = "Hildebrandstra"..szlig.."e",
	y = 3585.0 
}
streetTable.sn[718] = {
	name = "Weststra"..szlig.."e",
	y = 3590.0 
}
streetTable.sn[719] = {
	name = "An der Hebem"..auml.."rchte",
	y = 3595.0 
}
streetTable.sn[720] = {
	name = "Marienberger Stra"..szlig.."e",
	y = 3600.0 
}
streetTable.sn[721] = {
	name = "Eschenweg",
	y = 3605.0 
}
streetTable.sn[722] = {
	name = "Siegfriedplatz",
	y = 3610.0 
}
streetTable.sn[723] = {
	name = "Roseggerstra"..szlig.."e",
	y = 3615.0 
}
streetTable.sn[724] = {
	name = "Gaschwitzer Stra"..szlig.."e",
	y = 3620.0 
}
streetTable.sn[725] = {
	name = "Dautheweg",
	y = 3625.0 
}
streetTable.sn[726] = {
	name = "Ludwigsburger Stra"..szlig.."e",
	y = 3630.0 
}
streetTable.sn[727] = {
	name = "Elsterm"..uuml.."hlweg",
	y = 3635.0 
}
streetTable.sn[728] = {
	name = "Robert-Mayer-Stra"..szlig.."e",
	y = 3640.0 
}
streetTable.sn[729] = {
	name = "Gittelstra"..szlig.."e",
	y = 3645.0 
}
streetTable.sn[730] = {
	name = "Colmblick",
	y = 3650.0 
}
streetTable.sn[731] = {
	name = "P"..ouml.."tzschker Weg",
	y = 3655.0 
}
streetTable.sn[732] = {
	name = "Klausenerstra"..szlig.."e",
	y = 3660.0 
}
streetTable.sn[733] = {
	name = "Ro"..szlig.."markt",
	y = 3665.0 
}
streetTable.sn[734] = {
	name = "Richterstra"..szlig.."e",
	y = 3670.0 
}
streetTable.sn[735] = {
	name = "Louis-F"..uuml.."rnberg-Stra"..szlig.."e",
	y = 3675.0 
}
streetTable.sn[736] = {
	name = "Felsenkellerstra"..szlig.."e",
	y = 3680.0 
}
streetTable.sn[737] = {
	name = "Chopinstra"..szlig.."e",
	y = 3685.0 
}
streetTable.sn[738] = {
	name = "Badeweg",
	y = 3690.0 
}
streetTable.sn[739] = {
	name = "Gr"..uuml.."ner Bogen",
	y = 3695.0 
}
streetTable.sn[740] = {
	name = "Marienweg",
	y = 3700.0 
}
streetTable.sn[741] = {
	name = "Posadowskyanlagen",
	y = 3705.0 
}
streetTable.sn[742] = {
	name = "Ginsterstra"..szlig.."e",
	y = 3710.0 
}
streetTable.sn[743] = {
	name = "Ameisenstra"..szlig.."e",
	y = 3715.0 
}
streetTable.sn[744] = {
	name = "Im Weidengrund",
	y = 3720.0 
}
streetTable.sn[745] = {
	name = "Eggebrechtstra"..szlig.."e",
	y = 3725.0 
}
streetTable.sn[746] = {
	name = "Carl-Weichelt-Stra"..szlig.."e",
	y = 3730.0 
}
streetTable.sn[747] = {
	name = "Weberknechtstra"..szlig.."e",
	y = 3735.0 
}
streetTable.sn[748] = {
	name = "Galileistra"..szlig.."e",
	y = 3740.0 
}
streetTable.sn[749] = {
	name = "Lange Reihe",
	y = 3745.0 
}
streetTable.sn[750] = {
	name = "Rabenweg",
	y = 3750.0 
}
streetTable.sn[751] = {
	name = "Friesenstra"..szlig.."e",
	y = 3755.0 
}
streetTable.sn[752] = {
	name = "Schillingstra"..szlig.."e",
	y = 3760.0 
}
streetTable.sn[753] = {
	name = "Haferkornstra"..szlig.."e",
	y = 3765.0 
}
streetTable.sn[754] = {
	name = "Helmertstra"..szlig.."e",
	y = 3770.0 
}
streetTable.sn[755] = {
	name = "Wiesenrain",
	y = 3775.0 
}
streetTable.sn[756] = {
	name = "Molitorstra"..szlig.."e",
	y = 3780.0 
}
streetTable.sn[757] = {
	name = "Hornstra"..szlig.."e",
	y = 3785.0 
}
streetTable.sn[758] = {
	name = "Seeburgstra"..szlig.."e",
	y = 3790.0 
}
streetTable.sn[759] = {
	name = "Fridtjof-Nansen-Stra"..szlig.."e",
	y = 3795.0 
}
streetTable.sn[760] = {
	name = "F"..ouml.."pplstra"..szlig.."e",
	y = 3800.0 
}
streetTable.sn[761] = {
	name = "Turgenjewstra"..szlig.."e",
	y = 3805.0 
}
streetTable.sn[762] = {
	name = "Bayreuther Stra"..szlig.."e",
	y = 3810.0 
}
streetTable.sn[763] = {
	name = "Mendelejewstra"..szlig.."e",
	y = 3815.0 
}
streetTable.sn[764] = {
	name = "Pilzanger",
	y = 3820.0 
}
streetTable.sn[765] = {
	name = "Sattelhofstra"..szlig.."e",
	y = 3825.0 
}
streetTable.sn[766] = {
	name = "Ehrensteinstra"..szlig.."e",
	y = 3830.0 
}
streetTable.sn[767] = {
	name = "Wilhelm-Busch-Stra"..szlig.."e",
	y = 3835.0 
}
streetTable.sn[768] = {
	name = "Hinter dem Dorf",
	y = 3840.0 
}
streetTable.sn[769] = {
	name = "Schkorlopper Stra"..szlig.."e",
	y = 3845.0 
}
streetTable.sn[770] = {
	name = "Karl-Heine-Platz",
	y = 3850.0 
}
streetTable.sn[771] = {
	name = "R"..ouml.."delstra"..szlig.."e",
	y = 3855.0 
}
streetTable.sn[772] = {
	name = "Fl"..ouml.."haer Stra"..szlig.."e",
	y = 3860.0 
}
streetTable.sn[773] = {
	name = "Grabaustra"..szlig.."e",
	y = 3865.0 
}
streetTable.sn[774] = {
	name = "Sprikkenwinkel",
	y = 3870.0 
}
streetTable.sn[775] = {
	name = "Nickelmannweg",
	y = 3875.0 
}
streetTable.sn[776] = {
	name = "Sebastian-Bach-Stra"..szlig.."e",
	y = 3880.0 
}
streetTable.sn[777] = {
	name = "G"..ouml.."teborger Stra"..szlig.."e",
	y = 3885.0 
}
streetTable.sn[778] = {
	name = "Thymianweg",
	y = 3890.0 
}
streetTable.sn[779] = {
	name = "Otterstra"..szlig.."e",
	y = 3895.0 
}
streetTable.sn[780] = {
	name = "Wilhelminenstra"..szlig.."e",
	y = 3900.0 
}
streetTable.sn[781] = {
	name = "Leisniger Stra"..szlig.."e",
	y = 3905.0 
}
streetTable.sn[782] = {
	name = "Kometenweg",
	y = 3910.0 
}
streetTable.sn[783] = {
	name = "Lessingweg",
	y = 3915.0 
}
streetTable.sn[784] = {
	name = "Rudolphstra"..szlig.."e",
	y = 3920.0 
}
streetTable.sn[785] = {
	name = "Bothestra"..szlig.."e",
	y = 3925.0 
}
streetTable.sn[786] = {
	name = "Walter-Albrecht-Weg",
	y = 3930.0 
}
streetTable.sn[787] = {
	name = "Alfred-Schurig-Stra"..szlig.."e",
	y = 3935.0 
}
streetTable.sn[788] = {
	name = "Bienitzstra"..szlig.."e",
	y = 3940.0 
}
streetTable.sn[789] = {
	name = "Pau"..szlig.."nitzstra"..szlig.."e",
	y = 3945.0 
}
streetTable.sn[790] = {
	name = "Ferdinand-Lassalle-Stra"..szlig.."e",
	y = 3950.0 
}
streetTable.sn[791] = {
	name = "Ebenholzweg",
	y = 3955.0 
}
streetTable.sn[792] = {
	name = "Stiftsstra"..szlig.."e",
	y = 3960.0 
}
streetTable.sn[793] = {
	name = "Schulzeweg",
	y = 3965.0 
}
streetTable.sn[794] = {
	name = "Fr"..ouml.."belstra"..szlig.."e",
	y = 3970.0 
}
streetTable.sn[795] = {
	name = "S"..uuml.."dplatz",
	y = 3975.0 
}
streetTable.sn[796] = {
	name = "Handwerkerhof",
	y = 3980.0 
}
streetTable.sn[797] = {
	name = "Schulze-Delitzsch-Stra"..szlig.."e",
	y = 3985.0 
}
streetTable.sn[798] = {
	name = "Roseggerweg",
	y = 3990.0 
}
streetTable.sn[799] = {
	name = "Ro"..szlig.."platz",
	y = 3995.0 
}
streetTable.sn[800] = {
	name = "Kastanienring",
	y = 4000.0 
}
streetTable.sn[801] = {
	name = "Emil-Schubert-Stra"..szlig.."e",
	y = 4005.0 
}
streetTable.sn[802] = {
	name = "Rubensstra"..szlig.."e",
	y = 4010.0 
}
streetTable.sn[803] = {
	name = "Slevogtstra"..szlig.."e",
	y = 4015.0 
}
streetTable.sn[804] = {
	name = "An der Hufschmiede",
	y = 4020.0 
}
streetTable.sn[805] = {
	name = "Juister Weg",
	y = 4025.0 
}
streetTable.sn[806] = {
	name = "H"..ouml.."lderlinstra"..szlig.."e",
	y = 4030.0 
}
streetTable.sn[807] = {
	name = "H"..auml.."rtelstra"..szlig.."e",
	y = 4035.0 
}
streetTable.sn[808] = {
	name = "K"..ouml.."tzschkestra"..szlig.."e",
	y = 4040.0 
}
streetTable.sn[809] = {
	name = "Schwanenweg",
	y = 4045.0 
}
streetTable.sn[810] = {
	name = "Maximilian-Kolbe-Weg",
	y = 4050.0 
}
streetTable.sn[811] = {
	name = "Am Bogen",
	y = 4055.0 
}
streetTable.sn[812] = {
	name = "Magdeborner Stra"..szlig.."e",
	y = 4060.0 
}
streetTable.sn[813] = {
	name = "Schwartzestra"..szlig.."e",
	y = 4065.0 
}
streetTable.sn[814] = {
	name = "Hirtenweg",
	y = 4070.0 
}
streetTable.sn[815] = {
	name = "Max-Beckmann-Stra"..szlig.."e",
	y = 4075.0 
}
streetTable.sn[816] = {
	name = "Kurt-Tucholsky-Stra"..szlig.."e",
	y = 4080.0 
}
streetTable.sn[817] = {
	name = "Baumannstra"..szlig.."e",
	y = 4085.0 
}
streetTable.sn[818] = {
	name = "Waldemar-G"..ouml.."tze-Stra"..szlig.."e",
	y = 4090.0 
}
streetTable.sn[819] = {
	name = "Sackestra"..szlig.."e",
	y = 4095.0 
}
streetTable.sn[820] = {
	name = "Kutschweg",
	y = 4100.0 
}
streetTable.sn[821] = {
	name = "Stammerstra"..szlig.."e",
	y = 4105.0 
}
streetTable.sn[822] = {
	name = "Am Hasengraben",
	y = 4110.0 
}
streetTable.sn[823] = {
	name = "Alte Baumschule",
	y = 4115.0 
}
streetTable.sn[824] = {
	name = "Schubertstra"..szlig.."e",
	y = 4120.0 
}
streetTable.sn[825] = {
	name = "Krautgartenweg",
	y = 4125.0 
}
streetTable.sn[826] = {
	name = "D"..ouml.."ringstra"..szlig.."e",
	y = 4130.0 
}
streetTable.sn[827] = {
	name = "Vlamenstra"..szlig.."e",
	y = 4135.0 
}
streetTable.sn[828] = {
	name = "Meininger Ring",
	y = 4140.0 
}
streetTable.sn[829] = {
	name = "Platanenweg",
	y = 4145.0 
}
streetTable.sn[830] = {
	name = "Emil-Fuchs-Stra"..szlig.."e",
	y = 4150.0 
}
streetTable.sn[831] = {
	name = "Lausener Bogen",
	y = 4155.0 
}
streetTable.sn[832] = {
	name = "Selliner Stra"..szlig.."e",
	y = 4160.0 
}
streetTable.sn[833] = {
	name = "Kommandant-Prendel-Allee",
	y = 4165.0 
}
streetTable.sn[834] = {
	name = "Schadowstra"..szlig.."e",
	y = 4170.0 
}
streetTable.sn[835] = {
	name = "Haydnstra"..szlig.."e",
	y = 4175.0 
}
streetTable.sn[836] = {
	name = "Nikischstra"..szlig.."e",
	y = 4180.0 
}
streetTable.sn[837] = {
	name = "Friedhofsweg",
	y = 4185.0 
}
streetTable.sn[838] = {
	name = "Karl-Schurz-Stra"..szlig.."e",
	y = 4190.0 
}
streetTable.sn[839] = {
	name = "Taubenbergweg",
	y = 4195.0 
}
streetTable.sn[840] = {
	name = "Goethesteig",
	y = 4200.0 
}
streetTable.sn[841] = {
	name = "Martinsh"..ouml.."he",
	y = 4205.0 
}
streetTable.sn[842] = {
	name = "Seidelstra"..szlig.."e",
	y = 4210.0 
}
streetTable.sn[843] = {
	name = "Henriettenstra"..szlig.."e",
	y = 4215.0 
}
streetTable.sn[844] = {
	name = "Rapsweg",
	y = 4220.0 
}
streetTable.sn[845] = {
	name = "Marpergerstra"..szlig.."e",
	y = 4225.0 
}
streetTable.sn[846] = {
	name = "Rostocker Stra"..szlig.."e",
	y = 4230.0 
}
streetTable.sn[847] = {
	name = "Zauberweg",
	y = 4235.0 
}
streetTable.sn[848] = {
	name = "Schladitzer Stra"..szlig.."e",
	y = 4240.0 
}
streetTable.sn[849] = {
	name = "Wahrener Stra"..szlig.."e",
	y = 4245.0 
}
streetTable.sn[850] = {
	name = "Muldentalstra"..szlig.."e",
	y = 4250.0 
}
streetTable.sn[851] = {
	name = "Krugstra"..szlig.."e",
	y = 4255.0 
}
streetTable.sn[852] = {
	name = "Nobbeweg",
	y = 4260.0 
}
streetTable.sn[853] = {
	name = "Tilman-Riemenschneider-Weg",
	y = 4265.0 
}
streetTable.sn[854] = {
	name = "Kantatenweg",
	y = 4270.0 
}
streetTable.sn[855] = {
	name = "G"..ouml.."bschelwitzer Weg",
	y = 4275.0 
}
streetTable.sn[856] = {
	name = "Brandenburger Stra"..szlig.."e",
	y = 4280.0 
}
streetTable.sn[857] = {
	name = "Philippine-Arndt-Weg",
	y = 4285.0 
}
streetTable.sn[858] = {
	name = "Marbachstra"..szlig.."e",
	y = 4290.0 
}
streetTable.sn[859] = {
	name = "Breitenfelder Stra"..szlig.."e",
	y = 4295.0 
}
streetTable.sn[860] = {
	name = "Amorbacher Stra"..szlig.."e",
	y = 4300.0 
}
streetTable.sn[861] = {
	name = "Am M"..uuml.."hlgraben",
	y = 4305.0 
}
streetTable.sn[862] = {
	name = "Drosselweg",
	y = 4310.0 
}
streetTable.sn[863] = {
	name = "Sonneberger Weg",
	y = 4315.0 
}
streetTable.sn[864] = {
	name = "Fullaweg",
	y = 4320.0 
}
streetTable.sn[865] = {
	name = "Wiprechtstra"..szlig.."e",
	y = 4325.0 
}
streetTable.sn[866] = {
	name = "Zwergmispelstra"..szlig.."e",
	y = 4330.0 
}
streetTable.sn[867] = {
	name = "Bj"..ouml.."rneborgstra"..szlig.."e",
	y = 4335.0 
}
streetTable.sn[868] = {
	name = "Bernhardstra"..szlig.."e",
	y = 4340.0 
}
streetTable.sn[869] = {
	name = "Waldweg",
	y = 4345.0 
}
streetTable.sn[870] = {
	name = "Vollhardtstra"..szlig.."e",
	y = 4350.0 
}
streetTable.sn[871] = {
	name = "Neptunweg",
	y = 4355.0 
}
streetTable.sn[872] = {
	name = "Nonnenweg",
	y = 4360.0 
}
streetTable.sn[873] = {
	name = "Pfaffendorfer Stra"..szlig.."e",
	y = 4365.0 
}
streetTable.sn[874] = {
	name = "Willmar-Schwabe-Stra"..szlig.."e",
	y = 4370.0 
}
streetTable.sn[875] = {
	name = "Koehlerstra"..szlig.."e",
	y = 4375.0 
}
streetTable.sn[876] = {
	name = "Toskastra"..szlig.."e",
	y = 4380.0 
}
streetTable.sn[877] = {
	name = "Herwigstra"..szlig.."e",
	y = 4385.0 
}
streetTable.sn[878] = {
	name = "Kuckucksweg",
	y = 4390.0 
}
streetTable.sn[879] = {
	name = "D"..ouml.."sner Stra"..szlig.."e",
	y = 4395.0 
}
streetTable.sn[880] = {
	name = "Gothaer Stra"..szlig.."e",
	y = 4400.0 
}
streetTable.sn[881] = {
	name = "Grimmaische Stra"..szlig.."e",
	y = 4405.0 
}
streetTable.sn[882] = {
	name = "Altdorferweg",
	y = 4410.0 
}
streetTable.sn[883] = {
	name = "Ochsenweg",
	y = 4415.0 
}
streetTable.sn[884] = {
	name = "Peterssteinweg",
	y = 4420.0 
}
streetTable.sn[885] = {
	name = "Kleine Fleischergasse",
	y = 4425.0 
}
streetTable.sn[886] = {
	name = "Blochmannstra"..szlig.."e",
	y = 4430.0 
}
streetTable.sn[887] = {
	name = "Stahmelner Allee",
	y = 4435.0 
}
streetTable.sn[888] = {
	name = "Schmitzstra"..szlig.."e",
	y = 4440.0 
}
streetTable.sn[889] = {
	name = "Nikolaikirchhof",
	y = 4445.0 
}
streetTable.sn[890] = {
	name = "An der Kirche",
	y = 4450.0 
}
streetTable.sn[891] = {
	name = "Podelwitzer Weg",
	y = 4455.0 
}
streetTable.sn[892] = {
	name = "Am alten Flughafen",
	y = 4460.0 
}
streetTable.sn[893] = {
	name = "An den Linden",
	y = 4465.0 
}
streetTable.sn[894] = {
	name = "Aachener Stra"..szlig.."e",
	y = 4470.0 
}
streetTable.sn[895] = {
	name = "Rasenweg",
	y = 4475.0 
}
streetTable.sn[896] = {
	name = "Rudolf-Breitscheid-Hof",
	y = 4480.0 
}
streetTable.sn[897] = {
	name = "Handelsplatz",
	y = 4485.0 
}
streetTable.sn[898] = {
	name = "Lausener Stra"..szlig.."e",
	y = 4490.0 
}
streetTable.sn[899] = {
	name = "Waldbaurstra"..szlig.."e",
	y = 4495.0 
}
streetTable.sn[900] = {
	name = "Zinnienweg",
	y = 4500.0 
}
streetTable.sn[901] = {
	name = "Johannes-K"..auml.."rner-Stra"..szlig.."e",
	y = 4505.0 
}
streetTable.sn[902] = {
	name = "Heinrich-Kaps-Stra"..szlig.."e",
	y = 4510.0 
}
streetTable.sn[903] = {
	name = "Berliner Stra"..szlig.."e",
	y = 4515.0 
}
streetTable.sn[904] = {
	name = "Zum Haksch",
	y = 4520.0 
}
streetTable.sn[905] = {
	name = "Lurgensteins Steg",
	y = 4525.0 
}
streetTable.sn[906] = {
	name = "Magdalenenstra"..szlig.."e",
	y = 4530.0 
}
streetTable.sn[907] = {
	name = "Clara-Zetkin-Stra"..szlig.."e",
	y = 4535.0 
}
streetTable.sn[908] = {
	name = "St"..ouml.."tteritzer Stra"..szlig.."e",
	y = 4540.0 
}
streetTable.sn[909] = {
	name = "Kastanienallee",
	y = 4545.0 
}
streetTable.sn[910] = {
	name = "Nixenweg",
	y = 4550.0 
}
streetTable.sn[911] = {
	name = "Am Eulengraben",
	y = 4555.0 
}
streetTable.sn[912] = {
	name = "Dohnaweg",
	y = 4560.0 
}
streetTable.sn[913] = {
	name = "Roggenring",
	y = 4565.0 
}
streetTable.sn[914] = {
	name = "Schreinerweg",
	y = 4570.0 
}
streetTable.sn[915] = {
	name = "Wiederitzscher Landstra"..szlig.."e",
	y = 4575.0 
}
streetTable.sn[916] = {
	name = "An der Windm"..uuml.."hle",
	y = 4580.0 
}
streetTable.sn[917] = {
	name = "Calvisiusstra"..szlig.."e",
	y = 4585.0 
}
streetTable.sn[918] = {
	name = "Rabet",
	y = 4590.0 
}
streetTable.sn[919] = {
	name = "Gr"..uuml.."nbacher Weg",
	y = 4595.0 
}
streetTable.sn[920] = {
	name = "Schr"..ouml.."derstra"..szlig.."e",
	y = 4600.0 
}
streetTable.sn[921] = {
	name = "Walther-Rathenau-Stra"..szlig.."e",
	y = 4605.0 
}
streetTable.sn[922] = {
	name = "Julius-Krause-Stra"..szlig.."e",
	y = 4610.0 
}
streetTable.sn[923] = {
	name = "Rosenm"..uuml.."llerstra"..szlig.."e",
	y = 4615.0 
}
streetTable.sn[924] = {
	name = "Albersdorfer Weg",
	y = 4620.0 
}
streetTable.sn[925] = {
	name = "Auguste-Hennig-Stra"..szlig.."e",
	y = 4625.0 
}
streetTable.sn[926] = {
	name = "Dohnanyistra"..szlig.."e",
	y = 4630.0 
}
streetTable.sn[927] = {
	name = "Engelsdorfer Weg",
	y = 4635.0 
}
streetTable.sn[928] = {
	name = "Reinmuthweg",
	y = 4640.0 
}
streetTable.sn[929] = {
	name = "Wiebelstra"..szlig.."e",
	y = 4645.0 
}
streetTable.sn[930] = {
	name = "Braunstra"..szlig.."e",
	y = 4650.0 
}
streetTable.sn[931] = {
	name = "Maulbeerweg",
	y = 4655.0 
}
streetTable.sn[932] = {
	name = "Am Elsterbogen",
	y = 4660.0 
}
streetTable.sn[933] = {
	name = "Siemeringstra"..szlig.."e",
	y = 4665.0 
}
streetTable.sn[934] = {
	name = "Neue Gutenbergstra"..szlig.."e",
	y = 4670.0 
}
streetTable.sn[935] = {
	name = "Riesenweg",
	y = 4675.0 
}
streetTable.sn[936] = {
	name = "Shakespearestra"..szlig.."e",
	y = 4680.0 
}
streetTable.sn[937] = {
	name = "Heubnerweg",
	y = 4685.0 
}
streetTable.sn[938] = {
	name = "Ossietzkystra"..szlig.."e",
	y = 4690.0 
}
streetTable.sn[939] = {
	name = "Pferdnerstra"..szlig.."e",
	y = 4695.0 
}
streetTable.sn[940] = {
	name = "Goldene Hufe",
	y = 4700.0 
}
streetTable.sn[941] = {
	name = "Ziustra"..szlig.."e",
	y = 4705.0 
}
streetTable.sn[942] = {
	name = "Auschwitzer Stra"..szlig.."e",
	y = 4710.0 
}
streetTable.sn[943] = {
	name = "Herzenstra"..szlig.."e",
	y = 4715.0 
}
streetTable.sn[944] = {
	name = "Robert-Koch-Weg",
	y = 4720.0 
}
streetTable.sn[945] = {
	name = "Schacherstra"..szlig.."e",
	y = 4725.0 
}
streetTable.sn[946] = {
	name = "Erlk"..ouml.."nigweg",
	y = 4730.0 
}
streetTable.sn[947] = {
	name = "Gregor-Fuchs-Stra"..szlig.."e",
	y = 4735.0 
}
streetTable.sn[948] = {
	name = "August-Bebel-Siedlung",
	y = 4740.0 
}
streetTable.sn[949] = {
	name = "Ritterspornweg",
	y = 4745.0 
}
streetTable.sn[950] = {
	name = "An der M"..uuml.."hlplei"..szlig.."e",
	y = 4750.0 
}
streetTable.sn[951] = {
	name = "An der Hainkirche",
	y = 4755.0 
}
streetTable.sn[952] = {
	name = "Lehdenweg",
	y = 4760.0 
}
streetTable.sn[953] = {
	name = "Buttergasse",
	y = 4765.0 
}
streetTable.sn[954] = {
	name = "Etkar-AndrÈ-Stra"..szlig.."e",
	y = 4770.0 
}
streetTable.sn[955] = {
	name = "Burgst"..auml.."dter Stra"..szlig.."e",
	y = 4775.0 
}
streetTable.sn[956] = {
	name = "Lyoner Stra"..szlig.."e",
	y = 4780.0 
}
streetTable.sn[957] = {
	name = "Vater-Jahn-Stra"..szlig.."e",
	y = 4785.0 
}
streetTable.sn[958] = {
	name = "Hans-Poeche-Stra"..szlig.."e",
	y = 4790.0 
}
streetTable.sn[959] = {
	name = "Emil-Teich-Stra"..szlig.."e",
	y = 4795.0 
}
streetTable.sn[960] = {
	name = "D"..ouml.."lziger Stra"..szlig.."e",
	y = 4800.0 
}
streetTable.sn[961] = {
	name = "Hoepnerstra"..szlig.."e",
	y = 4805.0 
}
streetTable.sn[962] = {
	name = "Vor dem Hospitaltore",
	y = 4810.0 
}
streetTable.sn[963] = {
	name = "Opalstra"..szlig.."e",
	y = 4815.0 
}
streetTable.sn[964] = {
	name = "Kantstra"..szlig.."e",
	y = 4820.0 
}
streetTable.sn[965] = {
	name = "Brunnenweg",
	y = 4825.0 
}
streetTable.sn[966] = {
	name = "Durch die Felder",
	y = 4830.0 
}
streetTable.sn[967] = {
	name = "Lotzestra"..szlig.."e",
	y = 4835.0 
}
streetTable.sn[968] = {
	name = "M"..ouml.."ckernsche Allee",
	y = 4840.0 
}
streetTable.sn[969] = {
	name = "Bernhard-Kellermann-Stra"..szlig.."e",
	y = 4845.0 
}
streetTable.sn[970] = {
	name = "Portitzer Stra"..szlig.."e",
	y = 4850.0 
}
streetTable.sn[971] = {
	name = "Sybelstra"..szlig.."e",
	y = 4855.0 
}
streetTable.sn[972] = {
	name = "G"..uuml.."ntzstra"..szlig.."e",
	y = 4860.0 
}
streetTable.sn[973] = {
	name = "Alfred-Frank-Platz",
	y = 4865.0 
}
streetTable.sn[974] = {
	name = "Weizenweg",
	y = 4870.0 
}
streetTable.sn[975] = {
	name = "Am langen Teiche",
	y = 4875.0 
}
streetTable.sn[976] = {
	name = "Marktstra"..szlig.."e",
	y = 4880.0 
}
streetTable.sn[977] = {
	name = "Bl"..uuml.."mnerstra"..szlig.."e",
	y = 4885.0 
}
streetTable.sn[978] = {
	name = "Wasunger Stra"..szlig.."e",
	y = 4890.0 
}
streetTable.sn[979] = {
	name = "Zschopauer Stra"..szlig.."e",
	y = 4895.0 
}
streetTable.sn[980] = {
	name = "Zum Denkmal",
	y = 4900.0 
}
streetTable.sn[981] = {
	name = "Kulmbacher Stra"..szlig.."e",
	y = 4905.0 
}
streetTable.sn[982] = {
	name = "Zehmischstra"..szlig.."e",
	y = 4910.0 
}
streetTable.sn[983] = {
	name = "Tabakgasse",
	y = 4915.0 
}
streetTable.sn[984] = {
	name = "Zum Leutzscher Holz",
	y = 4920.0 
}
streetTable.sn[985] = {
	name = "Riebeckstra"..szlig.."e",
	y = 4925.0 
}
streetTable.sn[986] = {
	name = "Zschochersche Allee",
	y = 4930.0 
}
streetTable.sn[987] = {
	name = "Leibnizweg",
	y = 4935.0 
}
streetTable.sn[988] = {
	name = "Dreilindenstra"..szlig.."e",
	y = 4940.0 
}
streetTable.sn[989] = {
	name = "Essener Stra"..szlig.."e",
	y = 4945.0 
}
streetTable.sn[990] = {
	name = "Burgundenstra"..szlig.."e",
	y = 4950.0 
}
streetTable.sn[991] = {
	name = "Hasenheide",
	y = 4955.0 
}
streetTable.sn[992] = {
	name = "Heiterblickstra"..szlig.."e",
	y = 4960.0 
}
streetTable.sn[993] = {
	name = "Hartzstra"..szlig.."e",
	y = 4965.0 
}
streetTable.sn[994] = {
	name = "Lipsiusstra"..szlig.."e",
	y = 4970.0 
}
streetTable.sn[995] = {
	name = "Crensitzer Weg",
	y = 4975.0 
}
streetTable.sn[996] = {
	name = "Strelitzer Stra"..szlig.."e",
	y = 4980.0 
}
streetTable.sn[997] = {
	name = "Lise-Meitner-Stra"..szlig.."e",
	y = 4985.0 
}
streetTable.sn[998] = {
	name = "Lippendorfer Stra"..szlig.."e",
	y = 4990.0 
}
streetTable.sn[999] = {
	name = "Dammstra"..szlig.."e",
	y = 4995.0 
}
streetTable.sn[1000] = {
	name = "Am Sportplatz",
	y = 5000.0 
}
streetTable.sn[1001] = {
	name = "H"..auml.."nselweg",
	y = 5005.0 
}
streetTable.sn[1002] = {
	name = "Gustav-Schmoller-Stra"..szlig.."e",
	y = 5010.0 
}
streetTable.sn[1003] = {
	name = "Voltaweg",
	y = 5015.0 
}
streetTable.sn[1004] = {
	name = "Anemonenweg",
	y = 5020.0 
}
streetTable.sn[1005] = {
	name = "An der Querbreite",
	y = 5025.0 
}
streetTable.sn[1006] = {
	name = "Kahlhoffweg",
	y = 5030.0 
}
streetTable.sn[1007] = {
	name = "Waldwinkel",
	y = 5035.0 
}
streetTable.sn[1008] = {
	name = "Eisenschmidtplatz",
	y = 5040.0 
}
streetTable.sn[1009] = {
	name = "Bitterfelder Stra"..szlig.."e",
	y = 5045.0 
}
streetTable.sn[1010] = {
	name = "Stra"..szlig.."e des 17. Juni",
	y = 5050.0 
}
streetTable.sn[1011] = {
	name = "Dachsstra"..szlig.."e",
	y = 5055.0 
}
streetTable.sn[1012] = {
	name = "Seemannstra"..szlig.."e",
	y = 5060.0 
}
streetTable.sn[1013] = {
	name = "Althener Anger",
	y = 5065.0 
}
streetTable.sn[1014] = {
	name = "Offenbachweg",
	y = 5070.0 
}
streetTable.sn[1015] = {
	name = "Bayrischer Platz",
	y = 5075.0 
}
streetTable.sn[1016] = {
	name = "Wilhelm-Pfennig-Stra"..szlig.."e",
	y = 5080.0 
}
streetTable.sn[1017] = {
	name = "Holzhausener Stra"..szlig.."e",
	y = 5085.0 
}
streetTable.sn[1018] = {
	name = "B"..ouml.."ttgerstra"..szlig.."e",
	y = 5090.0 
}
streetTable.sn[1019] = {
	name = "Ernst-Guhr-Stra"..szlig.."e",
	y = 5095.0 
}
streetTable.sn[1020] = {
	name = "Robert-Koch-Stra"..szlig.."e",
	y = 5100.0 
}
streetTable.sn[1021] = {
	name = "Geibelstra"..szlig.."e",
	y = 5105.0 
}
streetTable.sn[1022] = {
	name = "Am Gartenverein",
	y = 5110.0 
}
streetTable.sn[1023] = {
	name = "Schneeberger Stra"..szlig.."e",
	y = 5115.0 
}
streetTable.sn[1024] = {
	name = "Segerstra"..szlig.."e",
	y = 5120.0 
}
streetTable.sn[1025] = {
	name = "Hermann-Dorner-Stra"..szlig.."e",
	y = 5125.0 
}
streetTable.sn[1026] = {
	name = "Schmalkaldener Weg",
	y = 5130.0 
}
streetTable.sn[1027] = {
	name = "Arthur-Hausmann-Stra"..szlig.."e",
	y = 5135.0 
}
streetTable.sn[1028] = {
	name = "Lauerscher Weg",
	y = 5140.0 
}
streetTable.sn[1029] = {
	name = "Begonienweg",
	y = 5145.0 
}
streetTable.sn[1030] = {
	name = "Im Blumengrund",
	y = 5150.0 
}
streetTable.sn[1031] = {
	name = "Springerstra"..szlig.."e",
	y = 5155.0 
}
streetTable.sn[1032] = {
	name = "Cheruskerstra"..szlig.."e",
	y = 5160.0 
}
streetTable.sn[1033] = {
	name = "Mansfelder Weg",
	y = 5165.0 
}
streetTable.sn[1034] = {
	name = "Hegelstra"..szlig.."e",
	y = 5170.0 
}
streetTable.sn[1035] = {
	name = "Schildberger Weg",
	y = 5175.0 
}
streetTable.sn[1036] = {
	name = "Abtnaundorfer Stra"..szlig.."e",
	y = 5180.0 
}
streetTable.sn[1037] = {
	name = "Gro"..szlig.."e Gartensiedlung",
	y = 5185.0 
}
streetTable.sn[1038] = {
	name = "Am Schwalbennest",
	y = 5190.0 
}
streetTable.sn[1039] = {
	name = "Schmiedestra"..szlig.."e",
	y = 5195.0 
}
streetTable.sn[1040] = {
	name = "Schulze-Boysen-Stra"..szlig.."e",
	y = 5200.0 
}
streetTable.sn[1041] = {
	name = "Beyerleinstra"..szlig.."e",
	y = 5205.0 
}
streetTable.sn[1042] = {
	name = "Quittenweg",
	y = 5210.0 
}
streetTable.sn[1043] = {
	name = "Parkweg",
	y = 5215.0 
}
streetTable.sn[1044] = {
	name = "Nikischplatz",
	y = 5220.0 
}
streetTable.sn[1045] = {
	name = "Taurusweg",
	y = 5225.0 
}
streetTable.sn[1046] = {
	name = "Geutebr"..uuml.."ckstra"..szlig.."e",
	y = 5230.0 
}
streetTable.sn[1047] = {
	name = "Pistorisstra"..szlig.."e",
	y = 5235.0 
}
streetTable.sn[1048] = {
	name = "Poniatowskiplan",
	y = 5240.0 
}
streetTable.sn[1049] = {
	name = "Hugo-Licht-Stra"..szlig.."e",
	y = 5245.0 
}
streetTable.sn[1050] = {
	name = "Menzingenweg",
	y = 5250.0 
}
streetTable.sn[1051] = {
	name = "Brunnenstra"..szlig.."e",
	y = 5255.0 
}
streetTable.sn[1052] = {
	name = "Heinrich-Zille-Weg",
	y = 5260.0 
}
streetTable.sn[1053] = {
	name = "Melissenweg",
	y = 5265.0 
}
streetTable.sn[1054] = {
	name = "G"..ouml.."schenstra"..szlig.."e",
	y = 5270.0 
}
streetTable.sn[1055] = {
	name = "Oswaldstra"..szlig.."e",
	y = 5275.0 
}
streetTable.sn[1056] = {
	name = "An der Kaninchenfarm",
	y = 5280.0 
}
streetTable.sn[1057] = {
	name = "Huygensstra"..szlig.."e",
	y = 5285.0 
}
streetTable.sn[1058] = {
	name = "Kolonnadenstra"..szlig.."e",
	y = 5290.0 
}
streetTable.sn[1059] = {
	name = "Sanddornweg",
	y = 5295.0 
}
streetTable.sn[1060] = {
	name = "W"..uuml.."rkertstra"..szlig.."e",
	y = 5300.0 
}
streetTable.sn[1061] = {
	name = "Weidenbachplan",
	y = 5305.0 
}
streetTable.sn[1062] = {
	name = "Limburgerstra"..szlig.."e",
	y = 5310.0 
}
streetTable.sn[1063] = {
	name = "Richard-Wagner-Stra"..szlig.."e",
	y = 5315.0 
}
streetTable.sn[1064] = {
	name = "Rehpfad",
	y = 5320.0 
}
streetTable.sn[1065] = {
	name = "Grassistra"..szlig.."e",
	y = 5325.0 
}
streetTable.sn[1066] = {
	name = "Scipiostra"..szlig.."e",
	y = 5330.0 
}
streetTable.sn[1067] = {
	name = "Liselotte-Herrmann-Stra"..szlig.."e",
	y = 5335.0 
}
streetTable.sn[1068] = {
	name = "Friesenweg",
	y = 5340.0 
}
streetTable.sn[1069] = {
	name = "Hermelinplatz",
	y = 5345.0 
}
streetTable.sn[1070] = {
	name = "Parkstra"..szlig.."e",
	y = 5350.0 
}
streetTable.sn[1071] = {
	name = "Gesnerstra"..szlig.."e",
	y = 5355.0 
}
streetTable.sn[1072] = {
	name = "Sandm"..auml.."nnchenweg",
	y = 5360.0 
}
streetTable.sn[1073] = {
	name = Auml.."u"..szlig.."ere M"..uuml.."hlenstra"..szlig.."e",
	y = 5365.0 
}
streetTable.sn[1074] = {
	name = "Crednerstra"..szlig.."e",
	y = 5370.0 
}
streetTable.sn[1075] = {
	name = "Grunertstra"..szlig.."e",
	y = 5375.0 
}
streetTable.sn[1076] = {
	name = "Querstra"..szlig.."e",
	y = 5380.0 
}
streetTable.sn[1077] = {
	name = "Wiesenweg",
	y = 5385.0 
}
streetTable.sn[1078] = {
	name = "Seegeritzer Stra"..szlig.."e",
	y = 5390.0 
}
streetTable.sn[1079] = {
	name = "K"..auml.."stnerbogen",
	y = 5395.0 
}
streetTable.sn[1080] = {
	name = "Breslauer Stra"..szlig.."e",
	y = 5400.0 
}
streetTable.sn[1081] = {
	name = "Gregoriusstra"..szlig.."e",
	y = 5405.0 
}
streetTable.sn[1082] = {
	name = "Reudnitzer Stra"..szlig.."e",
	y = 5410.0 
}
streetTable.sn[1083] = {
	name = "Stieglitzstra"..szlig.."e",
	y = 5415.0 
}
streetTable.sn[1084] = {
	name = "Paul-Langheinrich-Stra"..szlig.."e",
	y = 5420.0 
}
streetTable.sn[1085] = {
	name = "Adlershelmstra"..szlig.."e",
	y = 5425.0 
}
streetTable.sn[1086] = {
	name = "Fuggerstra"..szlig.."e",
	y = 5430.0 
}
streetTable.sn[1087] = {
	name = "Br"..uuml.."hl",
	y = 5435.0 
}
streetTable.sn[1088] = {
	name = "Lidicestra"..szlig.."e",
	y = 5440.0 
}
streetTable.sn[1089] = {
	name = "Bienerstra"..szlig.."e",
	y = 5445.0 
}
streetTable.sn[1090] = {
	name = "Tornauer Stra"..szlig.."e",
	y = 5450.0 
}
streetTable.sn[1091] = {
	name = "Fritz-Schmenkel-Stra"..szlig.."e",
	y = 5455.0 
}
streetTable.sn[1092] = {
	name = "D"..uuml.."rrenberger Stra"..szlig.."e",
	y = 5460.0 
}
streetTable.sn[1093] = {
	name = "Am Pfingstanger",
	y = 5465.0 
}
streetTable.sn[1094] = {
	name = "Trendelenburgstra"..szlig.."e",
	y = 5470.0 
}
streetTable.sn[1095] = {
	name = "Seelenbinderstra"..szlig.."e",
	y = 5475.0 
}
streetTable.sn[1096] = {
	name = "Floraweg",
	y = 5480.0 
}
streetTable.sn[1097] = {
	name = "Im Tannengrund",
	y = 5485.0 
}
streetTable.sn[1098] = {
	name = "Pfingstweide",
	y = 5490.0 
}
streetTable.sn[1099] = {
	name = "Hubmaierweg",
	y = 5495.0 
}
streetTable.sn[1100] = {
	name = "Georg-Reichardt-Stra"..szlig.."e",
	y = 5500.0 
}
streetTable.sn[1101] = {
	name = "Romain-Rolland-Weg",
	y = 5505.0 
}
streetTable.sn[1102] = {
	name = "Kilometerweg",
	y = 5510.0 
}
streetTable.sn[1103] = {
	name = "Nathusiusstra"..szlig.."e",
	y = 5515.0 
}
streetTable.sn[1104] = {
	name = "Merkurpromenade",
	y = 5520.0 
}
streetTable.sn[1105] = {
	name = "Klostergasse",
	y = 5525.0 
}
streetTable.sn[1106] = {
	name = "Neumarkt",
	y = 5530.0 
}
streetTable.sn[1107] = {
	name = "M"..uuml.."hlenweg",
	y = 5535.0 
}
streetTable.sn[1108] = {
	name = "Campestra"..szlig.."e",
	y = 5540.0 
}
streetTable.sn[1109] = {
	name = "Am Bauernteich",
	y = 5545.0 
}
streetTable.sn[1110] = {
	name = "Kunzestra"..szlig.."e",
	y = 5550.0 
}
streetTable.sn[1111] = {
	name = "Salbeiweg",
	y = 5555.0 
}
streetTable.sn[1112] = {
	name = "Zusestra"..szlig.."e",
	y = 5560.0 
}
streetTable.sn[1113] = {
	name = "GutsMuthsstra"..szlig.."e",
	y = 5565.0 
}
streetTable.sn[1114] = {
	name = "Universit"..auml.."tsstra"..szlig.."e",
	y = 5570.0 
}
streetTable.sn[1115] = {
	name = "Ostwaldstra"..szlig.."e",
	y = 5575.0 
}
streetTable.sn[1116] = {
	name = "Brehmestra"..szlig.."e",
	y = 5580.0 
}
streetTable.sn[1117] = {
	name = "Karl-Heft-Stra"..szlig.."e",
	y = 5585.0 
}
streetTable.sn[1118] = {
	name = "Wolfgang-Heinze-Stra"..szlig.."e",
	y = 5590.0 
}
streetTable.sn[1119] = {
	name = "Neumannstra"..szlig.."e",
	y = 5595.0 
}
streetTable.sn[1120] = {
	name = "Ferdinand-Freiligrath-Stra"..szlig.."",
	y = 5600.0 
}
streetTable.sn[1121] = {
	name = "Bernburger Stra"..szlig.."e",
	y = 5605.0 
}
streetTable.sn[1122] = {
	name = "Harnischstra"..szlig.."e",
	y = 5610.0 
}
streetTable.sn[1123] = {
	name = "Siemensstra"..szlig.."e",
	y = 5615.0 
}
streetTable.sn[1124] = {
	name = "Sulzbacher Stra"..szlig.."e",
	y = 5620.0 
}
streetTable.sn[1125] = {
	name = "Robert-Blum-Stra"..szlig.."e",
	y = 5625.0 
}
streetTable.sn[1126] = {
	name = "Altenburger Stra"..szlig.."e",
	y = 5630.0 
}
streetTable.sn[1127] = {
	name = "Grundstra"..szlig.."e",
	y = 5635.0 
}
streetTable.sn[1128] = {
	name = "Gro"..szlig.."steinberger Stra"..szlig.."e",
	y = 5640.0 
}
streetTable.sn[1129] = {
	name = "Handelsring",
	y = 5645.0 
}
streetTable.sn[1130] = {
	name = "Sophie-Scholl-Stra"..szlig.."e",
	y = 5650.0 
}
streetTable.sn[1131] = {
	name = "Otto-Heinze-Stra"..szlig.."e",
	y = 5655.0 
}
streetTable.sn[1132] = {
	name = "K"..auml.."ndlerstra"..szlig.."e",
	y = 5660.0 
}
streetTable.sn[1133] = {
	name = "Andromedaweg",
	y = 5665.0 
}
streetTable.sn[1134] = {
	name = "Plautstra"..szlig.."e",
	y = 5670.0 
}
streetTable.sn[1135] = {
	name = "Tschaikowskistra"..szlig.."e",
	y = 5675.0 
}
streetTable.sn[1136] = {
	name = "Karl-Moor-Weg",
	y = 5680.0 
}
streetTable.sn[1137] = {
	name = "Perrestra"..szlig.."e",
	y = 5685.0 
}
streetTable.sn[1138] = {
	name = "Heideweg",
	y = 5690.0 
}
streetTable.sn[1139] = {
	name = "Pfeffingerstra"..szlig.."e",
	y = 5695.0 
}
streetTable.sn[1140] = {
	name = "Auenblick",
	y = 5700.0 
}
streetTable.sn[1141] = {
	name = "Tollweg",
	y = 5705.0 
}
streetTable.sn[1142] = {
	name = "Wilhelm-Winkler-Stra"..szlig.."e",
	y = 5710.0 
}
streetTable.sn[1143] = {
	name = "Petersstra"..szlig.."e",
	y = 5715.0 
}
streetTable.sn[1144] = {
	name = "Laurentiusstra"..szlig.."e",
	y = 5720.0 
}
streetTable.sn[1145] = {
	name = "Balderstra"..szlig.."e",
	y = 5725.0 
}
streetTable.sn[1146] = {
	name = "Erich-M"..uuml.."hsam-Weg",
	y = 5730.0 
}
streetTable.sn[1147] = {
	name = "Sternwartenweg",
	y = 5735.0 
}
streetTable.sn[1148] = {
	name = "An der Verfassungslinde",
	y = 5740.0 
}
streetTable.sn[1149] = {
	name = "Oeserstra"..szlig.."e",
	y = 5745.0 
}
streetTable.sn[1150] = {
	name = "Traubengasse",
	y = 5750.0 
}
streetTable.sn[1151] = {
	name = "An der Friedenseiche",
	y = 5755.0 
}
streetTable.sn[1152] = {
	name = "Brockhausstra"..szlig.."e",
	y = 5760.0 
}
streetTable.sn[1153] = {
	name = "Zur Rodelbahn",
	y = 5765.0 
}
streetTable.sn[1154] = {
	name = "Kleine Bergstra"..szlig.."e",
	y = 5770.0 
}
streetTable.sn[1155] = {
	name = "Ro"..szlig.."lauer Stra"..szlig.."e",
	y = 5775.0 
}
streetTable.sn[1156] = {
	name = "Stegerwaldstra"..szlig.."e",
	y = 5780.0 
}
streetTable.sn[1157] = {
	name = "Karl-Liebknecht-Stra"..szlig.."e",
	y = 5785.0 
}
streetTable.sn[1158] = {
	name = "Fritz-Hanschmann-Stra"..szlig.."e",
	y = 5790.0 
}
streetTable.sn[1159] = {
	name = "Frohburger Stra"..szlig.."e",
	y = 5795.0 
}
streetTable.sn[1160] = {
	name = "Zur Heide",
	y = 5800.0 
}
streetTable.sn[1161] = {
	name = "Altranst"..auml.."dter Stra"..szlig.."e",
	y = 5805.0 
}
streetTable.sn[1162] = {
	name = "Swiftstra"..szlig.."e",
	y = 5810.0 
}
streetTable.sn[1163] = {
	name = "Dessauer Stra"..szlig.."e",
	y = 5815.0 
}
streetTable.sn[1164] = {
	name = "Klopstockstra"..szlig.."e",
	y = 5820.0 
}
streetTable.sn[1165] = {
	name = "Schmidstra"..szlig.."e",
	y = 5825.0 
}
streetTable.sn[1166] = {
	name = "Brentanostra"..szlig.."e",
	y = 5830.0 
}
streetTable.sn[1167] = {
	name = "Ammernplatz",
	y = 5835.0 
}
streetTable.sn[1168] = {
	name = "Jadebogen",
	y = 5840.0 
}
streetTable.sn[1169] = {
	name = "Barnecker Stra"..szlig.."e",
	y = 5845.0 
}
streetTable.sn[1170] = {
	name = "Reichenberger Stra"..szlig.."e",
	y = 5850.0 
}
streetTable.sn[1171] = {
	name = "Matzelstra"..szlig.."e",
	y = 5855.0 
}
streetTable.sn[1172] = {
	name = "Gro"..szlig.."beerener Stra"..szlig.."e",
	y = 5860.0 
}
streetTable.sn[1173] = {
	name = "Am Hegeanger",
	y = 5865.0 
}
streetTable.sn[1174] = {
	name = "Baalsdorfer Anger",
	y = 5870.0 
}
streetTable.sn[1175] = {
	name = "Dimpfelstra"..szlig.."e",
	y = 5875.0 
}
streetTable.sn[1176] = {
	name = "M"..uuml.."hlenstra"..szlig.."e",
	y = 5880.0 
}
streetTable.sn[1177] = {
	name = "Dr.-Wilhelm-K"..uuml.."lz-Stra"..szlig.."e",
	y = 5885.0 
}
streetTable.sn[1178] = {
	name = "Liebfrauenstra"..szlig.."e",
	y = 5890.0 
}
streetTable.sn[1179] = {
	name = "Zum Alten Seebad",
	y = 5895.0 
}
streetTable.sn[1180] = {
	name = "Dimitroffstra"..szlig.."e",
	y = 5900.0 
}
streetTable.sn[1181] = {
	name = "Kleiner Poetenweg",
	y = 5905.0 
}
streetTable.sn[1182] = {
	name = "Hinrichsenstra"..szlig.."e",
	y = 5910.0 
}
streetTable.sn[1183] = {
	name = "Weidmannstra"..szlig.."e",
	y = 5915.0 
}
streetTable.sn[1184] = {
	name = "Otto-Michael-Stra"..szlig.."e",
	y = 5920.0 
}
streetTable.sn[1185] = {
	name = "Schubarthstra"..szlig.."e",
	y = 5925.0 
}
streetTable.sn[1186] = {
	name = "Helmholtzstra"..szlig.."e",
	y = 5930.0 
}
streetTable.sn[1187] = {
	name = "K"..auml.."rrnerweg",
	y = 5935.0 
}
streetTable.sn[1188] = {
	name = "Windsheimer Stra"..szlig.."e",
	y = 5940.0 
}
streetTable.sn[1189] = {
	name = "Idunweg",
	y = 5945.0 
}
streetTable.sn[1190] = {
	name = "Holbeinstra"..szlig.."e",
	y = 5950.0 
}
streetTable.sn[1191] = {
	name = "Querma"..szlig.."e",
	y = 5955.0 
}
streetTable.sn[1192] = {
	name = "Clau"..szlig.."bruchstra"..szlig.."e",
	y = 5960.0 
}
streetTable.sn[1193] = {
	name = "Charlottenweg",
	y = 5965.0 
}
streetTable.sn[1194] = {
	name = "Zum Rosengarten",
	y = 5970.0 
}
streetTable.sn[1195] = {
	name = "Holunderweg",
	y = 5975.0 
}
streetTable.sn[1196] = {
	name = "Verl"..auml.."ngerte Wilhelmstra"..szlig.."e",
	y = 5980.0 
}
streetTable.sn[1197] = {
	name = "Pl"..ouml.."sener Stra"..szlig.."e",
	y = 5985.0 
}
streetTable.sn[1198] = {
	name = "An der G"..auml.."nseweide",
	y = 5990.0 
}
streetTable.sn[1199] = {
	name = "Obere Nordstra"..szlig.."e",
	y = 5995.0 
}
streetTable.sn[1200] = {
	name = "Carl-Meyer-Stra"..szlig.."e",
	y = 6000.0 
}
--All done, converter over and out

function getStreetName(postion, direction)
	if direction == "ew" then
		local posID = round(position / 5)
		return streetTable.ew[posID].name
	elseif direction == "sn" then
		local posID = round(position / 5)
		return streetTable.sn[posID].name	
	end
	return false
end

function getStreetData(position, direction)
	if direction == "ew" then
		local posID = round(position / 5)
		return streetTable.ew[posID].name, streetTable.ew[posID].x
	elseif direction == "sn" then
		local posID = round(position / 5)
		return streetTable.sn[posID].name, streetTable.sn[posID].y
	end
	return false	
end
