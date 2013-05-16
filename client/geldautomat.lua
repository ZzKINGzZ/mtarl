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



function showGeldautomatMenu(kontomoney)
	initalizeGeldautomatGUI()
	guiSetText(g_Moneymenu["Kontostand"], tostring(kontomoney).."$")
	guiSetText(g_Moneymenu["KontostandSend"], tostring(kontomoney).."$")
	guiSetText(g_Moneymenu["Edit"], "")
	guiSetText(g_Moneymenu["kontoEdit"], "")
	guiSetText(g_Moneymenu["moneyEdit"], "")
	guiSetText(g_Moneymenu["Error"], "Fehler: Ungültiger Betrag!")
	guiSetText(g_Moneymenu["ErrorSend"], "Fehler: Ungültiger Betrag!")
	guiSetVisible(g_Moneymenu["Window"], true)
	showCursor(true)
	addEventHandler("onClientGUIClick", g_Moneymenu["Window"], EinUndAuszahlen)
	toggleAllControls(false, true, false)
end

function hideGeldautomatMenu()
	guiSetVisible(g_Moneymenu["Window"], false)
	showCursor(false)
	removeEventHandler("onClientGUIClick", g_Moneymenu["Window"], EinUndAuszahlen)
	toggleAllControls(true, true, false)
end

function EinUndAuszahlen(button)
	if button == "left" then
		if source == g_Moneymenu["Einzahlen"] then
			guiSetVisible(g_Moneymenu["Error"], false)
			if tonumber(guiGetText(g_Moneymenu["Edit"])) then
				if tonumber(guiGetText(g_Moneymenu["Edit"])) > 0 then
					--server.changeKontoMoney("Einzahlen", tonumber(guiGetText(g_Moneymenu["Edit"])))
					rpcCallServerFunction("changeKontoMoney", "Einzahlen", tonumber(guiGetText(g_Moneymenu["Edit"])))
				else
					guiSetVisible(g_Moneymenu["Error"], true)
				end	
			end	
		end
		if source == g_Moneymenu["Auszahlen"] then
			guiSetVisible(g_Moneymenu["Error"], false)
			if tonumber(guiGetText(g_Moneymenu["Edit"])) then
				if tonumber(guiGetText(g_Moneymenu["Edit"])) > 0 then
					--server.changeKontoMoney("Auszahlen", tonumber(guiGetText(g_Moneymenu["Edit"])))
					rpcCallServerFunction("changeKontoMoney", "Auszahlen", tonumber(guiGetText(g_Moneymenu["Edit"])))
				else
					guiSetVisible(g_Moneymenu["Error"], true)
				end
			end	
		end
		if source == g_Moneymenu["send"] then
			guiSetVisible(g_Moneymenu["ErrorSend"], false)
			if tonumber(guiGetText(g_Moneymenu["moneyEdit"])) then
				if tonumber(guiGetText(g_Moneymenu["moneyEdit"])) > 0 then
					--server.transferMoney(guiGetText(g_Moneymenu["kontoEdit"]), tonumber(guiGetText(g_Moneymenu["moneyEdit"])))
					rpcCallServerFunction("transferMoney", guiGetText(g_Moneymenu["kontoEdit"]), tonumber(guiGetText(g_Moneymenu["moneyEdit"])))
				else
					guiSetVisible(g_Moneymenu["ErrorSend"], true)
				end	
			end
		end
		if source == g_Moneymenu["Abort"] then
			guiSetVisible(g_Moneymenu["Error"], false)
			guiSetVisible(g_Moneymenu["ErrorSend"], false)
			guiSetText(g_Moneymenu["Edit"], "")
			hideGeldautomatMenu()
		end
	end	
end

function setGeldautomatErrorText(text, arg)
	if arg then
		guiSetText(g_Moneymenu["ErrorSend"], tostring(text))
		guiSetVisible(g_Moneymenu["ErrorSend"], true)
	else
		guiSetText(g_Moneymenu["Error"], tostring(text))
		guiSetVisible(g_Moneymenu["Error"], true)
	end
end
