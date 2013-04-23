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



local job = "none"
local typ = "none"
local send = 0

function showWritePost(toggle)
	initalizePostWriteGUI()
	if toggle == true then
		showCursor(true)
		guiSetVisible(g_postwritegui["window"], true)
		addEventHandler("onClientGUIClick", g_postwritegui["window"], doPostWriteInput)
		addEventHandler("onClientGUIComboBoxAccepted", g_postwritegui["typ"], onPostComboBoxAcceptedTyp)
		addEventHandler("onClientGUIComboBoxAccepted", g_postwritegui["job"], onPostComboBoxAcceptedJob)
		guiSetInputEnabled(true)
	elseif toggle == false then
		showCursor(false)
		guiSetVisible(g_postwritegui["window"], false)	
		removeEventHandler("onClientGUIClick", g_postwritegui["window"], doPostWriteInput)
		removeEventHandler("onClientGUIComboBoxAccepted", g_postwritegui["typ"], onPostComboBoxAcceptedTyp)
		removeEventHandler("onClientGUIComboBoxAccepted", g_postwritegui["job"], onPostComboBoxAcceptedJob)
		guiSetInputEnabled(false)
		guiSetText(g_postwritegui["privat"], "")
		guiSetText(g_postwritegui["title"], "")
		guiSetText(g_postwritegui["nachricht"], "")
		guiComboBoxSetSelected(g_postwritegui["typ"], -1)
		guiComboBoxSetSelected(g_postwritegui["job"], -1)
		guiSetVisible(g_postwritegui["privat"], false)
		guiSetVisible(g_postwritegui["job"], false)
		guiSetEnabled(g_postwritegui["nachricht"], false)
		guiSetInputEnabled(false)
		send = 0
	end
end

function doPostWriteInput(button, state, x, y)
	if button == "left" then
		if source == g_postwritegui["abort"] then
			showWritePost(false)
		end
		if source == g_postwritegui["send"] then
			if guiGetText(g_postwritegui["title"]):len() ~= 0 or guiGetText(g_postwritegui["nachricht"]):len() ~= 0 then
				if typ ~= "none" then
					if send == 0 then
						if typ == "normal" then
							if guiGetText(g_postwritegui["privat"]):len() ~= 0 then
								send = 1
								rpcCallServerFunction("writePostClient", guiGetText(g_postwritegui["privat"]), guiGetText(g_postwritegui["title"]), guiGetText(g_postwritegui["nachricht"]))
								showWritePost(false)
							end
						elseif typ == "bewerbung" then
							if job ~= "none" then
								send = 1
								rpcCallServerFunction("writePostBewerbung", job, guiGetText(g_postwritegui["title"]), guiGetText(g_postwritegui["nachricht"]))
								showWritePost(false)
							end
						end
					end
				end
			end
		end
	end
end

function onPostComboBoxAcceptedTyp()
	local seltyp = guiComboBoxGetSelected(g_postwritegui["typ"])
	if seltyp == -1 then
		guiSetVisible(g_postwritegui["privat"], false)
		guiSetVisible(g_postwritegui["job"], false)
		guiSetEnabled(g_postwritegui["nachricht"], false)
		typ = "none"
	elseif seltyp == 0 then
		guiSetVisible(g_postwritegui["privat"], true)
		guiSetVisible(g_postwritegui["job"], false)
		guiSetEnabled(g_postwritegui["nachricht"], true)
		typ = "normal"
	elseif seltyp == 1 then
		guiSetVisible(g_postwritegui["privat"], false)
		guiSetVisible(g_postwritegui["job"], true)
		typ = "bewerbung"
	end
end

function onPostComboBoxAcceptedJob()
	if typ == "bewerbung" then
		local seljob = guiComboBoxGetSelected(g_postwritegui["job"])
		if seljob ~= -1 then
			job = guiComboBoxGetItemText (g_postwritegui["job"], seljob)
			guiSetEnabled(g_postwritegui["nachricht"], true)
		else
			guiSetEnabled(g_postwritegui["nachricht"], false)
		end
	end	
end

function postFillJobList(job)
	guiComboBoxAddItem(g_postwritegui["job"], job)
end
