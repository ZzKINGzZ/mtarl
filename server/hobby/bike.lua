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



local bikemarker = {}

function initalizeBikeRental()
	bikemarker[1] = createMarker(2235.5419921875, -1147.8115234375, 24.796875, "cylinder", 1.5, 100, 100, 150, 155, getRootElement()) --LS
	bikemarker[2] = createMarker(1934.3984375, 1365.357421875, 8.2578125, "cylinder", 1.5, 10, 100, 150, 155, getRootElement()) --LV
	bikemarker[3] = createMarker(-2414.346679, 349.380859, 34.171875, "cylinder", 1.5, 100, 100, 150, 155, getRootElement()) --SF
end
addEventHandler("onResourceStart", getResourceRootElement(), initalizeBikeRental)


function onBikeRentalMarkerHit(playerSource)
	if getElementType(playerSource) == "player" then
		if source == bikemarker[1] or source == bikemarker[2] or source == bikemarker[3] then
			if g_playerstat[playerSource]["rentalBikeHit"] then
				if g_playerstat[playerSource]["rentalBike"] then
					deleteTempVehicleMTARL(g_playerstat[playerSource]["rentalBike"] )
				end
				local x, y, z = getElementPosition(playerSource)
				local rz = getPedRotation(playerSource)
				local vehicle = createTempVehicleMTARL(510, x, y + 3, z + 1, 0, 0, rz)
				g_playerstat[playerSource]["rentalBike"] = vehicle
				warpPedIntoVehicle(playerSource, vehicle, 0)
				sendPlayerInfo(playerSource, "Willkommen im Fahrrad-Verleih! Das Fahrad hat dich50$ gekostet es steht Ihnen nun 1 Tag zu verfügung.", true)
				giveStaatsKasse(50)
				takePlayerMoney(playerSource, 50)
				g_playerstat[playerSource]["rentalBikeHit"] = nil
			else
				sendPlayerInfo(playerSource, "Willkommen im Fahrrad-Verleih! Das Fahrad wird dich 50$ kosten, es wird Ihnen 1 Tag zu verfügung stehen.\nGehe Sie erneut in den Marker um das Fahrrad zu holen!", true)
				g_playerstat[playerSource]["rentalBikeHit"] = 1
			end
		end
	end
end
addEventHandler("onMarkerHit", getRootElement(), onBikeRentalMarkerHit)

function deleteBike(playerSource)
	if g_playerstat[playerSource]["rentalBike"] then
		deleteTempVehicleMTARL(g_playerstat[playerSource]["rentalBike"] )
	end
end
addEventHandler("onPlayerLogoutMTARL", getResourceRootElement(), deleteBike)
