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



local handystate --1= meineNummer 2=Nummer 3=Anruf
local toggle = false

function toggleHandy()
	if toggle == true then
		hideHandy()
		toggle = false
	else
		showHandy()
		toggle = true
	end
end

function setPhoneNumber(phonenumber)
	if phonenumber then
		g_playerstat["Number"] = phonenumber
		guiSetText(g_Handymenu["Display"], "Meine Handynummer: 
"..g_playerstat["Number"])
		handystate = 1
	else
		guiSetText(g_Handymenu["Display"], "Meine Handynummer: 
"..g_playerstat["Number"])
		handystate = 1
	end
end

function showHandy()
	if not guiGetVisible(g_Handymenu["Window"]) then
		guiSetVisible(g_Handymenu["Window"], true)
		addEventHandler("onClientGUIClick", g_Handymenu["Window"], setPhoneNumberToRing)
		showCursor(true)
		setCallCancel(false)
		activateHandyTasten(true)
	end
end

function hideHandy()
	if guiGetVisible(g_Handymenu["Window"]) then
		guiSetVisible(g_Handymenu["Window"], false)
		removeEventHandler("onClientGUIClick", g_Handymenu["Window"], setPhoneNumberToRing)
		showCursor(false)
	end
end

function setHandyText(text, standard)
	if standard == false then
		guiSetText(g_Handymenu["Display"], tostring(text))
	elseif standard == true then
		guiSetText(g_Handymenu["Display"], "Meine Handynummer: 
"..g_playerstat["Number"])
	end
end

function setPhoneNumberToRing(button)
	if button == "left" then
		if source == g_Handymenu["TasteS"] then
			if handystate == 1 then
				guiSetText(g_Handymenu["Display"], "")
			end
			local text = (guiGetText(g_Handymenu["Display"]).."*"):gsub('
', '')
			guiSetText(g_Handymenu["Display"], text)			
		elseif source == g_Handymenu["TasteR"] then
			if handystate == 1 then
				guiSetText(g_Handymenu["Display"], "")
			end
			local text = (guiGetText(g_Handymenu["Display"]).."#"):gsub('
', '')
			guiSetText(g_Handymenu["Display"], text)			
		elseif source == g_Handymenu["Anruf"] then
			if handystate == 2 then
				activateHandyTasten(false)			
				--server.callNumber((guiGetText(g_Handymenu["Display"])):gsub('
', ''), "old")
				rpcCallServerFunction("callNumber", (guiGetText(g_Handymenu["Display"])):gsub('
', ''), "old")
				setCallCancel(true)
				handystate = 3
			end
		elseif source == g_Handymenu["Auflegen"] then
			if handystate == 3 then
				activateHandyTasten(true)
				setCallCancel(false)
				--server.endCall()
				rpcCallServerFunction("endCall")
				setPhoneNumber()
			end
		else
			local number = tonumber(guiGetText(source))
			if number then
				if number >= 0 and number <= 10 then
					if handystate == 1 then
						guiSetText(g_Handymenu["Display"], "")
					end
					local text = guiGetText(g_Handymenu["Display"])
					guiSetText(g_Handymenu["Display"], text..number)
					text = (guiGetText(g_Handymenu["Display"])):gsub('
', '')
					guiSetText(g_Handymenu["Display"], text)
					handystate = 2
				end
			end
		end
	end
end

function activateHandyTasten(bool)
	guiSetEnabled(g_Handymenu["Taste1"], bool)
	guiSetEnabled(g_Handymenu["Taste2"], bool)
	guiSetEnabled(g_Handymenu["Taste3"], bool)
	guiSetEnabled(g_Handymenu["Taste4"], bool)
	guiSetEnabled(g_Handymenu["Taste5"], bool)
	guiSetEnabled(g_Handymenu["Taste6"], bool)
	guiSetEnabled(g_Handymenu["Taste7"], bool)
	guiSetEnabled(g_Handymenu["Taste8"], bool)
	guiSetEnabled(g_Handymenu["Taste9"], bool)
	guiSetEnabled(g_Handymenu["Taste0"], bool)
	guiSetEnabled(g_Handymenu["TasteR"], bool)
	guiSetEnabled(g_Handymenu["TasteS"], bool)
	guiSetEnabled(g_Handymenu["Taste0"], bool)
	guiSetEnabled(g_Handymenu["Anruf"], bool)
end

function setCallCancel(bool)
	guiSetEnabled(g_Handymenu["Auflegen"], bool)
end
