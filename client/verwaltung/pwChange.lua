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



function initalizePWChange(toggle)
	initalizePWchangeGUI()
	if toggle == true then
		guiSetVisible(g_pwchange["window"], true)
		showCursor(true)
		addEventHandler("onClientGUIClick", g_pwchange["window"], PWchangeHandler)
	else 
		guiSetVisible(g_pwchange["window"], false)
		showCursor(false)
		removeEventHandler("onClientGUIClick", g_pwchange["window"], PWchangeHandler)
	end
end

function PWchangeHandler(button)
	if button == "left" then
		--Button Abbrechen
		if source == g_pwchange["button_abbrechen"] then
			initalizePWChange(false)
			return
		end
		--Button Ok
		if source == g_pwchange["button_ok"] then
			if guiGetText(g_pwchange["edit_pw1"]) == guiGetText(g_pwchange["edit_pw2"]) then
				if string.len(guiGetText(g_pwchange["edit_pw2"])) > 0 and string.len(guiGetText(g_pwchange["edit_pw2"])) < 3 then
					outputChatBox("Das angegebene neue Passwort ist zu kurz", 255, 0, 0)
					return false
				else
					--server.changePlayerStatPW(guiGetText(g_pwchange["edit_pw2"]))
					rpcCallServerFunction("changePlayerStatPW", guiGetText(g_pwchange["edit_pw2"]))
					initalizePWChange(false)
				end
			else
				outputChatBox("Die angegeben Passw"..ouml.."rter stimmen nicht "..uuml.."berein!", 255, 0, 0)
				return false
			end
		end
	end
end
