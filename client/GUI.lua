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



_guiSetVisible = guiSetVisible
function guiSetVisible(guiElement, toggle)
	if toggle == true then
		if getElementType(guiElement) == "gui-window" then
			local toFadeAlpha = guiGetAlpha(guiElement)
			guiSetAlpha(guiElement, 0)
			--Animation.createAndPlay(guiElement, { from = 0, to = toFadeAlpha, time = 250, fn = guiSetAlpha })
			Animation.createAndPlay(guiElement, { from = 0, to = 0.95, time = 250, fn = guiSetAlpha })
		end	
		_guiSetVisible(guiElement, true)
	else
		_guiSetVisible(guiElement, false)
	end
end

g_registergui = {}
g_Logingui = {}
g_Playermenugui = {}
g_Handymenu = {}
g_Moneymenu = {}
g_ADACgui = {}
g_housegui = {}
g_postgui = {}
g_postreadgui = {}
g_postwritegui = {}
g_housebuygui = {}
g_itemgui = {}
g_itemtauschgui = {}
g_jobeditgui = {}
g_tankergui = {}
g_changecolgui = {}
g_changecolguiuser = {}
g_bewerbungViewer = {}
g_chefoptions = {}
g_carsale = {}
g_tuning = {}
g_tuningende = {}
g_scoreboard = {}
g_spielmenu = {}
g_lizenz = {}
g_flightlizenz = {}
g_weaponshop = {}
g_wahlengui = {}
g_radio = {}
g_cinterior = {}
g_watertank = {}
g_pwchange = {}
g_mailchange = {}
g_stadtgui = {}
g_arbeitserlaubnisgui = {}
g_itemshopgui = {}
g_playerstats = {}
g_infomenu = {}
g_bugGUI = {}
g_removeItemGUI = {}
g_autodiebGUI = {}

g_guiloaded = {}
g_guiloaded["ADACgui"] = false
g_guiloaded["postgui"] = false
g_guiloaded["postreadgui"] = false
g_guiloaded["postwritegui"] = false
g_guiloaded["housebuygui"] = false
g_guiloaded["tankergui"] = false
g_guiloaded["autokaufgui"] = false
g_guiloaded["tuninggui"] = false
g_guiloaded["weaponlizensgui"] = false
g_guiloaded["flightlizensgui"] = false
g_guiloaded["weaponshopgui"] = false
g_guiloaded["wahlgui"] = false
g_guiloaded["register"] = false
g_guiloaded["cinterior"] = false
g_guiloaded["jobeditgui"] = false
g_guiloaded["geldautomatgui"] = false
g_guiloaded["chefoptionsgui"] = false
g_guiloaded["bewerbungsviewergui"] = false
g_guiloaded["pwchangegui"] = false
g_guiloaded["mailchangegui"] = false
g_guiloaded["stadtgui"] = false
g_guiloaded["arbeitserlaubnis"] = false
g_guiloaded["itemshop"] = false
g_guiloaded["playerstats"] = false
g_guiloaded["buggui"] = false
g_guiloaded["removeitemgui"] = false
g_guiloaded["autidieb"] = false

function PlayerGUI()
	guiSetInputMode ("no_binds_when_editing")
	
	--Login
	local img = {}
		img[1] = "./files/login/SA_1.jpg"
		img[2] = "./files/login/SA_2.jpg"
		img[3] = "./files/login/SA_3.jpg"
		img[4] = "./files/login/SA_4.jpg"
	local number = math.random(4)
	
	g_Logingui["IMG"] = guiCreateStaticImage(0,0,1,1,img[number],true)
	g_Logingui["Username"] = guiCreateEdit(0.8391,0.7417,0.1282,0.0271,getPlayerName(getLocalPlayer()),true,g_Logingui["IMG"])
	g_Logingui["Username_label"] = guiCreateLabel(0.7766,0.7542,0.0602,0.0229,"Username:",true,g_Logingui["IMG"])
	g_Logingui["Password"] = guiCreateEdit(0.8391,0.799,0.1281,0.0271,"",true,g_Logingui["IMG"])
	g_Logingui["Password_label"] = guiCreateLabel(0.7766,0.8135,0.0602,0.0229,"Passwort:",true,g_Logingui["IMG"])
	g_Logingui["Login_label"] = guiCreateLabel(0.807,0.6427,0.1227,0.1073,"Login",true,g_Logingui["IMG"])
	g_Logingui["Login_Button"] = guiCreateButton(0.7711,0.8708,0.207,0.0594,"Los geht's!",true,g_Logingui["IMG"])
	g_Logingui["true_label"] = guiCreateLabel(0.0063,0.9708,0.0859,0.0188,"Login erfolgreich....",true,g_Logingui["IMG"]) --Welcher Sinn steckt dahinter? xD 	Keiner!^^
	g_Logingui["false_label"] = guiCreateLabel(0.0063,0.9708,0.0859,0.0188,"Falsches Passwort!",true,g_Logingui["IMG"])
		
	guiSetFont(g_Logingui["Login_Button"],"sa-header")
	guiSetProperty(g_Logingui["Login_Button"], "HoverTextColour", "FFFF3300")
	guiSetProperty(g_Logingui["Login_Button"], "NormalTextColour", "FFFFFF66")
	guiSetFont(g_Logingui["Username_label"],"default-bold-small")
	guiSetFont(g_Logingui["Password_label"],"default-bold-small")
	guiSetFont(g_Logingui["Login_label"],"sa-gothic")
	guiSetFont(g_Logingui["true_label"],"default-bold-small")
	guiSetFont(g_Logingui["false_label"],"default-bold-small")
	
	--guiLabelSetColor(g_Logingui["Password_label"],255,255,255)
	--guiLabelSetColor(g_Logingui["Username_label"],255,255,255)
	--guiLabelSetColor(g_Logingui["Login_label"],255,255,255)
	guiLabelSetColor(g_Logingui["true_label"],0,255,0)
	guiLabelSetColor(g_Logingui["false_label"],255,0,0)
	
	guiEditSetMasked(g_Logingui["Password"], true)
	--guiWindowSetMovable(g_Logingui["IMG"], false)
	--guiWindowSetSizable(g_Logingui["IMG"], false)
	guiSetVisible(g_Logingui["IMG"], false)
	guiSetVisible(g_Logingui["true_label"], false)
	guiSetVisible(g_Logingui["false_label"], false)
	
	--Handymenu
	g_Handymenu["Window"] = guiCreateWindow(0.82, 0.65, 0.15, 0.3, "", true)
	g_Handymenu["Display"] = guiCreateMemo(0.075, 0.1, 0.85, 0.4, "", true, g_Handymenu["Window"])
	guiMemoSetReadOnly(g_Handymenu["Display"], true)
	g_Handymenu["Anruf"] = guiCreateButton(0.075, 0.54, 0.3, 0.06, "Anrufen", true, g_Handymenu["Window"])
	g_Handymenu["Auflegen"] = guiCreateButton(0.625, 0.54, 0.3, 0.06, "Auflegen", true, g_Handymenu["Window"])
	g_Handymenu["Taste1"] = guiCreateButton(0.075, 0.62, 0.25, 0.06, "1", true, g_Handymenu["Window"])
	g_Handymenu["Taste2"] = guiCreateButton(0.375, 0.62, 0.25, 0.06, "2", true, g_Handymenu["Window"])
	g_Handymenu["Taste3"] = guiCreateButton(0.675, 0.62, 0.25, 0.06, "3", true, g_Handymenu["Window"])
	g_Handymenu["Taste4"] = guiCreateButton(0.075, 0.7, 0.25, 0.06, "4", true, g_Handymenu["Window"])
	g_Handymenu["Taste5"] = guiCreateButton(0.375, 0.7, 0.25, 0.06, "5", true, g_Handymenu["Window"])
	g_Handymenu["Taste6"] = guiCreateButton(0.675, 0.7, 0.25, 0.06, "6", true, g_Handymenu["Window"])	
	g_Handymenu["Taste7"] = guiCreateButton(0.075, 0.78, 0.25, 0.06, "7", true, g_Handymenu["Window"])
	g_Handymenu["Taste8"] = guiCreateButton(0.375, 0.78, 0.25, 0.06, "8", true, g_Handymenu["Window"])
	g_Handymenu["Taste9"] = guiCreateButton(0.675, 0.78, 0.25, 0.06, "9", true, g_Handymenu["Window"])
	g_Handymenu["TasteS"] = guiCreateButton(0.075, 0.86, 0.25, 0.06, "*", true, g_Handymenu["Window"])
	g_Handymenu["Taste0"] = guiCreateButton(0.375, 0.86, 0.25, 0.06, "0", true, g_Handymenu["Window"])
	g_Handymenu["TasteR"] = guiCreateButton(0.675, 0.86, 0.25, 0.06, "#", true, g_Handymenu["Window"])
	guiWindowSetMovable(g_Handymenu["Window"], false)
	guiWindowSetSizable(g_Handymenu["Window"], false)
	guiSetVisible(g_Handymenu["Window"], false)	
	guiSetAlpha(g_Handymenu["Window"], 1)
	
	--Playermenu
	g_Playermenugui["Window1"] = guiCreateWindow(0.3, 0.25, 0.5, 0.5, "Spielermen"..uuml.."", true)
	local tab = guiCreateTabPanel(0.05, 0.05, 0.9, 0.9, true, g_Playermenugui["Window1"])
	g_Playermenugui["Tab"] = tab
	--local tab1 = guiCreateTab("Allgemein", tab)
	local tab2 = guiCreateTab("Systemeinstellungen", tab)
	local tab3 = guiCreateTab("Grafikeinstellungen", tab)
	local tab5 = guiCreateTab("Mapeinstellungen", tab)
	local tab4 = guiCreateTab("Hilfe", tab)
	local tab6 = guiCreateTab("Player-Message Log", tab)
	g_Playermenugui["Tab2"] = tab2
	g_Playermenugui["Tab3"] = tab3
	g_Playermenugui["Tab4"] = tab4
	g_Playermenugui["Tab5"] = tab5
	g_Playermenugui["Tab6"] = tab6
	--Systemeinstellungen
	local system = guiCreateLabel(0.05, 0.05, 0.8, 0.5, "Systemeinstellungen", true, tab2)
	guiSetFont(system, "sa-header")
	g_Playermenugui["PWChange"] = guiCreateButton(0.0469, 0.2525, 0.2135, 0.0828, "Passwort", true, tab2)
	g_Playermenugui["MailChange"] = guiCreateButton(0.2847, 0.2525, 0.2135, 0.0828, "E-Mail", true, tab2)
	--Grafikeinstellungen
	local tweaks = guiCreateLabel(0.05, 0.05, 0.5, 0.5, "Grafiktweaks", true, tab3)
	guiSetFont(tweaks, "sa-header")
	g_Playermenugui["BlurCheckbox"] = guiCreateCheckBox(0.05, 0.25, 0.5, 0.1, "Blureffekte aktivieren", true, true, tab3)
	g_Playermenugui["CloudsCheckbox"] = guiCreateCheckBox(0.05, 0.35, 0.5, 0.1, "Wolkeneffekte aktivieren", true, true, tab3)
	g_Playermenugui["WaterCheckbox"] = guiCreateCheckBox(0.05, 0.45, 0.5, 0.1, "Wassereffekte aktivieren", true, true, tab3)
	g_Playermenugui["BloomCheckbox"] = guiCreateCheckBox(0.05, 0.55, 0.5, 0.1, "Bloom aktivieren", true, true, tab3)
	g_Playermenugui["CarCheckbox"] = guiCreateCheckBox(0.05, 0.65, 0.5, 0.1, "Carpaint aktivieren", true, true, tab3)
	g_Playermenugui["FPSCheckbox"] = guiCreateCheckBox(0.05, 0.85, 0.5, 0.1, "FPS anzeigen", true, true, tab3)
	guiCheckBoxSetSelected(g_Playermenugui["FPSCheckbox"], false)
	--Mapeinstellungen
	local map = guiCreateLabel(0.05, 0.05, 0.5, 0.12, "Mapeinstellungen", true, tab5)
	guiSetFont(map, "sa-header")
	g_Playermenugui["Checkbox_tank"] = guiCreateCheckBox(0.05, 0.2, 0.2153, 0.0662, "Tankstellen", false, true, tab5)
	g_Playermenugui["Checkbox_tuning"] = guiCreateCheckBox(0.05, 0.3, 0.2153, 0.0662, "Tuning-Werkstatt", false, true, tab5)
	g_Playermenugui["Checkbox_freizeit"] = guiCreateCheckBox(0.05, 0.4, 0.2153, 0.0662, "Freizeit-Aktivit"..auml.."ten", false, true, tab5)
	g_Playermenugui["Checkbox_auto"] = guiCreateCheckBox(0.05, 0.5, 0.2153, 0.0662, "Autoh"..auml.."user", false, true, tab5)
	g_Playermenugui["Checkbox_kranken"] = guiCreateCheckBox(0.05, 0.6, 0.2153, 0.0662, "Krankenh"..auml.."user", false, true, tab5)
	g_Playermenugui["Checkbox_bank"] = guiCreateCheckBox(0.05, 0.7, 0.2153, 0.0662, "Bankautomaten", false, true, tab5)
	g_Playermenugui["Checkbox_job"] = guiCreateCheckBox(0.05, 0.8, 0.2153, 0.0662, "Jobs", false, true, tab5)
	g_Playermenugui["Checkbox_house"] = guiCreateCheckBox(0.05, 0.9, 0.2153, 0.0662, "Dein Haus", false, true, tab5)
	g_Playermenugui["Checkbox_letterbox"] = guiCreateCheckBox(0.3, 0.2, 0.2153, 0.0662, "Briefkästen", false, true, tab5)
	g_Playermenugui["Checkbox_cityhall"] = guiCreateCheckBox(0.3, 0.3, 0.2153, 0.0662, "Stadthalle", false, true, tab5)
	g_Playermenugui["Checkbox_minijob"] = guiCreateCheckBox(0.3, 0.4, 0.2153, 0.0662, "Minijobs", false, true, tab5)
	--Hilfe
	g_Playermenugui["HelpList"] = guiCreateGridList(0.05, 0.05, 0.3, 0.9, true, tab4)
	local gridlist = g_Playermenugui["HelpList"]
	local col1 = guiGridListAddColumn(gridlist, "Hilfethemen", 0.9)
	guiGridListSetItemText(gridlist, guiGridListAddRow(gridlist), col1, "Bedienung", false, false)
	guiGridListSetItemText(gridlist, guiGridListAddRow(gridlist), col1, "Fahrzeug", false, false)
	guiGridListSetItemText(gridlist, guiGridListAddRow(gridlist), col1, "Minijobs", false, false)
	guiGridListSetItemText(gridlist, guiGridListAddRow(gridlist), col1, "Handy", false, false)		
	guiGridListSetItemText(gridlist, guiGridListAddRow(gridlist), col1, "Jobs", false, false)	
	guiGridListSetItemText(gridlist, guiGridListAddRow(gridlist), col1, "  ADAC", false, false)	
	guiGridListSetItemText(gridlist, guiGridListAddRow(gridlist), col1, "  Feuerwehr", false, false)	
	guiGridListSetItemText(gridlist, guiGridListAddRow(gridlist), col1, "  Taxi", false, false)	
	guiGridListSetItemText(gridlist, guiGridListAddRow(gridlist), col1, "  Polizei", false, false)	
	guiGridListSetItemText(gridlist, guiGridListAddRow(gridlist), col1, "  Medic", false, false)	
	guiGridListSetItemText(gridlist, guiGridListAddRow(gridlist), col1, "  Post", false, false)
	guiGridListSetItemText(gridlist, guiGridListAddRow(gridlist), col1, "  Tanker", false, false)		
	g_Playermenugui["HelpMemo"] = guiCreateMemo(0.4, 0.05, 0.55, 0.9, "W"..auml.."hle ein Hilfethema aus.", true, tab4)
	guiMemoSetReadOnly(g_Playermenugui["HelpMemo"], true)
	guiWindowSetMovable(g_Playermenugui["Window1"], false)
	guiWindowSetSizable(g_Playermenugui["Window1"], false)
	guiSetVisible(g_Playermenugui["Window1"], false)	
	--Player-Message Log
	local titel = guiCreateLabel(0.05, 0.05, 0.7, 0.12, "Player-Message Log", true, tab6)
	guiSetFont(titel, "sa-header")
	g_Playermenugui["playerMessage"] = guiCreateMemo(0.044, 0.1861, 0.909, 0.7338, "Player-Message Log", true, tab6)
	guiMemoSetReadOnly(g_Playermenugui["playerMessage"], true)
	
	--Häuser
	g_housegui["window"] = guiCreateWindow(0.4, 0.4, 0.15, 0.25, "Haus", true)
	g_housegui["schloss"] = guiCreateButton(0.05, 0.15, 0.9, 0.1, "Schloss", true, g_housegui["window"])
	g_housegui["betreten"] = guiCreateButton(0.05, 0.3, 0.9, 0.1, "Betreten", true, g_housegui["window"])
	g_housegui["post"] = guiCreateButton(0.05, 0.45, 0.9, 0.1, "Briefkasten", true, g_housegui["window"])
	--g_housegui["items"] = guiCreateButton(0.05, 0.6, 0.9, 0.1, "Items", true, g_housegui["window"])
	g_housegui["abort"] = guiCreateButton(0.05, 0.85, 0.9, 0.1, "Abbrechen", true, g_housegui["window"])
	--guiSetEnabled(g_housegui["post"], false)
	--guiSetEnabled(g_housegui["items"], false)
	guiSetVisible(g_housegui["window"], false)
	guiWindowSetMovable(g_housegui["window"], false)
	guiWindowSetSizable(g_housegui["window"], false)
	
	--Itemmenü
	g_itemgui["window"] = guiCreateWindow(0.4057,0.1885,0.2781,0.5896,"Items",true)
	g_itemgui["grid"] = guiCreateGridList(0.0337,0.053,0.7725,0.9276,true,g_itemgui["window"])
	g_itemgui["itemcol"] = guiGridListAddColumn(g_itemgui["grid"],"Item",0.7)
	g_itemgui["anzcol"] = guiGridListAddColumn(g_itemgui["grid"],"Anzahl",0.2)
	guiGridListSetSelectionMode(g_itemgui["grid"],2)
	guiGridListSetSortingEnabled (g_itemgui["grid"], false)
	g_itemgui["itemimage"] = guiCreateStaticImage(0.8455,0.053,0.1,0.07,"./files/images/cross.png",true,g_itemgui["window"])
	g_itemgui["use"] = guiCreateStaticImage(0.8455,0.3600,0.1,0.07,"./files/ok.png",true,g_itemgui["window"])
	g_itemgui["destroy"] = guiCreateStaticImage(0.8455,0.4600,0.1,0.07,"./files/images/mail-trash.png",true,g_itemgui["window"])
	g_itemgui["give"] = guiCreateStaticImage(0.8455,0.5600,0.1,0.07,"./files/sync.png",true,g_itemgui["window"])
	guiWindowSetMovable(g_itemgui["window"], false)
	guiWindowSetSizable(g_itemgui["window"], false)
	guiSetVisible(g_itemgui["window"], false)

	--Itemtausch
	--[[g_itemtauschgui["window"] = guiCreateWindow(0.15, 0.15, 0.75, 0.75, "Itemtausch", true)
	g_itemtauschgui["gridlist1"] = guiCreateGridList(0.01, 0.05, 0.4, 0.95, true, g_itemtauschgui["window"])
	g_itemtauschgui["gridlist2"] = guiCreateGridList(0.6, 0.05, 0.4, 0.95, true, g_itemtauschgui["window"])
	g_itemtauschgui["ablegen"] = guiCreateButton(0.43, 0.1, 0.15, 0.025, "=>", true, g_itemtauschgui["window"])
	g_itemtauschgui["mitnehmen"] = guiCreateButton(0.43, 0.15, 0.15, 0.025, "<=", true, g_itemtauschgui["window"])
	g_itemtauschgui["speichern"] = guiCreateButton(0.43, 0.9, 0.15, 0.025, "Speichern", true, g_itemtauschgui["window"])
	g_itemtauschgui["abbrechen"] = guiCreateButton(0.43, 0.95, 0.15, 0.025, "Abbrechen", true, g_itemtauschgui["window"])
	guiGridListSetSortingEnabled(g_itemtauschgui["gridlist1"], false)
	guiGridListSetSortingEnabled(g_itemtauschgui["gridlist2"], false)
	guiWindowSetMovable(g_itemtauschgui["window"], false)
	guiWindowSetSizable(g_itemtauschgui["window"], false)
	guiSetVisible(g_itemtauschgui["window"], false)	--]]
	
	--FarbGui
	g_changecolguiuser["window"] = guiCreateWindow(0.35, 0.35, 0.52, 0.35, "Farbauswahl", true)
	g_changecolguiuser["Farben"] =  guiCreateStaticImage(0, 0.1, 10, 6, "files/colors.png", true, g_changecolguiuser["window"])
	guiWindowSetSizable(g_changecolguiuser["window"], false)
	guiSetVisible(g_changecolguiuser["window"], false)

	--Scoreboard
	g_scoreboard["window"] = guiCreateWindow(0.25,0.2177,0.5,0.5969,"MTA:RL Infoboard",true)
	g_scoreboard["label_spieler"] = guiCreateLabel(0.0198,0.075,0.173,0.0366,"Spieler:",true,g_scoreboard["window"])
		guiLabelSetColor(g_scoreboard["label_spieler"],100,200,200)
		guiSetFont(g_scoreboard["label_spieler"],"default-bold-small")
	g_scoreboard["label_online"] = guiCreateLabel(0.0195,0.0454,0.7031,0.0366,"MTA:RL gestartet seit:",true,g_scoreboard["window"])
		guiLabelSetColor(g_scoreboard["label_online"],100,200,200)
		guiSetFont(g_scoreboard["label_online"],"default-bold-small")
	guiWindowSetSizable(g_scoreboard["window"], false)
	guiWindowSetMovable(g_scoreboard["window"],false)
	guiSetVisible(g_scoreboard["window"], false)
	
	--Spielmen"..ouml.."
	--[[g_spielmenu["window"] = guiCreateWindow(0.2318,0.2361,0.5807,0.5914,"Spielmenu",true)
	guiWindowSetMovable(g_spielmenu["window"],false)
	guiWindowSetSizable(g_spielmenu["window"],false)
	guiSetVisible(g_spielmenu["window"], false)
	g_spielmenu["tabpanel"] = guiCreateTabPanel(0.0135,0.0411,0.9731,0.9413,true,g_spielmenu["window"])
	g_spielmenu["politikTab"] = guiCreateTab("Politik", g_spielmenu["tabpanel"])
	g_spielmenu["presilabel"] = guiCreateLabel(0.0215, 0.035, 0.9585, 0.116, "Repubik San Andreas", true, g_spielmenu["politikTab"])
	guiLabelSetColor(g_spielmenu["presilabel"],255, 215, 0)
	guiLabelSetVerticalAlign(g_spielmenu["presilabel"],"top")
	guiLabelSetHorizontalAlign(g_spielmenu["presilabel"],"left",false)
	guiSetFont(g_spielmenu["presilabel"],"sa-header")
	g_spielmenu["parlamentslabel"] = guiCreateLabel(0.023,0.2538,0.9539,0.0832,"Aktuelles Parlament:",true,g_spielmenu["politikTab"])
	guiLabelSetColor(g_spielmenu["parlamentslabel"],0, 255, 0)
	guiLabelSetVerticalAlign(g_spielmenu["parlamentslabel"],"top")
	guiLabelSetHorizontalAlign(g_spielmenu["parlamentslabel"],"left",false)
	g_spielmenu["parteienLabel"] = guiCreateLabel(0.023,0.3435,0.9555,0.6214,"Aktuelle Sitzzahl: 12

Parteien:
",true,g_spielmenu["politikTab"])
	guiLabelSetColor(g_spielmenu["parteienLabel"],255,255,255)
	guiLabelSetVerticalAlign(g_spielmenu["parteienLabel"],"top")
	guiLabelSetHorizontalAlign(g_spielmenu["parteienLabel"],"left",false)
	g_spielmenu["gesetztab"] = guiCreateTab("Gesetze", g_spielmenu["tabpanel"])--]]
	
	--Radio
	g_radio["label"] = guiCreateLabel(0.4, 0.1, 0.6, 0.1, "Radio aus", true)
	g_radio["time"] = -1
	guiLabelSetColor(g_radio["label"], 255, 215, 0)
	guiSetFont(g_radio["label"], "sa-header")
	guiSetVisible(g_radio["label"], false)
	g_radio["label_volume"] = guiCreateLabel(0.4641,0.9438,0.0328,0.0167,"Volume",true)
	g_radio["volume"] = guiCreateProgressBar(0.3883,0.9667,0.193,0.0229,true)
	guiProgressBarSetProgress(g_radio["volume"], 50)
	guiSetVisible(g_radio["label_volume"], false)
	guiSetVisible(g_radio["volume"], false)
	
	--Wassertank
	g_watertank["label"] = guiCreateLabel(0.782,0.9427,0.032,0.0188,"Wasser",true)
	g_watertank["progress"] = guiCreateProgressBar(0.7406,0.9646,0.1125,0.026,true)
	guiSetVisible(g_watertank["label"], false)
	guiSetVisible(g_watertank["progress"], false)
	
	--[[Infomenu
	g_infomenu["window"] = guiCreateWindow(0.3559,0.4248,0.3142,0.1817,"",true)
	guiSetProperty(g_infomenu["window"],"CloseButtonEnabled","False")
	guiSetProperty(g_infomenu["window"],"TitlebarEnabled","False")
	g_infomenu["text"] = guiCreateLabel(0.0221,0.0573,0.9586,0.6369,"",true,g_infomenu["window"])
	guiLabelSetColor(g_infomenu["text"],255,255,255)
	guiLabelSetVerticalAlign(g_infomenu["text"],"center")
	guiLabelSetHorizontalAlign(g_infomenu["text"],"center",true)
	guiSetFont(g_infomenu["text"],"default-bold-small")
	g_infomenu["button"] = guiCreateButton(0.3066,0.7643,0.3729,0.1783,"OK",true,g_infomenu["window"])
	guiWindowSetSizable(g_infomenu["window"], false)
	guiWindowSetMovable(g_infomenu["window"],false)
	guiSetVisible(g_infomenu["window"], false)--]]
	
	g_infomenu["window"] = guiCreateStaticImage(0,0,1,0.1602,"./files/background.png",true)
	g_infomenu["text"] = guiCreateLabel(0.25,0.05,0.5,0.85,"Test for my Life!",true,g_infomenu["window"])
		guiLabelSetVerticalAlign(g_infomenu["text"],"center")
		guiLabelSetHorizontalAlign(g_infomenu["text"],"center",true)
		guiSetFont(g_infomenu["text"],"default-bold-small")
	g_infomenu["button"] = guiCreateButton(0.975,0.0462,0.0188,0.1676,"X",true,g_infomenu["window"])
	guiSetVisible(g_infomenu["window"], false)
end
addEventHandler('onClientResourceStart', getResourceRootElement(), PlayerGUI)

function initalizeADACGui()
	if not g_guiloaded["ADACgui"] then
		--ADAC
		g_ADACgui["Progress"] = guiCreateProgressBar(0.45, 0.75, 0.25, 0.05, true)
		g_ADACgui["Taste"] = guiCreateLabel(0.47, 0.7, 0.25, 0.05, "Hoch und Runter!", true)
		guiSetFont(g_ADACgui["Taste"], "sa-header")
		guiSetVisible(g_ADACgui["Progress"], false)
		guiSetVisible(g_ADACgui["Taste"], false)
		g_guiloaded["ADACgui"] = true
	end	
end

function initalizePostGUI()
	if not g_guiloaded["postgui"] then
		--Postabfrage
		g_postgui["window"] = guiCreateWindow(0.5786,0.4759,0.4104,0.4935,"Briefkasten",true)
		g_postgui["abort"] = guiCreateButton(0.3503,0.9156,0.2576,0.0638,"Schli"..szlig.."en",true,g_postgui["window"])
		g_postgui["gridlist"] = guiCreateGridList(0.0165,0.0563,0.9619,0.8443,true,g_postgui["window"])
		g_postgui["colPostID"] = guiGridListAddColumn(g_postgui["gridlist"],"ID",0.15)
		g_postgui["colFrom"] = guiGridListAddColumn(g_postgui["gridlist"],"Absender",0.25)
		g_postgui["colTitel"] = guiGridListAddColumn(g_postgui["gridlist"],"Betreff",0.55)	
		guiWindowSetMovable(g_postgui["window"], false)
		guiWindowSetSizable(g_postgui["window"], false)	
		guiSetVisible(g_postgui["window"], false)
		guiGridListSetSortingEnabled(g_postgui["gridlist"], false)
		guiGridListSetSelectionMode(g_postgui["gridlist"], 0)
		g_guiloaded["postgui"] = true
	end	
end

function initalizePostReadGUI()
	if not g_guiloaded["postreadgui"] then
		--Post lesen
		g_postreadgui["window"] = guiCreateWindow(0.4, 0.4, 0.5, 0.5, "Briefkasten", true)
		--g_postreadgui["abort"] = guiCreateButton(0.95, 0.05, 0.05, 0.05, "x", true, g_postreadgui["window"])
		g_postreadgui["back"] = guiCreateButton(0.95, 0.05, 0.05, 0.05, "?", true, g_postreadgui["window"])
		g_postreadgui["delete"] = guiCreateButton(0.001, 0.05, 0.25, 0.05, "Nachricht entfernen", true, g_postreadgui["window"])
		g_postreadgui["title"] = guiCreateEdit(0.001, 0.12, 0.99, 0.05, "Titel wird geladen", true, g_postreadgui["window"])
		guiSetEnabled(g_postreadgui["title"], false)
		g_postreadgui["nachricht"] = guiCreateMemo(0.001, 0.2, 0.99, 0.75, "Nachricht wird geladen", true, g_postreadgui["window"])
		guiSetEnabled(g_postreadgui["nachricht"], false)	
		guiWindowSetMovable(g_postreadgui["window"], false)
		guiWindowSetSizable(g_postreadgui["window"], false)	
		guiSetVisible(g_postreadgui["window"], false)
		g_guiloaded["postreadgui"] = true
	end	
end

function initalizePostWriteGUI()
	if not g_guiloaded["postwritegui"] then
		--Post schreiben
		g_postwritegui["window"] = guiCreateWindow(0.4, 0.4, 0.5, 0.5, "Brief schreiben", true)
		g_postwritegui["abort"] = guiCreateButton(0.95, 0.05, 0.05, 0.05, "x", true, g_postwritegui["window"])
		g_postwritegui["send"] = guiCreateButton(0.01, 0.05, 0.1, 0.05, "Absenden", true, g_postwritegui["window"])
		g_postwritegui["title"] = guiCreateEdit(0.0923,0.2255,0.8513,0.0543, "", true, g_postwritegui["window"])
		g_postwritegui["nachricht"] = guiCreateMemo(0.001, 0.32, 0.99, 0.69, "", true, g_postwritegui["window"])
		guiCreateLabel(0.0172,0.2443,0.0657,0.0355,"Betreff:",true,g_postwritegui["window"])
		guiCreateLabel(0.0156,0.1399,0.0939,0.0376,"Epf"..auml.."nger:",true,g_postwritegui["window"])
		g_postwritegui["typ"] = guiCreateComboBox(0.12,0.134,0.2332,0.4, "Art", true, g_postwritegui["window"])
			guiComboBoxAddItem(g_postwritegui["typ"], "Normal")
			guiComboBoxAddItem(g_postwritegui["typ"], "Bewerbung")
		g_postwritegui["job"] = guiCreateComboBox(0.4085,0.134,0.2332,0.4, "Job", true, g_postwritegui["window"])
			rpcCallServerFunction("getAllJobNames", 1)
		g_postwritegui["privat"] = guiCreateEdit(0.3897,0.134,0.5493,0.0501,"",true,g_postwritegui["window"])
		guiWindowSetMovable(g_postwritegui["window"], false)
		guiWindowSetSizable(g_postwritegui["window"], false)
		guiSetEnabled(g_postwritegui["nachricht"], false)
		guiSetVisible(g_postwritegui["window"], false)
		guiSetVisible(g_postwritegui["privat"], false)
		guiSetVisible(g_postwritegui["job"], false)
		g_guiloaded["postwritegui"] = true
	end	
end

function initalizeHouseBuyGUI()
	if not g_guiloaded["housebuygui"] then
		--Hauseinrichtungskauf
		g_housebuygui["window"] = guiCreateWindow(0.3021,0.2796,0.4266,0.5306,"Einrichtung",true)
		g_housebuygui["gridlist"] = guiCreateGridList(0.2625,0.0541,0.7265,0.9267,true,g_housebuygui["window"])
		g_housebuygui["combo"] = guiCreateComboBox (0.0147,0.0576,0.2381,0.7644, "Kategorie", true, g_housebuygui["window"])
		guiComboBoxAddItem(g_housebuygui["combo"], "M"..ouml.."bel")
		guiComboBoxAddItem(g_housebuygui["combo"], "Pflanzen")
		guiComboBoxAddItem(g_housebuygui["combo"], "Sonstiges")		
		g_housebuygui["Typ"] = guiGridListAddColumn(g_housebuygui["gridlist"], "Typ", 0.45)	
		g_housebuygui["Preis"] = guiGridListAddColumn(g_housebuygui["gridlist"], "Preis", 0.20)	
		g_housebuygui["Modelid"] = guiGridListAddColumn(g_housebuygui["gridlist"], "Modelid", 0.20)		
		g_housebuygui["select"] = guiCreateButton(0.0134,0.8377,0.2405,0.0593,"Ausw"..auml.."hlen",true,g_housebuygui["window"])
			guiSetProperty(g_housebuygui["select"],"NormalTextColour","FF00FF00")
			guiSetProperty(g_housebuygui["select"],"HoverTextColour","FF009600")
		g_housebuygui["abort"] = guiCreateButton(0.0122,0.9197,0.2405,0.0593,"Abbrechen",true,g_housebuygui["window"])
			guiSetProperty(g_housebuygui["abort"],"NormalTextColour","FFFF0000")
			guiSetProperty(g_housebuygui["abort"],"HoverTextColour","FF960000")
		guiGridListSetSortingEnabled(g_housebuygui["gridlist"], false)
		guiWindowSetMovable(g_housebuygui["window"], false)
		guiWindowSetSizable(g_housebuygui["window"], false)
		guiSetVisible(g_housebuygui["window"], false)
		g_guiloaded["housebuygui"] = true
	end	
end

function initalizeTankerGUI()
	if not g_guiloaded["tankergui"] then
		--Tanker
		g_tankergui["window"] = guiCreateWindow(0.4, 0.6, 0.15, 0.3, "Tankauswahl", true)
		g_tankergui["benzin"] = guiCreateButton(0.05, 0.125, 0.9, 0.1, "Benzin", true, g_tankergui["window"])
		g_tankergui["diesel"] = guiCreateButton(0.05, 0.25, 0.9, 0.1, "Diesel", true, g_tankergui["window"])
		g_tankergui["super"] = guiCreateButton(0.05, 0.375, 0.9, 0.1, "Super", true, g_tankergui["window"])
		g_tankergui["superP"] = guiCreateButton(0.05, 0.5, 0.9, 0.1, "Super Plus", true, g_tankergui["window"])
		g_tankergui["kerosin"] = guiCreateButton(0.05, 0.625, 0.9, 0.1, "Kerosin", true, g_tankergui["window"])
		g_tankergui["boot"] = guiCreateButton(0.05, 0.75, 0.9, 0.1, "Bootsdiesel", true, g_tankergui["window"])
		g_tankergui["abbruch"] = guiCreateButton(0.05, 0.875, 0.9, 0.1, "Abbrechen", true, g_tankergui["window"])
		guiWindowSetSizable(g_tankergui["window"], false)
		guiWindowSetMovable(g_tankergui["window"], false)
		guiSetVisible(g_tankergui["window"], false)
		g_guiloaded["tankergui"] = true
	end	
end

function initalizeAutokaufGUI()
	if not g_guiloaded["autokaufgui"] then
		--Autoverkauf
		g_carsale["window"] = guiCreateWindow(0.3664,0.2802,0.2773,0.5344,"Autoverkauf",true)
		g_carsale["ok"] = guiCreateButton(0.0461,0.885,0.4366,0.0877,"Best"..auml.."tigen",true,g_carsale["window"])
		g_carsale["abbrechen"] = guiCreateButton(0.5161,0.885,0.4366,0.0877,"Abbrechen",true,g_carsale["window"])
		guiCreateLabel(0.0732,0.0721,0.1211,0.037,"Spieler:",true,g_carsale["window"])
		guiCreateLabel(0.5296,0.0682,0.1211,0.0372,"Auto:",true,g_carsale["window"])
		g_carsale["player"] = guiCreateGridList(0.0732,0.1209,0.3887,0.6998,true,g_carsale["window"])
		g_carsale["p_columm"] = guiGridListAddColumn( g_carsale["player"], "Spieler", 0.85 )
		g_carsale["car"] =  guiCreateGridList(0.5296,0.1189,0.3887,0.6998,true,g_carsale["window"])
		g_carsale["c_columm"] = guiGridListAddColumn( g_carsale["car"], "Autos", 0.85 )
		guiGridListSetSortingEnabled ( g_carsale["player"], false )
		guiGridListSetSortingEnabled ( g_carsale["car"], false )
		guiWindowSetSizable(g_carsale["window"], false)
		guiWindowSetMovable(g_carsale["window"], false)
		guiSetVisible(g_carsale["window"], false)
		--Preisliste
		g_carsale["window_price"] = guiCreateWindow(0.3836,0.2917,0.3695,0.4885,"Autohaus",true)
		g_carsale["price_list"] = guiCreateGridList(0.0359,0.0981,0.3383,0.7846,true,g_carsale["window_price"])
			guiGridListSetSelectionMode(g_carsale["price_list"],2)
			g_carsale["price_car"] = guiGridListAddColumn(g_carsale["price_list"],"Auto",0.9)
		guiCreateLabel(0.0359,0.0554,0.1945,0.0405,"Autos:",true,g_carsale["window_price"])
		guiCreateLabel(0.3953,0.0576,0.1945,0.0442,"Informationen:",true,g_carsale["window_price"])
		g_carsale["price_memo"] = guiCreateMemo(0.3953,0.1002,0.5793,0.7825,"Bitte w"..auml.."hle ein Auto aus!",true,g_carsale["window_price"])
			guiMemoSetReadOnly(g_carsale["price_memo"],true)
		g_carsale["price_buy"] = guiCreateButton(0.1298,0.9041,0.3679,0.0725,"Kaufen",true,g_carsale["window_price"])
     	g_carsale["price_close"] = guiCreateButton(0.5298,0.9041,0.3679,0.0725,"Schlie"..szlig.."en",true,g_carsale["window_price"])
		guiWindowSetSizable(g_carsale["window_price"], false)
		guiWindowSetMovable(g_carsale["window_price"], false)
		guiSetVisible(g_carsale["window_price"], false)
		--Ja oder Nein
		g_carsale["window_sell"] = guiCreateWindow(0.3559,0.4248,0.3142,0.1817,"",true)
			guiSetProperty(g_carsale["window_sell"],"CloseButtonEnabled","False")
			guiSetProperty(g_carsale["window_sell"],"TitlebarEnabled","False")
		g_carsale["window_selltext"] = guiCreateLabel(0.0221,0.0573,0.9586,0.6369,"",true,g_carsale["window_sell"])
			guiLabelSetColor(g_carsale["window_selltext"],255,255,255)
			guiLabelSetVerticalAlign(g_carsale["window_selltext"],"center")
			guiLabelSetHorizontalAlign(g_carsale["window_selltext"],"center",true)
			guiSetFont(g_carsale["window_selltext"],"default-bold-small")
		g_carsale["window_sellyes"] = guiCreateButton(0.1095,0.7414,0.3729,0.1783,"Ja",true,g_carsale["window_sell"])
		g_carsale["window_sellno"] = guiCreateButton(0.5199,0.7414,0.3729,0.1783,"Nein",true,g_carsale["window_sell"])
		guiWindowSetSizable(g_carsale["window_sell"], false)
		guiWindowSetMovable(g_carsale["window_sell"],false)
		guiSetVisible(g_carsale["window_sell"], false)
		
		g_guiloaded["autokaufgui"] = true
	end	
end

function initalizeTuningGUI()
	if not g_guiloaded["tuninggui"] then
		--Tuning
		---Cam
		g_tuning["window_cam"] = guiCreateWindow(0.8141,0.8823,0.1844,0.1146,"Kamera",true)
		g_tuning["normal"] = guiCreateButton(0.3093,0.2909,0.428,0.2273,"Normal",true,g_tuning["window_cam"])
		g_tuning["vorn"] = guiCreateButton(0.0381,0.6273,0.428,0.2273,"von Vorn",true,g_tuning["window_cam"])
		g_tuning["hinten"] = guiCreateButton(0.5339,0.6182,0.428,0.2273,"von Hinten",true,g_tuning["window_cam"])
		guiWindowSetSizable(g_tuning["window_cam"], false)
		guiWindowSetMovable(g_tuning["window_cam"], false)
		guiSetVisible(g_tuning["window_cam"], false)
		--Steuerung
		g_tuning["window_strg"] = guiCreateWindow(0.05,0 ,0.8844,0.074,"Tunings Men"..uuml.."",true)
		g_tuning["cam"] = guiCreateButton(0.0088,0.3836,0.0883,0.4658,"Kamera",true,g_tuning["window_strg"])
		g_tuning["paintjob"] = guiCreateButton(0.1069,0.3836,0.0883,0.4384,"Paintjob",true,g_tuning["window_strg"])
		g_tuning["teile"] = guiCreateButton(0.2032,0.3836,0.0883,0.411,"Teile",true,g_tuning["window_strg"])
		g_tuning["tacho"] = guiCreateButton(0.2977,0.3836,0.0883,0.3836,"Tacho",true,g_tuning["window_strg"])
		g_tuning["sicherheit"] = guiCreateButton(0.394,0.3826,0.0883,0.3836,"Sicherheit",true,g_tuning["window_strg"])
		g_tuning["licht"] = guiCreateButton(0.4894,0.3836,0.0883,0.3699,"Licht",true,g_tuning["window_strg"])
		g_tuning["gps"] = guiCreateButton(0.5822,0.3836,0.0883,0.3699,"GPS",true,g_tuning["window_strg"])
		g_tuning["farbe"] = guiCreateButton(0.6776,0.3836,0.0883,0.3699,"Autofarbe",true,g_tuning["window_strg"])
		g_tuning["annehmen"] = guiCreateButton(0.8074,0.3836,0.0883,0.3699,"Annehmen",true,g_tuning["window_strg"])
			guiSetProperty(g_tuning["annehmen"],"NormalTextColour","FF00FF00")
			guiSetProperty(g_tuning["annehmen"],"HoverTextColour","FF009600")			
		g_tuning["abbrechen"] = guiCreateButton(0.9037,0.3836,0.0883,0.3699,"Abbrechen",true,g_tuning["window_strg"])
			guiSetProperty(g_tuning["abbrechen"],"NormalTextColour","FFFF0000")
			guiSetProperty(g_tuning["abbrechen"],"HoverTextColour","FF960000")
		guiWindowSetSizable(g_tuning["window_strg"], false)
		guiWindowSetMovable(g_tuning["window_strg"], false)
		guiSetVisible(g_tuning["window_strg"], false)
		--Paintjob
		g_tuning["window_paintjob"] = guiCreateWindow(0.0023,0.8531,0.11,0.1427,"Paintjob 450$",true)
		g_tuning["keinen"] = guiCreateRadioButton(0.1532,0.2409,0.7,0.1387,"Keinen",true,g_tuning["window_paintjob"])
		g_tuning["1"] = guiCreateRadioButton(0.1532,0.423,0.7,0.1387,"Variante 1",true,g_tuning["window_paintjob"])
		g_tuning["2"] = guiCreateRadioButton(0.1532,0.5912,0.7,0.1387,"Variante 2",true,g_tuning["window_paintjob"])
		g_tuning["3"] = guiCreateRadioButton(0.1532,0.7518,0.7,0.1387,"Variante 3",true,g_tuning["window_paintjob"])
		guiWindowSetSizable(g_tuning["window_paintjob"], false)
		guiWindowSetMovable(g_tuning["window_paintjob"], false)
		guiSetVisible(g_tuning["window_paintjob"], false)
		--Autofarbe
		g_tuning["window_farbe"] = guiCreateWindow(0.5297,0.6479,0.468,0.35,"Autofarbe 200$",true)
		g_tuning["img_farben"] = guiCreateStaticImage(0.0217,0.0893,0.9633,0.7083,"files/colors.png",true,g_tuning["window_farbe"])
		g_tuning["label_color1"] = guiCreateLabel(0.2404,0.9018,0.0801,0.0446,"Farbe 1:",true,g_tuning["window_farbe"])
		g_tuning["color1"] = guiCreateEdit(0.3322,0.8631,0.0902,0.0833,"",true,g_tuning["window_farbe"])
		guiEditSetMaxLength ( g_tuning["color1"], 3 )
		g_tuning["label_color2"] = guiCreateLabel(0.5142,0.9048,0.0801,0.0404,"Farbe 2:",true,g_tuning["window_farbe"])
		g_tuning["color2"] = guiCreateEdit(0.611,0.8631,0.0902,0.0833,"",true,g_tuning["window_farbe"])
		guiEditSetMaxLength ( g_tuning["color2"], 3 )
		guiWindowSetSizable(g_tuning["window_farbe"], false)
		guiWindowSetMovable(g_tuning["window_farbe"], false)
		guiSetVisible(g_tuning["window_farbe"], false)
		--Lichtfarbe
		g_tuning["window_licht"] = guiCreateWindow(0.3422,0.7802,0.2836,0.2177,"Lichtfarbe 180$",true)
		g_tuning["label_rot"] = guiCreateLabel(0.0882,0.2488,0.0634,0.0766,"Rot:",true,g_tuning["window_licht"])
		guiLabelSetColor(g_tuning["label_rot"],255,0,0)
		g_tuning["rot"] = guiCreateScrollBar (0.1928,0.2448,0.6997,0.0900, true, true, g_tuning["window_licht"])
		g_tuning["label_blau"] = guiCreateLabel(0.0826,0.7703,0.0716,0.0813,"Blau:",true,g_tuning["window_licht"])
		guiLabelSetColor(g_tuning["label_blau"],0,0,255)
		g_tuning["gruen"] = guiCreateScrollBar (0.1956,0.5072,0.6997,0.0900, true, true, g_tuning["window_licht"])
		g_tuning["label_gruen"] = guiCreateLabel(0.0854,0.5072,0.0826,0.0718,"Gr"..uuml.."n:",true,g_tuning["window_licht"])
		guiLabelSetColor(g_tuning["label_gruen"],0,255,0)
		g_tuning["blau"] = guiCreateScrollBar (0.1956,0.7703,0.6997,0.0900, true, true, g_tuning["window_licht"])
		guiWindowSetSizable(g_tuning["window_licht"], false)
		guiWindowSetMovable(g_tuning["window_licht"], false)
		guiSetVisible(g_tuning["window_licht"], false)
		--Tacho
		g_tuning["window_tacho"] = guiCreateWindow(0.6,0.6792,0.3945,0.3125,"Tacho 550$",true)
		g_tuning["img_tank"] = guiCreateStaticImage(0.1802,0.3067,0.299,0.55,"files/tachos/tank.png",true,g_tuning["window_tacho"])
		g_tuning["img_tacho"] = guiCreateStaticImage(0.5149,0.1967,0.305,0.6333,"files/tachos/tacho.png",true,g_tuning["window_tacho"])
		g_tuning["img_tank_green"] = guiCreateStaticImage(0.1802,0.3067,0.299,0.55,"files/tachos/tank_green.png",true,g_tuning["window_tacho"])
		g_tuning["img_tacho_green"] = guiCreateStaticImage(0.5149,0.1967,0.305,0.6333,"files/tachos/tacho_green.png",true,g_tuning["window_tacho"])
		g_tuning["img_tank_red"] = guiCreateStaticImage(0.1802,0.3067,0.299,0.55,"files/tachos/tank_red.png",true,g_tuning["window_tacho"])
		g_tuning["img_tacho_red"] = guiCreateStaticImage(0.5149,0.1967,0.305,0.6333,"files/tachos/tacho_red.png",true,g_tuning["window_tacho"])
		g_tuning["img_tank_blue"] = guiCreateStaticImage(0.1802,0.3067,0.299,0.55,"files/tachos/tank_blue.png",true,g_tuning["window_tacho"])
		g_tuning["img_tacho_blue"] = guiCreateStaticImage(0.5149,0.1967,0.305,0.6333,"files/tachos/tacho_blue.png",true,g_tuning["window_tacho"])
		g_tuning["tacho_back"] = guiCreateButton(0.0475,0.5,0.0574,0.0967,"<",true,g_tuning["window_tacho"])
		g_tuning["tacho_forth"] = guiCreateButton(0.899,0.52,0.0574,0.0967,">",true,g_tuning["window_tacho"])
		guiWindowSetSizable(g_tuning["window_tacho"], false)
		guiWindowSetMovable(g_tuning["window_tacho"], false)
		guiSetVisible(g_tuning["window_tacho"], false)
		guiSetVisible(g_tuning["img_tank"], false)
		guiSetVisible(g_tuning["img_tacho"], false)
		guiSetVisible(g_tuning["img_tank_green"], false)
		guiSetVisible(g_tuning["img_tacho_green"], false)
		guiSetVisible(g_tuning["img_tank_red"], false)
		guiSetVisible(g_tuning["img_tacho_red"], false)
		guiSetVisible(g_tuning["img_tank_blue"], false)
		guiSetVisible(g_tuning["img_tacho_blue"], false)
		--GPS
		g_tuning["window_gps"] = guiCreateWindow(0.0023,0.8458,0.1523,0.151,"GPS 1000$",true)
		g_tuning["gps_text"] = guiCreateMemo(0.0615,0.1862,0.8718,0.4207,"Das GPS dient zur Ortung wenn dein Fahrzeug verschwunden ist!",true,g_tuning["window_gps"])
		g_tuning["gps_einbauen"] = guiCreateButton(0.0769,0.6759,0.8462,0.2345,"Einbauen",true,g_tuning["window_gps"])
		guiMemoSetReadOnly(g_tuning["gps_text"],true)
		guiWindowSetSizable(g_tuning["window_gps"], false)
		guiWindowSetMovable(g_tuning["window_gps"], false)
		guiSetVisible(g_tuning["window_gps"], false)
		--Teile
		g_tuning["window_teile"] = guiCreateWindow(0.7047,0.4719,0.2937,0.526,"Teile",true)
		g_tuning["grid_teile"] = guiCreateGridList(0.0234,0.0503,0.9532,0.933,true,g_tuning["window_teile"])
		g_tuning["column_teile"] = guiGridListAddColumn(g_tuning["grid_teile"], "Teile",0.7)
		g_tuning["column_x"] = guiGridListAddColumn(g_tuning["grid_teile"], "X",0.2)
		guiGridListSetSelectionMode(g_tuning["grid_teile"],1)
		guiWindowSetSizable(g_tuning["window_teile"], false)
		guiWindowSetMovable(g_tuning["window_teile"], false)
		guiSetVisible(g_tuning["window_teile"], false)
		--Sicherheit
		g_tuning["window_safty"] = guiCreateWindow(0.6617,0.5854,0.3328,0.4125,"Sicherheitstuning",true)
		local label_safty = guiCreateLabel(0.0469,0.1742,0.3732,0.048,"Aktuelle Sicherheitsklasse:",true,g_tuning["window_safty"])
			guiLabelSetColor(label_safty,100,150,200)
			guiSetFont(label_safty,"default-bold-small")
		g_tuning["label_safty"] = guiCreateLabel(0.4531,0.101,0.1408,0.1414,"10",true,g_tuning["window_safty"])
			guiLabelSetColor(g_tuning["label_safty"],100,200,100)
			guiSetFont(g_tuning["label_safty"],"sa-header")
		g_tuning["button_safty_up"] = guiCreateButton(0.4742,0.2879,0.0775,0.0884,"+",true,g_tuning["window_safty"])
		g_tuning["button_safty_down"] = guiCreateButton(0.4789,0.6414,0.0775,0.0884,"-",true,g_tuning["window_safty"])
		g_tuning["label_safty_add"] = guiCreateLabel(0.4085,0.4268,0.2207,0.1616,"+2",true,g_tuning["window_safty"])
			guiLabelSetColor(g_tuning["label_safty_add"],255,255,255)
			guiSetFont(g_tuning["label_safty_add"],"sa-gothic")
		local label_safty_current = guiCreateLabel(0.0469,0.8561,0.4789,0.0455,"Sicherheit nach dem Tuning:",true,g_tuning["window_safty"])
			guiLabelSetColor(label_safty_current,100,150,200)
			guiSetFont(label_safty_current,"default-bold-small")
		g_tuning["label_safty_current"] = guiCreateLabel(0.4695,0.7828,0.1408,0.1543,"10",true,g_tuning["window_safty"])
			guiLabelSetColor(g_tuning["label_safty_current"],100,200,100)
			guiSetFont(g_tuning["label_safty_current"],"sa-header")
		local label_safty_info = guiCreateLabel(0.6667,0.3788,0.2441,0.4924,"Das Sicherheits Tuning dient dazu das dein Auto schlechter gestohlen werden kann.                           Das Tuning kostet pro Klasse 200$!",true,g_tuning["window_safty"])
			guiLabelSetColor(label_safty_info,200,200,100)
			guiLabelSetHorizontalAlign(label_safty_info,"left",true)
			guiSetFont(label_safty_info,"default-bold-small")
		guiWindowSetSizable(g_tuning["window_safty"], false)
		guiWindowSetMovable(g_tuning["window_safty"], false)
		guiSetVisible(g_tuning["window_safty"], false)
			
		g_guiloaded["tuninggui"] = true
	end
end

function initalizeWeaponLizenzGUI()
	if not g_guiloaded["weaponlizensgui"] then
		--Waffen Lizens
		g_lizenz["window"] = guiCreateWindow(0.2922,0.3406,0.4242,0.2354,"Waffen Lizenz",true)
		g_lizenz["tip"] = guiCreateLabel(0.1105,0.1283,0.7532,0.0708,"W"..auml.."hlen Sie ein Waffen Klasse aus deren Lizenz Sie erwerben m"..ouml.."chten!",true,g_lizenz["window"])
		guiLabelSetColor(g_lizenz["tip"],200,100,100)
		guiSetFont(g_lizenz["tip"],"default-bold-small")
		g_lizenz["class1"] = guiCreateButton(0.0331,0.323,0.1878,0.1283,"Klasse 1",true,g_lizenz["window"])
		g_lizenz["class1tip"] = guiCreateLabel(0.2744,0.3496,0.4162,0.0796,"Kleine Waffen keine Schusswaffen! 5000$",true,g_lizenz["window"])
		g_lizenz["class2"] = guiCreateButton(0.0331,0.5575,0.1878,0.1283,"Klasse 2",true,g_lizenz["window"])
		g_lizenz["class2tip"] = guiCreateLabel(0.2689,0.5885,0.1529,0.0752,"Pistolen! 7000$",true,g_lizenz["window"])
		g_lizenz["class3"] = guiCreateButton(0.035,0.7965,0.1878,0.1283,"Klasse 3",true,g_lizenz["window"])
		g_lizenz["class3tip"] = guiCreateLabel(0.2689,0.8142,0.2873,0.0708,"Schnellschusswaffen! 15000$",true,g_lizenz["window"])
		g_lizenz["abbrechen"] = guiCreateButton(0.8,0.9,0.1878,0.1283,"Abbrechen",true,g_lizenz["window"])
		guiWindowSetSizable(g_lizenz["window"], false)
		guiWindowSetMovable(g_lizenz["window"],false)
		guiSetVisible(g_lizenz["window"], false)
		g_guiloaded["weaponlizensgui"] = true
	end
end

function initalizeFlightLizenzGUI()
	if not g_guiloaded["flightlizensgui"] then		
		--Fluglizenz
		g_flightlizenz["window"] = guiCreateWindow(0.3875,0.3063,0.2594,0.2396,"Fluglizenz",true)
		g_flightlizenz["tip"] = guiCreateLabel(0.0331,0.1174,0.9337,0.2435,"Wenn Sie eine Fluglizens erwerben m"..ouml.."chten best"..auml.."tigen Sie bitte mit \"Kaufen\" wenn nich brechen Sie den Vorgang ab!                                                                                     Eine Lizens Kostet 2000$.",true,g_flightlizenz["window"])
		guiLabelSetColor(g_flightlizenz["tip"],200,100,100)
		guiSetFont(g_flightlizenz["tip"],"default-bold-small")
		g_flightlizenz["ok"] = guiCreateButton(0.3253,0.487,0.3524,0.1348,"Kaufen",true,g_flightlizenz["window"])
		g_flightlizenz["abbrechen"] = guiCreateButton(0.3253,0.7261,0.3524,0.1348,"Abbrechen",true,g_flightlizenz["window"])
		guiLabelSetHorizontalAlign (g_flightlizenz["tip"] ,"left",true)
		guiWindowSetSizable(g_flightlizenz["window"], false)
		guiWindowSetMovable(g_flightlizenz["window"],false)
		guiSetVisible(g_flightlizenz["window"], false)
		g_guiloaded["flightlizensgui"] = true
	end
end

function initalizePWchangeGUI()
	if not g_guiloaded["pwchangegui"] then		
		g_pwchange["window"] = guiCreateWindow(0.4078,0.3375,0.1891,0.2625,"Passwort "..auml.."ndern",true)
		g_pwchange["label_info"] = guiCreateLabel(0.0289,0.1032,0.938,0.1865,"Tippe dein neues Passwort ein! Es sollte midensten 4 Zeichen enthalten.",true,g_pwchange["window"])
		guiLabelSetVerticalAlign(g_pwchange["label_info"],"top")
		guiLabelSetHorizontalAlign(g_pwchange["label_info"],"left",true)
		guiSetFont(g_pwchange["label_info"],"default-bold-small")
		guiCreateLabel(0.0785,0.4008,0.2273,0.0675,"Passwort:",true,g_pwchange["window"])
		local pw2 = guiCreateLabel(0.0785,0.5635,0.3512,0.127,"Passwort: (wiederhohlen)",true,g_pwchange["window"])
		guiLabelSetHorizontalAlign(pw2,"left",true)
		g_pwchange["edit_pw1"] = guiCreateEdit(0.4752,0.5754,0.4628,0.1032,"",true,g_pwchange["window"])
		g_pwchange["edit_pw2"] = guiCreateEdit(0.4669,0.3849,0.4628,0.1032,"",true,g_pwchange["window"])
		g_pwchange["button_ok"] = guiCreateButton(0.1157,0.8056,0.5537,0.131, Auml.."ndern",true,g_pwchange["window"])
		g_pwchange["button_abbrechen"] = guiCreateButton(0.7397,0.8016,0.1116,0.131,"X",true,g_pwchange["window"])
		guiWindowSetSizable(g_pwchange["window"], false)
		guiWindowSetMovable(g_pwchange["window"],false)
		guiSetVisible(g_pwchange["window"], false)
		g_guiloaded["pwchangegui"] = true
	end
end

function initalizeMailChangeGUI()
	if not g_guiloaded["mailchangegui"] then		
		g_mailchange["window"] = guiCreateWindow(0.4078,0.3375,0.1891,0.2625,"E-mail "..auml.."ndern",true)
		g_mailchange["label_info"] = guiCreateLabel(0.0289,0.1032,0.938,0.1865,"Tippe deine neu E-Mail ein!",true,g_mailchange["window"])
		guiLabelSetVerticalAlign(g_mailchange["label_info"],"top")
		guiLabelSetHorizontalAlign(g_mailchange["label_info"],"left",true)
		guiSetFont(g_mailchange["label_info"],"default-bold-small")
		guiCreateLabel(0.0785,0.4008,0.2273,0.0675,"E-Mail:",true,g_mailchange["window"])
		local mail2 = guiCreateLabel(0.0785,0.5635,0.3512,0.127,"E-Mail: (wiederhohlen)",true,g_mailchange["window"])
		guiLabelSetHorizontalAlign(mail2,"left",true)
		g_mailchange["edit_mail1"] = guiCreateEdit(0.4752,0.5754,0.4628,0.1032,"",true,g_mailchange["window"])
		g_mailchange["edit_mail2"] = guiCreateEdit(0.4669,0.3849,0.4628,0.1032,"",true,g_mailchange["window"])
		g_mailchange["button_ok"] = guiCreateButton(0.1157,0.8056,0.5537,0.131, Auml.."ndern",true,g_mailchange["window"])
		g_mailchange["button_abbrechen"] = guiCreateButton(0.7397,0.8016,0.1116,0.131,"X",true,g_mailchange["window"])
		guiWindowSetSizable(g_mailchange["window"], false)
		guiWindowSetMovable(g_mailchange["window"],false)
		guiSetVisible(g_mailchange["window"], false)
		g_guiloaded["mailchangegui"] = true
	end
end

function initalizeWeaponShopGUI()
	if not g_guiloaded["weaponshopgui"] then	
		g_weaponshop["window"] = guiCreateWindow(0.35,0.2656,0.3148,0.3812,"Waffenladen",true)
		g_weaponshop["class1"] = guiCreateButton(0.0447,0.0984,0.2754,0.0847,"Klasse 1",true,g_weaponshop["window"])
		g_weaponshop["class2"] = guiCreateButton(0.3672,0.0984,0.2754,0.0847,"Klasse 2",true,g_weaponshop["window"])
		g_weaponshop["class3"] = guiCreateButton(0.6873,0.0929,0.2754,0.0847,"Klasse 3",true,g_weaponshop["window"])
		g_weaponshop["grid"] = guiCreateGridList(0.0496,0.2514,0.9132,0.5628,true,g_weaponshop["window"])
		guiGridListSetSelectionMode(g_weaponshop["grid"],1)
		g_weaponshop["gridWeapon"] = guiGridListAddColumn(g_weaponshop["grid"],"Waffe",0.6)
		g_weaponshop["gridPrice"] = guiGridListAddColumn(g_weaponshop["grid"],"Preis",0.3)
		g_weaponshop["buy"] = guiCreateButton(0.0571,0.8579,0.4318,0.0902,"Kaufen",true,g_weaponshop["window"])
		g_weaponshop["abbrechen"] = guiCreateButton(0.5261,0.8579,0.4243,0.0902,"Abbrechen",true,g_weaponshop["window"])
		guiWindowSetSizable(g_weaponshop["window"], false)
		guiWindowSetMovable(g_weaponshop["window"],false)
		guiSetVisible(g_weaponshop["window"], false)
		g_guiloaded["weaponshopgui"] = true
		guiSetEnabled(g_weaponshop["class1"], false)
		guiSetEnabled(g_weaponshop["class2"], false)
		guiSetEnabled(g_weaponshop["class3"], false)
		guiSetEnabled(g_weaponshop["buy"], false)
	end
end

function initalizeWahlGUI()
	if not g_guiloaded["wahlgui"] then
		g_wahlengui["window"] = guiCreateWindow(0.35, 0.26, 0.3, 0.1, "Wahlen", true)
		g_wahlengui["combo"] = guiCreateComboBox(0.1, 0.22, 0.8, 1, "Partei", true, g_wahlengui["window"])
		g_wahlengui["wahlen"] = guiCreateButton(0.4, 0.6, 0.2, 0.3, "W"..auml.."hlen!", true, g_wahlengui["window"])
		g_guiloaded["wahlgui"] = true
	end
end

function initalizeRegisterGUI()
	if not g_guiloaded["register"] then	
		g_registergui["window"] = guiCreateStaticImage(0,0,1,1,"./files/px.png",true)
		--guiCreateStaticImage(0.0094,0.0135,0.1664,0.1844,"./files/logo.jpg",true,g_registergui["window"])
		guiCreateStaticImage(0.7625,0.576,0.1992,0.0958,"./files/mtarllogo.png",true,g_registergui["window"])
		local head2 = guiCreateLabel(0.3789,0.0521,0.2297,0.0781,"Registratur",true,g_registergui["window"])
		local head = guiCreateLabel(0.3798,0.0528,0.2297,0.0781,"Registratur",true,g_registergui["window"])
			guiSetFont(head,"sa-gothic")
			guiSetFont(head2,"sa-gothic")
			guiLabelSetColor(head, 255, 153, 50)
			guiLabelSetColor(head2, 0, 0, 0)
		g_registergui["edit_password2"] = guiCreateEdit(0.8383,0.6833,0.1234,0.0302, "" ,true,g_registergui["window"])
			guiEditSetMasked(g_registergui["edit_password2f"], true)
		g_registergui["label_password2"] = guiCreateLabel(0.7641,0.6969,0.0664,0.0167,"Passwort:",true,g_registergui["window"])
			--guiLabelSetColor(pin, 0, 0, 0)
		g_registergui["label_password"] = guiCreateLabel(0.7641,0.7604,0.0453,0.0177,"Passwort:",true,g_registergui["window"])
			--guiLabelSetColor(pw, 0, 0, 0)
		g_registergui["edit_password"] = guiCreateEdit(0.8383,0.7469,0.1234,0.0302,"",true,g_registergui["window"])
			guiEditSetMasked(g_registergui["edit_password"], true)
		g_registergui["label_mail"] = guiCreateLabel(0.7641,0.825,0.0695,0.0188,"E-Mail Addresse:",true,g_registergui["window"])
			--guiLabelSetColor(mail, 0, 0, 0)
		g_registergui["edit_mail"] = guiCreateEdit(0.8383,0.8125,0.1234,0.0302,"",true,g_registergui["window"])
		g_registergui["button_ok"] = guiCreateButton(0.7789,0.8823,0.1719,0.0521,"Annehmen",true,g_registergui["window"])
		guiSetProperty(g_registergui["button_ok"], "HoverTextColour", "FFFF9922")
		guiSetProperty(g_registergui["button_ok"], "NormalTextColour", "FFFFFF66")
		guiSetFont(g_registergui["button_ok"],"sa-header")
		g_registergui["button_back"] = guiCreateButton(0.2622,0.925,0.0242,0.0333,"<",true,g_registergui["window"])
		g_registergui["button_for"] = guiCreateButton(0.438,0.925,0.0242,0.0333,">",true,g_registergui["window"])
		g_registergui["label_skin"] = guiCreateLabel(0.2864,0.915,0.1516,0.05,"0",true,g_registergui["window"])
			guiLabelSetHorizontalAlign(g_registergui["label_skin"], "center")
			guiLabelSetVerticalAlign(g_registergui["label_skin"], "top")
			guiSetFont(g_registergui["label_skin"],"sa-header")
			guiLabelSetColor(g_registergui["label_skin"], 255, 255, 102)
		guiSetVisible(g_registergui["window"], false)
		g_guiloaded["register"] = true
	end
end

function initalizeCreateInteriorGUI()
	if not g_guiloaded["cinterior"] then	
		g_cinterior["window"] = guiCreateWindow(0.3187,0.3667,0.3219,0.2458,"Create House",true)
		guiCreateLabel(0.0413,0.1271,0.0704,0.072,"Preis:",true,g_cinterior["window"])
		g_cinterior["edit_preis"] = guiCreateEdit(0.034,0.2076,0.2354,0.0975,"",true,g_cinterior["window"])
		local label = guiCreateLabel(0.2743,0.2203,0.068,0.0805,"$",true,g_cinterior["window"])
		guiSetFont(label,"clear-normal")
		guiCreateLabel(0.4951,0.1271,0.0704,0.072,"User:",true,g_cinterior["window"])
		g_cinterior["edit_user"] = guiCreateEdit(0.4951,0.2203,0.2354,0.0975,"",true,g_cinterior["window"])
		guiEditSetReadOnly(g_cinterior["edit_user"],true)
		guiCreateLabel(0.0413,0.4153,0.1044,0.0805,"Groese:",true,g_cinterior["window"])
		g_cinterior["radio_1"] = guiCreateRadioButton(0.0898,0.5508,0.1286,0.0763,"Klein",true,g_cinterior["window"])
		g_cinterior["radio_2"] = guiCreateRadioButton(0.2573,0.5508,0.1286,0.0763,"Mittel",true,g_cinterior["window"])
		g_cinterior["radio_3"] = guiCreateRadioButton(0.4587,0.5508,0.1286,0.0763,"Gro"..szlig.."",true,g_cinterior["window"])
		g_cinterior["radio_4"] = guiCreateRadioButton(0.6456,0.5508,0.2015,0.0805,"Extra Gro"..szlig.."",true,g_cinterior["window"])
		g_cinterior["button_ok"] = guiCreateButton(0.0874,0.75,0.3398,0.1314,"OK",true,g_cinterior["window"])
		g_cinterior["button_ abbrechen"] = guiCreateButton(0.5777,0.75,0.3398,0.1314,"Abbrechen",true,g_cinterior["window"])
		guiWindowSetSizable(g_cinterior["window"], false)
		guiWindowSetMovable(g_cinterior["window"],false)
		guiSetVisible(g_cinterior["window"], false)
		g_guiloaded["cinterior"] = true
	end
end

function initalizeJobEditGUI()
	if not g_guiloaded["jobeditgui"] then
		--Jobedit
		g_jobeditgui["window"] = guiCreateWindow(0.35, 0.35, 0.35, 0.6, "Jobedit", true)
		g_jobeditgui["playergridlist"] = guiCreateGridList(0.0303, 0.0344, 0.4485, 0.8251, true, g_jobeditgui["window"])
		--guiGridListSetSelectionMode(g_jobeditgui["playergridlist"], 2)
		g_jobeditgui["playercol"] = guiGridListAddColumn(g_jobeditgui["playergridlist"], "Spieler", 1)
		g_jobeditgui["rankgridlist"] = guiCreateGridList(0.5152, 0.0344, 0.4485, 0.8251, true, g_jobeditgui["window"])
		--guiGridListSetSelectionMode(g_jobeditgui["rankgridlist"], 2)
		g_jobeditgui["rankcol"] = guiGridListAddColumn(g_jobeditgui["rankgridlist"], "Rank", 1)
		g_jobeditgui["accept"] = guiCreateButton(0.0333, 0.8819, 0.9273, 0.0433, "Durchf"..uuml.."hren", true, g_jobeditgui["window"])
		g_jobeditgui["abort"] = guiCreateButton(0.0333, 0.9447, 0.9273, 0.0389, "Abbrechen", true, g_jobeditgui["window"])
		guiWindowSetSizable(g_jobeditgui["window"], false)
		guiWindowSetMovable(g_jobeditgui["window"], false)
		guiSetVisible(g_jobeditgui["window"], false)
		g_guiloaded["jobeditgui"] = true
	end	
end

function initalizeGeldautomatGUI()
	if not g_guiloaded["geldautomatgui"] then
		--Geldautomat
		g_Moneymenu["Window"] = guiCreateWindow(0.3297,0.2937,0.3594,0.3385,"Geldautomat",true)
		local tabPanel = guiCreateTabPanel(0.0217,0.0831,0.9478,0.7692,true,g_Moneymenu["Window"])
		local tab1 = guiCreateTab("Konto",tabPanel)
		local kontostand = guiCreateLabel(0.0275,0.146,0.2821,0.0752,"Aktueller Kontostand:",true,tab1)
			guiLabelSetColor(kontostand,100,150,200)
			guiSetFont(kontostand,"default-bold-small")
		g_Moneymenu["Kontostand"] = guiCreateLabel(0.3234,0.031,0.6445,0.2301,"$",true,tab1)
			guiLabelSetColor(g_Moneymenu["Kontostand"],34,139,34)
			guiSetFont(g_Moneymenu["Kontostand"],"sa-header")
		g_Moneymenu["Edit"] = guiCreateEdit(0.2477,0.3451,0.4794,0.1372,"",true,tab1)
		local dollar = guiCreateLabel(0.7317,0.2876,0.055,0.2257,"$",true,tab1)
			guiLabelSetColor(dollar,34,139,34)
			guiSetFont(dollar,"sa-header")
		g_Moneymenu["Einzahlen"] = guiCreateButton(0.2408,0.5752,0.2431,0.1416,"Einzahlen",true,tab1)
			guiSetProperty(g_Moneymenu["Einzahlen"],"NormalTextColour","FF00FF00")
			guiSetProperty(g_Moneymenu["Einzahlen"],"HoverTextColour","FF009600")
		g_Moneymenu["Auszahlen"] = guiCreateButton(0.5298,0.5752,0.2431,0.1416,"Auszahlen",true,tab1)
			guiSetProperty(g_Moneymenu["Auszahlen"],"NormalTextColour","FFFF0000")
			guiSetProperty(g_Moneymenu["Auszahlen"],"HoverTextColour","FF960000")
		g_Moneymenu["Error"] = guiCreateLabel(0.0252,0.8938,0.5069,0.0973,"Fehler: Ung"..uuml.."ltiger Betrag!",true,tab1)
			guiLabelSetColor(g_Moneymenu["Error"],250,10,10)
		local tab2 = guiCreateTab(Uuml.."berweisung",tabPanel)
		local kontostand = guiCreateLabel(0.0275,0.146,0.2821,0.0752,"Aktueller Kontostand:",true,tab2)
			guiLabelSetColor(kontostand,100,150,200)
			guiSetFont(kontostand,"default-bold-small")
		g_Moneymenu["KontostandSend"] = guiCreateLabel(0.3234,0.031,0.6445,0.2301,"$",true,tab2)
			guiLabelSetColor(g_Moneymenu["KontostandSend"],34,139,34)
			guiSetFont(g_Moneymenu["KontostandSend"],"sa-header")
		g_Moneymenu["kontoEdit"] = guiCreateEdit(0.2477,0.3451,0.4794,0.1372,"",true,tab2)
		g_Moneymenu["moneyEdit"] = guiCreateEdit(0.2477,0.5442,0.4794,0.1372,"",true,tab2)
		local dollar = guiCreateLabel(0.7317,0.4912,0.055,0.2257,"$",true,tab2)
			guiLabelSetColor(dollar,34,139,34)
			guiSetFont(dollar,"sa-header")
		local kontoinhaber = guiCreateLabel(0.0596,0.4027,0.4027,0.0664,"Kontoinhaber:",true,tab2)
			guiLabelSetColor(kontoinhaber,100,150,200)
			guiSetFont(kontoinhaber,"default-bold-small")
		local money = guiCreateLabel(0.0596,0.6018,0.4027,0.0664,"Geld:",true,tab2)
			guiLabelSetColor(money,100,150,200)
			guiSetFont(money,"default-bold-small")
		g_Moneymenu["send"] = guiCreateButton(0.3830,0.7788,0.2431,0.1416,""..Uuml.."berweisen",true,tab2)
			guiSetProperty(g_Moneymenu["send"],"NormalTextColour","FFFF8C00")
			guiSetProperty(g_Moneymenu["send"],"HoverTextColour","FFFF4500")
		g_Moneymenu["ErrorSend"] = guiCreateLabel(0.0252,0.8938,0.5069,0.0973,"Fehler: Ung"..uuml.."ltiger Betrag!",true,tab2)
			guiLabelSetColor(g_Moneymenu["ErrorSend"],250,10,10)
		g_Moneymenu["Abort"] = guiCreateButton(0.5826,0.88,0.3891,0.08,"Auf Wiedersehen!",true,g_Moneymenu["Window"])
		guiWindowSetMovable(g_Moneymenu["Window"], false)
		guiWindowSetSizable(g_Moneymenu["Window"], false)
		guiSetVisible(g_Moneymenu["Window"], false)
		guiSetVisible(g_Moneymenu["Error"], false)
		guiSetVisible(g_Moneymenu["ErrorSend"], false)
		g_guiloaded["geldautomatgui"] = true
	end	
end

function initalizeChefOptionsGUI()
	if not g_guiloaded["chefoptionsgui"] then
		--Chefoptions
		g_chefoptions["window"] = guiCreateWindow(0.4922, 0.3368, 0.1467, 0.2431, "Chefoptionen", true)
		guiWindowSetMovable(g_chefoptions["window"], false)
		guiWindowSetSizable(g_chefoptions["window"], false)
		g_chefoptions["bewerbungen"] = guiCreateButton(0.0533, 0.1286, 0.8876, 0.1762, "Bewerbungen", true, g_chefoptions["window"])
		g_chefoptions["mitarbeiter"] = guiCreateButton(0.0533, 0.3429, 0.8876, 0.1762, "Mitarbeiter", true, g_chefoptions["window"])
		g_chefoptions["abort"] = guiCreateButton(0.0533, 0.7667, 0.8876, 0.1762, "Abbrechen", true, g_chefoptions["window"])
		guiSetVisible(g_chefoptions["window"], false)
		g_guiloaded["chefoptionsgui"] = true
	end	
end

function initalizeChefBewerbungsMenu()
	if not g_guiloaded["bewerbungsviewergui"] then
		--BewerbungsViewer
		g_bewerbungViewer["window"] = guiCreateWindow(0.2648, 0.3113, 0.5634, 0.4664, "Bewerbungsliste", true)
		g_bewerbungViewer["gridlist"] = guiCreateGridList(0.0231, 0.072, 0.2542, 0.8089, true, g_bewerbungViewer["window"])
		guiGridListSetSelectionMode(g_bewerbungViewer["gridlist"], 0)
		g_bewerbungViewer["text"] = guiCreateMemo(0.2912, 0.072, 0.6934, 0.8065, "", true, g_bewerbungViewer["window"])
		guiMemoSetReadOnly(g_bewerbungViewer["text"], true)
		g_bewerbungViewer["accept"] = guiCreateButton(0.2912, 0.8958, 0.2126, 0.0794, "Einstellen", true, g_bewerbungViewer["window"])
		g_bewerbungViewer["decline"] = guiCreateButton(0.5146, 0.8958, 0.2126, 0.0794, "Ablehnen", true, g_bewerbungViewer["window"])
		g_bewerbungViewer["close"] = guiCreateButton(0.926, 0.8958, 0.0601, 0.0794, "X", true, g_bewerbungViewer["window"])	
		guiSetVisible(g_bewerbungViewer["window"], false)
		guiWindowSetSizable(g_bewerbungViewer["window"], false)
		guiWindowSetMovable(g_bewerbungViewer["window"], false)
		g_guiloaded["bewerbungsviewergui"] = true
	end	
end

function initalizeStadtVerwaltungsGUI()
	if not g_guiloaded["stadtgui"] then
		g_stadtgui["window"] = guiCreateWindow(0.4227,0.3924,0.2214,0.2801,"Dokumente",true)
		g_stadtgui["combo"] = guiCreateComboBox(0.0314,0.1116,0.9373,0.5488," ",true,g_stadtgui["window"])
		g_stadtgui["do"] = guiCreateButton(0.0353,0.5661,0.9216,0.1446,"Durchf"..uuml.."hren",true,g_stadtgui["window"])
		g_stadtgui["cancel"] = guiCreateButton(0.0353,0.7727,0.9176,0.1446,"Abbrechen",true,g_stadtgui["window"])
		g_stadtgui["preis"] = guiCreateLabel(0.0314,0.3017,0.9255,0.1653,"Preis: 0$",true,g_stadtgui["window"])
		guiLabelSetColor(g_stadtgui["preis"],0, 255, 0)
		guiLabelSetVerticalAlign(g_stadtgui["preis"],"center")
		guiLabelSetHorizontalAlign(g_stadtgui["preis"],"center",false)	
		guiSetVisible(g_stadtgui["window"], false)
		guiWindowSetSizable(g_stadtgui["window"], false)
		guiWindowSetMovable(g_stadtgui["window"], false)

		g_stadtgui["Personalausweis"] = guiComboBoxAddItem(g_stadtgui["combo"], "Personalausweis")
		g_stadtgui["Arbeitserlaubnis"] = guiComboBoxAddItem(g_stadtgui["combo"], "Arbeitserlaubnis")
		
		g_guiloaded["stadtgui"]	= true	
	end
end

function initalizeArbeitserlaubnisGUI()
	if not g_guiloaded["arbeitserlaubnis"] then
		g_arbeitserlaubnisgui["window"] = guiCreateWindow(0.3516,0.4167,0.2891,0.3414,"Arbeitserlaubnis",true)
		g_arbeitserlaubnisgui["text1"] = guiCreateLabel(0.024,0.1051,0.9429,0.5186,"Arbeitserlaubnis f"..uuml.."r Herrn PLAYERNAME


Dem Spieler PLAYERNAME wird es erlaubt, in ganz San Andreas legal, frei und ohne Einschraenkungen zu arbeiten.


In Vertreung fuer den Praesidenten ",true, g_arbeitserlaubnisgui["window"])
		guiLabelSetColor(g_arbeitserlaubnisgui["text1"],255,255,255)
		guiLabelSetVerticalAlign(g_arbeitserlaubnisgui["text1"],"top")
		guiLabelSetHorizontalAlign(g_arbeitserlaubnisgui["text1"],"left",true)
		g_arbeitserlaubnisgui["text2"] = guiCreateLabel(0.03,0.6407,0.9459,0.2373,"Die Stadtverwaltung

12.12.2010",true,g_arbeitserlaubnisgui["window"])
		guiLabelSetColor(g_arbeitserlaubnisgui["text2"],0,40,255)
		guiLabelSetVerticalAlign(g_arbeitserlaubnisgui["text2"],"top")
		guiLabelSetHorizontalAlign(g_arbeitserlaubnisgui["text2"],"left",false)
		guiSetFont(g_arbeitserlaubnisgui["text2"],"default-bold-small")	
		
		guiWindowSetSizable(g_arbeitserlaubnisgui["window"], false)
		guiWindowSetMovable(g_arbeitserlaubnisgui["window"], false)		
		guiSetVisible(g_arbeitserlaubnisgui["window"], false)
		
		g_guiloaded["arbeitserlaubnis"] = true
	end
end

function initalizeItemShopGUI()
	if not g_guiloaded["itemshop"] then
		g_itemshopgui["window"] = guiCreateWindow(0.2789,0.1698,0.4695,0.575,"Itemshop",true)
		g_itemshopgui["grid_items"] = guiCreateGridList(0.025,0.0924,0.4393,0.8025,true,g_itemshopgui["window"])
			g_itemshopgui["grid_itemscolumm"] = guiGridListAddColumn(g_itemshopgui["grid_items"], "Items", 0.65 )
			g_itemshopgui["grid_ipreiscolumm"] = guiGridListAddColumn(g_itemshopgui["grid_items"], "Preis", 0.20 )
			guiGridListSetSelectionMode(g_itemshopgui["grid_items"],1)
		g_itemshopgui["grid_warenkorb"] = guiCreateGridList(0.5308,0.096,0.4393,0.8025,true,g_itemshopgui["window"])
			g_itemshopgui["grid_witemscolumm"] = guiGridListAddColumn(g_itemshopgui["grid_warenkorb"], "Items", 0.55 )
			g_itemshopgui["grid_wanzahlcolumm"] = guiGridListAddColumn(g_itemshopgui["grid_warenkorb"], "Anzahl", 0.15 )
			g_itemshopgui["grid_wpreiscolumm"] = guiGridListAddColumn(g_itemshopgui["grid_warenkorb"], "Preis", 0.20 )
			guiGridListSetSelectionMode(g_itemshopgui["grid_warenkorb"],1)
		local label_items = guiCreateLabel(0.0283,0.0562,0.0715,0.0326,"Items:",true,g_itemshopgui["window"])
			guiLabelSetColor(label_items,50,200,50)
			guiLabelSetVerticalAlign(label_items,"top")
			guiLabelSetHorizontalAlign(label_items,"left",false)
			guiSetFont(label_items,"default-bold-small")
		local label_warenkorb = guiCreateLabel(0.5358,0.0562,0.1248,0.0308,"Warenkorb:",true,g_itemshopgui["window"])
			guiLabelSetColor(label_warenkorb,50,200,50)
			guiLabelSetVerticalAlign(label_warenkorb,"top")
			guiLabelSetHorizontalAlign(label_warenkorb,"left",false)
			guiSetFont(label_warenkorb,"default-bold-small")
		g_itemshopgui["button_ad"] = guiCreateButton(0.4759,0.4221,0.0433,0.0507,">",true,g_itemshopgui["window"])
		g_itemshopgui["button_remove"] = guiCreateButton(0.4775,0.4909,0.0433,0.0507,"<",true,g_itemshopgui["window"])
		g_itemshopgui["button_buy"] = guiCreateButton(0.7604,0.9221,0.2113,0.0543,"Kaufen",true,g_itemshopgui["window"])
			guiSetProperty(g_itemshopgui["button_buy"],"NormalTextColour","FF00FF00")
			guiSetProperty(g_itemshopgui["button_buy"],"HoverTextColour","FF009600")
		g_itemshopgui["button_close"] = guiCreateButton(0.5258,0.9239,0.2113,0.0543,"Schlie"..szlig.."en",true,g_itemshopgui["window"])
			guiSetProperty(g_itemshopgui["button_close"],"NormalTextColour","FFFF0000")
			guiSetProperty(g_itemshopgui["button_close"],"HoverTextColour","FF960000")
		guiWindowSetSizable(g_itemshopgui["window"], false)
		guiWindowSetMovable(g_itemshopgui["window"], false)		
		guiSetVisible(g_itemshopgui["window"], false)
		
		g_guiloaded["itemshop"] = true
	end
end

function initalizePlayerstatsGUI()
	if not g_guiloaded["playerstats"] then
		g_playerstats["window"] = guiCreateWindow(0.3108,0.2512,0.3819,0.6262,"",true)
		guiSetProperty(g_playerstats["window"],"TitlebarEnabled","False")
		guiSetProperty(g_playerstats["window"],"CloseButtonEnabled","False")
		g_playerstats["tabpanel"]= guiCreateTabPanel(0.0205,0.0425,0.9591,0.9409,true,g_playerstats["window"])
		g_playerstats["tabbedurefnisse"] = guiCreateTab("Bed"..uuml.."rfnisse",g_playerstats["tabpanel"])
		g_playerstats["beduerfnisse"] = guiCreateScrollPane(0.0,0.0,1.0,1.0,true,g_playerstats["tabbedurefnisse"])
		
		g_playerstats["eatinglabel"] = guiCreateLabel(0.0071,0.0784,0.3436,0.0701,"   Essen",true, g_playerstats["beduerfnisse"])
		g_playerstats["eatingprogress"] = guiCreateProgressBar(0.3531,0.068,0.5995,0.0557,true, g_playerstats["beduerfnisse"])
		
		--[[guiLabelSetColor(GUIEditor_Label[1],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[1],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[1],"left",false)
		GUIEditor_Label[2] = guiCreateLabel(0.0071,0.0784,0.3436,0.0701,"   Hunger",true,GUIEditor_Tab[1])
		guiLabelSetColor(GUIEditor_Label[2],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[2],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[2],"left",false)
		guiSetFont(GUIEditor_Label[2],"default-bold-small")
		GUIEditor_Progress[1] = guiCreateProgressBar(0.3531,0.068,0.5995,0.0557,true,GUIEditor_Tab[1])
		guiProgressBarSetProgress(GUIEditor_Progress[1],100)--]]
		
		g_playerstats["tabkoennen"] = guiCreateTab("Können", g_playerstats["tabpanel"])
		g_playerstats["koennen"] = guiCreateScrollPane(0.0,0.0,1.0,1.0,true,g_playerstats["tabkoennen"])
		
		--[[guiLabelSetColor(GUIEditor_Label[3],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[3],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[3],"left",false)	--]]
		
		guiWindowSetSizable(g_playerstats["window"], false)
		guiWindowSetMovable(g_playerstats["window"], false)		
		guiSetVisible(g_playerstats["window"], false)		
		
		g_guiloaded["playerstats"] = true
	end
end

function initBugReportGUI()
	if not g_guiloaded["buggui"] then
		g_bugGUI["window"] = guiCreateWindow(0.25,0.2801,0.5017,0.5336,"Bugs eingeben",true)
		guiSetProperty(g_bugGUI["window"],"CaptionColour","FFFF0000")
		g_bugGUI["absenden"] = guiCreateButton(0.0173,0.9089,0.3426,0.0694,"Absenden",true,g_bugGUI["window"])
		g_bugGUI["schliessen"] = guiCreateButton(0.628,0.9089,0.3426,0.0694,"Schlie"..szlig.."en",true,g_bugGUI["window"])
		g_bugGUI["memo"] = guiCreateMemo(0.0173,0.0651,0.9516,0.8134,"",true,g_bugGUI["window"])
		
		guiWindowSetSizable(g_bugGUI["window"], false)
		guiWindowSetMovable(g_bugGUI["window"], false)		
		guiSetVisible(g_bugGUI["window"], false)		
		
		g_guiloaded["buggui"] = true
	end	
end

function initRemoveItemGUI()
	if not g_guiloaded["removeitemgui"] then
		g_removeItemGUI["window"] = guiCreateWindow(0.3516,0.4292,0.3164,0.1948,"Items zerstören",true)
		g_removeItemGUI["scrollbar"] = guiCreateScrollBar(0.0222,0.1979,0.9457,0.15,true,true,g_removeItemGUI["window"])
		g_removeItemGUI["anz"] = guiCreateLabel(0,0.5027,0.9975,0.1444,"0 / 0",true,g_removeItemGUI["window"])
		guiLabelSetVerticalAlign(g_removeItemGUI["anz"],"center")
		guiLabelSetHorizontalAlign(g_removeItemGUI["anz"],"center",false)
		g_removeItemGUI["do"] = guiCreateButton(0.0321,0.7487,0.4247,0.1658,"Zerst"..ouml.."ren",true,g_removeItemGUI["window"])
		g_removeItemGUI["abort"] = guiCreateButton(0.5309,0.7487,0.4247,0.1658,"Abbrechen",true,g_removeItemGUI["window"])

		guiWindowSetSizable(g_removeItemGUI["window"], false)
		guiWindowSetMovable(g_removeItemGUI["window"], false)		
		guiSetVisible(g_removeItemGUI["window"], false)				
		
		g_guiloaded["removeitemgui"] = true
	end
end

function initAutoDiebGUI()
	if not g_guiloaded["autidieb"] then
		g_autodiebGUI["window"] = guiCreateWindow(0.2781,0.5229,0.4187,0.175,"Knacken",true)
		guiSetProperty(g_autodiebGUI["window"],"TitlebarEnabled","False")
		guiSetProperty(g_autodiebGUI["window"],"CloseButtonEnabled","False")
		--g_autodiebGUI["progressbar"] = guiCreateProgressBar(0.0168,0.6488,0.7332,0.2619,true,g_autodiebGUI["window"])
		g_autodiebGUI["topress"] = guiCreateLabel(0.0243,0.1071,0.9459,0.4524,"Button: w",true,g_autodiebGUI["window"])
		guiSetFont(g_autodiebGUI["topress"],"sa-gothic")
		g_autodiebGUI["timeleft"] = guiCreateLabel(0.7631,0.6429,0.2257,0.2619,"Restliche Zeit: 0:10
Verbleibende Tasks: 25",true,g_autodiebGUI["window"])
		
		guiWindowSetSizable(g_autodiebGUI["window"], false)
		guiWindowSetMovable(g_autodiebGUI["window"], false)		
		guiSetVisible(g_autodiebGUI["window"], false)	
		
		g_guiloaded["autidieb"] = true
	end	
end
