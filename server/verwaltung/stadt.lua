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



rpcRegisterGlobalFunction("stadtVerwaltungsBeantragung")

local function stadtMakerHit(playerSource)
	if getElementType(playerSource) == "player" then
		if g_playerstat[playerSource] then
			CORE:getPlayer(playerSource):callClient("toggleStadtVerwaltungDokumente", true)
		end	
	end
end

local function onStadtVerwaltungInit()
	outputDebug("stadt.lua start...")
	
	local ped = createPed(57 ,358.939453125, 174.4296875, 1008.3893432617)
	setPedRotation(ped, 307.60266113281)
	setElementInterior(ped, 3)
	
	local marker = createMarker(361.59765625, 176.568359375, 1007.3828125, "cylinder", 1.5, 200, 255, 0, 190)
	addEventHandler("onMarkerHit", marker, stadtMakerHit)
	setElementInterior(marker, 3)	
end
addEventHandler('onResourceStart', getResourceRootElement(), onStadtVerwaltungInit)

local function onPlayerRegisterStadt(playerID)
	addPlayerItemMySQL(playerID, 2) --Aufenthaltsdokumente
end
addEventHandler("onPlayerRegisterMTARL", getRootElement(), onPlayerRegisterStadt)

function stadtVerwaltungsBeantragung(theDoc)
	--Aufenthaltsdokumente gegen Perso tauschen
	if theDoc == "Personalausweis" then
		local hasItem = hasPlayerItem(client, 1)
		if not hasItem then
			for dynamicID, item in pairs(getPlayerItems(client)) do
				if item["staticID"] == 2 then
					removePlayerItem(client, dynamicID)
					addPlayerItem(client, 1)
					
					takePlayerMoney(client, 50)
					giveStaatsKasse(50)
					
					--outputChatBox(g_colors["royalblue"].."Deine Aufenthaltsdokumente wurden gegen den Personalausweis getauscht!", client, 255, 255, 255, true)
					sendPlayerInfo(client, "Deine Aufenthaltsdokumente wurden gegen den Personalausweis getauscht.")
					break
				end
			end			
		else
			outputChatBox(g_colors["royalblue"].."Du besitzt bereits einen Personalausweis!", client, 255, 255, 255, true)
			return false
		end
		return true
	end
	
	--Arbeitserlaubnis ausstellen
	if theDoc == "Arbeitserlaubnis" then
		local hasItem = hasPlayerItem(client, 3)
		if not hasItem then
			local curDate = getRealTime()
			curDate.month = curDate.month + 1
			curDate.year = curDate.year + 1900
			local curData = curDate.monthday.."."..curDate.month.."."..curDate.year
			
			local dynamicID = addPlayerItem(client, 3)
			setItemData(client, dynamicID, "ausgestellt", tostring(curData))
			
			takePlayerMoney(client, 150)
			giveStaatsKasse(150)
			
			--outputChatBox(g_colors["royalblue"].."Deine Arbeitserlaubnis wurde ausgeteilt!", client, 255, 255, 255, true)
			sendPlayerInfo("Dir wurde eine Arbeitserlaubnis erteilt. Du kannst sie im Itemmen"..uuml.." finden")
			return true
		else
			outputChatBox(g_colors["royalblue"].."Du besitzt bereits eine Arbeitserlaubnis!", client, 255, 255, 255, true)
			return false
		end		
	end
	
end
