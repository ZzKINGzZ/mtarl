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



function adminPostClickButton(button, state)
	if source == g_admingui["tabPostButtonSend"] then
		local sender = guiGetText(g_admingui["tabPostSenderEdit"])
		local subject = guiGetText(g_admingui["tabPostSubjectEdit"])
		local content = guiGetText(g_admingui["tabPostContentEdit"])
		if sender ~= "" and sender ~= " " and subject ~= "" and subject ~= " " and conten ~= "" and conten ~= " " then
			rpcCallServerFunction("adminPostFunction", sender, subject, content)
			adminPostClear()
		else
			guiSetVisible(g_admingui["tabPostErrorLabel"], true)
			if sender ~= "" and sender ~= " " then
				guiSetText(g_admingui["tabPostErrorLabel"], "Fehler: Kein Absender!")
			elseif subject ~= "" and subject ~= " " then
				guiSetText(g_admingui["tabPostErrorLabel"], "Fehler: Kein Betreff!")
			elseif conten ~= "" and conten ~= " " then
				guiSetText(g_admingui["tabPostErrorLabel"], "Fehler: Kein Inhalt!")
			end
		end
	end
end
