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



local tutorial = {}
local tutorialstarted = false

function startTutorial()
	tutorial = {}
	tutorial["cursec"] = 0
	tutorial["textlabel"] = guiCreateLabel(0.05, 0.05, 0.85, 0.2, "Willkommen bei MTA:RL", true)
	guiSetFont(tutorial["textlabel"], "sa-header")
	fadeCamera(false, 0.1)
	
	setPedRotation(getLocalPlayer(), 180)
	
	tutorial["train"] = createVehicle(537, 1433.9658203125, 2628.1533203125, 11.392612457275)
	--tutorial["trainbox"] = createVehicle(590, 1433.9658203125, 2628.1533203125, 11.392612457275)
	
	tutorial["dimension"] = getElementDimension(getLocalPlayer())
	
	setElementDimension(tutorial["train"], tutorial["dimension"])
	--setElementDimension(tutorial["trainbox"], tutorial["dimension"])
	
	--attachTrailerToVehicle(tutorial["train"], tutorial["trainbox"])
	
	tutorial["car1"] = createVehicle(560, 1434.2587890625, 2609.453125, 10.448480606079, 359.8681640625, 355.19348144531, 90.208740234375)
	tutorial["car2"] = createVehicle(566, 1437.453125, 2578.0458984375, 10.525980949402, 359.8681640625, 359.99450683594, 359.2529296875)
	tutorial["car3"] = createVehicle(463, 1432.4931640625, 2578.1708984375, 10.525010108948, 359.8681640625, 359.99450683594, 178.42895507813)
	tutorial["car4"] = createVehicle(562, 1472.6416015625, 2573.083984375, 10.44898223877, 359.8681640625, 355.19348144531, 179.15954589844)
	tutorial["car5"] = createVehicle(536, 1343.33984375, 2577.708984375, 10.525856971741, 359.8681640625, 359.99450683594, 1.900634765625)
	tutorial["car6"] = createVehicle(420, 1442.767578125, 2678.4365234375, 10.448293685913, 359.8681640625, 355.19348144531, 88.873901367188)
	tutorial["car7"] = createVehicle(420, 1430.6201171875, 2678.44140625, 10.448027610779, 359.8681640625, 355.19348144531, 89.906616210938, Example)
	
	for i = 1, 7 do
		setElementDimension(tutorial["car"..i], tutorial["dimension"])
	end
	
	tutorial["ped1"] = createPed(21, 1416.6650390625, 2640.734375, 11.392612457275)
	setPedRotation(tutorial["ped1"], 181.58204650879)
	tutorial["ped2"] = createPed(26, 1445.798828125, 2642.3359375, 11.392612457275)
	setPedRotation(tutorial["ped2"], 180.3318786621094)
	
	tutorial["ped3"] = createPed(25, 1433.17578125, 2649.8466796875, 11.392612457275)
	setPedRotation(tutorial["ped3"], 179.36279296875)
	tutorial["ped4"] = createPed(40, 1433.390625, 2648.4716796875, 11.392612457275)
	setPedRotation(tutorial["ped4"], 1.5573425292969)
	setPedAnimation(tutorial["ped3"], "GANGS", "prtial_gngtlkH")
	setPedAnimation(tutorial["ped4"], "GANGS", "prtial_gngtlkC")
	
	tutorial["ped5"] = createPed(25, 1442.6552734375, 2581.9423828125, 10.8203125)
	setPedRotation(tutorial["ped5"], 273.67636108398)
	tutorial["ped6"] = createPed(40, 1443.9736328125, 2582.1923828125, 10.8203125)	
	setPedRotation(tutorial["ped6"], 92.73974609375)
	setPedAnimation(tutorial["ped5"], "GANGS", "prtial_gngtlkA")
	setPedAnimation(tutorial["ped6"], "GANGS", "prtial_gngtlkB")	
	
	tutorial["ped7"] = createPed(176, 1427.615234375, 2623.6494140625, 11.392612457275)	
	setPedRotation(tutorial["ped7"], 354.66329956055)
	
	for i = 1, 7 do
		setElementDimension(tutorial["ped"..i], tutorial["dimension"])
	end	
	
	tutorialstarted = true
	showChat(false)
end

function tutorialTimer()
	if tutorialstarted then
		tutorial["cursec"] = tutorial["cursec"] + 1
		
		if tutorial["cursec"] == 6 then
			playSoundFrontEnd(15)
			guiSetFont(tutorial["textlabel"], "clear-normal")
			guiSetText(tutorial["textlabel"], "In den folgenden Minuten wirst du das Tutorial durchlaufen")
		end
		
		if tutorial["cursec"] == 12 then
			playSoundFrontEnd(15)
			guiSetText(tutorial["textlabel"], "Du kannst das Tutorial nicht abbrechen!")
		end
		
		if tutorial["cursec"] == 17 then
			playSoundFrontEnd(15)
			guiLabelSetColor(tutorial["textlabel"], 255, 255, 0)
			guiSetText(tutorial["textlabel"], "Willkommen in der Welt von MTA:RL. Mache dich zun"..auml.."chst ein wenig mit der Steuerung vertraut.\n\nBeachte, dass es sich bei MTA:RL noch um eine Beta handelt")
			
			--setTrainSpeed(tutorial["train"], 0.03)
			fadeCamera(true, 2)	
			setElementPosition(getLocalPlayer(), 1433.9658203125, 2628.1533203125, 11.392612457275)
		end
		
		if tutorial["cursec"] == 25 then
			playSoundFrontEnd(15)
			guiSetText(tutorial["textlabel"], "Wir m"..ouml.."chten dich zun"..auml.."chst auf alle wichtigen Funktionen von MTA:RL aufmerksam machen.")
		end
		
		if tutorial["cursec"] == 30 then
			playSoundFrontEnd(15)
			guiSetText(tutorial["textlabel"], "MTA:RL stellt von Anfang an ein Spielermenue bereit.")
			toggleAllControls(false)
			activatePlayerMenu(true)
			showCursor(false)
		end	
		
		if tutorial["cursec"] == 35 then
			playSoundFrontEnd(15)
			guiSetText(tutorial["textlabel"], "In diesem Spielermenu kannst du jederzeit alle wichtigen Informationen abrufen und "..auml.."ndern.")
		end
		
		if tutorial["cursec"] == 37 then
			guiSetSelectedTab(g_Playermenugui["Tab"], g_Playermenugui["Tab3"])
		end
		
		if tutorial["cursec"] == 41 then
			guiSetSelectedTab(g_Playermenugui["Tab"], g_Playermenugui["Tab4"])
		end	

		if tutorial["cursec"] == 42 then
			playSoundFrontEnd(15)
			guiSetText(tutorial["textlabel"], "Du kannst das Spielermenu jederzeit durch dr"..uuml.."cken der F1-Taste aufrufen.")
		end
		
		if tutorial["cursec"] == 45 then
			playSoundFrontEnd(15)
			deactivatePlayerMenuTutorial()
			guiSetText(tutorial["textlabel"], "Beachte bitte, dass du dein Passwort niemals im Chat bekannt gibst. Auch Teammitglieder werden dich niemals\nnach deinem Passwort fragen.")
		end	
		
		if tutorial["cursec"] == 50 then
			playSoundFrontEnd(15)
			guiSetText(tutorial["textlabel"], "Den angesprochenen Chat kannst du jederzeit mit der Taste t "..ouml.."ffnen. Wir haben ihn erstmal deaktiviert,\num dich nicht vom Tutorial abzulenken.")
			fadeCamera(false, 5)			
		end
		
		if tutorial["cursec"] == 57 then
			destroyElement(tutorial["train"])
			for i = 1, 7 do
				destroyElement(tutorial["car"..i])
			end	

			for i = 1, 7 do
				destroyElement(tutorial["ped"..i])
			end	
			
			fadeCamera(true, 5)
			playSoundFrontEnd(15)
			
			tutorial["car1"] = createVehicle(560, 2228.787109375, -1166.443359375, 25.462230682373, 359.00024414063, 359.66491699219, 90.450439453125)
			tutorial["car2"] = createVehicle(535, 2206.1796875, -1160.8876953125, 25.437334060669, 359.64294433594, 0.0274658203125, 269.77478027344)
			tutorial["car3"] = createVehicle(547, 2217.306640625, -1170.22265625, 25.431371688843, 359.8681640625, 359.99450683594, 269.57702636719)	

			setElementDimension(tutorial["car1"], tutorial["dimension"])
			setElementDimension(tutorial["car2"], tutorial["dimension"])
			setElementDimension(tutorial["car3"], tutorial["dimension"])

			
			tutorial["ped1"] = createPed(60, 2220.2255859375, -1149.1640625, 25.76831817627)
			tutorial["ped2"] = createPed(93, 2218.041015625, -1149.1162109375, 25.765228271484)
			
			setElementDimension(tutorial["ped1"], tutorial["dimension"])
			setElementDimension(tutorial["ped2"], tutorial["dimension"])		
			
			setPedRotation(tutorial["ped1"], 92.904541015625)
			setPedRotation(tutorial["ped2"], 272.90179443359)
			
			setPedAnimation(tutorial["ped2"], "GANGS", "prtial_gngtlkH")
			setPedAnimation(tutorial["ped1"], "GANGS", "prtial_gngtlkC")
			
			guiSetText(tutorial["textlabel"], "Die ersten Stunden in MTA:RL wirst du in einem Hotel untergebracht sein.")
			setCameraMatrix(2231.2685546875, -1123.71875, 46.4453125, 2219.4697265625, -1178.8671875, 29.797086715698)
		end

		if tutorial["cursec"] == 63 then
			playSoundFrontEnd(15)
			
			guiSetText(tutorial["textlabel"], "Du kannst jederzeit mit einem Makler einen Termin vereinbaren und ein eigenes Haus\noder eine Wohnung kaufen.")
		end
		
		if tutorial["cursec"] == 70 then
			fadeCamera(false, 3)
		end
		
		if tutorial["cursec"] == 73 then
			destroyElement(tutorial["ped1"])
			destroyElement(tutorial["ped2"])
			destroyElement(tutorial["car1"])
			destroyElement(tutorial["car2"])
			destroyElement(tutorial["car3"])

			tutorial["car1"] = createVehicle(506, 1198.26171875, -1835.931640625, 13.104725837708, 359.96704101563, 0, 89.280395507813)
			tutorial["car2"] = createVehicle(559, 1198.654296875, -1828.15234375, 13.112811088562, 359.92309570313, 0.15380859375, 270.89538574219)
			tutorial["car3"] = createVehicle(555, 1237.5029296875, -1813.18359375, 13.136969566345, 359.78576660156, 359.90661621094, 179.76928710938)
			
			tutorial["marker1"] = createMarker(1211.2273,-1821.7512,12.5941, "cylinder", 2, 110, 139, 61, 150)
			setElementDimension(tutorial["marker1"], tutorial["dimension"])
			
			setElementDimension(tutorial["car1"], tutorial["dimension"])
			setElementDimension(tutorial["car2"], tutorial["dimension"])
			setElementDimension(tutorial["car3"], tutorial["dimension"])

			tutorial["ped1"] = createPed(228, 1221.638671875, -1812.77734375, 16.59375)
			setPedRotation(tutorial["ped1"], 179.76379394531)
			
			setElementDimension(tutorial["ped1"], tutorial["dimension"])
			
			
			setPedControlState(tutorial["ped1"], "walk", true)
			setPedControlState(tutorial["ped1"], "forwards", true)
			
			setCameraMatrix(1230.0322265625, -1863.0986328125, 20.847606658936 , 1211.1796875, -1824.181640625, 13.590532302856)
			
			fadeCamera(true, 3)
			playSoundFrontEnd(15)
			
			guiSetText(tutorial["textlabel"], "Du verf"..uuml.."gst ueber eine EC-Karte. Diese l"..auml.."sst dich an jedem Geldautomaten\nin ganz San Andreas jederzeit Geld abheben. Du erkennst sie an den gr"..uuml.."nen Markern.")
		end
		
		if tutorial["cursec"] == 81 then
			playSoundFrontEnd(15)
			guiSetText(tutorial["textlabel"], "Zu Beginn verf"..uuml.."gst du "..uuml.."ber 65000$, davon liegen 64500$ auf der Bank.")
			
			showGeldautomatMenu(64500)
			showCursor(false)
		end
		
		if tutorial["cursec"] == 86 then
			hideGeldautomatMenu()
		end
		
		if tutorial["cursec"] == 89 then
			fadeCamera(false, 3)
		end
		
		if tutorial["cursec"] == 92 then
			setCameraMatrix(1714.8125, 935.1650390625, 17.614505767822, 1712.7265625, 915.8349609375, 10.8203125)
			guiSetText(tutorial["textlabel"], "Du hast noch keinen Job, suchst aber trotzdem eine Beschaeftigung?")
			fadeCamera(true, 2.5)
		end	
			
		if tutorial["cursec"] == 94 then
			playSoundFrontEnd(15)
		end
		
		if tutorial["cursec"] == 100 then
			guiSetText(tutorial["textlabel"], "In ganz San Andreas gibt es Minijobs, die du jederzeit ausf"..uuml.."hren kannst.")
			playSoundFrontEnd(15)
		end
		
		if tutorial["cursec"] == 106 then
			guiSetText(tutorial["textlabel"], "Du brauchst dich f"..uuml.."r diese Jobs nicht bewerben.")
			playSoundFrontEnd(15)
		end	

		if tutorial["cursec"] == 111 then
			guiSetText(tutorial["textlabel"], "Der hier gezeigte Job ist der 'Sweeper-Job' in Las Venturas.")
			playSoundFrontEnd(15)
		end

		if tutorial["cursec"] == 115 then
			playSoundFrontEnd(15)
			fadeCamera(false, 1)
			guiSetText(tutorial["textlabel"], "Wir w"..uuml.."nschen dir nun viel Spass beim Nutzen von MTA:RL")
		end
		
		if tutorial["cursec"] == 123 then
			playSoundFrontEnd(15)
			guiSetText(tutorial["textlabel"], "Solltest du noch Fragen haben:\n-Nutze das Spielermenue\n-Frage ein Teammitglied\n-Nutze das Forum\n-Frage einen bereits eingewiesenen Nutzer")
		end		
		
		if tutorial["cursec"] == 127 then
			guiSetText(tutorial["textlabel"], "Du wirst jetzt in die Spielwelt zur"..uuml.."ckgebracht!")
			playSoundFrontEnd(15)		
		end
		
		if tutorial["cursec"] == 132 then
			destroyElement(tutorial["textlabel"])
			tutorialstarted = false
			server.endTutorial()
		end
		
		
	end
end
addEventHandler("onClientGeneralTimer", getRootElement(), tutorialTimer)
