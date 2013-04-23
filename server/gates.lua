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



local gate = {}
local gatesphere = {}

function placeGates()
	outputDebug("gates.lua start...")
	gate["LSPoliceDep1"] = createObject(985, 1591.7883300781, -1638.1378173828, 13.265258789063, 0, 0, 359.75)
	gate["LSPoliceDep2"] = createObject(986, 1583.8347167969, -1638.1378173828, 13.252639770508, 0, 0, 0)
	gatesphere["LSPoliceDep"] = createColSphere(1591.7883300781, -1638.1378173828, 13.265258789063, 10)
	
	gate["LSPoliceDepInside1"] = createObject(2930, 245.50022888184, 72.592063903809, 1005.0522460938, 0, 0, 90.23974609375)
	gatesphere["LSPoliceDepInside"] = createColSphere(245.50022888184, 72.592063903809, 1005.0522460938, 3)
	gate["LSPoliceDepInsideHelp"] = createObject(2930, 247.16172790527, 72.601654052734, 1005.0522460938, 0, 0, 90.23974609375)
	setElementInterior(gate["LSPoliceDepInside1"], 6)
	setElementInterior(gate["LSPoliceDepInsideHelp"], 6)
	
	gate["LVPoliceDep1"] = createObject(968, 2238.0720214844, 2450.4855957031, 10.8381690979, 0, 269.28051757813, 268.53088378906)
	gatesphere["LVPoliceDep1"] = createColSphere(2238.2165527344, 2450.4982910156, 10.81316947937, 10)
	
	gate["LVPoliceDep2"] = createObject(971, 2335.0874023438, 2443.3933105469, 8.168664932251, 0, 0, 60)
	gatesphere["LVPoliceDep2"] = createColSphere(2335.0874023438, 2443.3933105469, 8.168664932251, 10)	
	
	gate["SFPoliceDep"] = createObject(10184, -1631.6613769531, 688.40826416016, 8.7092628479004, 0, 0, 270.17565917969)
	gatesphere["SFPoliceDep"] = createColSphere(-1636.1655273438, 688.59454345703, 7.9375, 10)

	gate["LVTanker"] = createObject(976, 288.18957519531, 1415.4749755859, 9.4003324508667, 0, 0, 270.67565917969)
	gatesphere["LVTanker"] = createColSphere(288.18957519531, 1415.4749755859, 9.4003324508667, 10)
	--GateHelp
	createObject ( 974, 288.28433227539, 1403.4454345703, 10.689968109131, 0, 0, 270.67565917969 )
	createObject ( 974, 288.12738037109, 1418.9757080078, 10.689968109131, 0, 0, 270.67565917969 )
	
	gate["LSFeuer"] = createObject(975, 1488.1005859375, -2184.724609375, 14.413709640503, 0, 0, 181.35131835938)
	gatesphere["LSFeuer"] = createColSphere(1488.1005859375, -2184.724609375, 14.413709640503, 10)
	
	gate["LSADAC"] = createObject(975, 1811.451171875, -1890.08984375, 14.13561630249, 0, 0, 270.67565917969)
	gatesphere["LSADAC"] = createColSphere(1811.451171875, -1890.08984375, 14.13561630249, 10)
	
	gatesphere["SFADAC"] = createColSphere(-2038.4052734375, 178.9794921875, 28.8359375, 7)
	
	gate["LVADAC"] = createObject(975, 1673.1524658203, 2204.9174804688, 11.495002746582, 0, 0, 179.25048828125)
	gatesphere["LVADAC"] = createColSphere(1673.1524658203, 2204.9174804688, 11.495002746582, 10)
	--GateHelp
	createObject ( 974, 1665.3768310547, 2205.0173339844, 10.423025131226)
	
	gate["POST"] = createObject(975, -492.80627441406, -562.83807373047, 26.163866043091, 0, 0, 0)
	gatesphere["POST"] = createColSphere(-492.80627441406, -562.83807373047, 26.163866043091, 10)
	
	--Fix des Loches in der Wand
	createObject ( 8947, 2529.435303, -1279.364746, 34.379189 )
	
	gate["DerbyGate1"] = createObject(7657, -59.799999237061, 1887.1999511719, 18.60000038147, 0, 0, 270.25)
	setElementDoubleSided(gate["DerbyGate1"], true)
	gate["DerbyGate2"] = createObject(7657, -40, 1887.5, 18.60000038147, 0, 0, 270.24169921875)
	setElementDoubleSided(gate["DerbyGate2"], true)
end
addEventHandler('onResourceStart', getResourceRootElement(), placeGates)

function openGate(shape, dimension)
	if getElementType(source) == "player" then
		--POLICE GATES
		if g_playerstat[source] then
			if isPlayerEmployedInJob(source, 4) or g_playerstat[source]["Level"] == "Admin" then
				if shape == gatesphere["LSPoliceDep"] then
					moveObject(gate["LSPoliceDep1"], 7500, 1595.9067382813, -1637.9736328125, 13.265258789063)
					moveObject(gate["LSPoliceDep2"], 7500, 1581.03125, -1637.912109375, 13.252639770508)
				end
				if shape == gatesphere["LSPoliceDepInside"] then
					moveObject(gate["LSPoliceDepInside1"], 7500, 247.16172790527, 72.601654052734, 1005.0522460938)
				end
				if shape == gatesphere["LVPoliceDep1"] then
					local rx, ry, rz = getObjectRotation(gate["LVPoliceDep1"])
					ry = 357.45916748047 - ry
					moveObject(gate["LVPoliceDep1"], 5000, 2238.2165527344, 2450.4982910156, 10.81316947937, 0, ry, 0)
				end
				if shape == gatesphere["LVPoliceDep2"] then
					moveObject(gate["LVPoliceDep2"], 6000, 2335.0869140625, 2443.392578125, 13.018590927124)
				end
				if shape == gatesphere["SFPoliceDep"] then
					moveObject(gate["SFPoliceDep"], 7500, -1631.6611328125, 688.408203125, 12.9592628479)
				end
			end	
		end	
		--Tanker GATES
		if g_playerstat[source] then
			if isPlayerEmployedInJob(source, 6) or g_playerstat[source]["Level"] == "Admin" then
				if shape == gatesphere["LVTanker"] then
					moveObject(gate["LVTanker"], 7000, 288.41757202148, 1407.8858642578, 9.4003324508667)
				end
			end	
		end
		--Feuerwehr GATES
		if g_playerstat[source] then
			if isPlayerEmployedInJob(source, 1) or g_playerstat[source]["Level"] == "Admin" then
				if shape == gatesphere["LSFeuer"] then
					moveObject(gate["LSFeuer"], 7000, 1480.1652832031, -2184.9919433594, 14.413709640503)
				end
			end	
		end
		--ADAC GATES
		if g_playerstat[source] then
			if isPlayerEmployedInJob(source, 5) or g_playerstat[source]["Level"] == "Admin" then
				if shape == gatesphere["LSADAC"] then
					moveObject(gate["LSADAC"], 7000, 1811.4533691406, -1898.8010253906, 14.13561630249)
				end
				if shape == gatesphere["LVADAC"] then
					moveObject(gate["LVADAC"], 7000, 1665.4763183594, 2205.0620117188, 11.495002746582)
				end
				if shape == gatesphere["SFADAC"] then
					setGarageOpen(22,true)
				end
			end	
		end
		--POST GATE
		if g_playerstat[source] then
			if isPlayerEmployedInJob(source, 3) or g_playerstat[source]["Level"] == "Admin" then
				if shape == gatesphere["POST"] then
					moveObject(gate["POST"], 7000, -484.09405517578, -563.34930419922, 26.163866043091)
				end
			end	
		end
		--OTHER GATES
	end
end
addEventHandler("onElementColShapeHit", getRootElement(), openGate)

function closeGate(shape, dimension)
	if getElementType(source) == "player" then
		--POLICE GATES
		if g_playerstat[source] then
			if isPlayerEmployedInJob(source, 4) or g_playerstat[source]["Level"] == "Admin" then
				if shape == gatesphere["LSPoliceDep"] then
					moveObject(gate["LSPoliceDep1"], 7500, 1591.7883300781, -1638.1378173828, 13.265258789063)
					moveObject(gate["LSPoliceDep2"], 7500, 1583.8347167969, -1638.1378173828, 13.252639770508)
				end
				if shape == gatesphere["LSPoliceDepInside"] then
					moveObject(gate["LSPoliceDepInside1"], 8000, 245.50022888184, 72.592063903809, 1005.0522460938)
				end
				if shape == gatesphere["LVPoliceDep1"] then
					local rx, ry, rz = getObjectRotation(gate["LVPoliceDep1"])
					ry = 269.28051757813 - ry
					moveObject(gate["LVPoliceDep1"], 5000, 2238.0720214844, 2450.4855957031, 10.8381690979, 0, ry, 0)
				end
				if shape == gatesphere["LVPoliceDep2"] then
					moveObject(gate["LVPoliceDep2"], 6000, 2335.0874023438, 2443.3933105469, 8.168664932251)
				end
				if shape == gatesphere["SFPoliceDep"] then
					moveObject(gate["SFPoliceDep"], 7500, -1631.6613769531, 688.40826416016, 8.7092628479004)
				end		
			end	
		end
		--Tanker GATES
		if g_playerstat[source] then
			if isPlayerEmployedInJob(source, 6) or g_playerstat[source]["Level"] == "Admin" then
				if shape == gatesphere["LVTanker"] then
					moveObject(gate["LVTanker"], 7000, 288.18957519531, 1415.4749755859, 9.4003324508667)
				end
			end	
		end	
		--Feuerwehr GATES
		if g_playerstat[source] then
			if isPlayerEmployedInJob(source, 1) or g_playerstat[source]["Level"] == "Admin" then
				if shape == gatesphere["LSFeuer"] then
					moveObject(gate["LSFeuer"], 7000, 1488.1005859375, -2184.724609375, 14.413709640503)
				end
			end	
		end
		--ADAC GATES
		if g_playerstat[source] then
			if isPlayerEmployedInJob(source, 5) or g_playerstat[source]["Level"] == "Admin" then
				if shape == gatesphere["LSADAC"] then
					moveObject(gate["LSADAC"], 7000, 1811.451171875, -1890.08984375, 14.13561630249)
				end
				if shape == gatesphere["LVADAC"] then
					moveObject(gate["LVADAC"], 7000, 1673.1524658203, 2204.9174804688, 11.495002746582)
				end
				if shape == gatesphere["SFADAC"] then
					setGarageOpen(22,false)
				end
			end	
		end
		--POST GATE
		if g_playerstat[source] then
			if isPlayerEmployedInJob(source, 3) or g_playerstat[source]["Level"] == "Admin" then
				if shape == gatesphere["POST"] then
					moveObject(gate["POST"], 7000, -492.80627441406, -562.83807373047, 26.163866043091)
				end
			end	
		end
		--OTHER GATES
	end
end
addEventHandler("onElementColShapeLeave", getRootElement(), closeGate)   

function moveDerbyGates(playerSource, commandName, gateToMove)
	if g_playerstat[playerSource]["Level"] == "Admin" then
		if gateToMove then
			if gateToMove == "1" then
				local gate = gate["DerbyGate1"]
				local x, y, z = getElementPosition(gate)
				if z ~= 14 then
					moveObject(gate, 6000, -59.799999237061, 1887.1999511719, 14)
				else
					moveObject(gate, 6000, -59.799999237061, 1887.1999511719, 18.60000038147)
				end
			elseif gateToMove == "2" then
				local gate = gate["DerbyGate2"]
				local x, y, z = getElementPosition(gate)
				if z ~= 14 then
					moveObject(gate, 6000, -40, 1887.5, 14)
				else
					moveObject(gate, 6000, -40, 1887.5, 18.60000038147)
				end
			end
		end
	end
end
addCommandHandler("derbygate", moveDerbyGates)	
