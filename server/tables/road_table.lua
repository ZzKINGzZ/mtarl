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



--Funktionen weiter unten
local streetTable = {}

streetTable.ew = {}
streetTable.sn = {}

streetTable.ew[1] = {
	name = "Herloßsohnstraße",
	x = 5.0 
}
streetTable.ew[2] = {
	name = "Krautbreite",
	x = 10.0 
}
streetTable.ew[3] = {
	name = "Färberstraße",
	x = 15.0 
}
streetTable.ew[4] = {
	name = "Schletterplatz",
	x = 20.0 
}
streetTable.ew[5] = {
	name = "Großmannstraße",
	x = 25.0 
}
streetTable.ew[6] = {
	name = "Haselstraße",
	x = 30.0 
}
streetTable.ew[7] = {
	name = "Freirodaer Weg",
	x = 35.0 
}
streetTable.ew[8] = {
	name = "Kippenbergstraße",
	x = 40.0 
}
streetTable.ew[9] = {
	name = "Wilhelm-Seyfferth-Straße",
	x = 45.0 
}
streetTable.ew[10] = {
	name = "Mistelbogen",
	x = 50.0 
}
streetTable.ew[11] = {
	name = "Hirschfelder Straße",
	x = 55.0 
}
streetTable.ew[12] = {
	name = "Feldahornweg",
	x = 60.0 
}
streetTable.ew[13] = {
	name = "Göbschelwitzer Straße",
	x = 65.0 
}
streetTable.ew[14] = {
	name = "Kanalstraße",
	x = 70.0 
}
streetTable.ew[15] = {
	name = "Clara-Wieck-Straße",
	x = 75.0 
}
streetTable.ew[16] = {
	name = "Zu den Gärten",
	x = 80.0 
}
streetTable.ew[17] = {
	name = "Eitingonstraße",
	x = 85.0 
}
streetTable.ew[18] = {
	name = "Krönerstraße",
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
	name = "Schönauer Landstraße",
	x = 105.0 
}
streetTable.ew[22] = {
	name = "Voigtstraße",
	x = 110.0 
}
streetTable.ew[23] = {
	name = "Max-Metzger-Straße",
	x = 115.0 
}
streetTable.ew[24] = {
	name = "Puschstraße",
	x = 120.0 
}
streetTable.ew[25] = {
	name = "Lilienweg",
	x = 125.0 
}
streetTable.ew[26] = {
	name = "Roscherstraße",
	x = 130.0 
}
streetTable.ew[27] = {
	name = "Nimrodstraße",
	x = 135.0 
}
streetTable.ew[28] = {
	name = "Am Röschenhof",
	x = 140.0 
}
streetTable.ew[29] = {
	name = "Kurze Straße",
	x = 145.0 
}
streetTable.ew[30] = {
	name = "Rothenburger Straße",
	x = 150.0 
}
streetTable.ew[31] = {
	name = "Funkenburgstraße",
	x = 155.0 
}
streetTable.ew[32] = {
	name = "Mottelerstraße",
	x = 160.0 
}
streetTable.ew[33] = {
	name = "Forsetistraße",
	x = 165.0 
}
streetTable.ew[34] = {
	name = "Lene-Voigt-Straße",
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
	name = "Schrammsteinstraße",
	x = 185.0 
}
streetTable.ew[38] = {
	name = "Paul-Ernst-Straße",
	x = 190.0 
}
streetTable.ew[39] = {
	name = "Tieckstraße",
	x = 195.0 
}
streetTable.ew[40] = {
	name = "Händelstraße",
	x = 200.0 
}
streetTable.ew[41] = {
	name = "Edlichstraße",
	x = 205.0 
}
streetTable.ew[42] = {
	name = "Am Feldrain",
	x = 210.0 
}
streetTable.ew[43] = {
	name = "Wendenstraße",
	x = 215.0 
}
streetTable.ew[44] = {
	name = "Ranftsche Gasse",
	x = 220.0 
}
streetTable.ew[45] = {
	name = "Hickmannstraße",
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
	name = "Albert-Vollsack-Straße",
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
	name = "Schwimmerstraße",
	x = 255.0 
}
streetTable.ew[52] = {
	name = "Reiterallee",
	x = 260.0 
}
streetTable.ew[53] = {
	name = "Achatstraße",
	x = 265.0 
}
streetTable.ew[54] = {
	name = "Zschortauer Straße",
	x = 270.0 
}
streetTable.ew[55] = {
	name = "Nietzschestraße",
	x = 275.0 
}
streetTable.ew[56] = {
	name = "Kupfergasse",
	x = 280.0 
}
streetTable.ew[57] = {
	name = "Püchauer Straße",
	x = 285.0 
}
streetTable.ew[58] = {
	name = "Rippachtalstraße",
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
	name = "Holsteinstraße",
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
	name = "Max-Liebermann-Straße",
	x = 335.0 
}
streetTable.ew[68] = {
	name = "Ohmweg",
	x = 340.0 
}
streetTable.ew[69] = {
	name = "Anna-Kuhnow-Straße",
	x = 345.0 
}
streetTable.ew[70] = {
	name = "Am Wiesenblick",
	x = 350.0 
}
streetTable.ew[71] = {
	name = "Neubauernstraße",
	x = 355.0 
}
streetTable.ew[72] = {
	name = "Andersenweg",
	x = 360.0 
}
streetTable.ew[73] = {
	name = "Rodelandstraße",
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
	name = "Zweenfurther Straße",
	x = 395.0 
}
streetTable.ew[80] = {
	name = "Rudolph-Herrmann-Straße",
	x = 400.0 
}
streetTable.ew[81] = {
	name = "Wieselsteig",
	x = 405.0 
}
streetTable.ew[82] = {
	name = "Carlebachstraße",
	x = 410.0 
}
streetTable.ew[83] = {
	name = "Zerbster Straße",
	x = 415.0 
}
streetTable.ew[84] = {
	name = "Böcklinweg",
	x = 420.0 
}
streetTable.ew[85] = {
	name = "Lönsstraße",
	x = 425.0 
}
streetTable.ew[86] = {
	name = "Froschkönigweg",
	x = 430.0 
}
streetTable.ew[87] = {
	name = "Täubchenweg",
	x = 435.0 
}
streetTable.ew[88] = {
	name = "Günselstraße",
	x = 440.0 
}
streetTable.ew[89] = {
	name = "Dieselstraße",
	x = 445.0 
}
streetTable.ew[90] = {
	name = "Kastanienweg",
	x = 450.0 
}
streetTable.ew[91] = {
	name = "Gröpplerstraße",
	x = 455.0 
}
streetTable.ew[92] = {
	name = "Steinstraße",
	x = 460.0 
}
streetTable.ew[93] = {
	name = "Am Wegekreuz",
	x = 465.0 
}
streetTable.ew[94] = {
	name = "Pöppigstraße",
	x = 470.0 
}
streetTable.ew[95] = {
	name = "Hofer Straße",
	x = 475.0 
}
streetTable.ew[96] = {
	name = "Hommelweg",
	x = 480.0 
}
streetTable.ew[97] = {
	name = "Windscheidstraße",
	x = 485.0 
}
streetTable.ew[98] = {
	name = "Am Gothischen Bad",
	x = 490.0 
}
streetTable.ew[99] = {
	name = "Kurt-Schumacher-Straße",
	x = 495.0 
}
streetTable.ew[100] = {
	name = "Grünfinkenweg",
	x = 500.0 
}
streetTable.ew[101] = {
	name = "Sturmweg",
	x = 505.0 
}
streetTable.ew[102] = {
	name = "Wendlerstraße",
	x = 510.0 
}
streetTable.ew[103] = {
	name = "Reginenstraße",
	x = 515.0 
}
streetTable.ew[104] = {
	name = "Markthallenstraße",
	x = 520.0 
}
streetTable.ew[105] = {
	name = "Am Flößgen",
	x = 525.0 
}
streetTable.ew[106] = {
	name = "Torweg",
	x = 530.0 
}
streetTable.ew[107] = {
	name = "Klarastraße",
	x = 535.0 
}
streetTable.ew[108] = {
	name = "Köhraer Straße",
	x = 540.0 
}
streetTable.ew[109] = {
	name = "Heinrich-Oelerich-Straße",
	x = 545.0 
}
streetTable.ew[110] = {
	name = "Diesterwegstraße",
	x = 550.0 
}
streetTable.ew[111] = {
	name = "Sophienstraße",
	x = 555.0 
}
streetTable.ew[112] = {
	name = "Nibelungenring",
	x = 560.0 
}
streetTable.ew[113] = {
	name = "Barbarastraße",
	x = 565.0 
}
streetTable.ew[114] = {
	name = "Sachsenlinie",
	x = 570.0 
}
streetTable.ew[115] = {
	name = "Sommerfelder Straße",
	x = 575.0 
}
streetTable.ew[116] = {
	name = "Freiberger Straße",
	x = 580.0 
}
streetTable.ew[117] = {
	name = "Querweg",
	x = 585.0 
}
streetTable.ew[118] = {
	name = "Albrechtshainer Straße",
	x = 590.0 
}
streetTable.ew[119] = {
	name = "Webergasse",
	x = 595.0 
}
streetTable.ew[120] = {
	name = "Walter-Heinze-Straße",
	x = 600.0 
}
streetTable.ew[121] = {
	name = "Rübezahlweg",
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
	name = "Rotdornstraße",
	x = 620.0 
}
streetTable.ew[125] = {
	name = "Mahlmannstraße",
	x = 625.0 
}
streetTable.ew[126] = {
	name = "Schomburgkstraße",
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
	name = "Lilienthalstraße",
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
	name = "Turnerstraße",
	x = 680.0 
}
streetTable.ew[137] = {
	name = "Junghanßstraße",
	x = 685.0 
}
streetTable.ew[138] = {
	name = "Knesebeckstraße",
	x = 690.0 
}
streetTable.ew[139] = {
	name = "Ilse-Decho-Weg",
	x = 695.0 
}
streetTable.ew[140] = {
	name = "Carpzovstraße",
	x = 700.0 
}
streetTable.ew[141] = {
	name = "Ludwig-Hupfeld-Straße",
	x = 705.0 
}
streetTable.ew[142] = {
	name = "Christianstraße",
	x = 710.0 
}
streetTable.ew[143] = {
	name = "Pansastraße",
	x = 715.0 
}
streetTable.ew[144] = {
	name = "Phoenixweg",
	x = 720.0 
}
streetTable.ew[145] = {
	name = "Harnackstraße",
	x = 725.0 
}
streetTable.ew[146] = {
	name = "Am Keulenberg",
	x = 730.0 
}
streetTable.ew[147] = {
	name = "Gustav-Adolf-Straße",
	x = 735.0 
}
streetTable.ew[148] = {
	name = "Lindenstraße",
	x = 740.0 
}
streetTable.ew[149] = {
	name = "Stauffacherweg",
	x = 745.0 
}
streetTable.ew[150] = {
	name = "Oelßnerstraße",
	x = 750.0 
}
streetTable.ew[151] = {
	name = "Pörstener Straße",
	x = 755.0 
}
streetTable.ew[152] = {
	name = "Reinhold-Krüger-Straße",
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
	name = "Huttenstraße",
	x = 775.0 
}
streetTable.ew[156] = {
	name = "Theodor-Voigt-Straße",
	x = 780.0 
}
streetTable.ew[157] = {
	name = "Obludastraße",
	x = 785.0 
}
streetTable.ew[158] = {
	name = "Dorotheenplatz",
	x = 790.0 
}
streetTable.ew[159] = {
	name = "Theobald-Beer-Straße",
	x = 795.0 
}
streetTable.ew[160] = {
	name = "Däumlingsweg",
	x = 800.0 
}
streetTable.ew[161] = {
	name = "Plaußiger Weg",
	x = 805.0 
}
streetTable.ew[162] = {
	name = "Eva-Maria-Buch-Straße",
	x = 810.0 
}
streetTable.ew[163] = {
	name = "Leibnitzstraße",
	x = 815.0 
}
streetTable.ew[164] = {
	name = "Thomas-Mann-Straße",
	x = 820.0 
}
streetTable.ew[165] = {
	name = "Kohlenstraße",
	x = 825.0 
}
streetTable.ew[166] = {
	name = "Singdrosselweg",
	x = 830.0 
}
streetTable.ew[167] = {
	name = "Goldsternstraße",
	x = 835.0 
}
streetTable.ew[168] = {
	name = "Max-Reger-Allee",
	x = 840.0 
}
streetTable.ew[169] = {
	name = "Egelstraße",
	x = 845.0 
}
streetTable.ew[170] = {
	name = "Engelmannstraße",
	x = 850.0 
}
streetTable.ew[171] = {
	name = "Großer Brockhaus",
	x = 855.0 
}
streetTable.ew[172] = {
	name = "Gewandgäßchen",
	x = 860.0 
}
streetTable.ew[173] = {
	name = "Kipsdorfer Weg",
	x = 865.0 
}
streetTable.ew[174] = {
	name = "Könneritzstraße",
	x = 870.0 
}
streetTable.ew[175] = {
	name = "Hohentichelnstraße",
	x = 875.0 
}
streetTable.ew[176] = {
	name = "Himbeerweg",
	x = 880.0 
}
streetTable.ew[177] = {
	name = "Neue Straße",
	x = 885.0 
}
streetTable.ew[178] = {
	name = "Möckernsche Straße",
	x = 890.0 
}
streetTable.ew[179] = {
	name = "Mühlgrabenweg",
	x = 895.0 
}
streetTable.ew[180] = {
	name = "Raustraße",
	x = 900.0 
}
streetTable.ew[181] = {
	name = "Oberhofer Weg",
	x = 905.0 
}
streetTable.ew[182] = {
	name = "Theresienstraße",
	x = 910.0 
}
streetTable.ew[183] = {
	name = "Neuenburger Weg",
	x = 915.0 
}
streetTable.ew[184] = {
	name = "Bösdorfer Ring",
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
	name = "Weimarer Straße",
	x = 935.0 
}
streetTable.ew[188] = {
	name = "Wilhelm-Wundt-Platz",
	x = 940.0 
}
streetTable.ew[189] = {
	name = "Paul-List-Straße",
	x = 945.0 
}
streetTable.ew[190] = {
	name = "Gustav-Schwabe-Platz",
	x = 950.0 
}
streetTable.ew[191] = {
	name = "Klingenstraße",
	x = 955.0 
}
streetTable.ew[192] = {
	name = "Leanderweg",
	x = 960.0 
}
streetTable.ew[193] = {
	name = "Küchenholzallee",
	x = 965.0 
}
streetTable.ew[194] = {
	name = "Am Tore",
	x = 970.0 
}
streetTable.ew[195] = {
	name = "Linkelstraße",
	x = 975.0 
}
streetTable.ew[196] = {
	name = "Blumenstraße",
	x = 980.0 
}
streetTable.ew[197] = {
	name = "Gottfried-Keller-Straße",
	x = 985.0 
}
streetTable.ew[198] = {
	name = "Lößniger Straße",
	x = 990.0 
}
streetTable.ew[199] = {
	name = "Verdistraße",
	x = 995.0 
}
streetTable.ew[200] = {
	name = "Zum Schwinderplan",
	x = 1000.0 
}
streetTable.ew[201] = {
	name = "Lomonossowstraße",
	x = 1005.0 
}
streetTable.ew[202] = {
	name = "Kuhturmstraße",
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
	name = "Shukowstraße",
	x = 1025.0 
}
streetTable.ew[206] = {
	name = "Karl-Blechen-Straße",
	x = 1030.0 
}
streetTable.ew[207] = {
	name = "Weidlichstraße",
	x = 1035.0 
}
streetTable.ew[208] = {
	name = "Hainburger Weg",
	x = 1040.0 
}
streetTable.ew[209] = {
	name = "Roßbachstraße",
	x = 1045.0 
}
streetTable.ew[210] = {
	name = "Seilerweg",
	x = 1050.0 
}
streetTable.ew[211] = {
	name = "Mothesstraße",
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
	name = "Halberstädter Straße",
	x = 1070.0 
}
streetTable.ew[215] = {
	name = "Am Dorfteich",
	x = 1075.0 
}
streetTable.ew[216] = {
	name = "Weißdornweg",
	x = 1080.0 
}
streetTable.ew[217] = {
	name = "Am Sportforum",
	x = 1085.0 
}
streetTable.ew[218] = {
	name = "Spittastraße",
	x = 1090.0 
}
streetTable.ew[219] = {
	name = "Georg-Schwarz-Straße",
	x = 1095.0 
}
streetTable.ew[220] = {
	name = "Dantestraße",
	x = 1100.0 
}
streetTable.ew[221] = {
	name = "Matthäikirchhof",
	x = 1105.0 
}
streetTable.ew[222] = {
	name = "Sandberg",
	x = 1110.0 
}
streetTable.ew[223] = {
	name = "Caldernweg",
	x = 1115.0 
}
streetTable.ew[224] = {
	name = "Mecklenburger Straße",
	x = 1120.0 
}
streetTable.ew[225] = {
	name = "Lerchengrund",
	x = 1125.0 
}
streetTable.ew[226] = {
	name = "Dittrichstraße",
	x = 1130.0 
}
streetTable.ew[227] = {
	name = "Sandweg",
	x = 1135.0 
}
streetTable.ew[228] = {
	name = "Peilickestraße",
	x = 1140.0 
}
streetTable.ew[229] = {
	name = "Seffnerstraße",
	x = 1145.0 
}
streetTable.ew[230] = {
	name = "Kreuzstraße",
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
	name = "Koburger Straße",
	x = 1165.0 
}
streetTable.ew[234] = {
	name = "Ulmer Straße",
	x = 1170.0 
}
streetTable.ew[235] = {
	name = "Forststraße",
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
	name = "Jonsdorfer Straße",
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
	name = "Nienborgstraße",
	x = 1210.0 
}
streetTable.ew[243] = {
	name = "Bästleinstraße",
	x = 1215.0 
}
streetTable.ew[244] = {
	name = "Körnerplatz",
	x = 1220.0 
}
streetTable.ew[245] = {
	name = "Michaelisstraße",
	x = 1225.0 
}
streetTable.ew[246] = {
	name = "Cleudner Straße",
	x = 1230.0 
}
streetTable.ew[247] = {
	name = "Ehrenberger Straße",
	x = 1235.0 
}
streetTable.ew[248] = {
	name = "Zwergasternweg",
	x = 1240.0 
}
streetTable.ew[249] = {
	name = "Pösgrabenweg",
	x = 1245.0 
}
streetTable.ew[250] = {
	name = "Amalienstraße",
	x = 1250.0 
}
streetTable.ew[251] = {
	name = "Rittergutsstraße",
	x = 1255.0 
}
streetTable.ew[252] = {
	name = "Heimteichstraße",
	x = 1260.0 
}
streetTable.ew[253] = {
	name = "Wöllnerstraße",
	x = 1265.0 
}
streetTable.ew[254] = {
	name = "Elsbethstraße",
	x = 1270.0 
}
streetTable.ew[255] = {
	name = "Fleißnerstraße",
	x = 1275.0 
}
streetTable.ew[256] = {
	name = "Dombrowskistraße",
	x = 1280.0 
}
streetTable.ew[257] = {
	name = "Turmgutstraße",
	x = 1285.0 
}
streetTable.ew[258] = {
	name = "Zadestraße",
	x = 1290.0 
}
streetTable.ew[259] = {
	name = "Telemannstraße",
	x = 1295.0 
}
streetTable.ew[260] = {
	name = "Agricolastraße",
	x = 1300.0 
}
streetTable.ew[261] = {
	name = "Zuckelhausener Ring",
	x = 1305.0 
}
streetTable.ew[262] = {
	name = "Probstheidaer Straße",
	x = 1310.0 
}
streetTable.ew[263] = {
	name = "Marsweg",
	x = 1315.0 
}
streetTable.ew[264] = {
	name = "Faradaystraße",
	x = 1320.0 
}
streetTable.ew[265] = {
	name = "Lobensteiner Straße",
	x = 1325.0 
}
streetTable.ew[266] = {
	name = "Dürnsteiner Weg",
	x = 1330.0 
}
streetTable.ew[267] = {
	name = "Ludolf-Colditz-Straße",
	x = 1335.0 
}
streetTable.ew[268] = {
	name = "Schmutzlerstraße",
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
	name = "Thierschstraße",
	x = 1355.0 
}
streetTable.ew[272] = {
	name = "Lähnestraße",
	x = 1360.0 
}
streetTable.ew[273] = {
	name = "Salamanderstraße",
	x = 1365.0 
}
streetTable.ew[274] = {
	name = "Windmühlenweg",
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
	name = "Wachsmuthstraße",
	x = 1390.0 
}
streetTable.ew[279] = {
	name = "Morgensternstraße",
	x = 1395.0 
}
streetTable.ew[280] = {
	name = "Wendelin-Hipler-Weg",
	x = 1400.0 
}
streetTable.ew[281] = {
	name = "Grüner Weg",
	x = 1405.0 
}
streetTable.ew[282] = {
	name = "Karl-Tauchnitz-Straße",
	x = 1410.0 
}
streetTable.ew[283] = {
	name = "Zwiebelweg",
	x = 1415.0 
}
streetTable.ew[284] = {
	name = "Coblenzer Straße",
	x = 1420.0 
}
streetTable.ew[285] = {
	name = "Prünstraße",
	x = 1425.0 
}
streetTable.ew[286] = {
	name = "Defoestraße",
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
	name = "Rankestraße",
	x = 1445.0 
}
streetTable.ew[290] = {
	name = "Schweinfurter Straße",
	x = 1450.0 
}
streetTable.ew[291] = {
	name = "Regensburger Straße",
	x = 1455.0 
}
streetTable.ew[292] = {
	name = "Salzgäßchen",
	x = 1460.0 
}
streetTable.ew[293] = {
	name = "Porschestraße",
	x = 1465.0 
}
streetTable.ew[294] = {
	name = "Watestraße",
	x = 1470.0 
}
streetTable.ew[295] = {
	name = "Anzengruberstraße",
	x = 1475.0 
}
streetTable.ew[296] = {
	name = "Seiffener Straße",
	x = 1480.0 
}
streetTable.ew[297] = {
	name = "Volckmarstraße",
	x = 1485.0 
}
streetTable.ew[298] = {
	name = "Tauchaer Straße",
	x = 1490.0 
}
streetTable.ew[299] = {
	name = "Binsengrund",
	x = 1495.0 
}
streetTable.ew[300] = {
	name = "Stormstraße",
	x = 1500.0 
}
streetTable.ew[301] = {
	name = "Trufanowstraße",
	x = 1505.0 
}
streetTable.ew[302] = {
	name = "Ernestistraße",
	x = 1510.0 
}
streetTable.ew[303] = {
	name = "Kleine Promenade",
	x = 1515.0 
}
streetTable.ew[304] = {
	name = "Bahnhofstraße",
	x = 1520.0 
}
streetTable.ew[305] = {
	name = "Stephaniplatz",
	x = 1525.0 
}
streetTable.ew[306] = {
	name = "Palmstraße",
	x = 1530.0 
}
streetTable.ew[307] = {
	name = "Bormannstraße",
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
	name = "Wernerstraße",
	x = 1550.0 
}
streetTable.ew[311] = {
	name = "Friedrichshafner Straße",
	x = 1555.0 
}
streetTable.ew[312] = {
	name = "Ringstraße",
	x = 1560.0 
}
streetTable.ew[313] = {
	name = "Pettenkoferstraße",
	x = 1565.0 
}
streetTable.ew[314] = {
	name = "Reineckestraße",
	x = 1570.0 
}
streetTable.ew[315] = {
	name = "Augustenstraße",
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
	name = "Brambacher Straße",
	x = 1590.0 
}
streetTable.ew[319] = {
	name = "Georg-Maurer-Straße",
	x = 1595.0 
}
streetTable.ew[320] = {
	name = "Wilhelm-Leuschner-Platz",
	x = 1600.0 
}
streetTable.ew[321] = {
	name = "Hänischstraße",
	x = 1605.0 
}
streetTable.ew[322] = {
	name = "Paul-Flechsig-Straße",
	x = 1610.0 
}
streetTable.ew[323] = {
	name = "Stralsunder Straße",
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
	name = "Leostraße",
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
	name = "Jordanstraße",
	x = 1645.0 
}
streetTable.ew[330] = {
	name = "Höltystraße",
	x = 1650.0 
}
streetTable.ew[331] = {
	name = "Kurt-Eisner-Straße",
	x = 1655.0 
}
streetTable.ew[332] = {
	name = "Wustmannstraße",
	x = 1660.0 
}
streetTable.ew[333] = {
	name = "Prellerstraße",
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
	name = "Sasstraße",
	x = 1680.0 
}
streetTable.ew[337] = {
	name = "Egon-Erwin-Kisch-Weg",
	x = 1685.0 
}
streetTable.ew[338] = {
	name = "Handelsstraße",
	x = 1690.0 
}
streetTable.ew[339] = {
	name = "Igelstraße",
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
	name = "Mölkauer Dorfplatz",
	x = 1720.0 
}
streetTable.ew[345] = {
	name = "Baunackstraße",
	x = 1725.0 
}
streetTable.ew[346] = {
	name = "Humboldtstraße",
	x = 1730.0 
}
streetTable.ew[347] = {
	name = "Bausestraße",
	x = 1735.0 
}
streetTable.ew[348] = {
	name = "Bontjes-van-Beek-Straße",
	x = 1740.0 
}
streetTable.ew[349] = {
	name = "Grüne Gasse",
	x = 1745.0 
}
streetTable.ew[350] = {
	name = "Dybwadstraße",
	x = 1750.0 
}
streetTable.ew[351] = {
	name = "Kresseweg",
	x = 1755.0 
}
streetTable.ew[352] = {
	name = "Liliensteinstraße",
	x = 1760.0 
}
streetTable.ew[353] = {
	name = "Fasanenhöhe",
	x = 1765.0 
}
streetTable.ew[354] = {
	name = "Güntheritzer Weg",
	x = 1770.0 
}
streetTable.ew[355] = {
	name = "Plaußiger Straße",
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
	name = "Nußbaumweg",
	x = 1790.0 
}
streetTable.ew[359] = {
	name = "Volksgartenstraße",
	x = 1795.0 
}
streetTable.ew[360] = {
	name = "Erlenweg",
	x = 1800.0 
}
streetTable.ew[361] = {
	name = "Rosestraße",
	x = 1805.0 
}
streetTable.ew[362] = {
	name = "Schongauerstraße",
	x = 1810.0 
}
streetTable.ew[363] = {
	name = "Barbussestraße",
	x = 1815.0 
}
streetTable.ew[364] = {
	name = "Malteserstraße",
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
	name = "Knorrstraße",
	x = 1850.0 
}
streetTable.ew[371] = {
	name = "Ritter-Pflugk-Straße",
	x = 1855.0 
}
streetTable.ew[372] = {
	name = "Elisabethstraße",
	x = 1860.0 
}
streetTable.ew[373] = {
	name = "Ratzelstraße",
	x = 1865.0 
}
streetTable.ew[374] = {
	name = "Kolmstraße",
	x = 1870.0 
}
streetTable.ew[375] = {
	name = "Kindstraße",
	x = 1875.0 
}
streetTable.ew[376] = {
	name = "Angerstraße",
	x = 1880.0 
}
streetTable.ew[377] = {
	name = "Ulmenweg",
	x = 1885.0 
}
streetTable.ew[378] = {
	name = "Sosaer Straße",
	x = 1890.0 
}
streetTable.ew[379] = {
	name = "Wiesenblumenweg",
	x = 1895.0 
}
streetTable.ew[380] = {
	name = "Selneckerstraße",
	x = 1900.0 
}
streetTable.ew[381] = {
	name = "Elli-Voigt-Straße",
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
	name = "Hainstraße",
	x = 1920.0 
}
streetTable.ew[385] = {
	name = "Brodauer Weg",
	x = 1925.0 
}
streetTable.ew[386] = {
	name = "Brandvorwerkstraße",
	x = 1930.0 
}
streetTable.ew[387] = {
	name = "Portitzer Winkel",
	x = 1935.0 
}
streetTable.ew[388] = {
	name = "Bautzmannstraße",
	x = 1940.0 
}
streetTable.ew[389] = {
	name = "Gottfried-Rentzsch-Weg",
	x = 1945.0 
}
streetTable.ew[390] = {
	name = "Preußenseite",
	x = 1950.0 
}
streetTable.ew[391] = {
	name = "Gottschedstraße",
	x = 1955.0 
}
streetTable.ew[392] = {
	name = "Erhardstraße",
	x = 1960.0 
}
streetTable.ew[393] = {
	name = "Karolusstraße",
	x = 1965.0 
}
streetTable.ew[394] = {
	name = "Prof.-Dr.-Koch-Straße",
	x = 1970.0 
}
streetTable.ew[395] = {
	name = "Freirodaer Straße",
	x = 1975.0 
}
streetTable.ew[396] = {
	name = "Elstergarten",
	x = 1980.0 
}
streetTable.ew[397] = {
	name = "Häuslergasse",
	x = 1985.0 
}
streetTable.ew[398] = {
	name = "Barfußgäßchen",
	x = 1990.0 
}
streetTable.ew[399] = {
	name = "Heidelberger Straße",
	x = 1995.0 
}
streetTable.ew[400] = {
	name = "Waldmeisterweg",
	x = 2000.0 
}
streetTable.ew[401] = {
	name = "Naumburger Straße",
	x = 2005.0 
}
streetTable.ew[402] = {
	name = "Baalsdorfer Straße",
	x = 2010.0 
}
streetTable.ew[403] = {
	name = "Uhrigstraße",
	x = 2015.0 
}
streetTable.ew[404] = {
	name = "Am Klosterfeld",
	x = 2020.0 
}
streetTable.ew[405] = {
	name = "An der Mühle",
	x = 2025.0 
}
streetTable.ew[406] = {
	name = "Diderotstraße",
	x = 2030.0 
}
streetTable.ew[407] = {
	name = "Pröttitzer Weg",
	x = 2035.0 
}
streetTable.ew[408] = {
	name = "Am Alten Mühlgraben",
	x = 2040.0 
}
streetTable.ew[409] = {
	name = "Morellenweg",
	x = 2045.0 
}
streetTable.ew[410] = {
	name = "Thomasiusstraße",
	x = 2050.0 
}
streetTable.ew[411] = {
	name = "Kleiner Zipfel",
	x = 2055.0 
}
streetTable.ew[412] = {
	name = "Curiestraße",
	x = 2060.0 
}
streetTable.ew[413] = {
	name = "Scheumannstraße",
	x = 2065.0 
}
streetTable.ew[414] = {
	name = "Ahornstraße",
	x = 2070.0 
}
streetTable.ew[415] = {
	name = "Ihmelsstraße",
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
	name = "Entsbergerstraße",
	x = 2090.0 
}
streetTable.ew[419] = {
	name = "Fröschelstraße",
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
	name = "Falladastraße",
	x = 2110.0 
}
streetTable.ew[423] = {
	name = "Arthur-Polenz-Straße",
	x = 2115.0 
}
streetTable.ew[424] = {
	name = "Pappelhof",
	x = 2120.0 
}
streetTable.ew[425] = {
	name = "Baumgarten-Crusius-Straße",
	x = 2125.0 
}
streetTable.ew[426] = {
	name = "Ampereweg",
	x = 2130.0 
}
streetTable.ew[427] = {
	name = "Elfenweg",
	x = 2135.0 
}
streetTable.ew[428] = {
	name = "Winkelstraße",
	x = 2140.0 
}
streetTable.ew[429] = {
	name = "Leinestraße",
	x = 2145.0 
}
streetTable.ew[430] = {
	name = "Lützschenaer Straße",
	x = 2150.0 
}
streetTable.ew[431] = {
	name = "Bei der Krähenhütte",
	x = 2155.0 
}
streetTable.ew[432] = {
	name = "Täschnerstraße",
	x = 2160.0 
}
streetTable.ew[433] = {
	name = "Tannenweg",
	x = 2165.0 
}
streetTable.ew[434] = {
	name = "Karlstraße",
	x = 2170.0 
}
streetTable.ew[435] = {
	name = "Idastraße",
	x = 2175.0 
}
streetTable.ew[436] = {
	name = "Torgauer Platz",
	x = 2180.0 
}
streetTable.ew[437] = {
	name = "Walter-Günther-Weg",
	x = 2185.0 
}
streetTable.ew[438] = {
	name = "Am Hallischen Tor",
	x = 2190.0 
}
streetTable.ew[439] = {
	name = "Max-Planck-Straße",
	x = 2195.0 
}
streetTable.ew[440] = {
	name = "Arthur-Thiele-Weg",
	x = 2200.0 
}
streetTable.ew[441] = {
	name = "Saalecker Straße",
	x = 2205.0 
}
streetTable.ew[442] = {
	name = "Kiewer Straße",
	x = 2210.0 
}
streetTable.ew[443] = {
	name = "Zillstraße",
	x = 2215.0 
}
streetTable.ew[444] = {
	name = "Mariannenstraße",
	x = 2220.0 
}
streetTable.ew[445] = {
	name = "Am Flügelrad",
	x = 2225.0 
}
streetTable.ew[446] = {
	name = "Sportplatzstraße",
	x = 2230.0 
}
streetTable.ew[447] = {
	name = "Saxoniastraße",
	x = 2235.0 
}
streetTable.ew[448] = {
	name = "Donarstraße",
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
	name = "Nerchauer Straße",
	x = 2255.0 
}
streetTable.ew[452] = {
	name = "Kamelienweg",
	x = 2260.0 
}
streetTable.ew[453] = {
	name = "Ostheimstraße",
	x = 2265.0 
}
streetTable.ew[454] = {
	name = "Losinskiweg",
	x = 2270.0 
}
streetTable.ew[455] = {
	name = "Brückenstraße",
	x = 2275.0 
}
streetTable.ew[456] = {
	name = "Kossaer Straße",
	x = 2280.0 
}
streetTable.ew[457] = {
	name = "Erich-Weinert-Straße",
	x = 2285.0 
}
streetTable.ew[458] = {
	name = "Kötzschauer Straße",
	x = 2290.0 
}
streetTable.ew[459] = {
	name = "Ernst-Schneller-Straße",
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
	name = "Grünauer Allee",
	x = 2315.0 
}
streetTable.ew[464] = {
	name = "Töpferstraße",
	x = 2320.0 
}
streetTable.ew[465] = {
	name = "Roßstraße",
	x = 2325.0 
}
streetTable.ew[466] = {
	name = "Saalfelder Straße",
	x = 2330.0 
}
streetTable.ew[467] = {
	name = "Goldacher Straße",
	x = 2335.0 
}
streetTable.ew[468] = {
	name = "William-Zipperer-Straße",
	x = 2340.0 
}
streetTable.ew[469] = {
	name = "Grenzstraße",
	x = 2345.0 
}
streetTable.ew[470] = {
	name = "Oskar-Calov-Straße",
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
	name = "Zollikoferstraße",
	x = 2365.0 
}
streetTable.ew[474] = {
	name = "Schuhmachergäßchen",
	x = 2370.0 
}
streetTable.ew[475] = {
	name = "Liebertwolkwitzer Markt",
	x = 2375.0 
}
streetTable.ew[476] = {
	name = "Oberdorfstraße",
	x = 2380.0 
}
streetTable.ew[477] = {
	name = "Parthenstraße",
	x = 2385.0 
}
streetTable.ew[478] = {
	name = "Zum Alten Wasserwerk",
	x = 2390.0 
}
streetTable.ew[479] = {
	name = "Dahlienstraße",
	x = 2395.0 
}
streetTable.ew[480] = {
	name = "Herrmann-Meyer-Straße",
	x = 2400.0 
}
streetTable.ew[481] = {
	name = "Arno-Nitzsche-Straße",
	x = 2405.0 
}
streetTable.ew[482] = {
	name = "Schlehdornweg",
	x = 2410.0 
}
streetTable.ew[483] = {
	name = "Vordere Schlobachstraße",
	x = 2415.0 
}
streetTable.ew[484] = {
	name = "Büttnerweg",
	x = 2420.0 
}
streetTable.ew[485] = {
	name = "Diamantstraße",
	x = 2425.0 
}
streetTable.ew[486] = {
	name = "Veilchenweg",
	x = 2430.0 
}
streetTable.ew[487] = {
	name = "Arthur-Winkler-Straße",
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
	name = "Burghausener Straße",
	x = 2450.0 
}
streetTable.ew[491] = {
	name = "Zur Loberaue",
	x = 2455.0 
}
streetTable.ew[492] = {
	name = "Königsteinstraße",
	x = 2460.0 
}
streetTable.ew[493] = {
	name = "Bärlauchweg",
	x = 2465.0 
}
streetTable.ew[494] = {
	name = "Anton-Zickmantel-Straße",
	x = 2470.0 
}
streetTable.ew[495] = {
	name = "Rosenstraße",
	x = 2475.0 
}
streetTable.ew[496] = {
	name = "Stauffenbergstraße",
	x = 2480.0 
}
streetTable.ew[497] = {
	name = "Kreuzdornstraße",
	x = 2485.0 
}
streetTable.ew[498] = {
	name = "Eythraer Weg",
	x = 2490.0 
}
streetTable.ew[499] = {
	name = "Hugo-Junkers-Straße",
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
	name = "Breitschuhstraße",
	x = 2510.0 
}
streetTable.ew[503] = {
	name = "Papiermühlstraße",
	x = 2515.0 
}
streetTable.ew[504] = {
	name = "Lionstraße",
	x = 2520.0 
}
streetTable.ew[505] = {
	name = "Hilligerstraße",
	x = 2525.0 
}
streetTable.ew[506] = {
	name = "Aue",
	x = 2530.0 
}
streetTable.ew[507] = {
	name = "Friedrich-Naumann-Straße",
	x = 2535.0 
}
streetTable.ew[508] = {
	name = "Elsastraße",
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
	name = "Löwenzahnweg",
	x = 2555.0 
}
streetTable.ew[512] = {
	name = "Immenstraße",
	x = 2560.0 
}
streetTable.ew[513] = {
	name = "Arnikaweg",
	x = 2565.0 
}
streetTable.ew[514] = {
	name = "Hermundurenstraße",
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
	name = "Pater-Gordian-Straße",
	x = 2585.0 
}
streetTable.ew[518] = {
	name = "Schenkendorfstraße",
	x = 2590.0 
}
streetTable.ew[519] = {
	name = "Reichsbahnerstraße",
	x = 2595.0 
}
streetTable.ew[520] = {
	name = "Goetheweg",
	x = 2600.0 
}
streetTable.ew[521] = {
	name = "Travniker Straße",
	x = 2605.0 
}
streetTable.ew[522] = {
	name = "Kleiststraße",
	x = 2610.0 
}
streetTable.ew[523] = {
	name = "Cranachstraße",
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
	name = "Johannes-R.-Becher-Straße",
	x = 2630.0 
}
streetTable.ew[527] = {
	name = "Friedrich-List-Straße",
	x = 2635.0 
}
streetTable.ew[528] = {
	name = "Blumenweg",
	x = 2640.0 
}
streetTable.ew[529] = {
	name = "Leipziger Straße",
	x = 2645.0 
}
streetTable.ew[530] = {
	name = "Stöckelplatz",
	x = 2650.0 
}
streetTable.ew[531] = {
	name = "Wiederitzscher Straße",
	x = 2655.0 
}
streetTable.ew[532] = {
	name = "Lärchenweg",
	x = 2660.0 
}
streetTable.ew[533] = {
	name = "Pögnerstraße",
	x = 2665.0 
}
streetTable.ew[534] = {
	name = "Ritterstraße",
	x = 2670.0 
}
streetTable.ew[535] = {
	name = "Walnußweg",
	x = 2675.0 
}
streetTable.ew[536] = {
	name = "Logauweg",
	x = 2680.0 
}
streetTable.ew[537] = {
	name = "Connewitzer Straße",
	x = 2685.0 
}
streetTable.ew[538] = {
	name = "Norderneyer Weg",
	x = 2690.0 
}
streetTable.ew[539] = {
	name = "Hillerstraße",
	x = 2695.0 
}
streetTable.ew[540] = {
	name = "Poserstraße",
	x = 2700.0 
}
streetTable.ew[541] = {
	name = "Maienweg",
	x = 2705.0 
}
streetTable.ew[542] = {
	name = "Bernhard-Göring-Straße",
	x = 2710.0 
}
streetTable.ew[543] = {
	name = "Rennbahnweg",
	x = 2715.0 
}
streetTable.ew[544] = {
	name = "Wilhelm-Sammet-Straße",
	x = 2720.0 
}
streetTable.ew[545] = {
	name = "Friedrich-Ebert-Straße",
	x = 2725.0 
}
streetTable.ew[546] = {
	name = "Nagelstraße",
	x = 2730.0 
}
streetTable.ew[547] = {
	name = "Calaustraße",
	x = 2735.0 
}
streetTable.ew[548] = {
	name = "Adolf-Koppe-Straße",
	x = 2740.0 
}
streetTable.ew[549] = {
	name = "Fasanenhügel",
	x = 2745.0 
}
streetTable.ew[550] = {
	name = "Untere Eichstädtstraße",
	x = 2750.0 
}
streetTable.ew[551] = {
	name = "Dauthestraße",
	x = 2755.0 
}
streetTable.ew[552] = {
	name = "Pflaumenallee",
	x = 2760.0 
}
streetTable.ew[553] = {
	name = "Nürnberger Straße",
	x = 2765.0 
}
streetTable.ew[554] = {
	name = "Ferdinand-Jost-Straße",
	x = 2770.0 
}
streetTable.ew[555] = {
	name = "Bahnhofsallee",
	x = 2775.0 
}
streetTable.ew[556] = {
	name = "Coppistraße",
	x = 2780.0 
}
streetTable.ew[557] = {
	name = "Im Birkengrund",
	x = 2785.0 
}
streetTable.ew[558] = {
	name = "Benedixstraße",
	x = 2790.0 
}
streetTable.ew[559] = {
	name = "Wolffstraße",
	x = 2795.0 
}
streetTable.ew[560] = {
	name = "Kohlgartenweg",
	x = 2800.0 
}
streetTable.ew[561] = {
	name = "Fontanestraße",
	x = 2805.0 
}
streetTable.ew[562] = {
	name = "Lucknerstraße",
	x = 2810.0 
}
streetTable.ew[563] = {
	name = "Schwägrichenstraße",
	x = 2815.0 
}
streetTable.ew[564] = {
	name = "An der Märchenwiese",
	x = 2820.0 
}
streetTable.ew[565] = {
	name = "Reinhardtstraße",
	x = 2825.0 
}
streetTable.ew[566] = {
	name = "Radiusstraße",
	x = 2830.0 
}
streetTable.ew[567] = {
	name = "J.-C.-Hinrichs-Straße",
	x = 2835.0 
}
streetTable.ew[568] = {
	name = "Alter Amtshof",
	x = 2840.0 
}
streetTable.ew[569] = {
	name = "Gärtnereiweg",
	x = 2845.0 
}
streetTable.ew[570] = {
	name = "George-Bähr-Straße",
	x = 2850.0 
}
streetTable.ew[571] = {
	name = "Seidengasse",
	x = 2855.0 
}
streetTable.ew[572] = {
	name = "Meißner Straße",
	x = 2860.0 
}
streetTable.ew[573] = {
	name = "Zur Weißen Mark",
	x = 2865.0 
}
streetTable.ew[574] = {
	name = "Beipertstraße",
	x = 2870.0 
}
streetTable.ew[575] = {
	name = "Thomas-Müntzer-Straße",
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
	name = "Schauerstraße",
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
	name = "Herzberger Straße",
	x = 2905.0 
}
streetTable.ew[582] = {
	name = "Grüner Winkel",
	x = 2910.0 
}
streetTable.ew[583] = {
	name = "Hohenthalstraße",
	x = 2915.0 
}
streetTable.ew[584] = {
	name = "Seehausener Straße",
	x = 2920.0 
}
streetTable.ew[585] = {
	name = "Belterstraße",
	x = 2925.0 
}
streetTable.ew[586] = {
	name = "Sonnenblumenweg",
	x = 2930.0 
}
streetTable.ew[587] = {
	name = "Baaderstraße",
	x = 2935.0 
}
streetTable.ew[588] = {
	name = "Hempelstraße",
	x = 2940.0 
}
streetTable.ew[589] = {
	name = "Knauthainer Straße",
	x = 2945.0 
}
streetTable.ew[590] = {
	name = "Brandensteinstraße",
	x = 2950.0 
}
streetTable.ew[591] = {
	name = "Hamburger Straße",
	x = 2955.0 
}
streetTable.ew[592] = {
	name = "Albrecht-Dürer-Platz",
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
	name = "Fucikstraße",
	x = 2980.0 
}
streetTable.ew[597] = {
	name = "Hessenstraße",
	x = 2985.0 
}
streetTable.ew[598] = {
	name = "Tresckowstraße",
	x = 2990.0 
}
streetTable.ew[599] = {
	name = "Göhrenzer Weg",
	x = 2995.0 
}
streetTable.ew[600] = {
	name = "Dölziger Weg",
	x = 3000.0 
}
streetTable.ew[601] = {
	name = "Cradefelder Straße",
	x = 3005.0 
}
streetTable.ew[602] = {
	name = "Konrad-Hagen-Platz",
	x = 3010.0 
}
streetTable.ew[603] = {
	name = "Windorfer Straße",
	x = 3015.0 
}
streetTable.ew[604] = {
	name = "Wunderlichstraße",
	x = 3020.0 
}
streetTable.ew[605] = {
	name = "Auguste-Schmidt-Straße",
	x = 3025.0 
}
streetTable.ew[606] = {
	name = "Am Sonnenwinkel",
	x = 3030.0 
}
streetTable.ew[607] = {
	name = "Teichmannstraße",
	x = 3035.0 
}
streetTable.ew[608] = {
	name = "Müllerring",
	x = 3040.0 
}
streetTable.ew[609] = {
	name = "Möckernscher Weg",
	x = 3045.0 
}
streetTable.ew[610] = {
	name = "Mühlweg",
	x = 3050.0 
}
streetTable.ew[611] = {
	name = "Witkowskistraße",
	x = 3055.0 
}
streetTable.ew[612] = {
	name = "Kohrener Straße",
	x = 3060.0 
}
streetTable.ew[613] = {
	name = "Thierbacher Straße",
	x = 3065.0 
}
streetTable.ew[614] = {
	name = "Friedrich-Wolf-Straße",
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
	name = "Blankenburger Straße",
	x = 3085.0 
}
streetTable.ew[618] = {
	name = "Katzstraße",
	x = 3090.0 
}
streetTable.ew[619] = {
	name = "Arno-Bruchardt-Straße",
	x = 3095.0 
}
streetTable.ew[620] = {
	name = "Zum Förderturm",
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
	name = "Erfurter Straße",
	x = 3120.0 
}
streetTable.ew[625] = {
	name = "Bösenbergstraße",
	x = 3125.0 
}
streetTable.ew[626] = {
	name = "Lessingstraße",
	x = 3130.0 
}
streetTable.ew[627] = {
	name = "Dresdner Straße",
	x = 3135.0 
}
streetTable.ew[628] = {
	name = "Zur Schule",
	x = 3140.0 
}
streetTable.ew[629] = {
	name = "Geschwister-Scholl-Straße",
	x = 3145.0 
}
streetTable.ew[630] = {
	name = "Gerberstraße",
	x = 3150.0 
}
streetTable.ew[631] = {
	name = "Zimmerstraße",
	x = 3155.0 
}
streetTable.ew[632] = {
	name = "Hohe Straße",
	x = 3160.0 
}
streetTable.ew[633] = {
	name = "Dankwartstraße",
	x = 3165.0 
}
streetTable.ew[634] = {
	name = "Bodenreformweg",
	x = 3170.0 
}
streetTable.ew[635] = {
	name = "Weigelienstraße",
	x = 3175.0 
}
streetTable.ew[636] = {
	name = "Stöckelstraße",
	x = 3180.0 
}
streetTable.ew[637] = {
	name = "Hans-Marchwitza-Straße",
	x = 3185.0 
}
streetTable.ew[638] = {
	name = "An der Hauptstraße",
	x = 3190.0 
}
streetTable.ew[639] = {
	name = "Lazarusstraße",
	x = 3195.0 
}
streetTable.ew[640] = {
	name = "Georg-Schumann-Straße",
	x = 3200.0 
}
streetTable.ew[641] = {
	name = "An der Tabaksmühle",
	x = 3205.0 
}
streetTable.ew[642] = {
	name = "Stahmelner Höhe",
	x = 3210.0 
}
streetTable.ew[643] = {
	name = "Schönauer Straße",
	x = 3215.0 
}
streetTable.ew[644] = {
	name = "Kleine Gartenstraße",
	x = 3220.0 
}
streetTable.ew[645] = {
	name = "Hedwig-Burgheim-Straße",
	x = 3225.0 
}
streetTable.ew[646] = {
	name = "Franz-Schlobach-Straße",
	x = 3230.0 
}
streetTable.ew[647] = {
	name = "Paul-Schneider-Straße",
	x = 3235.0 
}
streetTable.ew[648] = {
	name = "Coppiplatz",
	x = 3240.0 
}
streetTable.ew[649] = {
	name = "Heinrich-Budde-Straße",
	x = 3245.0 
}
streetTable.ew[650] = {
	name = "Mühligstraße",
	x = 3250.0 
}
streetTable.ew[651] = {
	name = "Mitschurinstraße",
	x = 3255.0 
}
streetTable.ew[652] = {
	name = "Lagerhofstraße",
	x = 3260.0 
}
streetTable.ew[653] = {
	name = "Zeisigweg",
	x = 3265.0 
}
streetTable.ew[654] = {
	name = "Rochlitzstraße",
	x = 3270.0 
}
streetTable.ew[655] = {
	name = "Walter-Köhn-Straße",
	x = 3275.0 
}
streetTable.ew[656] = {
	name = "Sigismundstraße",
	x = 3280.0 
}
streetTable.ew[657] = {
	name = "Bremer Weg",
	x = 3285.0 
}
streetTable.ew[658] = {
	name = "Kiebitzstraße",
	x = 3290.0 
}
streetTable.ew[659] = {
	name = "Lermontowstraße",
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
	name = "Heisenbergstraße",
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
	name = "Blücherstraße",
	x = 3325.0 
}
streetTable.ew[666] = {
	name = "Gerichtsweg",
	x = 3330.0 
}
streetTable.ew[667] = {
	name = "Lobstädter Straße",
	x = 3335.0 
}
streetTable.ew[668] = {
	name = "Althener Straße",
	x = 3340.0 
}
streetTable.ew[669] = {
	name = "Baumeyerstraße",
	x = 3345.0 
}
streetTable.ew[670] = {
	name = "Untere Mühlenstraße",
	x = 3350.0 
}
streetTable.ew[671] = {
	name = "Gottleubaer Straße",
	x = 3355.0 
}
streetTable.ew[672] = {
	name = "Zehmenstraße",
	x = 3360.0 
}
streetTable.ew[673] = {
	name = "Sorbenstraße",
	x = 3365.0 
}
streetTable.ew[674] = {
	name = "Rehbacher Anger",
	x = 3370.0 
}
streetTable.ew[675] = {
	name = "Miltenberger Straße",
	x = 3375.0 
}
streetTable.ew[676] = {
	name = "Wiedebachstraße",
	x = 3380.0 
}
streetTable.ew[677] = {
	name = "Hammerstraße",
	x = 3385.0 
}
streetTable.ew[678] = {
	name = "Lampestraße",
	x = 3390.0 
}
streetTable.ew[679] = {
	name = "Straße der Einheit",
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
	name = "Täschners Garten",
	x = 3410.0 
}
streetTable.ew[683] = {
	name = "Lobelienweg",
	x = 3415.0 
}
streetTable.ew[684] = {
	name = "Sternbachstraße",
	x = 3420.0 
}
streetTable.ew[685] = {
	name = "Apostelstraße",
	x = 3425.0 
}
streetTable.ew[686] = {
	name = "Charlottenstraße",
	x = 3430.0 
}
streetTable.ew[687] = {
	name = "Gudrunstraße",
	x = 3435.0 
}
streetTable.ew[688] = {
	name = "Am Doppeladler",
	x = 3440.0 
}
streetTable.ew[689] = {
	name = "Flemmingstraße",
	x = 3445.0 
}
streetTable.ew[690] = {
	name = "Schillerplatz",
	x = 3450.0 
}
streetTable.ew[691] = {
	name = "Lipinskistraße",
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
	name = "Eichbergstraße",
	x = 3475.0 
}
streetTable.ew[696] = {
	name = "Seehausener Allee",
	x = 3480.0 
}
streetTable.ew[697] = {
	name = "Röntgenstraße",
	x = 3485.0 
}
streetTable.ew[698] = {
	name = "Denkmalsblick",
	x = 3490.0 
}
streetTable.ew[699] = {
	name = "Karl-Härting-Straße",
	x = 3495.0 
}
streetTable.ew[700] = {
	name = "Am Zuckmantel",
	x = 3500.0 
}
streetTable.ew[701] = {
	name = "Alte Holzhausener Straße",
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
	name = "Rolf-Axen-Straße",
	x = 3520.0 
}
streetTable.ew[705] = {
	name = "Lewienstraße",
	x = 3525.0 
}
streetTable.ew[706] = {
	name = "Am Lindeneck",
	x = 3530.0 
}
streetTable.ew[707] = {
	name = "Pöppelmannstraße",
	x = 3535.0 
}
streetTable.ew[708] = {
	name = "Karl-Heine-Straße",
	x = 3540.0 
}
streetTable.ew[709] = {
	name = "Bistumsweg",
	x = 3545.0 
}
streetTable.ew[710] = {
	name = "Hüfnerstraße",
	x = 3550.0 
}
streetTable.ew[711] = {
	name = "Christian-Ferkel-Straße",
	x = 3555.0 
}
streetTable.ew[712] = {
	name = "Wachbergallee",
	x = 3560.0 
}
streetTable.ew[713] = {
	name = "Pohlestraße",
	x = 3565.0 
}
streetTable.ew[714] = {
	name = "Fasanenweg",
	x = 3570.0 
}
streetTable.ew[715] = {
	name = "Rosenowstraße",
	x = 3575.0 
}
streetTable.ew[716] = {
	name = "Andreasstraße",
	x = 3580.0 
}
streetTable.ew[717] = {
	name = "Krostitzer Weg",
	x = 3585.0 
}
streetTable.ew[718] = {
	name = "Kunadstraße",
	x = 3590.0 
}
streetTable.ew[719] = {
	name = "Erika-von-Brockdorff-Straß",
	x = 3595.0 
}
streetTable.ew[720] = {
	name = "Bussardweg",
	x = 3600.0 
}
streetTable.ew[721] = {
	name = "Konradstraße",
	x = 3605.0 
}
streetTable.ew[722] = {
	name = "Herrenallee",
	x = 3610.0 
}
streetTable.ew[723] = {
	name = "Wiskenstraße",
	x = 3615.0 
}
streetTable.ew[724] = {
	name = "Brüderstraße",
	x = 3620.0 
}
streetTable.ew[725] = {
	name = "Rathausring",
	x = 3625.0 
}
streetTable.ew[726] = {
	name = "Stefan-Zweig-Straße",
	x = 3630.0 
}
streetTable.ew[727] = {
	name = "Langhansstraße",
	x = 3635.0 
}
streetTable.ew[728] = {
	name = "Gontscharowstraße",
	x = 3640.0 
}
streetTable.ew[729] = {
	name = "Kleine Gartensiedlung",
	x = 3645.0 
}
streetTable.ew[730] = {
	name = "Taubestraße",
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
	name = "Friedrichstraße",
	x = 3670.0 
}
streetTable.ew[735] = {
	name = "Franckestraße",
	x = 3675.0 
}
streetTable.ew[736] = {
	name = "Elsterstraße",
	x = 3680.0 
}
streetTable.ew[737] = {
	name = "Waldplatz",
	x = 3685.0 
}
streetTable.ew[738] = {
	name = "Dufourstraße",
	x = 3690.0 
}
streetTable.ew[739] = {
	name = "Heiterblickallee",
	x = 3695.0 
}
streetTable.ew[740] = {
	name = "Gaußstraße",
	x = 3700.0 
}
streetTable.ew[741] = {
	name = "Verlängerte Schwedenstraße",
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
	name = "Schönauer Ring",
	x = 3720.0 
}
streetTable.ew[745] = {
	name = "Heinrich-Mann-Straße",
	x = 3725.0 
}
streetTable.ew[746] = {
	name = "Gedikestraße",
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
	name = "Seifertshainer Straße",
	x = 3750.0 
}
streetTable.ew[751] = {
	name = "Sporergäßchen",
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
	name = "Jacobstraße",
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
	name = "Paul-Gruner-Straße",
	x = 3795.0 
}
streetTable.ew[760] = {
	name = "Auerbachstraße",
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
	name = "Obere Mühlenstraße",
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
	name = "Dornbergerstraße",
	x = 3830.0 
}
streetTable.ew[767] = {
	name = "Prinzenweg",
	x = 3835.0 
}
streetTable.ew[768] = {
	name = "Eisenacher Straße",
	x = 3840.0 
}
streetTable.ew[769] = {
	name = "Erdmannstraße",
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
	name = "Südblick",
	x = 3860.0 
}
streetTable.ew[773] = {
	name = "Raiffeisenstraße",
	x = 3865.0 
}
streetTable.ew[774] = {
	name = "Rudolph-Sack-Straße",
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
	name = "Bergerstraße",
	x = 3885.0 
}
streetTable.ew[778] = {
	name = "Gebrüder-Weber-Weg",
	x = 3890.0 
}
streetTable.ew[779] = {
	name = "Crusiusstraße",
	x = 3895.0 
}
streetTable.ew[780] = {
	name = "Kochstraße",
	x = 3900.0 
}
streetTable.ew[781] = {
	name = "Bonhoefferstraße",
	x = 3905.0 
}
streetTable.ew[782] = {
	name = "Lützner Plan",
	x = 3910.0 
}
streetTable.ew[783] = {
	name = "Stünzer Weg",
	x = 3915.0 
}
streetTable.ew[784] = {
	name = "Einsteinstraße",
	x = 3920.0 
}
streetTable.ew[785] = {
	name = "Martin-Herrmann-Straße",
	x = 3925.0 
}
streetTable.ew[786] = {
	name = "Zur Sägemühle",
	x = 3930.0 
}
streetTable.ew[787] = {
	name = "Polluxweg",
	x = 3935.0 
}
streetTable.ew[788] = {
	name = "Gleitsmannstraße",
	x = 3940.0 
}
streetTable.ew[789] = {
	name = "Postreitergasse",
	x = 3945.0 
}
streetTable.ew[790] = {
	name = "Dennewitzer Straße",
	x = 3950.0 
}
streetTable.ew[791] = {
	name = "Am Gundorfer Teich",
	x = 3955.0 
}
streetTable.ew[792] = {
	name = "Rohrteichstraße",
	x = 3960.0 
}
streetTable.ew[793] = {
	name = "Spalierweg",
	x = 3965.0 
}
streetTable.ew[794] = {
	name = "Böttcherweg",
	x = 3970.0 
}
streetTable.ew[795] = {
	name = "Jadassohnstraße",
	x = 3975.0 
}
streetTable.ew[796] = {
	name = "Grasweg",
	x = 3980.0 
}
streetTable.ew[797] = {
	name = "Diakonissenstraße",
	x = 3985.0 
}
streetTable.ew[798] = {
	name = "Alte Theklaer Straße",
	x = 3990.0 
}
streetTable.ew[799] = {
	name = "Mitschurinring",
	x = 3995.0 
}
streetTable.ew[800] = {
	name = "Alte Dübener Landstraße",
	x = 4000.0 
}
streetTable.ew[801] = {
	name = "Breite Allee",
	x = 4005.0 
}
streetTable.ew[802] = {
	name = "Heilbronner Straße",
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
	name = "Radefelder Straße",
	x = 4030.0 
}
streetTable.ew[807] = {
	name = "Albert-Schweitzer-Straße",
	x = 4035.0 
}
streetTable.ew[808] = {
	name = "Gretschelstraße",
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
	name = "Erlanger Straße",
	x = 4055.0 
}
streetTable.ew[812] = {
	name = "Adolf-Damaschke-Straße",
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
	name = "Engertstraße",
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
	name = "Reiskestraße",
	x = 4095.0 
}
streetTable.ew[820] = {
	name = "Salzhandelsstraße",
	x = 4100.0 
}
streetTable.ew[821] = {
	name = "Kutscherweg",
	x = 4105.0 
}
streetTable.ew[822] = {
	name = "Rembrandtstraße",
	x = 4110.0 
}
streetTable.ew[823] = {
	name = "Hirzelstraße",
	x = 4115.0 
}
streetTable.ew[824] = {
	name = "Schönauer Lachen",
	x = 4120.0 
}
streetTable.ew[825] = {
	name = "Kurt-Weill-Straße",
	x = 4125.0 
}
streetTable.ew[826] = {
	name = "Glockenstraße",
	x = 4130.0 
}
streetTable.ew[827] = {
	name = "Verlängerte Max-Liebermann-Straße",
	x = 4135.0 
}
streetTable.ew[828] = {
	name = "Nikolai-Rumjanzew-Straße",
	x = 4140.0 
}
streetTable.ew[829] = {
	name = "Thärigenstraße",
	x = 4145.0 
}
streetTable.ew[830] = {
	name = "Gontardweg",
	x = 4150.0 
}
streetTable.ew[831] = {
	name = "Äußerer Zeisigweg",
	x = 4155.0 
}
streetTable.ew[832] = {
	name = "Thiemstraße",
	x = 4160.0 
}
streetTable.ew[833] = {
	name = "Buschenaustraße",
	x = 4165.0 
}
streetTable.ew[834] = {
	name = "Arthur-Heidrich-Platz",
	x = 4170.0 
}
streetTable.ew[835] = {
	name = "Tucholskystraße",
	x = 4175.0 
}
streetTable.ew[836] = {
	name = "Flößenstraße",
	x = 4180.0 
}
streetTable.ew[837] = {
	name = "Forchheimer Straße",
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
	name = "Lumumbastraße",
	x = 4215.0 
}
streetTable.ew[844] = {
	name = "Möbiusplatz",
	x = 4220.0 
}
streetTable.ew[845] = {
	name = "Dorfstraße",
	x = 4225.0 
}
streetTable.ew[846] = {
	name = "Außenring",
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
	name = "Gustav-Mahler-Straße",
	x = 4260.0 
}
streetTable.ew[853] = {
	name = "Kleinpösnaer Anger",
	x = 4265.0 
}
streetTable.ew[854] = {
	name = "Kopernikusstraße",
	x = 4270.0 
}
streetTable.ew[855] = {
	name = "Straße am See",
	x = 4275.0 
}
streetTable.ew[856] = {
	name = "Gemeindeamtsstraße",
	x = 4280.0 
}
streetTable.ew[857] = {
	name = "Siriusweg",
	x = 4285.0 
}
streetTable.ew[858] = {
	name = "Wodanstraße",
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
	name = "Kömmlitzer Weg",
	x = 4305.0 
}
streetTable.ew[862] = {
	name = "Zur Kuhweide",
	x = 4310.0 
}
streetTable.ew[863] = {
	name = "Kregelstraße",
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
	name = "Prinz-Eugen-Straße",
	x = 4330.0 
}
streetTable.ew[867] = {
	name = "Sellerhäuser Straße",
	x = 4335.0 
}
streetTable.ew[868] = {
	name = "Pölitzstraße",
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
	name = "Gustav-Scheibe-Straße",
	x = 4360.0 
}
streetTable.ew[873] = {
	name = "Gotenstraße",
	x = 4365.0 
}
streetTable.ew[874] = {
	name = "Suhler Straße",
	x = 4370.0 
}
streetTable.ew[875] = {
	name = "An der Kirschallee",
	x = 4375.0 
}
streetTable.ew[876] = {
	name = "Lauchstädter Straße",
	x = 4380.0 
}
streetTable.ew[877] = {
	name = "Zur Lindenhöhe",
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
	name = "Karl-Vogel-Straße",
	x = 4400.0 
}
streetTable.ew[881] = {
	name = "Franzosenallee",
	x = 4405.0 
}
streetTable.ew[882] = {
	name = "Schwindstraße",
	x = 4410.0 
}
streetTable.ew[883] = {
	name = "Edisonstraße",
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
	name = "Klenaustraße",
	x = 4430.0 
}
streetTable.ew[887] = {
	name = "Goethestraße",
	x = 4435.0 
}
streetTable.ew[888] = {
	name = "Dachauer Straße",
	x = 4440.0 
}
streetTable.ew[889] = {
	name = "Dübener Landstraße",
	x = 4445.0 
}
streetTable.ew[890] = {
	name = "Akeleiweg",
	x = 4450.0 
}
streetTable.ew[891] = {
	name = "Crottendorfer Straße",
	x = 4455.0 
}
streetTable.ew[892] = {
	name = "Melker Weg",
	x = 4460.0 
}
streetTable.ew[893] = {
	name = "Kapellenstraße",
	x = 4465.0 
}
streetTable.ew[894] = {
	name = "Weinbergstraße",
	x = 4470.0 
}
streetTable.ew[895] = {
	name = "Eberlestraße",
	x = 4475.0 
}
streetTable.ew[896] = {
	name = "Jaspisstraße",
	x = 4480.0 
}
streetTable.ew[897] = {
	name = "Würzburger Straße",
	x = 4485.0 
}
streetTable.ew[898] = {
	name = "Martin-Drucker-Straße",
	x = 4490.0 
}
streetTable.ew[899] = {
	name = "Mörikestraße",
	x = 4495.0 
}
streetTable.ew[900] = {
	name = "An der Meusdorfer Höhe",
	x = 4500.0 
}
streetTable.ew[901] = {
	name = "Rosentalgasse",
	x = 4505.0 
}
streetTable.ew[902] = {
	name = "Rotfuchsstraße",
	x = 4510.0 
}
streetTable.ew[903] = {
	name = "Plaußiger Dorfstraße",
	x = 4515.0 
}
streetTable.ew[904] = {
	name = "Lochmannstraße",
	x = 4520.0 
}
streetTable.ew[905] = {
	name = "Alter Marktweg",
	x = 4525.0 
}
streetTable.ew[906] = {
	name = "An der Alten Mühle",
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
	name = "Graßdorfer Straße",
	x = 4545.0 
}
streetTable.ew[910] = {
	name = "Dreiecksweg",
	x = 4550.0 
}
streetTable.ew[911] = {
	name = "Aurelienstraße",
	x = 4555.0 
}
streetTable.ew[912] = {
	name = "Görlitzer Straße",
	x = 4560.0 
}
streetTable.ew[913] = {
	name = "Brunhildstraße",
	x = 4565.0 
}
streetTable.ew[914] = {
	name = "Werkstättenweg",
	x = 4570.0 
}
streetTable.ew[915] = {
	name = "Leuckartstraße",
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
	name = "Gohliser Straße",
	x = 4590.0 
}
streetTable.ew[919] = {
	name = "Zum Birkenwäldchen",
	x = 4595.0 
}
streetTable.ew[920] = {
	name = "Tiefe Straße",
	x = 4600.0 
}
streetTable.ew[921] = {
	name = "Lindenthaler Straße",
	x = 4605.0 
}
streetTable.ew[922] = {
	name = "Lange Straße",
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
	name = "Hänicher Mühle",
	x = 4625.0 
}
streetTable.ew[926] = {
	name = "Hersvelder Straße",
	x = 4630.0 
}
streetTable.ew[927] = {
	name = "Maria-Grollmuß-Straße",
	x = 4635.0 
}
streetTable.ew[928] = {
	name = "Am Pösgraben",
	x = 4640.0 
}
streetTable.ew[929] = {
	name = "Kasseler Straße",
	x = 4645.0 
}
streetTable.ew[930] = {
	name = "Blanchardweg",
	x = 4650.0 
}
streetTable.ew[931] = {
	name = "Wollkämmereistraße",
	x = 4655.0 
}
streetTable.ew[932] = {
	name = "Wichernstraße",
	x = 4660.0 
}
streetTable.ew[933] = {
	name = "Am Brunnen",
	x = 4665.0 
}
streetTable.ew[934] = {
	name = "Hellriegelstraße",
	x = 4670.0 
}
streetTable.ew[935] = {
	name = "Marienplatz",
	x = 4675.0 
}
streetTable.ew[936] = {
	name = "Mühlparkweg",
	x = 4680.0 
}
streetTable.ew[937] = {
	name = "Stötteritzer Landstraße",
	x = 4685.0 
}
streetTable.ew[938] = {
	name = "Dürrplatz",
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
	name = "Renftstraße",
	x = 4705.0 
}
streetTable.ew[942] = {
	name = "Schlesierstraße",
	x = 4710.0 
}
streetTable.ew[943] = {
	name = "Cohnheimstraße",
	x = 4715.0 
}
streetTable.ew[944] = {
	name = "Prager Straße",
	x = 4720.0 
}
streetTable.ew[945] = {
	name = "Alte Seehausener Straße",
	x = 4725.0 
}
streetTable.ew[946] = {
	name = "Wilhelm-His-Straße",
	x = 4730.0 
}
streetTable.ew[947] = {
	name = "Lausener Dorfplatz",
	x = 4735.0 
}
streetTable.ew[948] = {
	name = "Rousseaustraße",
	x = 4740.0 
}
streetTable.ew[949] = {
	name = "Drescherweg",
	x = 4745.0 
}
streetTable.ew[950] = {
	name = "Annaberger Straße",
	x = 4750.0 
}
streetTable.ew[951] = {
	name = "Weinbrennerstraße",
	x = 4755.0 
}
streetTable.ew[952] = {
	name = "Löhrstraße",
	x = 4760.0 
}
streetTable.ew[953] = {
	name = "Bogislawstraße",
	x = 4765.0 
}
streetTable.ew[954] = {
	name = "Bussestraße",
	x = 4770.0 
}
streetTable.ew[955] = {
	name = "Packhofstraße",
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
	name = "Seebenischer Straße",
	x = 4795.0 
}
streetTable.ew[960] = {
	name = "Prof.-Andreas-Schubert-Straße",
	x = 4800.0 
}
streetTable.ew[961] = {
	name = "Äußere Raustraße",
	x = 4805.0 
}
streetTable.ew[962] = {
	name = "Straße der 53",
	x = 4810.0 
}
streetTable.ew[963] = {
	name = "Staffelsteinstraße",
	x = 4815.0 
}
streetTable.ew[964] = {
	name = "Steffensstraße",
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
	name = "Katzmannstraße",
	x = 4835.0 
}
streetTable.ew[968] = {
	name = "Stollberger Straße",
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
	name = "Magdeburger Straße",
	x = 4855.0 
}
streetTable.ew[972] = {
	name = "Paul-Heyse-Straße",
	x = 4860.0 
}
streetTable.ew[973] = {
	name = "Kehrwieder",
	x = 4865.0 
}
streetTable.ew[974] = {
	name = "Karl-Mannsfeld-Straße",
	x = 4870.0 
}
streetTable.ew[975] = {
	name = "Ponickaustraße",
	x = 4875.0 
}
streetTable.ew[976] = {
	name = "Morungenstraße",
	x = 4880.0 
}
streetTable.ew[977] = {
	name = "Krokerstraße",
	x = 4885.0 
}
streetTable.ew[978] = {
	name = "Zolaweg",
	x = 4890.0 
}
streetTable.ew[979] = {
	name = "Schönbergstraße",
	x = 4895.0 
}
streetTable.ew[980] = {
	name = "Lützowstraße",
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
	name = "Brackestraße",
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
	name = "Witzlebenstraße",
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
	name = "Vivaldistraße",
	x = 4955.0 
}
streetTable.ew[992] = {
	name = "Am Hohen Graben",
	x = 4960.0 
}
streetTable.ew[993] = {
	name = "Petzscher Straße",
	x = 4965.0 
}
streetTable.ew[994] = {
	name = "Im Zipfel",
	x = 4970.0 
}
streetTable.ew[995] = {
	name = "Otto-Adam-Straße",
	x = 4975.0 
}
streetTable.ew[996] = {
	name = "Geyerstraße",
	x = 4980.0 
}
streetTable.ew[997] = {
	name = "Hussitenstraße",
	x = 4985.0 
}
streetTable.ew[998] = {
	name = "Liviastraße",
	x = 4990.0 
}
streetTable.ew[999] = {
	name = "Deutsche Einheit",
	x = 4995.0 
}
streetTable.ew[1000] = {
	name = "Braustraße",
	x = 5000.0 
}
streetTable.ew[1001] = {
	name = "Quedlinburger Straße",
	x = 5005.0 
}
streetTable.ew[1002] = {
	name = "Leo-Tolstoi-Straße",
	x = 5010.0 
}
streetTable.ew[1003] = {
	name = "Rudolf-Breitscheid-Straße",
	x = 5015.0 
}
streetTable.ew[1004] = {
	name = "Zu den Drei Kugeln",
	x = 5020.0 
}
streetTable.ew[1005] = {
	name = "Landhausstraße",
	x = 5025.0 
}
streetTable.ew[1006] = {
	name = "Gletschersteinstraße",
	x = 5030.0 
}
streetTable.ew[1007] = {
	name = "Winzerweg",
	x = 5035.0 
}
streetTable.ew[1008] = {
	name = "Gleisstraße",
	x = 5040.0 
}
streetTable.ew[1009] = {
	name = "Am Dorfplatz",
	x = 5045.0 
}
streetTable.ew[1010] = {
	name = "Fritz-Simonis-Straße",
	x = 5050.0 
}
streetTable.ew[1011] = {
	name = "Johann-Adolf-Straße",
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
	name = "Harkortstraße",
	x = 5070.0 
}
streetTable.ew[1015] = {
	name = "Karl-Winkler-Straße",
	x = 5075.0 
}
streetTable.ew[1016] = {
	name = "Industriestraße",
	x = 5080.0 
}
streetTable.ew[1017] = {
	name = "Dürrstraße",
	x = 5085.0 
}
streetTable.ew[1018] = {
	name = "Hermann-Brade-Straße",
	x = 5090.0 
}
streetTable.ew[1019] = {
	name = "Gundermannstraße",
	x = 5095.0 
}
streetTable.ew[1020] = {
	name = "Kastorweg",
	x = 5100.0 
}
streetTable.ew[1021] = {
	name = "Wielandstraße",
	x = 5105.0 
}
streetTable.ew[1022] = {
	name = "Baumschulenweg",
	x = 5110.0 
}
streetTable.ew[1023] = {
	name = "Italiaanderstraße",
	x = 5115.0 
}
streetTable.ew[1024] = {
	name = "Berberitzenstraße",
	x = 5120.0 
}
streetTable.ew[1025] = {
	name = "Birkenweg",
	x = 5125.0 
}
streetTable.ew[1026] = {
	name = "Auenhainer Straße",
	x = 5130.0 
}
streetTable.ew[1027] = {
	name = "Onckenstraße",
	x = 5135.0 
}
streetTable.ew[1028] = {
	name = "Geraer Straße",
	x = 5140.0 
}
streetTable.ew[1029] = {
	name = "Gorbitzer Straße",
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
	name = "Giebnerstraße",
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
	name = "Josephinenstraße",
	x = 5175.0 
}
streetTable.ew[1036] = {
	name = "Carl-Hampel-Platz",
	x = 5180.0 
}
streetTable.ew[1037] = {
	name = "Thüringer Straße",
	x = 5185.0 
}
streetTable.ew[1038] = {
	name = "Augustusplatz",
	x = 5190.0 
}
streetTable.ew[1039] = {
	name = "Auenstraße",
	x = 5195.0 
}
streetTable.ew[1040] = {
	name = "Wiesenwinkel",
	x = 5200.0 
}
streetTable.ew[1041] = {
	name = "Marcher Straße",
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
	name = "Wilhelmstraße",
	x = 5220.0 
}
streetTable.ew[1045] = {
	name = "Oschatzer Straße",
	x = 5225.0 
}
streetTable.ew[1046] = {
	name = "Martin-Luther-Ring",
	x = 5230.0 
}
streetTable.ew[1047] = {
	name = "Riesaer Straße",
	x = 5235.0 
}
streetTable.ew[1048] = {
	name = "Käthe-Kollwitz-Straße",
	x = 5240.0 
}
streetTable.ew[1049] = {
	name = "Gotzkowskystraße",
	x = 5245.0 
}
streetTable.ew[1050] = {
	name = "Bertha-Beckmann-Weg",
	x = 5250.0 
}
streetTable.ew[1051] = {
	name = "Carl-Maria-von-Weber-Straße",
	x = 5255.0 
}
streetTable.ew[1052] = {
	name = "Johann-Eck-Straße",
	x = 5260.0 
}
streetTable.ew[1053] = {
	name = "Untere Nordstraße",
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
	name = "Nieritzstraße",
	x = 5285.0 
}
streetTable.ew[1058] = {
	name = "An der Eisenbahn",
	x = 5290.0 
}
streetTable.ew[1059] = {
	name = "Wettiner Straße",
	x = 5295.0 
}
streetTable.ew[1060] = {
	name = "Möbiusstraße",
	x = 5300.0 
}
streetTable.ew[1061] = {
	name = "Klempererstraße",
	x = 5305.0 
}
streetTable.ew[1062] = {
	name = "Stifterstraße",
	x = 5310.0 
}
streetTable.ew[1063] = {
	name = "Beuchaer Straße",
	x = 5315.0 
}
streetTable.ew[1064] = {
	name = "Leupoldstraße",
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
	name = "Gottschallstraße",
	x = 5335.0 
}
streetTable.ew[1068] = {
	name = "Saphirstraße",
	x = 5340.0 
}
streetTable.ew[1069] = {
	name = "Mommsenstraße",
	x = 5345.0 
}
streetTable.ew[1070] = {
	name = "Thomasgasse",
	x = 5350.0 
}
streetTable.ew[1071] = {
	name = "Schützstraße",
	x = 5355.0 
}
streetTable.ew[1072] = {
	name = "Am ".."Übergang",
	x = 5360.0 
}
streetTable.ew[1073] = {
	name = "Jungmannstraße",
	x = 5365.0 
}
streetTable.ew[1074] = {
	name = "Maiglöckchenweg",
	x = 5370.0 
}
streetTable.ew[1075] = {
	name = "Hermelinstraße",
	x = 5375.0 
}
streetTable.ew[1076] = {
	name = "Emil-März-Straße",
	x = 5380.0 
}
streetTable.ew[1077] = {
	name = "Berggartenstraße",
	x = 5385.0 
}
streetTable.ew[1078] = {
	name = "Otto-Runki-Platz",
	x = 5390.0 
}
streetTable.ew[1079] = {
	name = "Zillerstraße",
	x = 5395.0 
}
streetTable.ew[1080] = {
	name = "Oberholzstraße",
	x = 5400.0 
}
streetTable.ew[1081] = {
	name = "Stockartstraße",
	x = 5405.0 
}
streetTable.ew[1082] = {
	name = "Alter Kirchweg",
	x = 5410.0 
}
streetTable.ew[1083] = {
	name = "Manetstraße",
	x = 5415.0 
}
streetTable.ew[1084] = {
	name = "Wieselstraße",
	x = 5420.0 
}
streetTable.ew[1085] = {
	name = "Leonhard-Frank-Straße",
	x = 5425.0 
}
streetTable.ew[1086] = {
	name = "Mölkauer Straße",
	x = 5430.0 
}
streetTable.ew[1087] = {
	name = "Kuhnaustraße",
	x = 5435.0 
}
streetTable.ew[1088] = {
	name = "Naunhofer Straße",
	x = 5440.0 
}
streetTable.ew[1089] = {
	name = "Gerhardstraße",
	x = 5445.0 
}
streetTable.ew[1090] = {
	name = "Breisgaustraße",
	x = 5450.0 
}
streetTable.ew[1091] = {
	name = "Breunsdorffstraße",
	x = 5455.0 
}
streetTable.ew[1092] = {
	name = "Schulstraße",
	x = 5460.0 
}
streetTable.ew[1093] = {
	name = "Holbergstraße",
	x = 5465.0 
}
streetTable.ew[1094] = {
	name = "Berkaer Weg",
	x = 5470.0 
}
streetTable.ew[1095] = {
	name = "Sylter Straße",
	x = 5475.0 
}
streetTable.ew[1096] = {
	name = "Deutsches Heim",
	x = 5480.0 
}
streetTable.ew[1097] = {
	name = "Markranstädter Straße",
	x = 5485.0 
}
streetTable.ew[1098] = {
	name = "Schrägweg",
	x = 5490.0 
}
streetTable.ew[1099] = {
	name = "Undinenweg",
	x = 5495.0 
}
streetTable.ew[1100] = {
	name = "Kulkwitzer Straße",
	x = 5500.0 
}
streetTable.ew[1101] = {
	name = "Alte Straße",
	x = 5505.0 
}
streetTable.ew[1102] = {
	name = "Mauersbergerstraße",
	x = 5510.0 
}
streetTable.ew[1103] = {
	name = "Permoserstraße",
	x = 5515.0 
}
streetTable.ew[1104] = {
	name = "Pfaffenweg",
	x = 5520.0 
}
streetTable.ew[1105] = {
	name = "Krätzbergstraße",
	x = 5525.0 
}
streetTable.ew[1106] = {
	name = "Humperdinckstraße",
	x = 5530.0 
}
streetTable.ew[1107] = {
	name = "Otto-Engert-Straße",
	x = 5535.0 
}
streetTable.ew[1108] = {
	name = "Ploßstraße",
	x = 5540.0 
}
streetTable.ew[1109] = {
	name = "Seestraße",
	x = 5545.0 
}
streetTable.ew[1110] = {
	name = "Marienbrunnenstraße",
	x = 5550.0 
}
streetTable.ew[1111] = {
	name = "Am Gutspark",
	x = 5555.0 
}
streetTable.ew[1112] = {
	name = "Inselstraße",
	x = 5560.0 
}
streetTable.ew[1113] = {
	name = "Hoffmannstraße",
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
	name = "Ursula-Götze-Straße",
	x = 5585.0 
}
streetTable.ew[1118] = {
	name = "Karlsruher Straße",
	x = 5590.0 
}
streetTable.ew[1119] = {
	name = "Heinrich-Heine-Straße",
	x = 5595.0 
}
streetTable.ew[1120] = {
	name = "Frankenweg",
	x = 5600.0 
}
streetTable.ew[1121] = {
	name = "Großpösnaer Straße",
	x = 5605.0 
}
streetTable.ew[1122] = {
	name = "Robert-Hanf-Weg",
	x = 5610.0 
}
streetTable.ew[1123] = {
	name = "Teubnerstraße",
	x = 5615.0 
}
streetTable.ew[1124] = {
	name = "Amselstraße",
	x = 5620.0 
}
streetTable.ew[1125] = {
	name = "Pfarrholzstraße",
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
	name = "Rathenaustraße",
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
	name = "Schletterstraße",
	x = 5655.0 
}
streetTable.ew[1132] = {
	name = "Glafeystraße",
	x = 5660.0 
}
streetTable.ew[1133] = {
	name = "Lützner Straße",
	x = 5665.0 
}
streetTable.ew[1134] = {
	name = "Lichtenfelser Straße",
	x = 5670.0 
}
streetTable.ew[1135] = {
	name = "Lorenzstraße",
	x = 5675.0 
}
streetTable.ew[1136] = {
	name = "Heuweg",
	x = 5680.0 
}
streetTable.ew[1137] = {
	name = "Kamenzer Straße",
	x = 5685.0 
}
streetTable.ew[1138] = {
	name = "Karl-Bücher-Straße",
	x = 5690.0 
}
streetTable.ew[1139] = {
	name = "Werkstättenstraße",
	x = 5695.0 
}
streetTable.ew[1140] = {
	name = "Kutschbachweg",
	x = 5700.0 
}
streetTable.ew[1141] = {
	name = "Eduardstraße",
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
	name = "Teslastraße",
	x = 5720.0 
}
streetTable.ew[1145] = {
	name = "Rehwagenstraße",
	x = 5725.0 
}
streetTable.ew[1146] = {
	name = "Wehrmannstraße",
	x = 5730.0 
}
streetTable.ew[1147] = {
	name = "Mascovstraße",
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
	name = "Edmond-Kaiser-Straße",
	x = 5760.0 
}
streetTable.ew[1153] = {
	name = "Renkwitzstraße",
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
	name = "Straßbergerstraße",
	x = 5790.0 
}
streetTable.ew[1159] = {
	name = "Hauffweg",
	x = 5795.0 
}
streetTable.ew[1160] = {
	name = "Watzdorfstraße",
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
	name = "Simsonstraße",
	x = 5830.0 
}
streetTable.ew[1167] = {
	name = "Thietmarstraße",
	x = 5835.0 
}
streetTable.ew[1168] = {
	name = "Hildburgstraße",
	x = 5840.0 
}
streetTable.ew[1169] = {
	name = "Kleinpösnaer Straße",
	x = 5845.0 
}
streetTable.ew[1170] = {
	name = "Reichpietschstraße",
	x = 5850.0 
}
streetTable.ew[1171] = {
	name = "Joachim-Gottschalk-Weg",
	x = 5855.0 
}
streetTable.ew[1172] = {
	name = "Robert-Volkmann-Straße",
	x = 5860.0 
}
streetTable.ew[1173] = {
	name = "Littstraße",
	x = 5865.0 
}
streetTable.ew[1174] = {
	name = "Sachsenseite",
	x = 5870.0 
}
streetTable.ew[1175] = {
	name = "Hähnelstraße",
	x = 5875.0 
}
streetTable.ew[1176] = {
	name = "Steinpilzweg",
	x = 5880.0 
}
streetTable.ew[1177] = {
	name = "Dähnhardtstraße",
	x = 5885.0 
}
streetTable.ew[1178] = {
	name = "Hermann-Schein-Straße",
	x = 5890.0 
}
streetTable.ew[1179] = {
	name = "Olbrichtstraße",
	x = 5895.0 
}
streetTable.ew[1180] = {
	name = "Salomonstraße",
	x = 5900.0 
}
streetTable.ew[1181] = {
	name = "Jouleweg",
	x = 5905.0 
}
streetTable.ew[1182] = {
	name = "Dr.-Margarete-Blank-Straße",
	x = 5910.0 
}
streetTable.ew[1183] = {
	name = "Kissinger Straße",
	x = 5915.0 
}
streetTable.ew[1184] = {
	name = "Mückenhainer Weg",
	x = 5920.0 
}
streetTable.ew[1185] = {
	name = "Rückertstraße",
	x = 5925.0 
}
streetTable.ew[1186] = {
	name = "Triftweg",
	x = 5930.0 
}
streetTable.ew[1187] = {
	name = "Brahestraße",
	x = 5935.0 
}
streetTable.ew[1188] = {
	name = "Max-Pommer-Straße",
	x = 5940.0 
}
streetTable.ew[1189] = {
	name = "Waldstraße",
	x = 5945.0 
}
streetTable.ew[1190] = {
	name = "Kirschbergstraße",
	x = 5950.0 
}
streetTable.ew[1191] = {
	name = "Fliederhof",
	x = 5955.0 
}
streetTable.ew[1192] = {
	name = "Koloniestraße",
	x = 5960.0 
}
streetTable.ew[1193] = {
	name = "Strümpellstraße",
	x = 5965.0 
}
streetTable.ew[1194] = {
	name = "Defreggerweg",
	x = 5970.0 
}
streetTable.ew[1195] = {
	name = "Kurt-Hänselmann-Weg",
	x = 5975.0 
}
streetTable.ew[1196] = {
	name = "Lausicker Straße",
	x = 5980.0 
}
streetTable.ew[1197] = {
	name = "An der Streuobstwiese",
	x = 5985.0 
}
streetTable.ew[1198] = {
	name = "Les-Epesses-Straße",
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
	name = "Jöhstädter Straße",
	y = 10.0 
}
streetTable.sn[3] = {
	name = "Fuchspfad",
	y = 15.0 
}
streetTable.sn[4] = {
	name = "Hans-Weigel-Straße",
	y = 20.0 
}
streetTable.sn[5] = {
	name = "Schachtstraße",
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
	name = "Lamprechtstraße",
	y = 40.0 
}
streetTable.sn[9] = {
	name = "Zaucheweg",
	y = 45.0 
}
streetTable.sn[10] = {
	name = "Stentzlerstraße",
	y = 50.0 
}
streetTable.sn[11] = {
	name = "Lotterstraße",
	y = 55.0 
}
streetTable.sn[12] = {
	name = "Ahorngasse",
	y = 60.0 
}
streetTable.sn[13] = {
	name = "Hans-Driesch-Straße",
	y = 65.0 
}
streetTable.sn[14] = {
	name = "Diezmannstraße",
	y = 70.0 
}
streetTable.sn[15] = {
	name = "Nonnenstraße",
	y = 75.0 
}
streetTable.sn[16] = {
	name = "Roßmarktstraße",
	y = 80.0 
}
streetTable.sn[17] = {
	name = "Buchenweg",
	y = 85.0 
}
streetTable.sn[18] = {
	name = "Eichhörnchenweg",
	y = 90.0 
}
streetTable.sn[19] = {
	name = "Wangerooger Weg",
	y = 95.0 
}
streetTable.sn[20] = {
	name = "Mosenthinstraße",
	y = 100.0 
}
streetTable.sn[21] = {
	name = "Florian-Geyer-Platz",
	y = 105.0 
}
streetTable.sn[22] = {
	name = "Friedrich-Dittes-Straße",
	y = 110.0 
}
streetTable.sn[23] = {
	name = "Schiebestraße",
	y = 115.0 
}
streetTable.sn[24] = {
	name = "Wachauer Straße",
	y = 120.0 
}
streetTable.sn[25] = {
	name = "Mohnweg",
	y = 125.0 
}
streetTable.sn[26] = {
	name = "Salzstraße",
	y = 130.0 
}
streetTable.sn[27] = {
	name = "Brommeweg",
	y = 135.0 
}
streetTable.sn[28] = {
	name = "Keplerstraße",
	y = 140.0 
}
streetTable.sn[29] = {
	name = "Theodor-Neubauer-Straße",
	y = 145.0 
}
streetTable.sn[30] = {
	name = "Wilhelm-Michel-Straße",
	y = 150.0 
}
streetTable.sn[31] = {
	name = "Hohenheidaer Straße",
	y = 155.0 
}
streetTable.sn[32] = {
	name = "Augustinerstraße",
	y = 160.0 
}
streetTable.sn[33] = {
	name = "Pohlentzstraße",
	y = 165.0 
}
streetTable.sn[34] = {
	name = "Lindenthaler Hauptstraße",
	y = 170.0 
}
streetTable.sn[35] = {
	name = "Rodinweg",
	y = 175.0 
}
streetTable.sn[36] = {
	name = "Friedensstraße",
	y = 180.0 
}
streetTable.sn[37] = {
	name = "Renoirstraße",
	y = 185.0 
}
streetTable.sn[38] = {
	name = "Mockauer Straße",
	y = 190.0 
}
streetTable.sn[39] = {
	name = "Ludwig-Thoma-Weg",
	y = 195.0 
}
streetTable.sn[40] = {
	name = "Löbauer Straße",
	y = 200.0 
}
streetTable.sn[41] = {
	name = "Zur Alten Sandgrube",
	y = 205.0 
}
streetTable.sn[42] = {
	name = "Ottostraße",
	y = 210.0 
}
streetTable.sn[43] = {
	name = "Eigenheimstraße",
	y = 215.0 
}
streetTable.sn[44] = {
	name = "Salzmannstraße",
	y = 220.0 
}
streetTable.sn[45] = {
	name = "Wittestraße",
	y = 225.0 
}
streetTable.sn[46] = {
	name = "Dornröschenweg",
	y = 230.0 
}
streetTable.sn[47] = {
	name = "Ranstädter Steinweg",
	y = 235.0 
}
streetTable.sn[48] = {
	name = "Mechlerstraße",
	y = 240.0 
}
streetTable.sn[49] = {
	name = "Mittelstraße",
	y = 245.0 
}
streetTable.sn[50] = {
	name = "Zirkonstraße",
	y = 250.0 
}
streetTable.sn[51] = {
	name = "Südtangente",
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
	name = "Georg-Große-Straße",
	y = 270.0 
}
streetTable.sn[55] = {
	name = "Westplatz",
	y = 275.0 
}
streetTable.sn[56] = {
	name = "Mozartstraße",
	y = 280.0 
}
streetTable.sn[57] = {
	name = "Oldenburger Straße",
	y = 285.0 
}
streetTable.sn[58] = {
	name = "Zum Wäldchen",
	y = 290.0 
}
streetTable.sn[59] = {
	name = "Mainzer Straße",
	y = 295.0 
}
streetTable.sn[60] = {
	name = "Osten-Sacken-Weg",
	y = 300.0 
}
streetTable.sn[61] = {
	name = "Grünauer Blick",
	y = 305.0 
}
streetTable.sn[62] = {
	name = "Feldweg",
	y = 310.0 
}
streetTable.sn[63] = {
	name = "Probsteistraße",
	y = 315.0 
}
streetTable.sn[64] = {
	name = "Kleeweg",
	y = 320.0 
}
streetTable.sn[65] = {
	name = "Körnerstraße",
	y = 325.0 
}
streetTable.sn[66] = {
	name = "Hüfferstraße",
	y = 330.0 
}
streetTable.sn[67] = {
	name = "Leopoldstraße",
	y = 335.0 
}
streetTable.sn[68] = {
	name = "Eythstraße",
	y = 340.0 
}
streetTable.sn[69] = {
	name = "Gmundener Weg",
	y = 345.0 
}
streetTable.sn[70] = {
	name = "Franz-Flemming-Straße",
	y = 350.0 
}
streetTable.sn[71] = {
	name = "Wilsnacker Straße",
	y = 355.0 
}
streetTable.sn[72] = {
	name = "Grauwackeweg",
	y = 360.0 
}
streetTable.sn[73] = {
	name = "Marschnerstraße",
	y = 365.0 
}
streetTable.sn[74] = {
	name = "Elsterweg",
	y = 370.0 
}
streetTable.sn[75] = {
	name = "Friedrich-Bosse-Straße",
	y = 375.0 
}
streetTable.sn[76] = {
	name = "Stresemannstraße",
	y = 380.0 
}
streetTable.sn[77] = {
	name = "Erich-Köhn-Straße",
	y = 385.0 
}
streetTable.sn[78] = {
	name = "Nollendorfstraße",
	y = 390.0 
}
streetTable.sn[79] = {
	name = "Primavesistraße",
	y = 395.0 
}
streetTable.sn[80] = {
	name = "Richard-Strauss-Platz",
	y = 400.0 
}
streetTable.sn[81] = {
	name = "Schimmelstraße",
	y = 405.0 
}
streetTable.sn[82] = {
	name = "Odermannstraße",
	y = 410.0 
}
streetTable.sn[83] = {
	name = "Zum Sonnenblick",
	y = 415.0 
}
streetTable.sn[84] = {
	name = "Basedowstraße",
	y = 420.0 
}
streetTable.sn[85] = {
	name = "Schopenhauerstraße",
	y = 425.0 
}
streetTable.sn[86] = {
	name = "Plovdiver Straße",
	y = 430.0 
}
streetTable.sn[87] = {
	name = "Schirmerstraße",
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
	name = "Raimundstraße",
	y = 450.0 
}
streetTable.sn[91] = {
	name = "Johannisallee",
	y = 455.0 
}
streetTable.sn[92] = {
	name = "Franz-Mehring-Straße",
	y = 460.0 
}
streetTable.sn[93] = {
	name = "Goldglöckchenstraße",
	y = 465.0 
}
streetTable.sn[94] = {
	name = "Amazonstraße",
	y = 470.0 
}
streetTable.sn[95] = {
	name = "Gartenweg",
	y = 475.0 
}
streetTable.sn[96] = {
	name = "Nernststraße",
	y = 480.0 
}
streetTable.sn[97] = {
	name = "Talstraße",
	y = 485.0 
}
streetTable.sn[98] = {
	name = "Volbedingstraße",
	y = 490.0 
}
streetTable.sn[99] = {
	name = "Bautzner Straße",
	y = 495.0 
}
streetTable.sn[100] = {
	name = "Reuningstraße",
	y = 500.0 
}
streetTable.sn[101] = {
	name = "Am Ochsenwinkel",
	y = 505.0 
}
streetTable.sn[102] = {
	name = "Ferdinand-Gruner-Straße",
	y = 510.0 
}
streetTable.sn[103] = {
	name = "Gartenstraße",
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
	name = "Steinbergstraße",
	y = 530.0 
}
streetTable.sn[107] = {
	name = "Sternheimstraße",
	y = 535.0 
}
streetTable.sn[108] = {
	name = "Parkallee",
	y = 540.0 
}
streetTable.sn[109] = {
	name = "Schützenhausstraße",
	y = 545.0 
}
streetTable.sn[110] = {
	name = "Carl-Munde-Straße",
	y = 550.0 
}
streetTable.sn[111] = {
	name = "Mannheimer Straße",
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
	name = "Thomas-Wagner-Straße",
	y = 570.0 
}
streetTable.sn[115] = {
	name = "Gerhard-Ellrodt-Straße",
	y = 575.0 
}
streetTable.sn[116] = {
	name = "Pflugkstraße",
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
	name = "Otto-Schmiedt-Straße",
	y = 595.0 
}
streetTable.sn[120] = {
	name = "Lukasstraße",
	y = 600.0 
}
streetTable.sn[121] = {
	name = "Pirolweg",
	y = 605.0 
}
streetTable.sn[122] = {
	name = "Wolfener Straße",
	y = 610.0 
}
streetTable.sn[123] = {
	name = "Helgoländer Weg",
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
	name = "Stockmannstraße",
	y = 630.0 
}
streetTable.sn[127] = {
	name = "Feuerbachstraße",
	y = 635.0 
}
streetTable.sn[128] = {
	name = "Zu den Wiesen",
	y = 640.0 
}
streetTable.sn[129] = {
	name = "Köstritzer Straße",
	y = 645.0 
}
streetTable.sn[130] = {
	name = "Engelsdorfer Park",
	y = 650.0 
}
streetTable.sn[131] = {
	name = "Knaurstraße",
	y = 655.0 
}
streetTable.sn[132] = {
	name = "Ziegelstraße",
	y = 660.0 
}
streetTable.sn[133] = {
	name = "Raschwitzer Straße",
	y = 665.0 
}
streetTable.sn[134] = {
	name = "Georg-Herwegh-Straße",
	y = 670.0 
}
streetTable.sn[135] = {
	name = "Am Sportpark",
	y = 675.0 
}
streetTable.sn[136] = {
	name = "Majakowskistraße",
	y = 680.0 
}
streetTable.sn[137] = {
	name = "Hauschildstraße",
	y = 685.0 
}
streetTable.sn[138] = {
	name = "Dinterstraße",
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
	name = "Äußere Friedrich-Naumann-Straße",
	y = 715.0 
}
streetTable.sn[144] = {
	name = "Basteistraße",
	y = 720.0 
}
streetTable.sn[145] = {
	name = "Goerdelerring",
	y = 725.0 
}
streetTable.sn[146] = {
	name = "Neunkirchener Straße",
	y = 730.0 
}
streetTable.sn[147] = {
	name = "Falkensteinstraße",
	y = 735.0 
}
streetTable.sn[148] = {
	name = "Bühringstraße",
	y = 740.0 
}
streetTable.sn[149] = {
	name = "Stahmelner Straße",
	y = 745.0 
}
streetTable.sn[150] = {
	name = "Burgstraße",
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
	name = "Gustav-Kühn-Straße",
	y = 770.0 
}
streetTable.sn[155] = {
	name = "Leibnizstraße",
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
	name = "Wittenberger Straße",
	y = 795.0 
}
streetTable.sn[160] = {
	name = "Blausternweg",
	y = 800.0 
}
streetTable.sn[161] = {
	name = "Christian-Schmid-Straße",
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
	name = "Gotthelfstraße",
	y = 820.0 
}
streetTable.sn[165] = {
	name = "Ulrichstraße",
	y = 825.0 
}
streetTable.sn[166] = {
	name = "Beuthstraße",
	y = 830.0 
}
streetTable.sn[167] = {
	name = "Kärrnerstraße",
	y = 835.0 
}
streetTable.sn[168] = {
	name = "Im Limburgerpark",
	y = 840.0 
}
streetTable.sn[169] = {
	name = "Tschammerstraße",
	y = 845.0 
}
streetTable.sn[170] = {
	name = "Hummelstraße",
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
	name = "Offenburger Straße",
	y = 865.0 
}
streetTable.sn[174] = {
	name = "An der Brücke",
	y = 870.0 
}
streetTable.sn[175] = {
	name = "Zweifelstraße",
	y = 875.0 
}
streetTable.sn[176] = {
	name = "Giordano-Bruno-Straße",
	y = 880.0 
}
streetTable.sn[177] = {
	name = "Paul-Michael-Straße",
	y = 885.0 
}
streetTable.sn[178] = {
	name = "Hainbuchenstraße",
	y = 890.0 
}
streetTable.sn[179] = {
	name = "Schulweg",
	y = 895.0 
}
streetTable.sn[180] = {
	name = "Eisenbahnstraße",
	y = 900.0 
}
streetTable.sn[181] = {
	name = "Baumwollgasse",
	y = 905.0 
}
streetTable.sn[182] = {
	name = "Fichtestraße",
	y = 910.0 
}
streetTable.sn[183] = {
	name = "Dorstigstraße",
	y = 915.0 
}
streetTable.sn[184] = {
	name = "Posastraße",
	y = 920.0 
}
streetTable.sn[185] = {
	name = "Friedrich-Schmidt-Straße",
	y = 925.0 
}
streetTable.sn[186] = {
	name = "Neue Linie",
	y = 930.0 
}
streetTable.sn[187] = {
	name = "Matthissonstraße",
	y = 935.0 
}
streetTable.sn[188] = {
	name = "Ellernweg",
	y = 940.0 
}
streetTable.sn[189] = {
	name = "Herrnhuter Straße",
	y = 945.0 
}
streetTable.sn[190] = {
	name = "Gottschalkstraße",
	y = 950.0 
}
streetTable.sn[191] = {
	name = "Beethovenstraße",
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
	name = "Eduard-von-Hartmann-Straße",
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
	name = "Max-Borsdorf-Straße",
	y = 985.0 
}
streetTable.sn[198] = {
	name = "Torstensonring",
	y = 990.0 
}
streetTable.sn[199] = {
	name = "Gellertstraße",
	y = 995.0 
}
streetTable.sn[200] = {
	name = "Ernst-Hasse-Straße",
	y = 1000.0 
}
streetTable.sn[201] = {
	name = "Hirtenholzstraße",
	y = 1005.0 
}
streetTable.sn[202] = {
	name = "Etzelstraße",
	y = 1010.0 
}
streetTable.sn[203] = {
	name = "Jupiterstraße",
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
	name = "Schillerstraße",
	y = 1030.0 
}
streetTable.sn[207] = {
	name = "Borsdorfer Straße",
	y = 1035.0 
}
streetTable.sn[208] = {
	name = "Dittrichring",
	y = 1040.0 
}
streetTable.sn[209] = {
	name = "Stünz-Mölkauer Weg",
	y = 1045.0 
}
streetTable.sn[210] = {
	name = "Unterer Sandweg",
	y = 1050.0 
}
streetTable.sn[211] = {
	name = "Beckerstraße",
	y = 1055.0 
}
streetTable.sn[212] = {
	name = "Ludwigstraße",
	y = 1060.0 
}
streetTable.sn[213] = {
	name = "Klosterneuburger Weg",
	y = 1065.0 
}
streetTable.sn[214] = {
	name = "Libellenstraße",
	y = 1070.0 
}
streetTable.sn[215] = {
	name = "Heimdallstraße",
	y = 1075.0 
}
streetTable.sn[216] = {
	name = "Kantor-Hase-Straße",
	y = 1080.0 
}
streetTable.sn[217] = {
	name = "Hofmeisterstraße",
	y = 1085.0 
}
streetTable.sn[218] = {
	name = "Corinthstraße",
	y = 1090.0 
}
streetTable.sn[219] = {
	name = "Quasnitzer Höhe",
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
	name = "Wöbbeliner Straße",
	y = 1110.0 
}
streetTable.sn[223] = {
	name = "Adamsweg",
	y = 1115.0 
}
streetTable.sn[224] = {
	name = "Rackwitzer Straße",
	y = 1120.0 
}
streetTable.sn[225] = {
	name = "Max-Reger-Straße",
	y = 1125.0 
}
streetTable.sn[226] = {
	name = "Auerbachplatz",
	y = 1130.0 
}
streetTable.sn[227] = {
	name = "Schnorrstraße",
	y = 1135.0 
}
streetTable.sn[228] = {
	name = "Bürgerstraße",
	y = 1140.0 
}
streetTable.sn[229] = {
	name = "Ziolkowskistraße",
	y = 1145.0 
}
streetTable.sn[230] = {
	name = "Chamissoweg",
	y = 1150.0 
}
streetTable.sn[231] = {
	name = "Moschelesstraße",
	y = 1155.0 
}
streetTable.sn[232] = {
	name = "Spetlakstraße",
	y = 1160.0 
}
streetTable.sn[233] = {
	name = "Bucksdorffstraße",
	y = 1165.0 
}
streetTable.sn[234] = {
	name = "Brösigkestraße",
	y = 1170.0 
}
streetTable.sn[235] = {
	name = "Veclav-Neumann-Straße",
	y = 1175.0 
}
streetTable.sn[236] = {
	name = "Fregestraße",
	y = 1180.0 
}
streetTable.sn[237] = {
	name = "Naundörfchen",
	y = 1185.0 
}
streetTable.sn[238] = {
	name = "Menckestraße",
	y = 1190.0 
}
streetTable.sn[239] = {
	name = "Elsterberg",
	y = 1195.0 
}
streetTable.sn[240] = {
	name = "Brandiser Straße",
	y = 1200.0 
}
streetTable.sn[241] = {
	name = "Kriemhildstraße",
	y = 1205.0 
}
streetTable.sn[242] = {
	name = "Hedwigstraße",
	y = 1210.0 
}
streetTable.sn[243] = {
	name = "Siegfriedstraße",
	y = 1215.0 
}
streetTable.sn[244] = {
	name = "Arndtstraße",
	y = 1220.0 
}
streetTable.sn[245] = {
	name = "Spohrstraße",
	y = 1225.0 
}
streetTable.sn[246] = {
	name = "Hildegardstraße",
	y = 1230.0 
}
streetTable.sn[247] = {
	name = "Holteistraße",
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
	name = "Schwedenstraße",
	y = 1250.0 
}
streetTable.sn[251] = {
	name = "Zschampertaue",
	y = 1255.0 
}
streetTable.sn[252] = {
	name = "Schinkelstraße",
	y = 1260.0 
}
streetTable.sn[253] = {
	name = "Ilmenauer Weg",
	y = 1265.0 
}
streetTable.sn[254] = {
	name = "Preußergäßchen",
	y = 1270.0 
}
streetTable.sn[255] = {
	name = "Fraunhoferstraße",
	y = 1275.0 
}
streetTable.sn[256] = {
	name = "Threnaer Straße",
	y = 1280.0 
}
streetTable.sn[257] = {
	name = "Oberläuterstraße",
	y = 1285.0 
}
streetTable.sn[258] = {
	name = "Otto-Militzer-Straße",
	y = 1290.0 
}
streetTable.sn[259] = {
	name = "Felsenbirnenstraße",
	y = 1295.0 
}
streetTable.sn[260] = {
	name = "Birkenstraße",
	y = 1300.0 
}
streetTable.sn[261] = {
	name = "Am langen Felde",
	y = 1305.0 
}
streetTable.sn[262] = {
	name = "Josephstraße",
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
	name = "Rotkäppchenweg",
	y = 1325.0 
}
streetTable.sn[266] = {
	name = "Endnerstraße",
	y = 1330.0 
}
streetTable.sn[267] = {
	name = "Grünewaldstraße",
	y = 1335.0 
}
streetTable.sn[268] = {
	name = "Ganghoferstraße",
	y = 1340.0 
}
streetTable.sn[269] = {
	name = "Markkleeberger Straße",
	y = 1345.0 
}
streetTable.sn[270] = {
	name = "Katharinenstraße",
	y = 1350.0 
}
streetTable.sn[271] = {
	name = "Weheweg",
	y = 1355.0 
}
streetTable.sn[272] = {
	name = "August-Scheibe-Straße",
	y = 1360.0 
}
streetTable.sn[273] = {
	name = "Jöcherstraße",
	y = 1365.0 
}
streetTable.sn[274] = {
	name = "Alfred-Kästner-Straße",
	y = 1370.0 
}
streetTable.sn[275] = {
	name = "Arnstädter Kehre",
	y = 1375.0 
}
streetTable.sn[276] = {
	name = "Smaragdstraße",
	y = 1380.0 
}
streetTable.sn[277] = {
	name = "Hans-Beimler-Straße",
	y = 1385.0 
}
streetTable.sn[278] = {
	name = "Rietschelstraße",
	y = 1390.0 
}
streetTable.sn[279] = {
	name = "Schellingstraße",
	y = 1395.0 
}
streetTable.sn[280] = {
	name = "Zur Alten Bäckerei",
	y = 1400.0 
}
streetTable.sn[281] = {
	name = "Judith-Auer-Straße",
	y = 1405.0 
}
streetTable.sn[282] = {
	name = "An der Alten Post",
	y = 1410.0 
}
streetTable.sn[283] = {
	name = "Rüdigerstraße",
	y = 1415.0 
}
streetTable.sn[284] = {
	name = "Neue Leipziger Straße",
	y = 1420.0 
}
streetTable.sn[285] = {
	name = "Hauckstraße",
	y = 1425.0 
}
streetTable.sn[286] = {
	name = "Pittlerstraße",
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
	name = "Am Pfefferbrückchen",
	y = 1445.0 
}
streetTable.sn[290] = {
	name = "Senefelderstraße",
	y = 1450.0 
}
streetTable.sn[291] = {
	name = "Karl-Ferlemann-Straße",
	y = 1455.0 
}
streetTable.sn[292] = {
	name = "Am alten Gasthof",
	y = 1460.0 
}
streetTable.sn[293] = {
	name = "Antonienstraße",
	y = 1465.0 
}
streetTable.sn[294] = {
	name = "Pufendorfstraße",
	y = 1470.0 
}
streetTable.sn[295] = {
	name = "Berthastraße",
	y = 1475.0 
}
streetTable.sn[296] = {
	name = "Zum Lippenplan",
	y = 1480.0 
}
streetTable.sn[297] = {
	name = "Hünerfeldstraße",
	y = 1485.0 
}
streetTable.sn[298] = {
	name = "Freisinger Weg",
	y = 1490.0 
}
streetTable.sn[299] = {
	name = "Tannenwaldstraße",
	y = 1495.0 
}
streetTable.sn[300] = {
	name = "Gärtnergasse",
	y = 1500.0 
}
streetTable.sn[301] = {
	name = "Markgrafenstraße",
	y = 1505.0 
}
streetTable.sn[302] = {
	name = "Kolpingweg",
	y = 1510.0 
}
streetTable.sn[303] = {
	name = "Annenstraße",
	y = 1515.0 
}
streetTable.sn[304] = {
	name = "Hartriegelstraße",
	y = 1520.0 
}
streetTable.sn[305] = {
	name = "Paul-Klöpsch-Straße",
	y = 1525.0 
}
streetTable.sn[306] = {
	name = "Lenzstraße",
	y = 1530.0 
}
streetTable.sn[307] = {
	name = "Goetheplatz",
	y = 1535.0 
}
streetTable.sn[308] = {
	name = "Ludwig-Beck-Straße",
	y = 1540.0 
}
streetTable.sn[309] = {
	name = "Osthöhe",
	y = 1545.0 
}
streetTable.sn[310] = {
	name = "Brahmsplatz",
	y = 1550.0 
}
streetTable.sn[311] = {
	name = "Delitzscher Straße",
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
	name = "Otto-Thiele-Straße",
	y = 1575.0 
}
streetTable.sn[316] = {
	name = "Güldengossaer Straße",
	y = 1580.0 
}
streetTable.sn[317] = {
	name = "Dösner Weg",
	y = 1585.0 
}
streetTable.sn[318] = {
	name = "Amselhöhe",
	y = 1590.0 
}
streetTable.sn[319] = {
	name = "Trinitatisstraße",
	y = 1595.0 
}
streetTable.sn[320] = {
	name = "Güterbahnhofstraße",
	y = 1600.0 
}
streetTable.sn[321] = {
	name = "Nordstraße",
	y = 1605.0 
}
streetTable.sn[322] = {
	name = "Walter-Barth-Straße",
	y = 1610.0 
}
streetTable.sn[323] = {
	name = "Kastanienstraße",
	y = 1615.0 
}
streetTable.sn[324] = {
	name = "Emil-Kluge-Straße",
	y = 1620.0 
}
streetTable.sn[325] = {
	name = "Dortmunder Straße",
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
	name = "Marmontstraße",
	y = 1640.0 
}
streetTable.sn[329] = {
	name = "Kaninchensteig",
	y = 1645.0 
}
streetTable.sn[330] = {
	name = "Curschmannstraße",
	y = 1650.0 
}
streetTable.sn[331] = {
	name = "Störmthaler Straße",
	y = 1655.0 
}
streetTable.sn[332] = {
	name = "Kieler Straße",
	y = 1660.0 
}
streetTable.sn[333] = {
	name = "Huberstraße",
	y = 1665.0 
}
streetTable.sn[334] = {
	name = "Bretschneiderstraße",
	y = 1670.0 
}
streetTable.sn[335] = {
	name = "Iltispfad",
	y = 1675.0 
}
streetTable.sn[336] = {
	name = "Kolbestraße",
	y = 1680.0 
}
streetTable.sn[337] = {
	name = "Dietzgenstraße",
	y = 1685.0 
}
streetTable.sn[338] = {
	name = "Ölhafenstraße",
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
	name = "Roßmäßlerstraße",
	y = 1715.0 
}
streetTable.sn[344] = {
	name = "Mühlstraße",
	y = 1720.0 
}
streetTable.sn[345] = {
	name = "Stephanstraße",
	y = 1725.0 
}
streetTable.sn[346] = {
	name = "Liebigstraße",
	y = 1730.0 
}
streetTable.sn[347] = {
	name = "Kornblumenweg",
	y = 1735.0 
}
streetTable.sn[348] = {
	name = "Hermannstraße",
	y = 1740.0 
}
streetTable.sn[349] = {
	name = "Zur Alten Weintraube",
	y = 1745.0 
}
streetTable.sn[350] = {
	name = "Wenckstraße",
	y = 1750.0 
}
streetTable.sn[351] = {
	name = "Am Stausee",
	y = 1755.0 
}
streetTable.sn[352] = {
	name = "Schwylststraße",
	y = 1760.0 
}
streetTable.sn[353] = {
	name = "Frickestraße",
	y = 1765.0 
}
streetTable.sn[354] = {
	name = "Hendelweg",
	y = 1770.0 
}
streetTable.sn[355] = {
	name = "Korolenkostraße",
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
	name = "Auenseestraße",
	y = 1790.0 
}
streetTable.sn[359] = {
	name = "Wurzner Straße",
	y = 1795.0 
}
streetTable.sn[360] = {
	name = "Am Pfarrfelde",
	y = 1800.0 
}
streetTable.sn[361] = {
	name = "Auguste-Schulze-Straße",
	y = 1805.0 
}
streetTable.sn[362] = {
	name = "Cröberner Straße",
	y = 1810.0 
}
streetTable.sn[363] = {
	name = "Erich-Thiele-Straße",
	y = 1815.0 
}
streetTable.sn[364] = {
	name = "Hubertusstraße",
	y = 1820.0 
}
streetTable.sn[365] = {
	name = "Schneeballweg",
	y = 1825.0 
}
streetTable.sn[366] = {
	name = "Bisamstraße",
	y = 1830.0 
}
streetTable.sn[367] = {
	name = "Schlegelstraße",
	y = 1835.0 
}
streetTable.sn[368] = {
	name = "Güntherstraße",
	y = 1840.0 
}
streetTable.sn[369] = {
	name = "Nußbaumallee",
	y = 1845.0 
}
streetTable.sn[370] = {
	name = "Im Dölitzer Holz",
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
	name = "Am Jägerhaus",
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
	name = "Köbisstraße",
	y = 1890.0 
}
streetTable.sn[379] = {
	name = "Auf der Höhe",
	y = 1895.0 
}
streetTable.sn[380] = {
	name = "Basilikumweg",
	y = 1900.0 
}
streetTable.sn[381] = {
	name = "Feldstraße",
	y = 1905.0 
}
streetTable.sn[382] = {
	name = "Hohmannstraße",
	y = 1910.0 
}
streetTable.sn[383] = {
	name = "Rinckartstraße",
	y = 1915.0 
}
streetTable.sn[384] = {
	name = "Gänseblümchenweg",
	y = 1920.0 
}
streetTable.sn[385] = {
	name = "Dörrienstraße",
	y = 1925.0 
}
streetTable.sn[386] = {
	name = "Göhrenzer Straße",
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
	name = "Am Güterring",
	y = 1945.0 
}
streetTable.sn[390] = {
	name = "Hardenbergstraße",
	y = 1950.0 
}
streetTable.sn[391] = {
	name = "Schöfflerweg",
	y = 1955.0 
}
streetTable.sn[392] = {
	name = "Nathanaelstraße",
	y = 1960.0 
}
streetTable.sn[393] = {
	name = "Jahnstraße",
	y = 1965.0 
}
streetTable.sn[394] = {
	name = "Am Lindenhof",
	y = 1970.0 
}
streetTable.sn[395] = {
	name = "Wertheimer Straße",
	y = 1975.0 
}
streetTable.sn[396] = {
	name = "Claudiusstraße",
	y = 1980.0 
}
streetTable.sn[397] = {
	name = "Christoph-Probst-Straße",
	y = 1985.0 
}
streetTable.sn[398] = {
	name = "Hauptmannstraße",
	y = 1990.0 
}
streetTable.sn[399] = {
	name = "An der Wendeschleife",
	y = 1995.0 
}
streetTable.sn[400] = {
	name = "Sommerlindenstraße",
	y = 2000.0 
}
streetTable.sn[401] = {
	name = "Teichgräberstraße",
	y = 2005.0 
}
streetTable.sn[402] = {
	name = "Nonnenmühlgasse",
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
	name = "Thünenstraße",
	y = 2025.0 
}
streetTable.sn[406] = {
	name = "An der Telle",
	y = 2030.0 
}
streetTable.sn[407] = {
	name = "Hermann-Liebmann-Straße",
	y = 2035.0 
}
streetTable.sn[408] = {
	name = "Carusstraße",
	y = 2040.0 
}
streetTable.sn[409] = {
	name = "Hallesche Straße",
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
	name = "Krakauer Straße",
	y = 2060.0 
}
streetTable.sn[413] = {
	name = "Straße des 18. Oktober",
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
	name = "Demmeringstraße",
	y = 2080.0 
}
streetTable.sn[417] = {
	name = "Oelsnitzer Straße",
	y = 2085.0 
}
streetTable.sn[418] = {
	name = "Kuntzschmannstraße",
	y = 2090.0 
}
streetTable.sn[419] = {
	name = "Grillenstraße",
	y = 2095.0 
}
streetTable.sn[420] = {
	name = "Sachsenhöhe",
	y = 2100.0 
}
streetTable.sn[421] = {
	name = "Mühlbergsiedlung",
	y = 2105.0 
}
streetTable.sn[422] = {
	name = "Preußenstraße",
	y = 2110.0 
}
streetTable.sn[423] = {
	name = "Werfelstraße",
	y = 2115.0 
}
streetTable.sn[424] = {
	name = "Ostrowskistraße",
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
	name = "Kurt-Krah-Straße",
	y = 2135.0 
}
streetTable.sn[428] = {
	name = "Emilienstraße",
	y = 2140.0 
}
streetTable.sn[429] = {
	name = "Karlstädter Straße",
	y = 2145.0 
}
streetTable.sn[430] = {
	name = "Heinrichstraße",
	y = 2150.0 
}
streetTable.sn[431] = {
	name = "Willi-Bredel-Straße",
	y = 2155.0 
}
streetTable.sn[432] = {
	name = "Papitzer Straße",
	y = 2160.0 
}
streetTable.sn[433] = {
	name = "Topasstraße",
	y = 2165.0 
}
streetTable.sn[434] = {
	name = "Penckstraße",
	y = 2170.0 
}
streetTable.sn[435] = {
	name = "Davidstraße",
	y = 2175.0 
}
streetTable.sn[436] = {
	name = "Lindenauer Markt",
	y = 2180.0 
}
streetTable.sn[437] = {
	name = "Körnerweg",
	y = 2185.0 
}
streetTable.sn[438] = {
	name = "Wildentensteig",
	y = 2190.0 
}
streetTable.sn[439] = {
	name = "Kümmelweg",
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
	name = "Stünzer Straße",
	y = 2225.0 
}
streetTable.sn[446] = {
	name = "Safranweg",
	y = 2230.0 
}
streetTable.sn[447] = {
	name = "Semmelweisstraße",
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
	name = "Simildenstraße",
	y = 2250.0 
}
streetTable.sn[451] = {
	name = "Zaucheblick",
	y = 2255.0 
}
streetTable.sn[452] = {
	name = "Riemannstraße",
	y = 2260.0 
}
streetTable.sn[453] = {
	name = "Auenblickstraße",
	y = 2265.0 
}
streetTable.sn[454] = {
	name = "Konstantinstraße",
	y = 2270.0 
}
streetTable.sn[455] = {
	name = "Friederikenstraße",
	y = 2275.0 
}
streetTable.sn[456] = {
	name = "Johannisplatz",
	y = 2280.0 
}
streetTable.sn[457] = {
	name = "Waldkerbelstraße",
	y = 2285.0 
}
streetTable.sn[458] = {
	name = "Bleichertstraße",
	y = 2290.0 
}
streetTable.sn[459] = {
	name = "Schwarzackerstraße",
	y = 2295.0 
}
streetTable.sn[460] = {
	name = "Holzhäuser Straße",
	y = 2300.0 
}
streetTable.sn[461] = {
	name = "Schneiderstraße",
	y = 2305.0 
}
streetTable.sn[462] = {
	name = "Storchenweg",
	y = 2310.0 
}
streetTable.sn[463] = {
	name = "Potschkaustraße",
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
	name = "Julian-Marchlewski-Straße",
	y = 2330.0 
}
streetTable.sn[467] = {
	name = "Reichsstraße",
	y = 2335.0 
}
streetTable.sn[468] = {
	name = "Knöflerstraße",
	y = 2340.0 
}
streetTable.sn[469] = {
	name = "Garskestraße",
	y = 2345.0 
}
streetTable.sn[470] = {
	name = "Atriumstraße",
	y = 2350.0 
}
streetTable.sn[471] = {
	name = "Philipp-Rosenthal-Straße",
	y = 2355.0 
}
streetTable.sn[472] = {
	name = "Zum Kleingartenpark",
	y = 2360.0 
}
streetTable.sn[473] = {
	name = "Am Schäferhügel",
	y = 2365.0 
}
streetTable.sn[474] = {
	name = "Luchspfad",
	y = 2370.0 
}
streetTable.sn[475] = {
	name = "Yorckstraße ",
	y = 2375.0 
}
streetTable.sn[476] = {
	name = "Rotheplatz",
	y = 2380.0 
}
streetTable.sn[477] = {
	name = "Sperontesstraße",
	y = 2385.0 
}
streetTable.sn[478] = {
	name = "Viktoriastraße",
	y = 2390.0 
}
streetTable.sn[479] = {
	name = "Giselherstraße",
	y = 2395.0 
}
streetTable.sn[480] = {
	name = "Buchener Straße",
	y = 2400.0 
}
streetTable.sn[481] = {
	name = "Alte Salzstraße",
	y = 2405.0 
}
streetTable.sn[482] = {
	name = "Am Bischofsholz",
	y = 2410.0 
}
streetTable.sn[483] = {
	name = "Cocciusstraße",
	y = 2415.0 
}
streetTable.sn[484] = {
	name = "Pommernstraße",
	y = 2420.0 
}
streetTable.sn[485] = {
	name = "An der Bahn",
	y = 2425.0 
}
streetTable.sn[486] = {
	name = "Voltairestraße",
	y = 2430.0 
}
streetTable.sn[487] = {
	name = "Hauptstraße",
	y = 2435.0 
}
streetTable.sn[488] = {
	name = "Gersterstraße",
	y = 2440.0 
}
streetTable.sn[489] = {
	name = "Teichweg",
	y = 2445.0 
}
streetTable.sn[490] = {
	name = "Luckaer Straße",
	y = 2450.0 
}
streetTable.sn[491] = {
	name = "Gutenbergplatz",
	y = 2455.0 
}
streetTable.sn[492] = {
	name = "Alexander-Alesius-Straße",
	y = 2460.0 
}
streetTable.sn[493] = {
	name = "Weidenweg",
	y = 2465.0 
}
streetTable.sn[494] = {
	name = "Döbelner Straße",
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
	name = "Bischofstraße",
	y = 2490.0 
}
streetTable.sn[499] = {
	name = "Neustädter Markt",
	y = 2495.0 
}
streetTable.sn[500] = {
	name = "Cichoriusstraße",
	y = 2500.0 
}
streetTable.sn[501] = {
	name = "Barclayweg",
	y = 2505.0 
}
streetTable.sn[502] = {
	name = "Eilenburger Straße",
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
	name = "Zeumerstraße",
	y = 2525.0 
}
streetTable.sn[506] = {
	name = "Hoyerstraße",
	y = 2530.0 
}
streetTable.sn[507] = {
	name = "Schönauer Allee",
	y = 2535.0 
}
streetTable.sn[508] = {
	name = "Espenhainer Straße",
	y = 2540.0 
}
streetTable.sn[509] = {
	name = "Zschölkauer Weg",
	y = 2545.0 
}
streetTable.sn[510] = {
	name = "Am Gänseanger",
	y = 2550.0 
}
streetTable.sn[511] = {
	name = "Aschenbrödelweg",
	y = 2555.0 
}
streetTable.sn[512] = {
	name = "Cunnersdorfer Straße",
	y = 2560.0 
}
streetTable.sn[513] = {
	name = "Johannes-Weyrauch-Platz",
	y = 2565.0 
}
streetTable.sn[514] = {
	name = "Albrecht-Dürer-Weg",
	y = 2570.0 
}
streetTable.sn[515] = {
	name = "Wildschweinpfad",
	y = 2575.0 
}
streetTable.sn[516] = {
	name = "Kohlgartenstraße",
	y = 2580.0 
}
streetTable.sn[517] = {
	name = "Abrahamstraße",
	y = 2585.0 
}
streetTable.sn[518] = {
	name = "Helenenstraße",
	y = 2590.0 
}
streetTable.sn[519] = {
	name = "Mittelweg",
	y = 2595.0 
}
streetTable.sn[520] = {
	name = "Schlotterbeckstraße",
	y = 2600.0 
}
streetTable.sn[521] = {
	name = "Aschaffenburger Straße",
	y = 2605.0 
}
streetTable.sn[522] = {
	name = "Zur Lehmbahn",
	y = 2610.0 
}
streetTable.sn[523] = {
	name = "Platanenstraße",
	y = 2615.0 
}
streetTable.sn[524] = {
	name = "Wächterstraße",
	y = 2620.0 
}
streetTable.sn[525] = {
	name = "Rotbuchenweg",
	y = 2625.0 
}
streetTable.sn[526] = {
	name = "Am Mückenschlößchen",
	y = 2630.0 
}
streetTable.sn[527] = {
	name = "Waldrebenweg",
	y = 2635.0 
}
streetTable.sn[528] = {
	name = "Gorkistraße",
	y = 2640.0 
}
streetTable.sn[529] = {
	name = "An der Gärtnerei",
	y = 2645.0 
}
streetTable.sn[530] = {
	name = "Dieskaustraße",
	y = 2650.0 
}
streetTable.sn[531] = {
	name = "Am Sonneneck",
	y = 2655.0 
}
streetTable.sn[532] = {
	name = "Fuchshainer Straße",
	y = 2660.0 
}
streetTable.sn[533] = {
	name = "Jupp-Müller-Straße",
	y = 2665.0 
}
streetTable.sn[534] = {
	name = "Anton-Bruckner-Allee",
	y = 2670.0 
}
streetTable.sn[535] = {
	name = "Glesiener Straße",
	y = 2675.0 
}
streetTable.sn[536] = {
	name = "Schröterstraße",
	y = 2680.0 
}
streetTable.sn[537] = {
	name = "Herbert-Thiele-Straße",
	y = 2685.0 
}
streetTable.sn[538] = {
	name = "Feldlerchenweg",
	y = 2690.0 
}
streetTable.sn[539] = {
	name = "Ungerstraße",
	y = 2695.0 
}
streetTable.sn[540] = {
	name = "Kröbelstraße",
	y = 2700.0 
}
streetTable.sn[541] = {
	name = "Clemens-Thieme-Straße",
	y = 2705.0 
}
streetTable.sn[542] = {
	name = "Zweinaundorfer Straße",
	y = 2710.0 
}
streetTable.sn[543] = {
	name = "Schreberstraße",
	y = 2715.0 
}
streetTable.sn[544] = {
	name = "Erlenstraße",
	y = 2720.0 
}
streetTable.sn[545] = {
	name = "Schmiedeberger Straße",
	y = 2725.0 
}
streetTable.sn[546] = {
	name = "Hartungstraße",
	y = 2730.0 
}
streetTable.sn[547] = {
	name = "Wilhelm-Plesse-Straße",
	y = 2735.0 
}
streetTable.sn[548] = {
	name = "Hotherstraße",
	y = 2740.0 
}
streetTable.sn[549] = {
	name = "Frankenheimer Weg",
	y = 2745.0 
}
streetTable.sn[550] = {
	name = "Schlößchenweg",
	y = 2750.0 
}
streetTable.sn[551] = {
	name = "Fritz-Reuter-Straße",
	y = 2755.0 
}
streetTable.sn[552] = {
	name = "Fabrikstraße",
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
	name = "Türkisstraße",
	y = 2775.0 
}
streetTable.sn[556] = {
	name = "Teschstraße",
	y = 2780.0 
}
streetTable.sn[557] = {
	name = "An den Tierkliniken",
	y = 2785.0 
}
streetTable.sn[558] = {
	name = "Fechnerstraße",
	y = 2790.0 
}
streetTable.sn[559] = {
	name = "Tschernyschewskistraße",
	y = 2795.0 
}
streetTable.sn[560] = {
	name = "Feldhasenweg",
	y = 2800.0 
}
streetTable.sn[561] = {
	name = "Liechtensteinstraße",
	y = 2805.0 
}
streetTable.sn[562] = {
	name = "Wasserwerkstraße",
	y = 2810.0 
}
streetTable.sn[563] = {
	name = "Natonekstraße",
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
	name = "Theodor-Heuss-Straße",
	y = 2835.0 
}
streetTable.sn[568] = {
	name = "Karl-Rothe-Straße",
	y = 2840.0 
}
streetTable.sn[569] = {
	name = "Virchowstraße",
	y = 2845.0 
}
streetTable.sn[570] = {
	name = "Zwickauer Straße",
	y = 2850.0 
}
streetTable.sn[571] = {
	name = "Uferstraße",
	y = 2855.0 
}
streetTable.sn[572] = {
	name = "Teichstraße",
	y = 2860.0 
}
streetTable.sn[573] = {
	name = "Am Künstlerbogen",
	y = 2865.0 
}
streetTable.sn[574] = {
	name = "Falterstraße",
	y = 2870.0 
}
streetTable.sn[575] = {
	name = "Sabinenstraße",
	y = 2875.0 
}
streetTable.sn[576] = {
	name = "Kiesgrubenstraße",
	y = 2880.0 
}
streetTable.sn[577] = {
	name = "Rosenholzweg",
	y = 2885.0 
}
streetTable.sn[578] = {
	name = "Torgauer Straße",
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
	name = "Wincklerstraße",
	y = 2910.0 
}
streetTable.sn[583] = {
	name = "Gießerstraße",
	y = 2915.0 
}
streetTable.sn[584] = {
	name = "Bachenpfad",
	y = 2920.0 
}
streetTable.sn[585] = {
	name = "Ernst-Thälmann-Platz",
	y = 2925.0 
}
streetTable.sn[586] = {
	name = "Heinrich-Schmidt-Straße",
	y = 2930.0 
}
streetTable.sn[587] = {
	name = "Carl-Hinne-Straße",
	y = 2935.0 
}
streetTable.sn[588] = {
	name = "Gutenbergstraße",
	y = 2940.0 
}
streetTable.sn[589] = {
	name = "Heinrothstraße",
	y = 2945.0 
}
streetTable.sn[590] = {
	name = "Rosmarinweg",
	y = 2950.0 
}
streetTable.sn[591] = {
	name = "Benediktusstraße",
	y = 2955.0 
}
streetTable.sn[592] = {
	name = "Kloßstraße",
	y = 2960.0 
}
streetTable.sn[593] = {
	name = "Pfarrweg",
	y = 2965.0 
}
streetTable.sn[594] = {
	name = "Hans-Grade-Straße",
	y = 2970.0 
}
streetTable.sn[595] = {
	name = "Am Ritterschlößchen",
	y = 2975.0 
}
streetTable.sn[596] = {
	name = "Innenring",
	y = 2980.0 
}
streetTable.sn[597] = {
	name = "Martinstraße",
	y = 2985.0 
}
streetTable.sn[598] = {
	name = "Viertelsweg",
	y = 2990.0 
}
streetTable.sn[599] = {
	name = "Pitschkestraße",
	y = 2995.0 
}
streetTable.sn[600] = {
	name = "Wegastraße",
	y = 3000.0 
}
streetTable.sn[601] = {
	name = "Uhlandweg",
	y = 3005.0 
}
streetTable.sn[602] = {
	name = "Ernst-Keil-Straße",
	y = 3010.0 
}
streetTable.sn[603] = {
	name = "Ernst-Meier-Straße",
	y = 3015.0 
}
streetTable.sn[604] = {
	name = "Pfaffensteinstraße",
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
	name = "Melanchthonstraße",
	y = 3045.0 
}
streetTable.sn[610] = {
	name = "Buchenwaldstraße",
	y = 3050.0 
}
streetTable.sn[611] = {
	name = "Wintergartenstraße",
	y = 3055.0 
}
streetTable.sn[612] = {
	name = "Ringweg",
	y = 3060.0 
}
streetTable.sn[613] = {
	name = "Karl-Helbig-Straße",
	y = 3065.0 
}
streetTable.sn[614] = {
	name = "Richard-Wagner-Platz",
	y = 3070.0 
}
streetTable.sn[615] = {
	name = "Am Mühlengrund",
	y = 3075.0 
}
streetTable.sn[616] = {
	name = "Schönbachstraße",
	y = 3080.0 
}
streetTable.sn[617] = {
	name = "Wognaundorfer Gasse",
	y = 3085.0 
}
streetTable.sn[618] = {
	name = "Lortzingstraße",
	y = 3090.0 
}
streetTable.sn[619] = {
	name = "Erikenstraße",
	y = 3095.0 
}
streetTable.sn[620] = {
	name = "Zwenkauer Straße",
	y = 3100.0 
}
streetTable.sn[621] = {
	name = "Schreiberstraße",
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
	name = "Kirchstraße",
	y = 3120.0 
}
streetTable.sn[625] = {
	name = "Perlpilzweg",
	y = 3125.0 
}
streetTable.sn[626] = {
	name = "Baumeister-Günther-Straße",
	y = 3130.0 
}
streetTable.sn[627] = {
	name = "Ecksteinstraße",
	y = 3135.0 
}
streetTable.sn[628] = {
	name = "Arthur-Hoffmann-Straße",
	y = 3140.0 
}
streetTable.sn[629] = {
	name = "Saarländer Straße",
	y = 3145.0 
}
streetTable.sn[630] = {
	name = "Drosselnest",
	y = 3150.0 
}
streetTable.sn[631] = {
	name = "Ahlfeldstraße",
	y = 3155.0 
}
streetTable.sn[632] = {
	name = "Seipelweg",
	y = 3160.0 
}
streetTable.sn[633] = {
	name = "Goldschmidtstraße",
	y = 3165.0 
}
streetTable.sn[634] = {
	name = "Richard-Leisebein-Straße",
	y = 3170.0 
}
streetTable.sn[635] = {
	name = "Tennstedter Weg",
	y = 3175.0 
}
streetTable.sn[636] = {
	name = "Gundorfer Straße",
	y = 3180.0 
}
streetTable.sn[637] = {
	name = "Husemannstraße",
	y = 3185.0 
}
streetTable.sn[638] = {
	name = "Gogolstraße",
	y = 3190.0 
}
streetTable.sn[639] = {
	name = "Krokusweg",
	y = 3195.0 
}
streetTable.sn[640] = {
	name = "Zentralstraße",
	y = 3200.0 
}
streetTable.sn[641] = {
	name = "Balzacstraße",
	y = 3205.0 
}
streetTable.sn[642] = {
	name = "Samuel-Lampel-Straße",
	y = 3210.0 
}
streetTable.sn[643] = {
	name = "Lintacherstraße",
	y = 3215.0 
}
streetTable.sn[644] = {
	name = "Bernsteinstraße",
	y = 3220.0 
}
streetTable.sn[645] = {
	name = "Engelsdorfer Straße",
	y = 3225.0 
}
streetTable.sn[646] = {
	name = "Corneliusweg",
	y = 3230.0 
}
streetTable.sn[647] = {
	name = "Hertzstraße",
	y = 3235.0 
}
streetTable.sn[648] = {
	name = "Elisabeth-Schumacher-Stra",
	y = 3240.0 
}
streetTable.sn[649] = {
	name = "Böttchergäßchen",
	y = 3245.0 
}
streetTable.sn[650] = {
	name = "Mockauer Ring",
	y = 3250.0 
}
streetTable.sn[651] = {
	name = "Frommannstraße",
	y = 3255.0 
}
streetTable.sn[652] = {
	name = "Seitengasse",
	y = 3260.0 
}
streetTable.sn[653] = {
	name = "Drei-Linden-Höhe",
	y = 3265.0 
}
streetTable.sn[654] = {
	name = "Kohlweg",
	y = 3270.0 
}
streetTable.sn[655] = {
	name = "Kurt-Kresse-Straße",
	y = 3275.0 
}
streetTable.sn[656] = {
	name = "Eichlerstraße",
	y = 3280.0 
}
streetTable.sn[657] = {
	name = "Oswald-Kahnt-Ring",
	y = 3285.0 
}
streetTable.sn[658] = {
	name = "Breite Straße",
	y = 3290.0 
}
streetTable.sn[659] = {
	name = "Louise-Otto-Peters-Platz",
	y = 3295.0 
}
streetTable.sn[660] = {
	name = "Thaerstraße",
	y = 3300.0 
}
streetTable.sn[661] = {
	name = "Ansbacher Straße",
	y = 3305.0 
}
streetTable.sn[662] = {
	name = "Don-Carlos-Straße",
	y = 3310.0 
}
streetTable.sn[663] = {
	name = "Klingerstraße",
	y = 3315.0 
}
streetTable.sn[664] = {
	name = "Döllingstraße",
	y = 3320.0 
}
streetTable.sn[665] = {
	name = "Eichendorffstraße",
	y = 3325.0 
}
streetTable.sn[666] = {
	name = "Am Wassergraben",
	y = 3330.0 
}
streetTable.sn[667] = {
	name = "Melscher Straße",
	y = 3335.0 
}
streetTable.sn[668] = {
	name = "Bahnstraße",
	y = 3340.0 
}
streetTable.sn[669] = {
	name = "Räpitzer Straße",
	y = 3345.0 
}
streetTable.sn[670] = {
	name = "Alte Dorfstraße",
	y = 3350.0 
}
streetTable.sn[671] = {
	name = "Ackerweg",
	y = 3355.0 
}
streetTable.sn[672] = {
	name = "An der Schäferei",
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
	name = "Heinrich-Büchner-Straße",
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
	name = "Alexanderstraße",
	y = 3390.0 
}
streetTable.sn[679] = {
	name = "Landsberger Straße",
	y = 3395.0 
}
streetTable.sn[680] = {
	name = "Sigebandweg",
	y = 3400.0 
}
streetTable.sn[681] = {
	name = "Böhmestraße",
	y = 3405.0 
}
streetTable.sn[682] = {
	name = "Breitkopfstraße",
	y = 3410.0 
}
streetTable.sn[683] = {
	name = "Am Lösegraben",
	y = 3415.0 
}
streetTable.sn[684] = {
	name = "Paunsdorfer Allee",
	y = 3420.0 
}
streetTable.sn[685] = {
	name = "Cezanneweg",
	y = 3425.0 
}
streetTable.sn[686] = {
	name = "Christian-Grunert-Straße",
	y = 3430.0 
}
streetTable.sn[687] = {
	name = "Fortunabadstraße",
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
	name = "Luftschiffstraße",
	y = 3450.0 
}
streetTable.sn[691] = {
	name = "Lerchenrain",
	y = 3455.0 
}
streetTable.sn[692] = {
	name = "Emmausstraße",
	y = 3460.0 
}
streetTable.sn[693] = {
	name = "Audorfstraße",
	y = 3465.0 
}
streetTable.sn[694] = {
	name = "Lindenallee",
	y = 3470.0 
}
streetTable.sn[695] = {
	name = "Rathausstraße",
	y = 3475.0 
}
streetTable.sn[696] = {
	name = "Gutshofstraße",
	y = 3480.0 
}
streetTable.sn[697] = {
	name = "Seeweg",
	y = 3485.0 
}
streetTable.sn[698] = {
	name = "Neustädter Straße",
	y = 3490.0 
}
streetTable.sn[699] = {
	name = "Narsdorfer Straße",
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
	name = "Blochstraße",
	y = 3510.0 
}
streetTable.sn[703] = {
	name = "Asternweg",
	y = 3515.0 
}
streetTable.sn[704] = {
	name = "Riedelstraße",
	y = 3520.0 
}
streetTable.sn[705] = {
	name = "Friedhofstraße",
	y = 3525.0 
}
streetTable.sn[706] = {
	name = "Triftstraße",
	y = 3530.0 
}
streetTable.sn[707] = {
	name = "Graffstraße",
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
	name = "Häußerstraße",
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
	name = "Steinberger Straße",
	y = 3565.0 
}
streetTable.sn[714] = {
	name = "Zum Feld",
	y = 3570.0 
}
streetTable.sn[715] = {
	name = "Gustav-Esche-Straße",
	y = 3575.0 
}
streetTable.sn[716] = {
	name = "Böhlitzer Mühle",
	y = 3580.0 
}
streetTable.sn[717] = {
	name = "Hildebrandstraße",
	y = 3585.0 
}
streetTable.sn[718] = {
	name = "Weststraße",
	y = 3590.0 
}
streetTable.sn[719] = {
	name = "An der Hebemärchte",
	y = 3595.0 
}
streetTable.sn[720] = {
	name = "Marienberger Straße",
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
	name = "Roseggerstraße",
	y = 3615.0 
}
streetTable.sn[724] = {
	name = "Gaschwitzer Straße",
	y = 3620.0 
}
streetTable.sn[725] = {
	name = "Dautheweg",
	y = 3625.0 
}
streetTable.sn[726] = {
	name = "Ludwigsburger Straße",
	y = 3630.0 
}
streetTable.sn[727] = {
	name = "Elstermühlweg",
	y = 3635.0 
}
streetTable.sn[728] = {
	name = "Robert-Mayer-Straße",
	y = 3640.0 
}
streetTable.sn[729] = {
	name = "Gittelstraße",
	y = 3645.0 
}
streetTable.sn[730] = {
	name = "Colmblick",
	y = 3650.0 
}
streetTable.sn[731] = {
	name = "Pötzschker Weg",
	y = 3655.0 
}
streetTable.sn[732] = {
	name = "Klausenerstraße",
	y = 3660.0 
}
streetTable.sn[733] = {
	name = "Roßmarkt",
	y = 3665.0 
}
streetTable.sn[734] = {
	name = "Richterstraße",
	y = 3670.0 
}
streetTable.sn[735] = {
	name = "Louis-Fürnberg-Straße",
	y = 3675.0 
}
streetTable.sn[736] = {
	name = "Felsenkellerstraße",
	y = 3680.0 
}
streetTable.sn[737] = {
	name = "Chopinstraße",
	y = 3685.0 
}
streetTable.sn[738] = {
	name = "Badeweg",
	y = 3690.0 
}
streetTable.sn[739] = {
	name = "Grüner Bogen",
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
	name = "Ginsterstraße",
	y = 3710.0 
}
streetTable.sn[743] = {
	name = "Ameisenstraße",
	y = 3715.0 
}
streetTable.sn[744] = {
	name = "Im Weidengrund",
	y = 3720.0 
}
streetTable.sn[745] = {
	name = "Eggebrechtstraße",
	y = 3725.0 
}
streetTable.sn[746] = {
	name = "Carl-Weichelt-Straße",
	y = 3730.0 
}
streetTable.sn[747] = {
	name = "Weberknechtstraße",
	y = 3735.0 
}
streetTable.sn[748] = {
	name = "Galileistraße",
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
	name = "Friesenstraße",
	y = 3755.0 
}
streetTable.sn[752] = {
	name = "Schillingstraße",
	y = 3760.0 
}
streetTable.sn[753] = {
	name = "Haferkornstraße",
	y = 3765.0 
}
streetTable.sn[754] = {
	name = "Helmertstraße",
	y = 3770.0 
}
streetTable.sn[755] = {
	name = "Wiesenrain",
	y = 3775.0 
}
streetTable.sn[756] = {
	name = "Molitorstraße",
	y = 3780.0 
}
streetTable.sn[757] = {
	name = "Hornstraße",
	y = 3785.0 
}
streetTable.sn[758] = {
	name = "Seeburgstraße",
	y = 3790.0 
}
streetTable.sn[759] = {
	name = "Fridtjof-Nansen-Straße",
	y = 3795.0 
}
streetTable.sn[760] = {
	name = "Föpplstraße",
	y = 3800.0 
}
streetTable.sn[761] = {
	name = "Turgenjewstraße",
	y = 3805.0 
}
streetTable.sn[762] = {
	name = "Bayreuther Straße",
	y = 3810.0 
}
streetTable.sn[763] = {
	name = "Mendelejewstraße",
	y = 3815.0 
}
streetTable.sn[764] = {
	name = "Pilzanger",
	y = 3820.0 
}
streetTable.sn[765] = {
	name = "Sattelhofstraße",
	y = 3825.0 
}
streetTable.sn[766] = {
	name = "Ehrensteinstraße",
	y = 3830.0 
}
streetTable.sn[767] = {
	name = "Wilhelm-Busch-Straße",
	y = 3835.0 
}
streetTable.sn[768] = {
	name = "Hinter dem Dorf",
	y = 3840.0 
}
streetTable.sn[769] = {
	name = "Schkorlopper Straße",
	y = 3845.0 
}
streetTable.sn[770] = {
	name = "Karl-Heine-Platz",
	y = 3850.0 
}
streetTable.sn[771] = {
	name = "Rödelstraße",
	y = 3855.0 
}
streetTable.sn[772] = {
	name = "Flöhaer Straße",
	y = 3860.0 
}
streetTable.sn[773] = {
	name = "Grabaustraße",
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
	name = "Sebastian-Bach-Straße",
	y = 3880.0 
}
streetTable.sn[777] = {
	name = "Göteborger Straße",
	y = 3885.0 
}
streetTable.sn[778] = {
	name = "Thymianweg",
	y = 3890.0 
}
streetTable.sn[779] = {
	name = "Otterstraße",
	y = 3895.0 
}
streetTable.sn[780] = {
	name = "Wilhelminenstraße",
	y = 3900.0 
}
streetTable.sn[781] = {
	name = "Leisniger Straße",
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
	name = "Rudolphstraße",
	y = 3920.0 
}
streetTable.sn[785] = {
	name = "Bothestraße",
	y = 3925.0 
}
streetTable.sn[786] = {
	name = "Walter-Albrecht-Weg",
	y = 3930.0 
}
streetTable.sn[787] = {
	name = "Alfred-Schurig-Straße",
	y = 3935.0 
}
streetTable.sn[788] = {
	name = "Bienitzstraße",
	y = 3940.0 
}
streetTable.sn[789] = {
	name = "Paußnitzstraße",
	y = 3945.0 
}
streetTable.sn[790] = {
	name = "Ferdinand-Lassalle-Straße",
	y = 3950.0 
}
streetTable.sn[791] = {
	name = "Ebenholzweg",
	y = 3955.0 
}
streetTable.sn[792] = {
	name = "Stiftsstraße",
	y = 3960.0 
}
streetTable.sn[793] = {
	name = "Schulzeweg",
	y = 3965.0 
}
streetTable.sn[794] = {
	name = "Fröbelstraße",
	y = 3970.0 
}
streetTable.sn[795] = {
	name = "Südplatz",
	y = 3975.0 
}
streetTable.sn[796] = {
	name = "Handwerkerhof",
	y = 3980.0 
}
streetTable.sn[797] = {
	name = "Schulze-Delitzsch-Straße",
	y = 3985.0 
}
streetTable.sn[798] = {
	name = "Roseggerweg",
	y = 3990.0 
}
streetTable.sn[799] = {
	name = "Roßplatz",
	y = 3995.0 
}
streetTable.sn[800] = {
	name = "Kastanienring",
	y = 4000.0 
}
streetTable.sn[801] = {
	name = "Emil-Schubert-Straße",
	y = 4005.0 
}
streetTable.sn[802] = {
	name = "Rubensstraße",
	y = 4010.0 
}
streetTable.sn[803] = {
	name = "Slevogtstraße",
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
	name = "Hölderlinstraße",
	y = 4030.0 
}
streetTable.sn[807] = {
	name = "Härtelstraße",
	y = 4035.0 
}
streetTable.sn[808] = {
	name = "Kötzschkestraße",
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
	name = "Magdeborner Straße",
	y = 4060.0 
}
streetTable.sn[813] = {
	name = "Schwartzestraße",
	y = 4065.0 
}
streetTable.sn[814] = {
	name = "Hirtenweg",
	y = 4070.0 
}
streetTable.sn[815] = {
	name = "Max-Beckmann-Straße",
	y = 4075.0 
}
streetTable.sn[816] = {
	name = "Kurt-Tucholsky-Straße",
	y = 4080.0 
}
streetTable.sn[817] = {
	name = "Baumannstraße",
	y = 4085.0 
}
streetTable.sn[818] = {
	name = "Waldemar-Götze-Straße",
	y = 4090.0 
}
streetTable.sn[819] = {
	name = "Sackestraße",
	y = 4095.0 
}
streetTable.sn[820] = {
	name = "Kutschweg",
	y = 4100.0 
}
streetTable.sn[821] = {
	name = "Stammerstraße",
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
	name = "Schubertstraße",
	y = 4120.0 
}
streetTable.sn[825] = {
	name = "Krautgartenweg",
	y = 4125.0 
}
streetTable.sn[826] = {
	name = "Döringstraße",
	y = 4130.0 
}
streetTable.sn[827] = {
	name = "Vlamenstraße",
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
	name = "Emil-Fuchs-Straße",
	y = 4150.0 
}
streetTable.sn[831] = {
	name = "Lausener Bogen",
	y = 4155.0 
}
streetTable.sn[832] = {
	name = "Selliner Straße",
	y = 4160.0 
}
streetTable.sn[833] = {
	name = "Kommandant-Prendel-Allee",
	y = 4165.0 
}
streetTable.sn[834] = {
	name = "Schadowstraße",
	y = 4170.0 
}
streetTable.sn[835] = {
	name = "Haydnstraße",
	y = 4175.0 
}
streetTable.sn[836] = {
	name = "Nikischstraße",
	y = 4180.0 
}
streetTable.sn[837] = {
	name = "Friedhofsweg",
	y = 4185.0 
}
streetTable.sn[838] = {
	name = "Karl-Schurz-Straße",
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
	name = "Martinshöhe",
	y = 4205.0 
}
streetTable.sn[842] = {
	name = "Seidelstraße",
	y = 4210.0 
}
streetTable.sn[843] = {
	name = "Henriettenstraße",
	y = 4215.0 
}
streetTable.sn[844] = {
	name = "Rapsweg",
	y = 4220.0 
}
streetTable.sn[845] = {
	name = "Marpergerstraße",
	y = 4225.0 
}
streetTable.sn[846] = {
	name = "Rostocker Straße",
	y = 4230.0 
}
streetTable.sn[847] = {
	name = "Zauberweg",
	y = 4235.0 
}
streetTable.sn[848] = {
	name = "Schladitzer Straße",
	y = 4240.0 
}
streetTable.sn[849] = {
	name = "Wahrener Straße",
	y = 4245.0 
}
streetTable.sn[850] = {
	name = "Muldentalstraße",
	y = 4250.0 
}
streetTable.sn[851] = {
	name = "Krugstraße",
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
	name = "Göbschelwitzer Weg",
	y = 4275.0 
}
streetTable.sn[856] = {
	name = "Brandenburger Straße",
	y = 4280.0 
}
streetTable.sn[857] = {
	name = "Philippine-Arndt-Weg",
	y = 4285.0 
}
streetTable.sn[858] = {
	name = "Marbachstraße",
	y = 4290.0 
}
streetTable.sn[859] = {
	name = "Breitenfelder Straße",
	y = 4295.0 
}
streetTable.sn[860] = {
	name = "Amorbacher Straße",
	y = 4300.0 
}
streetTable.sn[861] = {
	name = "Am Mühlgraben",
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
	name = "Wiprechtstraße",
	y = 4325.0 
}
streetTable.sn[866] = {
	name = "Zwergmispelstraße",
	y = 4330.0 
}
streetTable.sn[867] = {
	name = "Björneborgstraße",
	y = 4335.0 
}
streetTable.sn[868] = {
	name = "Bernhardstraße",
	y = 4340.0 
}
streetTable.sn[869] = {
	name = "Waldweg",
	y = 4345.0 
}
streetTable.sn[870] = {
	name = "Vollhardtstraße",
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
	name = "Pfaffendorfer Straße",
	y = 4365.0 
}
streetTable.sn[874] = {
	name = "Willmar-Schwabe-Straße",
	y = 4370.0 
}
streetTable.sn[875] = {
	name = "Koehlerstraße",
	y = 4375.0 
}
streetTable.sn[876] = {
	name = "Toskastraße",
	y = 4380.0 
}
streetTable.sn[877] = {
	name = "Herwigstraße",
	y = 4385.0 
}
streetTable.sn[878] = {
	name = "Kuckucksweg",
	y = 4390.0 
}
streetTable.sn[879] = {
	name = "Dösner Straße",
	y = 4395.0 
}
streetTable.sn[880] = {
	name = "Gothaer Straße",
	y = 4400.0 
}
streetTable.sn[881] = {
	name = "Grimmaische Straße",
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
	name = "Blochmannstraße",
	y = 4430.0 
}
streetTable.sn[887] = {
	name = "Stahmelner Allee",
	y = 4435.0 
}
streetTable.sn[888] = {
	name = "Schmitzstraße",
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
	name = "Aachener Straße",
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
	name = "Lausener Straße",
	y = 4490.0 
}
streetTable.sn[899] = {
	name = "Waldbaurstraße",
	y = 4495.0 
}
streetTable.sn[900] = {
	name = "Zinnienweg",
	y = 4500.0 
}
streetTable.sn[901] = {
	name = "Johannes-Kärner-Straße",
	y = 4505.0 
}
streetTable.sn[902] = {
	name = "Heinrich-Kaps-Straße",
	y = 4510.0 
}
streetTable.sn[903] = {
	name = "Berliner Straße",
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
	name = "Magdalenenstraße",
	y = 4530.0 
}
streetTable.sn[907] = {
	name = "Clara-Zetkin-Straße",
	y = 4535.0 
}
streetTable.sn[908] = {
	name = "Stötteritzer Straße",
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
	name = "Wiederitzscher Landstraße",
	y = 4575.0 
}
streetTable.sn[916] = {
	name = "An der Windmühle",
	y = 4580.0 
}
streetTable.sn[917] = {
	name = "Calvisiusstraße",
	y = 4585.0 
}
streetTable.sn[918] = {
	name = "Rabet",
	y = 4590.0 
}
streetTable.sn[919] = {
	name = "Grünbacher Weg",
	y = 4595.0 
}
streetTable.sn[920] = {
	name = "Schröderstraße",
	y = 4600.0 
}
streetTable.sn[921] = {
	name = "Walther-Rathenau-Straße",
	y = 4605.0 
}
streetTable.sn[922] = {
	name = "Julius-Krause-Straße",
	y = 4610.0 
}
streetTable.sn[923] = {
	name = "Rosenmüllerstraße",
	y = 4615.0 
}
streetTable.sn[924] = {
	name = "Albersdorfer Weg",
	y = 4620.0 
}
streetTable.sn[925] = {
	name = "Auguste-Hennig-Straße",
	y = 4625.0 
}
streetTable.sn[926] = {
	name = "Dohnanyistraße",
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
	name = "Wiebelstraße",
	y = 4645.0 
}
streetTable.sn[930] = {
	name = "Braunstraße",
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
	name = "Siemeringstraße",
	y = 4665.0 
}
streetTable.sn[934] = {
	name = "Neue Gutenbergstraße",
	y = 4670.0 
}
streetTable.sn[935] = {
	name = "Riesenweg",
	y = 4675.0 
}
streetTable.sn[936] = {
	name = "Shakespearestraße",
	y = 4680.0 
}
streetTable.sn[937] = {
	name = "Heubnerweg",
	y = 4685.0 
}
streetTable.sn[938] = {
	name = "Ossietzkystraße",
	y = 4690.0 
}
streetTable.sn[939] = {
	name = "Pferdnerstraße",
	y = 4695.0 
}
streetTable.sn[940] = {
	name = "Goldene Hufe",
	y = 4700.0 
}
streetTable.sn[941] = {
	name = "Ziustraße",
	y = 4705.0 
}
streetTable.sn[942] = {
	name = "Auschwitzer Straße",
	y = 4710.0 
}
streetTable.sn[943] = {
	name = "Herzenstraße",
	y = 4715.0 
}
streetTable.sn[944] = {
	name = "Robert-Koch-Weg",
	y = 4720.0 
}
streetTable.sn[945] = {
	name = "Schacherstraße",
	y = 4725.0 
}
streetTable.sn[946] = {
	name = "Erlkönigweg",
	y = 4730.0 
}
streetTable.sn[947] = {
	name = "Gregor-Fuchs-Straße",
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
	name = "An der Mühlpleiße",
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
	name = "Etkar-Andre-Straße",
	y = 4770.0 
}
streetTable.sn[955] = {
	name = "Burgstädter Straße",
	y = 4775.0 
}
streetTable.sn[956] = {
	name = "Lyoner Straße",
	y = 4780.0 
}
streetTable.sn[957] = {
	name = "Vater-Jahn-Straße",
	y = 4785.0 
}
streetTable.sn[958] = {
	name = "Hans-Poeche-Straße",
	y = 4790.0 
}
streetTable.sn[959] = {
	name = "Emil-Teich-Straße",
	y = 4795.0 
}
streetTable.sn[960] = {
	name = "Dölziger Straße",
	y = 4800.0 
}
streetTable.sn[961] = {
	name = "Hoepnerstraße",
	y = 4805.0 
}
streetTable.sn[962] = {
	name = "Vor dem Hospitaltore",
	y = 4810.0 
}
streetTable.sn[963] = {
	name = "Opalstraße",
	y = 4815.0 
}
streetTable.sn[964] = {
	name = "Kantstraße",
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
	name = "Lotzestraße",
	y = 4835.0 
}
streetTable.sn[968] = {
	name = "Möckernsche Allee",
	y = 4840.0 
}
streetTable.sn[969] = {
	name = "Bernhard-Kellermann-Straße",
	y = 4845.0 
}
streetTable.sn[970] = {
	name = "Portitzer Straße",
	y = 4850.0 
}
streetTable.sn[971] = {
	name = "Sybelstraße",
	y = 4855.0 
}
streetTable.sn[972] = {
	name = "Güntzstraße",
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
	name = "Marktstraße",
	y = 4880.0 
}
streetTable.sn[977] = {
	name = "Blümnerstraße",
	y = 4885.0 
}
streetTable.sn[978] = {
	name = "Wasunger Straße",
	y = 4890.0 
}
streetTable.sn[979] = {
	name = "Zschopauer Straße",
	y = 4895.0 
}
streetTable.sn[980] = {
	name = "Zum Denkmal",
	y = 4900.0 
}
streetTable.sn[981] = {
	name = "Kulmbacher Straße",
	y = 4905.0 
}
streetTable.sn[982] = {
	name = "Zehmischstraße",
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
	name = "Riebeckstraße",
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
	name = "Dreilindenstraße",
	y = 4940.0 
}
streetTable.sn[989] = {
	name = "Essener Straße",
	y = 4945.0 
}
streetTable.sn[990] = {
	name = "Burgundenstraße",
	y = 4950.0 
}
streetTable.sn[991] = {
	name = "Hasenheide",
	y = 4955.0 
}
streetTable.sn[992] = {
	name = "Heiterblickstraße",
	y = 4960.0 
}
streetTable.sn[993] = {
	name = "Hartzstraße",
	y = 4965.0 
}
streetTable.sn[994] = {
	name = "Lipsiusstraße",
	y = 4970.0 
}
streetTable.sn[995] = {
	name = "Crensitzer Weg",
	y = 4975.0 
}
streetTable.sn[996] = {
	name = "Strelitzer Straße",
	y = 4980.0 
}
streetTable.sn[997] = {
	name = "Lise-Meitner-Straße",
	y = 4985.0 
}
streetTable.sn[998] = {
	name = "Lippendorfer Straße",
	y = 4990.0 
}
streetTable.sn[999] = {
	name = "Dammstraße",
	y = 4995.0 
}
streetTable.sn[1000] = {
	name = "Am Sportplatz",
	y = 5000.0 
}
streetTable.sn[1001] = {
	name = "Hänselweg",
	y = 5005.0 
}
streetTable.sn[1002] = {
	name = "Gustav-Schmoller-Straße",
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
	name = "Bitterfelder Straße",
	y = 5045.0 
}
streetTable.sn[1010] = {
	name = "Straße des 17. Juni",
	y = 5050.0 
}
streetTable.sn[1011] = {
	name = "Dachsstraße",
	y = 5055.0 
}
streetTable.sn[1012] = {
	name = "Seemannstraße",
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
	name = "Wilhelm-Pfennig-Straße",
	y = 5080.0 
}
streetTable.sn[1017] = {
	name = "Holzhausener Straße",
	y = 5085.0 
}
streetTable.sn[1018] = {
	name = "Böttgerstraße",
	y = 5090.0 
}
streetTable.sn[1019] = {
	name = "Ernst-Guhr-Straße",
	y = 5095.0 
}
streetTable.sn[1020] = {
	name = "Robert-Koch-Straße",
	y = 5100.0 
}
streetTable.sn[1021] = {
	name = "Geibelstraße",
	y = 5105.0 
}
streetTable.sn[1022] = {
	name = "Am Gartenverein",
	y = 5110.0 
}
streetTable.sn[1023] = {
	name = "Schneeberger Straße",
	y = 5115.0 
}
streetTable.sn[1024] = {
	name = "Segerstraße",
	y = 5120.0 
}
streetTable.sn[1025] = {
	name = "Hermann-Dorner-Straße",
	y = 5125.0 
}
streetTable.sn[1026] = {
	name = "Schmalkaldener Weg",
	y = 5130.0 
}
streetTable.sn[1027] = {
	name = "Arthur-Hausmann-Straße",
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
	name = "Springerstraße",
	y = 5155.0 
}
streetTable.sn[1032] = {
	name = "Cheruskerstraße",
	y = 5160.0 
}
streetTable.sn[1033] = {
	name = "Mansfelder Weg",
	y = 5165.0 
}
streetTable.sn[1034] = {
	name = "Hegelstraße",
	y = 5170.0 
}
streetTable.sn[1035] = {
	name = "Schildberger Weg",
	y = 5175.0 
}
streetTable.sn[1036] = {
	name = "Abtnaundorfer Straße",
	y = 5180.0 
}
streetTable.sn[1037] = {
	name = "Große Gartensiedlung",
	y = 5185.0 
}
streetTable.sn[1038] = {
	name = "Am Schwalbennest",
	y = 5190.0 
}
streetTable.sn[1039] = {
	name = "Schmiedestraße",
	y = 5195.0 
}
streetTable.sn[1040] = {
	name = "Schulze-Boysen-Straße",
	y = 5200.0 
}
streetTable.sn[1041] = {
	name = "Beyerleinstraße",
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
	name = "Geutebrückstraße",
	y = 5230.0 
}
streetTable.sn[1047] = {
	name = "Pistorisstraße",
	y = 5235.0 
}
streetTable.sn[1048] = {
	name = "Poniatowskiplan",
	y = 5240.0 
}
streetTable.sn[1049] = {
	name = "Hugo-Licht-Straße",
	y = 5245.0 
}
streetTable.sn[1050] = {
	name = "Menzingenweg",
	y = 5250.0 
}
streetTable.sn[1051] = {
	name = "Brunnenstraße",
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
	name = "Göschenstraße",
	y = 5270.0 
}
streetTable.sn[1055] = {
	name = "Oswaldstraße",
	y = 5275.0 
}
streetTable.sn[1056] = {
	name = "An der Kaninchenfarm",
	y = 5280.0 
}
streetTable.sn[1057] = {
	name = "Huygensstraße",
	y = 5285.0 
}
streetTable.sn[1058] = {
	name = "Kolonnadenstraße",
	y = 5290.0 
}
streetTable.sn[1059] = {
	name = "Sanddornweg",
	y = 5295.0 
}
streetTable.sn[1060] = {
	name = "Würkertstraße",
	y = 5300.0 
}
streetTable.sn[1061] = {
	name = "Weidenbachplan",
	y = 5305.0 
}
streetTable.sn[1062] = {
	name = "Limburgerstraße",
	y = 5310.0 
}
streetTable.sn[1063] = {
	name = "Richard-Wagner-Straße",
	y = 5315.0 
}
streetTable.sn[1064] = {
	name = "Rehpfad",
	y = 5320.0 
}
streetTable.sn[1065] = {
	name = "Grassistraße",
	y = 5325.0 
}
streetTable.sn[1066] = {
	name = "Scipiostraße",
	y = 5330.0 
}
streetTable.sn[1067] = {
	name = "Liselotte-Herrmann-Straße",
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
	name = "Parkstraße",
	y = 5350.0 
}
streetTable.sn[1071] = {
	name = "Gesnerstraße",
	y = 5355.0 
}
streetTable.sn[1072] = {
	name = "Sandmännchenweg",
	y = 5360.0 
}
streetTable.sn[1073] = {
	name = "Äußere Mühlenstraße",
	y = 5365.0 
}
streetTable.sn[1074] = {
	name = "Crednerstraße",
	y = 5370.0 
}
streetTable.sn[1075] = {
	name = "Grunertstraße",
	y = 5375.0 
}
streetTable.sn[1076] = {
	name = "Querstraße",
	y = 5380.0 
}
streetTable.sn[1077] = {
	name = "Wiesenweg",
	y = 5385.0 
}
streetTable.sn[1078] = {
	name = "Seegeritzer Straße",
	y = 5390.0 
}
streetTable.sn[1079] = {
	name = "Kästnerbogen",
	y = 5395.0 
}
streetTable.sn[1080] = {
	name = "Breslauer Straße",
	y = 5400.0 
}
streetTable.sn[1081] = {
	name = "Gregoriusstraße",
	y = 5405.0 
}
streetTable.sn[1082] = {
	name = "Reudnitzer Straße",
	y = 5410.0 
}
streetTable.sn[1083] = {
	name = "Stieglitzstraße",
	y = 5415.0 
}
streetTable.sn[1084] = {
	name = "Paul-Langheinrich-Straße",
	y = 5420.0 
}
streetTable.sn[1085] = {
	name = "Adlershelmstraße",
	y = 5425.0 
}
streetTable.sn[1086] = {
	name = "Fuggerstraße",
	y = 5430.0 
}
streetTable.sn[1087] = {
	name = "Brühl",
	y = 5435.0 
}
streetTable.sn[1088] = {
	name = "Lidicestraße",
	y = 5440.0 
}
streetTable.sn[1089] = {
	name = "Bienerstraße",
	y = 5445.0 
}
streetTable.sn[1090] = {
	name = "Tornauer Straße",
	y = 5450.0 
}
streetTable.sn[1091] = {
	name = "Fritz-Schmenkel-Straße",
	y = 5455.0 
}
streetTable.sn[1092] = {
	name = "Dürrenberger Straße",
	y = 5460.0 
}
streetTable.sn[1093] = {
	name = "Am Pfingstanger",
	y = 5465.0 
}
streetTable.sn[1094] = {
	name = "Trendelenburgstraße",
	y = 5470.0 
}
streetTable.sn[1095] = {
	name = "Seelenbinderstraße",
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
	name = "Georg-Reichardt-Straße",
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
	name = "Nathusiusstraße",
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
	name = "Mühlenweg",
	y = 5535.0 
}
streetTable.sn[1108] = {
	name = "Campestraße",
	y = 5540.0 
}
streetTable.sn[1109] = {
	name = "Am Bauernteich",
	y = 5545.0 
}
streetTable.sn[1110] = {
	name = "Kunzestraße",
	y = 5550.0 
}
streetTable.sn[1111] = {
	name = "Salbeiweg",
	y = 5555.0 
}
streetTable.sn[1112] = {
	name = "Zusestraße",
	y = 5560.0 
}
streetTable.sn[1113] = {
	name = "GutsMuthsstraße",
	y = 5565.0 
}
streetTable.sn[1114] = {
	name = "Universitätsstraße",
	y = 5570.0 
}
streetTable.sn[1115] = {
	name = "Ostwaldstraße",
	y = 5575.0 
}
streetTable.sn[1116] = {
	name = "Brehmestraße",
	y = 5580.0 
}
streetTable.sn[1117] = {
	name = "Karl-Heft-Straße",
	y = 5585.0 
}
streetTable.sn[1118] = {
	name = "Wolfgang-Heinze-Straße",
	y = 5590.0 
}
streetTable.sn[1119] = {
	name = "Neumannstraße",
	y = 5595.0 
}
streetTable.sn[1120] = {
	name = "Ferdinand-Freiligrath-Straß",
	y = 5600.0 
}
streetTable.sn[1121] = {
	name = "Bernburger Straße",
	y = 5605.0 
}
streetTable.sn[1122] = {
	name = "Harnischstraße",
	y = 5610.0 
}
streetTable.sn[1123] = {
	name = "Siemensstraße",
	y = 5615.0 
}
streetTable.sn[1124] = {
	name = "Sulzbacher Straße",
	y = 5620.0 
}
streetTable.sn[1125] = {
	name = "Robert-Blum-Straße",
	y = 5625.0 
}
streetTable.sn[1126] = {
	name = "Altenburger Straße",
	y = 5630.0 
}
streetTable.sn[1127] = {
	name = "Grundstraße",
	y = 5635.0 
}
streetTable.sn[1128] = {
	name = "Großsteinberger Straße",
	y = 5640.0 
}
streetTable.sn[1129] = {
	name = "Handelsring",
	y = 5645.0 
}
streetTable.sn[1130] = {
	name = "Sophie-Scholl-Straße",
	y = 5650.0 
}
streetTable.sn[1131] = {
	name = "Otto-Heinze-Straße",
	y = 5655.0 
}
streetTable.sn[1132] = {
	name = "Kändlerstraße",
	y = 5660.0 
}
streetTable.sn[1133] = {
	name = "Andromedaweg",
	y = 5665.0 
}
streetTable.sn[1134] = {
	name = "Plautstraße",
	y = 5670.0 
}
streetTable.sn[1135] = {
	name = "Tschaikowskistraße",
	y = 5675.0 
}
streetTable.sn[1136] = {
	name = "Karl-Moor-Weg",
	y = 5680.0 
}
streetTable.sn[1137] = {
	name = "Perrestraße",
	y = 5685.0 
}
streetTable.sn[1138] = {
	name = "Heideweg",
	y = 5690.0 
}
streetTable.sn[1139] = {
	name = "Pfeffingerstraße",
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
	name = "Wilhelm-Winkler-Straße",
	y = 5710.0 
}
streetTable.sn[1143] = {
	name = "Petersstraße",
	y = 5715.0 
}
streetTable.sn[1144] = {
	name = "Laurentiusstraße",
	y = 5720.0 
}
streetTable.sn[1145] = {
	name = "Balderstraße",
	y = 5725.0 
}
streetTable.sn[1146] = {
	name = "Erich-Mühsam-Weg",
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
	name = "Oeserstraße",
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
	name = "Brockhausstraße",
	y = 5760.0 
}
streetTable.sn[1153] = {
	name = "Zur Rodelbahn",
	y = 5765.0 
}
streetTable.sn[1154] = {
	name = "Kleine Bergstraße",
	y = 5770.0 
}
streetTable.sn[1155] = {
	name = "Roßlauer Straße",
	y = 5775.0 
}
streetTable.sn[1156] = {
	name = "Stegerwaldstraße",
	y = 5780.0 
}
streetTable.sn[1157] = {
	name = "Karl-Liebknecht-Straße",
	y = 5785.0 
}
streetTable.sn[1158] = {
	name = "Fritz-Hanschmann-Straße",
	y = 5790.0 
}
streetTable.sn[1159] = {
	name = "Frohburger Straße",
	y = 5795.0 
}
streetTable.sn[1160] = {
	name = "Zur Heide",
	y = 5800.0 
}
streetTable.sn[1161] = {
	name = "Altranstädter Straße",
	y = 5805.0 
}
streetTable.sn[1162] = {
	name = "Swiftstraße",
	y = 5810.0 
}
streetTable.sn[1163] = {
	name = "Dessauer Straße",
	y = 5815.0 
}
streetTable.sn[1164] = {
	name = "Klopstockstraße",
	y = 5820.0 
}
streetTable.sn[1165] = {
	name = "Schmidstraße",
	y = 5825.0 
}
streetTable.sn[1166] = {
	name = "Brentanostraße",
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
	name = "Barnecker Straße",
	y = 5845.0 
}
streetTable.sn[1170] = {
	name = "Reichenberger Straße",
	y = 5850.0 
}
streetTable.sn[1171] = {
	name = "Matzelstraße",
	y = 5855.0 
}
streetTable.sn[1172] = {
	name = "Großbeerener Straße",
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
	name = "Dimpfelstraße",
	y = 5875.0 
}
streetTable.sn[1176] = {
	name = "Mühlenstraße",
	y = 5880.0 
}
streetTable.sn[1177] = {
	name = "Dr.-Wilhelm-Külz-Straße",
	y = 5885.0 
}
streetTable.sn[1178] = {
	name = "Liebfrauenstraße",
	y = 5890.0 
}
streetTable.sn[1179] = {
	name = "Zum Alten Seebad",
	y = 5895.0 
}
streetTable.sn[1180] = {
	name = "Dimitroffstraße",
	y = 5900.0 
}
streetTable.sn[1181] = {
	name = "Kleiner Poetenweg",
	y = 5905.0 
}
streetTable.sn[1182] = {
	name = "Hinrichsenstraße",
	y = 5910.0 
}
streetTable.sn[1183] = {
	name = "Weidmannstraße",
	y = 5915.0 
}
streetTable.sn[1184] = {
	name = "Otto-Michael-Straße",
	y = 5920.0 
}
streetTable.sn[1185] = {
	name = "Schubarthstraße",
	y = 5925.0 
}
streetTable.sn[1186] = {
	name = "Helmholtzstraße",
	y = 5930.0 
}
streetTable.sn[1187] = {
	name = "Kärrnerweg",
	y = 5935.0 
}
streetTable.sn[1188] = {
	name = "Windsheimer Straße",
	y = 5940.0 
}
streetTable.sn[1189] = {
	name = "Idunweg",
	y = 5945.0 
}
streetTable.sn[1190] = {
	name = "Holbeinstraße",
	y = 5950.0 
}
streetTable.sn[1191] = {
	name = "Quermaße",
	y = 5955.0 
}
streetTable.sn[1192] = {
	name = "Claußbruchstraße",
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
	name = "Verlängerte Wilhelmstraße",
	y = 5980.0 
}
streetTable.sn[1197] = {
	name = "Plösener Straße",
	y = 5985.0 
}
streetTable.sn[1198] = {
	name = "An der Gänseweide",
	y = 5990.0 
}
streetTable.sn[1199] = {
	name = "Obere Nordstraße",
	y = 5995.0 
}
streetTable.sn[1200] = {
	name = "Carl-Meyer-Straße",
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
