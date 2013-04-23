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



function initInteriors()
	outputDebug("interiors.lua start...")
	
	local interior = mysql_query(g_mysql["connection"], "SELECT * FROM `interiors`")
	if interior then
		while true do
			local row = mysql_fetch_assoc(interior)
			if not row then break end
			
			local interior = createElement("interior")
			setElementPosition(interior, tonumber(row["x"]), tonumber(row["y"]), tonumber(row["z"]))
			
			setElementData(interior, "id", tonumber(row["id"]))
			setElementData(interior, "intX", tonumber(row["intx"]))
			setElementData(interior, "intY", tonumber(row["inty"]))
			setElementData(interior, "intZ", tonumber(row["intz"]))
			setElementData(interior, "dimension", tonumber(row["dimension"]))
			setElementData(interior, "interior", tonumber(row["interior"]))
			setElementData(interior, "rotation", tonumber(row["rotation"]))
			setElementData(interior, "rotationOutside", tonumber(row["rotationOutside"]))
			
			local Z = tonumber(row["z"]) + 2
			local marker = createMarker(tonumber(row["x"]), tonumber(row["y"]), Z, "arrow", 1.5, 255, 0, 0, 155, getRootElement())
			setElementData(interior, "markerOutside", marker)
			setElementData(marker, "interior", interior)
			addEventHandler("onMarkerHit", marker, onOutsideInteriorMarkerHit)
			
			local Z = tonumber(row["intz"]) + 2
			local marker = createMarker(tonumber(row["intx"]), tonumber(row["inty"]), Z, "arrow", 1.5, 255, 0, 0, 155, getRootElement())
			setElementInterior(marker, tonumber(row["interior"]))
			setElementData(interior, "markerInside", marker)
			setElementData(marker, "interior", interior)
			setElementDimension(marker, tonumber(row["dimension"]))
			addEventHandler("onMarkerHit", marker, onInsideInteriorMarkerHit)
		end
	end
end
addEventHandler('onResourceStart', getResourceRootElement(), initInteriors)

function onOutsideInteriorMarkerHit(player, dimension)
	if getElementType(player) == "player" then
		if not getPedOccupiedVehicle(player) then
			if getElementType(player) == "player" then
				local interior = getElementData(source, "interior")
				if interior then
					local r = getElementData(interior, "rotation")
					local x = getElementData(interior, "intX") + 1.5 * math.cos(math.rad(r + 90))
					local y = getElementData(interior, "intY") + 1.5 * math.sin(math.rad(r + 90))
					local z = getElementData(interior, "intZ")
					
					local vx, vy, vz = getElementVelocity(player)
					
					setElementInterior(player, getElementData(interior, "interior"))
					setElementPosition(player, x, y, z + 1, false)
					setPedRotation(player, r)
					setElementVelocity(player, vx, vy, vz)
					setElementDimension(player, getElementData(interior, "dimension"))
				end
			end
		end
	end	
end

function onInsideInteriorMarkerHit(player, dimension)
	if getElementType(player) == "player" then
		if not getPedOccupiedVehicle(player) then
			if getElementType(player) == "player" and dimension then
				local interior = getElementData(source, "interior")
				if interior then
					local r = getElementData(interior, "rotationOutside")
					local oldX, oldY, z = getElementPosition(interior)
					local x = oldX + 1.5 * math.cos(math.rad(r + 90))
					local y = oldY + 1.5 * math.sin(math.rad(r + 90))
					
					local vx, vy, vz = getElementVelocity(player)
					
					setElementInterior(player, getElementData(interior, "interior"))
					setElementPosition(player, x, y, z + 1, false)
					setPedRotation(player, r)
					setElementInterior(player, 0)
					setElementDimension(player, 0)
					setElementVelocity(player, vx, vy, vz)
				end
			end
		end	
	end
end
