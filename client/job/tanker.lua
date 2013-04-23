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



function startTankauswahl(toggle)
	initalizeTankerGUI()
	if toggle == true then
		guiSetVisible(g_tankergui["window"], true)
		showCursor(true)
		addEventHandler("onClientGUIClick", g_tankergui["window"], clickTankerauswahl)
		toggleAllControls(false, true, false)		
	else 
		guiSetVisible(g_tankergui["window"], false)
		showCursor(false)
		removeEventHandler("onClientGUIClick", g_tankergui["window"], clickTankerauswahl)
		toggleAllControls(true, true, false)
	end
end

function clickTankerauswahl(button)
	if button == "left" then
		--Benzin
		if source == g_tankergui["benzin"] then
			rpcCallServerFunction("tankerFillTrailer", "benzin")
		end		
		--Diesel
		if source == g_tankergui["diesel"] then
			rpcCallServerFunction("tankerFillTrailer", "diesel")
		end
		--Super
		if source == g_tankergui["super"] then
			rpcCallServerFunction("tankerFillTrailer", "super")
		end		
		--Super Plus
		if source == g_tankergui["superP"] then

			rpcCallServerFunction("tankerFillTrailer", "superP")
		end		
		--Kerosin
		if source == g_tankergui["keroisen"] then
			rpcCallServerFunction("tankerFillTrailer", "kerosin")
		end		
		--Bootskerosin
		if source == g_tankergui["boot"] then
			rpcCallServerFunction("tankerFillTrailer", "boot")
		end		
		--Abbrechen
		if source == g_tankergui["abbrechen"] then
			startTankauswahl(false)
		end
		startTankauswahl(false)
	end
end
