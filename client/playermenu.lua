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



function initalizePlayermenu()
	bindKey("F1", "down", activatePlayerMenu)
	
	--setCloudsEnabled(true)
	--setBlurLevel(38)
	if fileExists("./settingsPlayermenu.xml") then
		local xml = xmlLoadFile("./settingsPlayermenu.xml")
		if xml then
			local find = xmlFindChild(xml, "blurEnabled", 0)
			if find then
				if xmlNodeGetValue(find) == "true" then
					setBlurLevel(38)
					guiCheckBoxSetSelected(g_Playermenugui["BlurCheckbox"], true)
				else
					setBlurLevel(0)
					guiCheckBoxSetSelected(g_Playermenugui["BlurCheckbox"], false)
				end
			end
			
			local find = xmlFindChild(xml, "cloudsEnabled", 0)
			if find then
				if xmlNodeGetValue(find) == "true" then
					setCloudsEnabled(true)
					guiCheckBoxSetSelected(g_Playermenugui["CloudsCheckbox"], true)
				else
					setCloudsEnabled(false)
					guiCheckBoxSetSelected(g_Playermenugui["CloudsCheckbox"], false)
				end
			end
			
			local find = xmlFindChild(xml, "waterEnabled", 0)
			if find then
				if xmlNodeGetValue(find) == "true" then
					setWaterEffectsEnabled(true)
					guiCheckBoxSetSelected(g_Playermenugui["WaterCheckbox"], true)
				else
					setWaterEffectsEnabled(false)
					guiCheckBoxSetSelected(g_Playermenugui["WaterCheckbox"], false)
				end
			end
			
			local find = xmlFindChild(xml, "bloomEnabled", 0)
			if find then
				if xmlNodeGetValue(find) == "true" then
					setBloomEffectsEnabled(true)
					guiCheckBoxSetSelected(g_Playermenugui["BloomCheckbox"], true)
				else
					setBloomEffectsEnabled(false)
					guiCheckBoxSetSelected(g_Playermenugui["BloomCheckbox"], false)
				end
			end
			
			local find = xmlFindChild(xml, "carEnabled", 0)
			if find then
				if xmlNodeGetValue(find) == "true" then
					setCarEffectsEnabled(true)
					guiCheckBoxSetSelected(g_Playermenugui["CarCheckbox"], true)
				else
					setCarEffectsEnabled(false)
					guiCheckBoxSetSelected(g_Playermenugui["CarCheckbox"], false)
				end
			end

			xmlUnloadFile(xml)			
		end
	else
		setBlurLevel(38)
		setCloudsEnabled(true)
		
		local xml = xmlCreateFile("./settingsPlayermenu.xml", "settings")
		xmlNodeSetValue(xmlCreateChild(xml, "blurEnabled"), "true")
		xmlNodeSetValue(xmlCreateChild(xml, "cloudsEnabled"), "true")
		xmlNodeSetValue(xmlCreateChild(xml, "waterEnabled"), "true")
		xmlNodeSetValue(xmlCreateChild(xml, "bloomEnabled"), "false")
		xmlNodeSetValue(xmlCreateChild(xml, "carEnabled"), "false")
		xmlSaveFile(xml)
		xmlUnloadFile(xml)
		
		guiCheckBoxSetSelected(g_Playermenugui["BlurCheckbox"], true)
		guiCheckBoxSetSelected(g_Playermenugui["CloudsCheckbox"], true)
		guiCheckBoxSetSelected(g_Playermenugui["WaterCheckbox"], true)
		guiCheckBoxSetSelected(g_Playermenugui["BloomCheckbox"], false)
		guiCheckBoxSetSelected(g_Playermenugui["CarCheckbox"], true)
	end
end

function activatePlayerMenu(tutorialtoggle)
	if tutorialtoggle then tutorialtoggle = true end
	if g_playerstat["Logedin"] == true or tutorialtoggle then
		if guiGetVisible(g_Playermenugui["Window1"]) then
			guiSetVisible(g_Playermenugui["Window1"], false)
			showCursor(false)
			removeEventHandler("onClientGUIClick", g_Playermenugui["BlurCheckbox"], changeBlur)
			removeEventHandler("onClientGUIClick", g_Playermenugui["HelpList"], setHelp)
			removeEventHandler("onClientGUIClick", g_Playermenugui["PWChange"], initPWChange)
			removeEventHandler("onClientGUIClick", g_Playermenugui["MailChange"], initMailChange)
			removeEventHandler("onClientGUIClick", g_Playermenugui["CloudsCheckbox"], changeClouds)
			removeEventHandler("onClientGUIClick", g_Playermenugui["WaterCheckbox"], changeWater)
			removeEventHandler("onClientGUIClick", g_Playermenugui["CarCheckbox"], changeCar)
			removeEventHandler("onClientGUIClick", g_Playermenugui["BloomCheckbox"], changeBloom)
			removeEventHandler("onClientGUIClick", g_Playermenugui["FPSCheckbox"], changeFPS)
			removeEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_tank"], changeMapTank)
			removeEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_tuning"], changeMapTuning)
			removeEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_freizeit"], changeMapFreizeit)
			removeEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_auto"], changeMapAuto)
			removeEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_kranken"], changeMapKranken)
			removeEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_bank"], changeMapBank)
			removeEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_job"], changeMapJobs)
			removeEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_house"], changeMapHouse)
			removeEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_letterbox"], changeMapLetterBox)
			removeEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_cityhall"], changeMapCityHall)
			removeEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_minijob"], changeMapMiniJob)
			toggleControl("chatbox", true)
		else 
			guiSetVisible(g_Playermenugui["Window1"], true)	
			showCursor(true)
			addEventHandler("onClientGUIClick", g_Playermenugui["BlurCheckbox"], changeBlur)
			addEventHandler("onClientGUIClick", g_Playermenugui["HelpList"], setHelp)
			addEventHandler("onClientGUIClick", g_Playermenugui["PWChange"], initPWChange)
			addEventHandler("onClientGUIClick", g_Playermenugui["MailChange"], initMailChange)
			addEventHandler("onClientGUIClick", g_Playermenugui["CloudsCheckbox"], changeClouds)
			addEventHandler("onClientGUIClick", g_Playermenugui["WaterCheckbox"], changeWater)
			addEventHandler("onClientGUIClick", g_Playermenugui["CarCheckbox"], changeCar)
			addEventHandler("onClientGUIClick", g_Playermenugui["BloomCheckbox"], changeBloom)
			addEventHandler("onClientGUIClick", g_Playermenugui["FPSCheckbox"], changeFPS)
			addEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_tank"], changeMapTank)
			addEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_tuning"], changeMapTuning)
			addEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_freizeit"], changeMapFreizeit)
			addEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_auto"], changeMapAuto)
			addEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_kranken"], changeMapKranken)
			addEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_bank"], changeMapBank)
			addEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_job"], changeMapJobs)
			addEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_house"], changeMapHouse)
			addEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_letterbox"], changeMapLetterBox)
			addEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_cityhall"], changeMapCityHall)
			addEventHandler("onClientGUIClick", g_Playermenugui["Checkbox_minijob"], changeMapMiniJob)
			toggleControl("chatbox", false)
		end
	end	
end

function deactivatePlayerMenuTutorial()
	guiSetVisible(g_Playermenugui["Window1"], false)
	showCursor(false)
	removeEventHandler("onClientGUIClick", g_Playermenugui["BlurCheckbox"], changeBlur)
	removeEventHandler("onClientGUIClick", g_Playermenugui["HelpList"], setHelp)
	removeEventHandler("onClientGUIClick", g_Playermenugui["PWChange"], initPWChange)
	removeEventHandler("onClientGUIClick", g_Playermenugui["MailChange"], initMailChange)
	removeEventHandler("onClientGUIClick", g_Playermenugui["CloudsCheckbox"], changeClouds)
	removeEventHandler("onClientGUIClick", g_Playermenugui["FPSCheckbox"], changeFPS)
	toggleControl("chatbox", true)
end

function changeBlur(sorte)
	if sorte == "left" then
		if guiCheckBoxGetSelected(g_Playermenugui["BlurCheckbox"]) then
			setBlurLevel(38)
			
			local xml = xmlLoadFile("./settingsPlayermenu.xml")
			if xml then	
				local find = xmlFindChild(xml, "blurEnabled", 0)
				if not find then
					find = xmlCreateChild(xml, "blurEnabled")
				end
				
				xmlNodeSetValue(find, "true")
				xmlSaveFile(xml)
				xmlUnloadFile(xml)
			end
		else
			setBlurLevel(0)
			
			local xml = xmlLoadFile("./settingsPlayermenu.xml")
			if xml then	
				local find = xmlFindChild(xml, "blurEnabled", 0)
				if not find then
					find = xmlCreateChild(xml, "blurEnabled")
				end
				
				xmlNodeSetValue(find, "false")
				xmlSaveFile(xml)
				xmlUnloadFile(xml)
			end			
		end
	end
end

function changeClouds(sorte)
	if sorte == "left" then
		if guiCheckBoxGetSelected(g_Playermenugui["CloudsCheckbox"]) then
			setCloudsEnabled(true)
			
			local xml = xmlLoadFile("./settingsPlayermenu.xml")
			if xml then	
				local find = xmlFindChild(xml, "cloudsEnabled", 0)
				if not find then
					find = xmlCreateChild(xml, "cloudsEnabled")
				end
				
				xmlNodeSetValue(find, "true")
				xmlSaveFile(xml)
				xmlUnloadFile(xml)
			end			
		else
			setCloudsEnabled(false)
			
			local xml = xmlLoadFile("./settingsPlayermenu.xml")
			if xml then	
				local find = xmlFindChild(xml, "cloudsEnabled", 0)
				if not find then
					find = xmlCreateChild(xml, "cloudsEnabled")
				end
				
				xmlNodeSetValue(find, "false")
				xmlSaveFile(xml)
				xmlUnloadFile(xml)
			end				
		end
	end
end

function changeWater(sorte)
	if sorte == "left" then
		if guiCheckBoxGetSelected(g_Playermenugui["WaterCheckbox"]) then
			setWaterEffectsEnabled(true)
			
			local xml = xmlLoadFile("./settingsPlayermenu.xml")
			if xml then	
				local find = xmlFindChild(xml, "waterEnabled", 0)
				if not find then
					find = xmlCreateChild(xml, "waterEnabled")
				end
				
				xmlNodeSetValue(find, "true")
				xmlSaveFile(xml)
				xmlUnloadFile(xml)
			end			
		else
			setWaterEffectsEnabled(false)
			
			local xml = xmlLoadFile("./settingsPlayermenu.xml")
			if xml then	
				local find = xmlFindChild(xml, "waterEnabled", 0)
				if not find then
					find = xmlCreateChild(xml, "waterEnabled")
				end
				
				xmlNodeSetValue(find, "false")
				xmlSaveFile(xml)
				xmlUnloadFile(xml)
			end				
		end
	end
end

function changeBloom(sorte)
	if sorte == "left" then
		if guiCheckBoxGetSelected(g_Playermenugui["BloomCheckbox"]) then
			setBloomEffectsEnabled(true)
			
			local xml = xmlLoadFile("./settingsPlayermenu.xml")
			if xml then	
				local find = xmlFindChild(xml, "bloomEnabled", 0)
				if not find then
					find = xmlCreateChild(xml, "bloomEnabled")
				end
				
				xmlNodeSetValue(find, "true")
				xmlSaveFile(xml)
				xmlUnloadFile(xml)
			end			
		else
			setBloomEffectsEnabled(false)
			
			local xml = xmlLoadFile("./settingsPlayermenu.xml")
			if xml then	
				local find = xmlFindChild(xml, "bloomEnabled", 0)
				if not find then
					find = xmlCreateChild(xml, "bloomEnabled")
				end
				
				xmlNodeSetValue(find, "false")
				xmlSaveFile(xml)
				xmlUnloadFile(xml)
			end				
		end
	end
end

function changeCar(sorte)
	if sorte == "left" then
		if guiCheckBoxGetSelected(g_Playermenugui["CarCheckbox"]) then
			setCarEffectsEnabled(true)
			
			local xml = xmlLoadFile("./settingsPlayermenu.xml")
			if xml then	
				local find = xmlFindChild(xml, "carEnabled", 0)
				if not find then
					find = xmlCreateChild(xml, "carEnabled")
				end
				
				xmlNodeSetValue(find, "true")
				xmlSaveFile(xml)
				xmlUnloadFile(xml)
			end			
		else
			setCarEffectsEnabled(false)
			
			local xml = xmlLoadFile("./settingsPlayermenu.xml")
			if xml then	
				local find = xmlFindChild(xml, "carEnabled", 0)
				if not find then
					find = xmlCreateChild(xml, "carEnabled")
				end
				
				xmlNodeSetValue(find, "false")
				xmlSaveFile(xml)
				xmlUnloadFile(xml)
			end				
		end
	end
end

function changeFPS(sorte)
	if sorte == "left" then
		if guiCheckBoxGetSelected(g_Playermenugui["FPSCheckbox"]) then
			--FPS aktivieren
			addEventHandler("onClientRender", getRootElement(), showFPSPlayermenu)
		else
			--FPS deaktivieren
			removeEventHandler("onClientRender", getRootElement(), showFPSPlayermenu)
		end
	end
end

function setHelp(sorte)
	if sorte == "left" then
		local item = guiGridListGetItemText(g_Playermenugui["HelpList"], guiGridListGetSelectedItem(g_Playermenugui["HelpList"]), 1)
		
		--Bedienung
		if item == "Bedienung" then
			guiSetText(g_Playermenugui["HelpMemo"], "Tastaturk"..uuml.."rzel und Commands: 

F1 - Aktiviert das Spielermenue
F5 - de- oder aktiviert das HUD
F12 - Screenshot
x - Itemmen"..uuml.."
/pm [NAME] [TEXT]
/givecash [NAME] [BETRAG]
/afk - de- oder aktiviert den AFK Modus
/anim - Spielt eine Animation ab
/tanken - Betankt dein Fahrzeug.
/stoptanken - Bricht das Tanken ab
/bug - Hier kannst du einen Bug melden
/admincall - Damit machst du dich f"..uuml.."r das Team sichtbar.")
		end	
		--Fahrzeug
		if item == "Fahrzeug" then
			guiSetText(g_Playermenugui["HelpMemo"], "Fahrzeugfunktionen: 

Tastenk"..uuml.."rzel: 
B - "..Ouml.."ffnet oder schliesst dein Fahrzeug 

Befehle: 
/givekey [NAME] - Gibt [NAME] einen Schl"..uuml.."ssel f"..uuml.."r dein Auto. Du musst neben dem Fahrzeug stehen. 
/makeowner [NAME] - Macht [NAME] zum neuen Eigent"..uuml.."mer deines Fahrzeugs. Du verlierst deinen Schl"..uuml.."ssel dabei. Du musst neben dem Fahrzeug stehen.
/reset - Setzt den zweiten Kilometerzaehler zur"..uuml.."ck.
")
		end
		--Minijobs
		if item == "Minijobs" then
			guiSetText(g_Playermenugui["HelpMemo"], "Was sind Minijobs? 

Minijobs sind kleine Jobs die du ohne Bewerbung ausf"..uuml.."hren kannst. Sie sind in ganz San Andreas zu finden wo sie sind wird nicht verraten suche sie einfach selbst. 
 Es sind volgende Minijobs vorhanden: 
-Sweeper
-Aircargo
-M"..uuml.."labfuhr
-Bau
-Fischer")
		end	
		--Handy
		if item == "Handy" then
			guiSetText(g_Playermenugui["HelpMemo"], "Wof"..uuml.."r genau ist das Handy gedacht? 

Das Handy ist dazu gedacht, sich f"..uuml.."r andere Spieler sichtbar zu machen und bestimmte Jobs zu erreichen. Jeder Spieler erh"..auml.."lt ausserdem eine eigene Rufnummer. 

Wie benutze ich das Handy? 

Du musst das Handy kaufen dann ist per Itemmen"..uuml.." zu erreichen. Man muss es einfach nur ausw"..auml.."hlen. Ist das Handy aktiv, muss man die Nummern einfach nurnoch per Cursor eingeben.")
		end				
		--Jobs
		if item == "Jobs" then
			guiSetText(g_Playermenugui["HelpMemo"], "Wie komme ich an einen Job? 

Um einen Job zu bekommen, musst du eine Bewerbung per Post abschicken. Der Chef des Jobs kann sich dann deinen Brief durchlesen und dich ggf. dem Job hinzuf"..uuml.."gen.")
		end	
		--ADAC
		if item == "  ADAC" then --Leerzeichen m"..uuml.."ssen drinnen bleiben!
			guiSetText(g_Playermenugui["HelpMemo"], "Was macht der ADAC? 

Der ADAC k"..uuml.."mmert sich darum, dass deine Fahrzeuge und die Fahrzeuge des Staates immer wieder Reparaturen und Wartungen erhalten. Ohne den ADAC wueder dein Fahrzeug nach einer Weile nicht mehr Verkehrssicher sein oder gar nicht mehr funktionieren. Die Rufnummer f"..uuml.."r diesen Dienst lautet: 255 


Welche Jobcommands hat der ADAC? 

num_1 oder /repair - Reparatur des Fahrzeuges, welches sich im ADAC Einzugsgebiet befindet
num_4 oder /maketuv - Erneuert den T"..uuml.."v
num_3 oder /seizveh - Beschlagnahmt ein Fahrzeug")
		end	
		--Feuerwehr
		if item == "  Feuerwehr" then
			guiSetText(g_Playermenugui["HelpMemo"], "Was macht die Feuerwehr? 

Die Feuerwehr k"..uuml.."mmert sich darum, im Notfall dein Fahrzeug zu l"..ouml.."schen. Die Rufnummer f"..uuml.."r diesen Dienst lautet: 112 


Jobauftrag: 

L"..ouml.."sche das Fahrzeug mit dem Feuerl"..ouml.."scher und sichere die Insassen! 

Welche Jobcommands hat die Feuerwehr? 

num_1 oder /rescue - Rettet den Insassen des Fahrzeuges")
		end
		--Taxi
		if item == "  Taxi" then
			guiSetText(g_Playermenugui["HelpMemo"], "Was macht der Taxidienst? 

Der Taxidienst k"..uuml.."mmert sich darum, dich von Punkt A nach Punkt B zu bef"..ouml.."rdern, falls du mal kein Auto besitzt oder neu in der Stadt bist. Die Rufnummer fuer diesen Dienst lautet: 321 


Welche Jobcommands hat der Taxidienst? 

 num_1 oder /taxo - Schaltet den Taxometer ein und aus")
		end
		--Polizei
		if item == "  Polizei" then
			guiSetText(g_Playermenugui["HelpMemo"], "Was macht die Polizei? 

Die Verkehrspolizei "..uuml.."berwacht die Einhaltung der Gesetze in San Andreas. Die Rufnummer f"..uuml.."r diesen Dienst lautet: 110 


Welche Jobcommands hat die Polizei? 

num_1 oder /bust - Legt einem Spieler die Handschellen an
/num2 oder stopcall - Sendet an alle umliegenden Spieler: Halt Verkehrspolizei! 
/num3 oder sperre - Errichtet eine Stra"..szlig.."ensperre 
/num4 oder nagelband - Rollt ein Nagelband aus
/blitzer - Errichtet einen Blitzer
/strafe Spieler [Geld] [Begruendung] - Bestraft einen Spieler auf sein Strafkonto")
		end		
		--Medic
		if item == "  Medic" then
			guiSetText(g_Playermenugui["HelpMemo"], "Was macht das Medic Department? 

Das Medicdepartment k"..uuml.."mmert sich um alle Krankenf"..auml.."lle in San Andreas. Solltest du verletzt sein, solltest du einen Arzt aufrufen. Die Rufnummer f"..uuml.."r diesen Dienst lautet: 111 


Welche Jobcommands hat ein Arzt? 

num_1 oder /heal - Heilt einen Spieler oder sich selbst")
		end
		--Post
		if item == "  Post" then
			guiSetText(g_Playermenugui["HelpMemo"], "Was macht die Post?

Die Post tr"..auml.."gt die Briefe von Jobs und Personen in ganz San Andreas aus. F"..uuml.."r das schreiben von Briefn musst du einen Briefkasten aufrufen.")
		end
		--Tanker
		if item == "  Tanker" then
			guiSetText(g_Playermenugui["HelpMemo"], "Was macht der Tanker-Fahrer? 

Der Tanker-Fahrer sorgt daf"..auml.."r, dass alle Tankstellen in San Andreas mit neuen Treibstoffen versorgt werden.


Welche Jobcommands hat der Tanker?

num_1 oder /betanken - Fuellt eine Tankstelle auf, der Spieler muss dabei neben dem Tanklastzug stehen
num_2 oder /deattach - Kuppelt den H"..auml.."nger vom Lastkraftwagen ab")
		end		
	end
end

function initPWChange(button)
	if button == "left" then
		if source == g_Playermenugui["PWChange"] then
			activatePlayerMenu()
			initalizePWChange(true)
		end
	end
end

function initMailChange(button)
	if button == "left" then
		if source == g_Playermenugui["MailChange"] then
			activatePlayerMenu()
			initalizeMailChange(true)
		end
	end
end

local curfps = 0
local lastfps = 35
local lasttick = 0
local winx, winy = guiGetScreenSize()
local redcol = tocolor(255, 0, 0, 215)

function showFPSPlayermenu()
	if (getTickCount() - lasttick) > 1000 then
		lastfps = curfps
		curfps = 0
		lasttick = getTickCount()
	end
	curfps = curfps + 1
	dxDrawText(lastfps.." FPS", winx - 75, 15, "left", "top", redcol, 1.5)
	--outputChatBox(tostring(lastfps))
end

local tankblip = {}
function changeMapTank(state)
	if state == "left" then
		if guiCheckBoxGetSelected(g_Playermenugui["Checkbox_tank"]) then
			for _, tankstelle in ipairs(getElementsByType("tankstelle")) do
				local x, y, z = getElementPosition(tankstelle)
				tankblip[tankstelle] = createBlip(x, y, z, 42, 1, 0, 255, 255, 155, -32768, 500, client)
			end
		else
			for _, tankstelle in ipairs(getElementsByType("tankstelle")) do
				destroyElement(tankblip[tankstelle])
			end
		end
	end
end

local tuningblip = {}
function changeMapTuning(state)
	if state == "left" then
		if guiCheckBoxGetSelected(g_Playermenugui["Checkbox_tuning"]) then
			tuningblip[1] = createBlip(2386.6005859375, 1052.203125, 9.8203125, 27, 3, 0, 255, 255, 155, -32768, 500)
			tuningblip[2] = createBlip(1041.6650390625, -1017.8232421875, 31.107528686523, 27, 3, 0, 255, 255, 155, -32768, 500)
			tuningblip[3] = createBlip(-1936.8125, 247.1923828125, 33.4609375, 27, 3, 0, 255, 255, 155, -32768, 500)
			tuningblip[4] = createBlip(-2281.6572265625, 2449.2001953125, 0, 27, 3, 0, 255, 255, 155, -32768, 500)
			tuningblip[5] = createBlip(1279.93359375, 1324.0634765625, 10.280610084534, 27, 3, 0, 255, 255, 155, -32768, 500)
		else
			for i, tuningblip in ipairs(tuningblip) do
				destroyElement(tuningblip)
				tuningblip = nil
			end	
		end
	end
end

local freizeitblip = {}
function changeMapFreizeit(state)
	if state == "left" then
		if guiCheckBoxGetSelected(g_Playermenugui["Checkbox_freizeit"]) then
			freizeitblip[1] = createBlip(1166.5283203125, 1348.1728515625, 10.921875, 58, 3, 0, 255, 255, 155, -32768, 500)
			freizeitblip[2] = createBlip(1836.9, -1681.75, 12.3635, 58, 3, 0, 255, 255, 155, -32768, 500)
			freizeitblip[3] = createBlip(953.40234375, 2164.181640625, 1010.0234375, 58, 3, 0, 255, 255, 155, -32768, 500)
			freizeitblip[4] = createBlip(-1749.6572265625, 902.20703125, 25.0859375, 58, 3, 0, 255, 255, 155, -32768, 500)
			freizeitblip[5] = createBlip(1958.7489013672, -1454.8581542969, 12.549285888672, 58, 3, 0, 255, 255, 155, -32768, 500)
			freizeitblip[5] = createBlip(693.807, 1964.6035, 4.539, 58, 3, 0, 255, 255, 155, -32768, 500)
		else
			for i, freizeitblip in ipairs(freizeitblip) do
				destroyElement(freizeitblipU)
				freizeitblip[i] = nil
			end	
		end
	end
end

local autoblip = {}
function changeMapAuto(state)
	if state == "left" then
		if guiCheckBoxGetSelected(g_Playermenugui["Checkbox_auto"]) then
			autoblip[1] = createBlip(2172.0859375, 1397.134765625, 11.0625, 55, 3, 0, 255, 255, 155, -32768, 500)
			autoblip[2] = createBlip(541.4638671875, 2363.703125, 30.874475479126, 55, 3, 0, 255, 255, 155, -32768, 500)
			autoblip[3] = createBlip(538.4853515625, -1292.375, 17.2421875, 55, 3, 0, 255, 255, 155, -32768, 500)
			autoblip[4] = createBlip(2131.40625, -1149.701171875, 24.23360824585, 55, 3, 0, 255, 255, 155, -32768, 500)
			autoblip[5] = createBlip(2282.2470703125, -2363.8984375, 13.546875, 55, 3, 0, 255, 255, 155, -32768, 500)
			autoblip[6] = createBlip(-1952.2763671875, 295.2265625, 35.468755, 55, 3, 0, 255, 255, 155, -32768, 500)
			autoblip[7] = createBlip(-1658.5986328125, 1207.3076171875, 7.25, 55, 3, 0, 255, 255, 155, -32768, 500)
			autoblip[8] = createBlip(401.34375, 2538.306640625, 16.545127868652, 55, 3, 0, 255, 255, 155, -32768, 500)
			autoblip[9] = createBlip(-2184.6015625, 2416.0927734375, 5.1876344680786, 55, 3, 0, 255, 255, 155, -32768, 500)
		else
			for i, autoblipU in pairs(autoblip) do
				destroyElement(autoblipU)
				autoblip[i] = nil
			end	
		end
	end
end

local krankenblip = {}
function changeMapKranken(state)
	if state == "left" then
		if guiCheckBoxGetSelected(g_Playermenugui["Checkbox_kranken"]) then
			krankenblip[1] = createBlip(1172.662109375, -1319.8037109375, 15.39520740509, 22, 3, 0, 255, 255, 155, -32768, 500)
			krankenblip[2] = createBlip(-2641.98046875, 638.2109375, 14.453125, 22, 3, 0, 255, 255, 155, -32768, 500)
			krankenblip[3] = createBlip(1611.49609375, 1817.439453125, 10.8203125, 22, 3, 0, 255, 255, 155, -32768, 500)
		else
			for i, krankenblipU in pairs(krankenblip) do
				destroyElement(krankenblipU)
				krankenblip[i] = nil
			end	
		end
	end
end

local bankblip = {}
function changeMapBank(state)
	if state == "left" then
		if guiCheckBoxGetSelected(g_Playermenugui["Checkbox_bank"]) then
			--bankblip[1] = createBlip(2089.0959472656, 2055.0290527344, 10.8203125, 52, 1, 0, 255, 255, 155, -32768, 500) -- im nirgendwo
			bankblip[2] = createBlip(1467.1107177734, -1048.9367675781, 23.828125, 52, 3, 0, 255, 255, 155, -32768, 500)
			--bankblip[3] = createBlip(-2050.0505371094, 461.35934448242, -100035.171875, 52, 1, 0, 255, 255, 155, -32768, 500) --Doppelt
			bankblip[4] = createBlip(589.4363,-1252.9896,17.2082, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[5] = createBlip(1104.5245,-923.6553,42.3906, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[6] = createBlip(2401.4680,-1547.5966,23.1641, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[7] = createBlip(2179.0349,-1774.5035,12.5389, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[8] = createBlip(1955.2133,-2178.2131,12.5469, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[9] = createBlip(1755.9009,-1944.2782,12.5672, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[10] = createBlip(1211.2273,-1821.7512,12.5941, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[10] = createBlip(394.5443,-1758.0463,7.1906, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[11] = createBlip(255.0592,-54.2191,1.5703, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[12] = createBlip(1364.1897,301.7996,18.5469, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[13] = createBlip(2302.1636,-13.7446,25.4844, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[14] = createBlip(647.2449,-520.9219,15.3359, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[15] = createBlip(-1420.4598,-289.4524,13.1484, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[16] = createBlip(-1946.2261,-852.2305,31.2266, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[17] = createBlip(-2031.6053,455.7636,33.1723, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[18] = createBlip(-1982.8958,1043.1011,54.7188, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[19] = createBlip(-2580.0720,71.6548,3.9938, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[20] = createBlip(-2651.4854,363.6794,3.3777, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[21] = createBlip(-2724.6375,-322.9290,6.1758, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[22] = createBlip(-1551.3137,1054.2794,6.1875, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[23] = createBlip(-825.5186,1502.7145,18.6339, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[24] = createBlip(1460.4734,2593.2981,54.8359, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[25] = createBlip(-286.5519,2692.7720,61.6875, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[26] = createBlip(664.8341,1721.2539,6.1875, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[27] = createBlip(1583.9930,2216.7090,10.0692, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[28] = createBlip(2140.4719,2735.3926,10.1763, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[29] = createBlip(2823.5027,2008.0493,10.8203, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[30] = createBlip(2525.6040,1519.2852,9.8203, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[31] = createBlip(2108.8230,898.4670,10.1797, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[32] = createBlip(1307.5076,1252.0139,9.8203, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[33] = createBlip(2469.8975,2243.4092,9.8203, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[34] = createBlip(1901.0206,2447.0144,10.1782, 52, 3, 0, 255, 255, 155, -32768, 500)
			bankblip[35] = createBlip(1589.8370,743.2934,9.8203, 52, 3, 0, 255, 255, 155, -32768, 500)
		else
			for i, bankblip in pairs(bankblip) do
				destroyElement(bankblip)
				bankblip = nil
			end	
		end
	end
end

local jobblip = {}
function changeMapJobs(state)
	if state == "left" then
		if guiCheckBoxGetSelected(g_Playermenugui["Checkbox_job"]) then
			jobblip[1] = createBlip(1808.9592285156, -1903.7839355469, 13.684513092041, 48, 3, 0, 255, 255, 155, -32768, 500) --ADAC
			jobblip[2] = createBlip(-2042.1884765625, 159.70703125, 28.8359375, 48, 3, 0, 255, 255, 155, -32768, 500) --ADAC
			jobblip[3] = createBlip(1658.5339355469, 2199.5522460938, 10.8203125, 48, 3, 0, 255, 255, 155, -32768, 500) --ADAC
			jobblip[4] = createBlip(1495.1650390625, -2178.8310546875, 13.739019393921, 20, 3, 0, 255, 255, 155, -32768, 500) --Feuerwehr
			jobblip[5] = createBlip(1776.8310546875, 2080.482421875, 10.8203125, 20, 3, 0, 255, 255, 155, -32768, 500) --Feuerwehr
			jobblip[6] = createBlip(-2024.6330566406, 67.245750427246, 28.441009521484, 20, 3, 0, 255, 255, 155, -32768, 500) --Feuerwehr
			jobblip[7] = createBlip(1172.6964111328, -1327.6652832031, 15.401915550232, 22, 3, 0, 255, 255, 155, -32768, 500) --Medic
			jobblip[8] = createBlip(1614.6671142578, 1817.5483398438, 10.8203125, 22, 3, 0, 255, 255, 155, -32768, 500) --Medic
			jobblip[9] = createBlip(-2665.3134765625, 637.92590332031, 14.453125, 22, 3, 0, 255, 255, 155, -32768, 500) --Medic
			jobblip[10] = createBlip(254.0732421875, 76.564453125, 1003.640625, 30, 3, 0, 255, 255, 155, -32768, 500) --Police
			jobblip[11] = createBlip(223.2255859375, 186.337890625, 1003.03125, 30, 3, 0, 255, 255, 155, -32768, 500) --Police
			jobblip[12] = createBlip(-1592.3161621094, 716.09307861328, -5.2421875, 30, 3, 0, 255, 255, 155, -32768, 500) --Police
			jobblip[13] = createBlip(-501.2236328125, -551.267578125, 25.5234375, 60, 3, 0, 255, 255, 155, -32768, 500) --Post
			jobblip[14] = createBlip(282.3571472168, 1420.0771484375, 10.538059234619, 11, 3, 0, 255, 255, 155, -32768, 500) --Tanker
			jobblip[15] = createBlip(1565.7724609375, -2335.9077148438, 13.546875, 44, 3, 0, 255, 255, 155, -32768, 500) --Taxi
			jobblip[16] = createBlip(-1981.5589599609, 134.85935974121, 27.6875, 44, 3, 0, 255, 255, 155, -32768, 500) --Taxi
			jobblip[17] = createBlip(1713.2829589844, 1303.3278808594, 10.827939987183, 44, 3, 0, 255, 255, 155, -32768, 500) --Taxi
		else
			for i, jobblip in pairs(jobblip) do
				destroyElement(jobblip)
				jobblip = nil
			end	
		end
	end
end

local houseblip = {}
local houseX, houseY, houseZ = 0, 0, 0
function changeMapHouse(state)
	if state == "left" then
		if guiCheckBoxGetSelected(g_Playermenugui["Checkbox_house"]) then
			houseblip[1] = createBlip(houseX, houseY, houseZ, 31, 3, 0, 255, 255, 155, -32768, 500)
		else
			for i, houseblip in pairs(houseblip) do
				destroyElement(houseblip)
				houseblip = nil
			end	
		end
	end
end

function setHousePos(x, y, z)
	houseX, houseY, houseZ = x, y, z
end

local letterboxblip = {}
function changeMapLetterBox(state)
	if state == "left" then
		if guiCheckBoxGetSelected(g_Playermenugui["Checkbox_letterbox"]) then
			letterboxblip[1] = createBlip(995.0517578125, -1228.8779296875, 16.904308319092, 0, 3, 255, 255, 0, 155, -32768, 500)
			letterboxblip[2] = createBlip(-2455.5732421875, 2285.76953125, 4.9793748855591, 0, 3, 255, 255, 0, 155, -32768, 500)
			letterboxblip[3] = createBlip(1499.486328125, 1001.390625, 10.8203125, 0, 3, 255, 255, 0, 155, -32768, 500)
			letterboxblip[4] = createBlip(402.529296875, -1363.1455078125, 14.862838745117, 0, 3, 255, 255, 0, 155, -32768, 500)
			letterboxblip[5] = createBlip(1035.6474609375, -1333.517578125, 13.547601699829, 0, 3, 255, 255, 0, 155, -32768, 500)
			letterboxblip[6] = createBlip(1540.6142578125, -1663.046875, 13.550939559937, 0, 3, 255, 255, 0, 155, -32768, 500)
			letterboxblip[7] = createBlip(2276.82421875, -1377.7548828125, 23.980195999146, 0, 3, 255, 255, 0, 155, -32768, 500)
			letterboxblip[8] = createBlip(2036.1787109375, 1477.9853515625, 10.8203125, 0, 3, 255, 255, 0, 155, -32768, 500)
			letterboxblip[9] = createBlip(2154.603515625, 2221.3857421875, 10.8203125, 0, 3, 255, 255, 0, 155, -32768, 500)
			letterboxblip[10] = createBlip(2094.55859375, 2682.1533203125, 10.8203125, 0, 3, 255, 255, 0, 155, -32768, 500)
			letterboxblip[11] = createBlip(-2161.798828125, -161.7421875, 35.3203125, 0, 3, 255, 255, 0, 155, -32768, 500)
			letterboxblip[12] = createBlip(-2153.7822265625, 254.267578125, 35.3203125, 0, 3, 255, 255, 0, 155, -32768, 500)
			letterboxblip[13] = createBlip(-2133.3447265625, 666.1435546875, 55.295722961426, 0, 3, 255, 255, 0, 155, -32768, 500)
			letterboxblip[14] = createBlip(-1910.0751953125, 721.5791015625, 45.4453125, 0, 3, 255, 255, 0, 155, -32768, 500)
			letterboxblip[15] = createBlip(-1998.1689453125, 175.6533203125, 27.6875, 0, 3, 255, 255, 0, 155, -32768, 500)
		else
			for i, letterboxblip in pairs(letterboxblip) do
				destroyElement(letterboxblip)
				letterboxblip = nil
			end	
		end
	end
end

local cityhallblip = {}
function changeMapCityHall(state)
	if state == "left" then
		if guiCheckBoxGetSelected(g_Playermenugui["Checkbox_cityhall"]) then
			cityhallblip[1] = createBlip(1209.2890625, -1747.4365234375, 13.593576431274, 0, 3, 255, 105, 105, 155, -32768, 500)
		else
			for i, cityhallblip in pairs(cityhallblip) do
				destroyElement(cityhallblip)
				cityhallblip = nil
			end	
		end
	end
end

local minijobblip = {}
function changeMapMiniJob(state)
	if state == "left" then
		if guiCheckBoxGetSelected(g_Playermenugui["Checkbox_minijob"]) then
			minijobblip[1] = createBlip(1668.759765625, 1566.658203125, 10.779090881348, 0, 3, 50, 205, 50, 155, -32768, 500)
			minijobblip[2] = createBlip(-2121.076171875, 219.9658203125, 35.249809265137, 0, 3, 50, 205, 50, 155, -32768, 500)
			minijobblip[3] = createBlip(-920.904296875, 2671.4970703125, 42.370262145996, 0, 3, 50, 205, 50, 155, -32768, 500)
			minijobblip[4] = createBlip(1602.833984375, -1838.794921875, 13.499720573425, 0, 3, 50, 205, 50, 155, -32768, 500)
			minijobblip[5] = createBlip(1713.4365234375, 914.220703125, 10.8203125, 0, 3, 50, 205, 50, 155, -32768, 500)
		else
			for i, minijobblip in pairs(minijobblip) do
				destroyElement(minijobblip)
				minijobblip = nil
			end	
		end
	end
end
