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



function initalizeMailChange(toggle)
	initalizeMailChangeGUI()
	if toggle == true then
		guiSetVisible(g_mailchange["window"], true)
		showCursor(true)
		addEventHandler("onClientGUIClick", g_mailchange["window"], MailChangeHandler)
	else 
		guiSetVisible(g_mailchange["window"], false)
		showCursor(false)
		removeEventHandler("onClientGUIClick", g_mailchange["window"], MailChangeHandler)
	end
end

function MailChangeHandler(button)
	if button == "left" then
		--Button Abbrechen
		if source == g_mailchange["button_abbrechen"] then
			initalizeMailChange(false)
			return
		end
		--Button Ok
		if source == g_mailchange["button_ok"] then
			if guiGetText(g_mailchange["edit_mail1"]) == guiGetText(g_mailchange["edit_mail2"]) then
				if string.len(guiGetText(g_mailchange["edit_mail2"])) > 0 and string.len(guiGetText(g_mailchange["edit_mail2"])) < 4 then
					outputChatBox("Die angegebene Mail Addresse ist zu kurz", 255, 0, 0)
					return false
				else
					local splitemailstart, splitemailend = string.find(guiGetText(g_mailchange["edit_mail2"]), "@")
					if not splitemailstart then 
						outputChatBox("Dies ist keine gueltige Email")
						return false
					else
						--server.changePlayerStatMail(guiGetText(g_mailchange["edit_mail2"]))
						rpcCallServerFunction("changePlayerStatMail", guiGetText(g_mailchange["edit_mail2"]))
						initalizeMailChange(false)
					end
				end
			else
				outputChatBox("Die angegeben Mail-Addressen stimmen nicht "..uuml.."berein!", 255, 0, 0)
				return false
			end
		end
	end
end
