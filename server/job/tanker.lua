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



rpcRegisterGlobalFunction("tankerFillTrailer")

local function initTankerCrew()
	addJob(6, "Tanker", false, 105, 105, 105, true)
	addJobLocation(6, 1, 282.3571472168, 1420.0771484375, 10.538059234619, 0, 0)
	
	addJobRank(6, 1, "Tanklasterfahrer", 0.17, false) --153$ pro 15 Min
	addJobRank(6, 2, "Tanker-Chef", 0.20, true) --180$ pro 15 Min -- Chef
	
	local tankerCol = createColSphere(277.47442626953, 1391.1529541016, 10.585936546326, 5)
	addEventHandler("onColShapeHit", tankerCol, tankerColShapeHit)
	
	setJobExtraMoneyLimit(6, 1000)
	
	registerJobFunction(6, "onPlayerEnterJob", tankerCrewEnterJob)
	registerJobFunction(6, "onPlayerLeaveJob", tankerCrewLeaveJob)
end
addEventHandler("onResourceStart", getResourceRootElement(), initTankerCrew)

function tankerCrewEnterJob(playerSource, staticJobID, locationID, playerJobRank)
	if playerJobRank == 1 then
		setElementModel(playerSource, 7)
	elseif playerJobRank == 2 then
		setElementModel(playerSource, 34)
	end
	bindKey(playerSource, "num_1", "down", tankerFillGasStation)
	bindKey(playerSource, "num_2", "down", detachTrailer)
	bindKey(playerSource, "j", "down", turnJobChat)
end

function tankerCrewLeaveJob(playerSource, staticJobID, locationID, playerJobRank)
	setElementModel(playerSource, g_playerstat[playerSource]["Skin"])
	unbindKey(playerSource, "num_1", "down", tankerFillGasStation)
	unbindKey(playerSource, "num_2", "down", detachTrailer)
	unbindKey(playerSource, "j", "down", turnJobChat)
end

function tankerColShapeHit(player, dimension)
	if getElementType(player) == "player" then
		if isPlayerActiveInJob(player, 6) then
			local vehicle = getPedOccupiedVehicle(player)
			if vehicle then
				if getPedOccupiedVehicleSeat(player) == 0 then
					local trailer = getVehicleTowedByVehicle(vehicle)
					if trailer then
						if getElementModel(trailer) == 584 then
							if g_vehiclestat[trailer]["Specialcar"] == "Tanker" then
								rpcCallClientFunction(player, "startTankauswahl", true)
								setElementVelocity(vehicle, 0, 0, 0)
							else
								sendPlayerInfo(player, "Der Anhänger hat nicht das richtige Prop.", true)
							end
						end
					end
				end
			end
		end
	end
end

function tankerFillTrailer(fuel)
	local vehicle = getPedOccupiedVehicle(client)
	if vehicle then
		local trailer = getVehicleTowedByVehicle(vehicle)
		if trailer then
			if getElementModel(trailer) == 584 then
				if g_vehiclestat[trailer]["Specialcar"] == "Tanker" then
					if fuel == "benzin" then
						outputChatBox(g_colors["yellow"].."Dein Tanker wurde mit Benzin beladen", client, 0, 0, 0, true)
						g_vehiclestat[trailer]["getankt"] = 250
						g_vehiclestat[trailer]["tankart"] = fuel
					elseif fuel == "diesel" then
						outputChatBox(g_colors["yellow"].."Dein Tanker wurde mit Diesel beladen", client, 0, 0, 0, true)
						g_vehiclestat[trailer]["getankt"] = 250
						g_vehiclestat[trailer]["tankart"] = fuel
					elseif fuel == "super" then
						outputChatBox(g_colors["yellow"].."Dein Tanker wurde mit Super beladen", client, 0, 0, 0, true)
						g_vehiclestat[trailer]["getankt"] = 250
						g_vehiclestat[trailer]["tankart"] = fuel
					elseif fuel == "superP" then
						outputChatBox(g_colors["yellow"].."Dein Tanker wurde mit Super Plus beladen", client, 0, 0, 0, true)
						g_vehiclestat[trailer]["getankt"] = 250
						g_vehiclestat[trailer]["tankart"] = fuel	
					elseif fuel == "kerosin" then
						outputChatBox(g_colors["yellow"].."Dein Tanker wurde mit Kerosin beladen", client, 0, 0, 0, true)
						g_vehiclestat[trailer]["getankt"] = 250
						g_vehiclestat[trailer]["tankart"] = fuel	
					elseif fuel == "boot" then
						outputChatBox(g_colors["yellow"].."Dein Tanker wurde mit Bootskerosin beladen", client, 0, 0, 0, true)
						g_vehiclestat[trailer]["getankt"] = 250
						g_vehiclestat[trailer]["tankart"] = fuel
					end
				end
			end
		end
	end
end

function tankerSetVehicleVars()
	if g_vehiclestat[source]["Specialcar"] then
		if g_vehiclestat[source]["Specialcar"] == "Tanker" then
			if getElementModel(source) == 584 then
				g_vehiclestat[source]["getankt"] = -1
				g_vehiclestat[source]["tankart"] = "none"
			end
		end
	end
end
addEventHandler("onVehicleSetVarsMTARL", getRootElement(), tankerSetVehicleVars)

function tankerFillGasStation(playerSource, commandName)
	if isPlayerActiveInJob(playerSource, 6) then
		local vehicle = getPedOccupiedVehicle(playerSource)
		if not vehicle then
			local vehicle, dist = closestVehicle(playerSource)
			if vehicle then
				if dist < 15 then
					if getElementModel(vehicle) == 584 then
						if g_vehiclestat[vehicle]["Specialcar"] == "Tanker" then
							local tankstellen = getElementsByType("tankstelle")
							for _, tankstelle in ipairs(tankstellen) do
								if isElementWithinColShape(playerSource, getElementData(tankstelle, "colshape")) then
									local tankart = g_vehiclestat[vehicle]["tankart"]
									
									if g_vehiclestat[vehicle]["getankt"] < 1 then
										g_vehiclestat[vehicle]["getankt"] = 0
										sendPlayerInfo(playerSource, "Dein Trailer ist leer, kehre zum Stützpunkt zurück und fülle ihne mit neuem Treibstoff.", true)
										return false
									end
									if getElementData(tankstelle, tankart) < 500 then
										local needed = 500 - getElementData(tankstelle, tankart)
										if g_vehiclestat[vehicle]["getankt"] > needed then
											--Mehr im Hänger als gebraucht
											g_vehiclestat[vehicle]["getankt"] = g_vehiclestat[vehicle]["getankt"] - needed
											setElementData(tankstelle, tankart, 500)
											
											local money = math.floor(needed * 0.50)
											
											sendPlayerInfo(playerSource, "Der Treibstoff der Tankstelle wurde komplett aufgefüllt. Belohnung: "..tostring(money).."$", true)
											
											giveStaatsKasse(-money)
											addPlayerJobExtraMoney(playerSource, money)
											
											recalcTankstellenPreis(tankstelle, tankart)
											
										elseif g_vehiclestat[vehicle]["getankt"] < needed then
											--Mehr gebraucht als im Hänger
											setElementData(tankstelle, tankart, getElementData(tankstelle, tankart) + g_vehiclestat[vehicle]["getankt"])
											g_vehiclestat[vehicle]["getankt"] = 0
											
											local money = math.floor(needed * 0.50)
											
											sendPlayerInfo(playerSource, "Der Treibstoff der Tankstelle wurde teilweise aufgefüllt. Belohnung: "..tostring(money).."$", true)
											
											giveStaatsKasse(-money)
											addPlayerJobExtraMoney(playerSource, money)
											
											recalcTankstellenPreis(tankstelle, tankart)
										end
									else
										sendPlayerInfo(playerSource, "Die Tankstelle verfügt über genug Treibstoff.", true)
									end
									
									break
								end
							end
						end
					end
				end
			end
		else
			sendPlayerInfo(playerSource, "Du musst außerhalb deines Tankers stehen, wenn du betanken möchtest.", true)
		end
	end
end
addCommandHandler("betanken", tankerFillGasStation)
