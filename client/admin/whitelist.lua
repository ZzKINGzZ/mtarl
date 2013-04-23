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



function adminWlFillList(playerName, playerPin)	
	row = guiGridListAddRow(g_admingui["tabWlList"])
	guiGridListSetItemText(g_admingui["tabWlList"], row, g_admingui["tabWlListColName"], playerName, false, false )
	guiGridListSetItemText(g_admingui["tabWlList"], row, g_admingui["tabWlListColPin"], playerPin, false, false )
end

function adminWlClickButton(button, state)
	if source == g_admingui["tabWlButtonDel"] then
		local player = guiGridListGetSelectedItem(g_admingui["tabWlList"])
		if player then
			local playerName = guiGridListGetItemText(g_admingui["tabWlList"], player, g_admingui["tabWlListColName"])
			if playerName then
				if playerName ~= "" and playerName ~= " " then
					rpcCallServerFunction("adminWlFunction", "Remove", playerName)
					guiGridListClear(g_admingui["tabWlList"])
					rpcCallServerFunction("adminGetWhitelist")
				end
			end
		end
	elseif source == g_admingui["tabWlButtonAdd"] then
		local playerName = guiGetText(g_admingui["tabWlAddEdit"])
		if playerName ~= "" or playerName ~= " " then
			rpcCallServerFunction("adminWlFunction", "Add", playerName)
			guiGridListClear(g_admingui["tabWlList"])
			rpcCallServerFunction("adminGetWhitelist")
		end
	end
end

function adminWLSetPin(pin)
	guiSetText(g_admingui["tabWlPinEdit"], "PIN: "..tostring(pin))
end
