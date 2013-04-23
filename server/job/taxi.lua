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



local function initTaxiCrew()
	addJob(7, "Taxi", false, 254, 223, 86, true)
	addJobLocation(7, 1, 1565.7724609375, -2335.9077148438, 13.546875, 0, 0)
	addJobLocation(7, 2, -1981.5589599609, 134.85935974121, 27.6875, 0, 0)
	addJobLocation(7, 3, 1713.2829589844, 1303.3278808594, 10.827939987183, 0, 0)
	
	addJobRank(7, 1, "Taxi-Fahrer", 0.16, false) --150$ pro 15 Min
	addJobRank(7, 2, "Taxi-Chef", 0.19, true) --170$ pro 15 Min -- Chef
	
	setJobExtraMoneyLimit(7, 1000)
	
	registerJobFunction(7, "onPlayerEnterJob", taxiCrewEnterJob)
	registerJobFunction(7, "onPlayerLeaveJob", taxiCrewLeaveJob)
end
addEventHandler("onResourceStart", getResourceRootElement(), initTaxiCrew)

function taxiCrewEnterJob(playerSource, staticJobID, locationID, playerJobRank)
	if playerJobRank == 1 then
		setElementModel(playerSource, 166)
	elseif playerJobRank == 2 then
		setElementModel(playerSource, 163)
	end
	
	bindKey(playerSource, "num_1", "down", taxiActivateTaxoMeter)
	bindKey(playerSource, "j", "down", turnJobChat)
end

function taxiCrewLeaveJob(playerSource, staticJobID, locationID, playerJobRank)
	setElementModel(playerSource, g_playerstat[playerSource]["Skin"])
	
	unbindKey(playerSource, "num_1", "down", taxiActivateTaxoMeter)
	unbindKey(playerSource, "j", "down", turnJobChat)
end

function taxiActivateTaxoMeter(playerSource, commandName)
	if isPlayerActiveInJob(playerSource, 7) then
		local vehicle = getPedOccupiedVehicle(playerSource)
		if vehicle then
			if g_vehiclestat[vehicle]["Specialcar"] == "Taxi" then
				local seat = getPedOccupiedVehicleSeat(playerSource)
				if seat == 0 then
					if not g_playerstat[playerSource]["Jobvar"]["Taxo"] then
						rpcCallClientFunction(playerSource, "taxiToggleTaxometer", true)
						g_playerstat[playerSource]["Jobvar"]["Taxo"] = true
					else
						rpcCallClientFunction(playerSource, "taxiToggleTaxometer", false)
						g_playerstat[playerSource]["Jobvar"]["Taxo"] = nil
					end
				else
					sendPlayerInfo(playerSource, "Du bist nicht der Fahrer!", true)
					return false
				end
			else
				sendPlayerInfo(playerSource, "Dies ist kein Fahrzeug des Taxidienstes!", true)
				return false
			end
		else
			sendPlayerInfo(playerSource, "Du musst in einem Fahrzeug sitzen!", true)
			return false
		end
	end
end
addCommandHandler("taxo", taxiActivateTaxoMeter)
