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



rpcRegisterGlobalFunction("writePostClient")
rpcRegisterGlobalFunction("writePostBewerbung")
rpcRegisterGlobalFunction("getHousePost")
rpcRegisterGlobalFunction("getHousePostRead")
rpcRegisterGlobalFunction("deletePost")

local postMailBox = {}
local postMailBoxBlip = {}
local postLoadingRamp = {}
local postPlayerMailBox = {}

local postLetters = {}

local function initPostCrew()
	addJob(3, "Post", false, 255, 255, 0, true)
	addJobLocation(3, 1, -501.2236328125, -551.267578125, 25.5234375, 0, 0)
	
	addJobRank(3, 1, "Postbote", 0.16, false) --150$ pro 15 Min
	addJobRank(3, 2, "Postchef", 0.19, true) --175$ pro 15 Min - Chef
	
	registerJobFunction(3, "onPlayerEnterJob", postCrewEnterJob)
	registerJobFunction(3, "onPlayerLeaveJob", postCrewLeaveJob)
	
	setJobExtraMoneyLimit(3, 5000)
	
	postMailBox[1] = createPickup(995.0517578125, -1228.8779296875, 16.904308319092, 3, 1291, 1)
	postMailBox[2] = createPickup(-2455.5732421875, 2285.76953125, 4.9793748855591, 3, 1291, 1)
	postMailBox[3] = createPickup(1499.486328125, 1001.390625, 10.8203125, 3, 1291, 1)
	postMailBox[4] = createPickup(402.529296875, -1363.1455078125, 14.862838745117, 3, 1291, 1)
	postMailBox[5] = createPickup(1035.6474609375, -1333.517578125, 13.547601699829, 3, 1291, 1)
	postMailBox[6] = createPickup(1540.6142578125, -1663.046875, 13.550939559937, 3, 1291, 1)
	postMailBox[7] = createPickup(2276.82421875, -1377.7548828125, 23.980195999146, 3, 1291, 1)
	postMailBox[8] = createPickup(2036.1787109375, 1477.9853515625, 10.8203125, 3, 1291, 1)
	postMailBox[9] = createPickup(2154.603515625, 2221.3857421875, 10.8203125, 3, 1291, 1)
	postMailBox[10] = createPickup(2094.55859375, 2682.1533203125, 10.8203125, 3, 1291, 1)
	postMailBox[11] = createPickup(-2161.798828125, -161.7421875, 35.3203125, 3, 1291, 1)
	postMailBox[12] = createPickup(-2153.7822265625, 254.267578125, 35.3203125, 3, 1291, 1)
	postMailBox[13] = createPickup(-2133.3447265625, 666.1435546875, 55.295722961426, 3, 1291, 1)
	postMailBox[14] = createPickup(-1910.0751953125, 721.5791015625, 45.4453125, 3, 1291, 1)
	postMailBox[15] = createPickup(-1998.1689453125, 175.6533203125, 27.6875, 3, 1291, 1)
	
	local number = 1
	for _, pickup in ipairs(postMailBox) do
		addEventHandler("onPickupHit", pickup, postPickupeHitMailBox)
		local x, y, z = getElementPosition(pickup)
		postMailBoxBlip[number] = createBlip(x, y, z, 0, 2, 255, 255, 0, 155, 0, 99999, getRootElement())
		setElementVisibleTo(postMailBoxBlip[number], getRootElement(), false)
		number = number + 1
	end
	number = nil
	
	postLoadingRamp[1] = createColTube (-520.4248046875, -502.0390625, 23, 2, 8)
	postLoadingRamp[2] = createColTube (-529.7578125, -501.53125, 23, 2, 8)
	postLoadingRamp[3] = createColTube (-557.7763671875, -501.798828125, 23, 2, 8)
	postLoadingRamp[4] = createColTube (-557.736328125, -543.6875, 23, 2, 8)
	postLoadingRamp[5] = createColTube (-529.8681640625, -544.6552734375, 23, 2, 8)
	postLoadingRamp[6] = createColTube (-520.40234375, -543.986328125, 23, 2, 8)
	for _, colShape in ipairs(postLoadingRamp) do
		addEventHandler("onColShapeHit", colShape, postColShapeHitRamp)
	end
	
	--Unausgelieferte Post aus Mysql auslesen
	local post = mysql_query(g_mysql["connection"], "SELECT * FROM `post` WHERE NOT `ort` = 'Ausgeliefert'")
	if post then
		while true do
			local row = mysql_fetch_assoc(post)
			if not row then break end
			local id = tonumber(row["id"])
			
			postLetters[id] = {}
			postLetters[id]["Blip"] = nil
			postLetters[id]["playerID"] = tonumber(row["toPlayerID"])
			if string.find(row["ort"], "mailBox") or string.find(row["ort"], "Lager") then
				postLetters[id]["ort"] = row["ort"] 
			else 
				postLetters[id]["ort"] = tonumber(row["ort"])
			end
			postLetters[id]["special"] = row["special"]
				

			if row["special"] == "false" then
				local x, y, z = getHousePosFromPlayerID(row["toPlayerID"])
				postLetters[id]["x"] = x
				postLetters[id]["y"] = y
				postLetters[id]["z"] = z
			elseif row["special"] == "Feuerwehr" then				
				postLetters[id]["x"] = 1775.423828125
				postLetters[id]["y"] = 2066.365234375
				postLetters[id]["z"] = 9.8203125
			elseif row["special"] == "ADAC" then
				postLetters[id]["x"] = 1812.5263671875
				postLetters[id]["y"] = -1881.42578125
				postLetters[id]["z"] = 12.578125
			elseif row["special"] == "Post" then
				postLetters[id]["x"] = -495.8994140625
				postLetters[id]["y"] = -557.4326171875
				postLetters[id]["z"] = 24.5234375
			elseif row["special"] == "Taxi" then
				postLetters[id]["x"] = 1544.6728515625
				postLetters[id]["y"] = -1675.1279296875
				postLetters[id]["z"] = 12.558868408203
			elseif row["special"] == "VPolizei" then
				postLetters[id]["x"] = 2282.072265625
				postLetters[id]["y"] = 2429.439453125
				postLetters[id]["z"] = 9.8203125
			elseif row["special"] == "KPolizei" then
				postLetters[id]["x"] = 1712.869140625
				postLetters[id]["y"] = 1315.4384765625
				postLetters[id]["z"] = 9.8203125
			elseif row["special"] == "Medic" then
				postLetters[id]["x"] = -2654.23046875
				postLetters[id]["y"] = 637.7353515625
				postLetters[id]["z"] = 13.453125
			elseif row["special"] == "Tanker" then
				postLetters[id]["x"] = 294.5234375
				postLetters[id]["y"] = 1405.4052734375
				postLetters[id]["z"] = 8.9704437255859
			elseif row["special"] == "El-Salvador" then
				postLetters[id]["x"] = 2220.86401
				postLetters[id]["y"] = -1163.43494
				postLetters[id]["z"] = 25.733
			elseif row["special"] == "Yakuza" then
				postLetters[id]["x"] = 1913.27112
				postLetters[id]["y"] = 956.40320
				postLetters[id]["z"] = 10.8203
			elseif row["special"] == "18th-Street-Gang" then
				postLetters[id]["x"] = -2618.49658
				postLetters[id]["y"] = 1390.58020
				postLetters[id]["z"] = 7.10821
			end
		end
		mysql_free_result(post)
	end
end
addEventHandler("onResourceStart", getResourceRootElement(), initPostCrew)

function postCrewEnterJob(playerSource, staticJobID, locationID, playerJobRank)
	setElementModel(playerSource, 268)
	bindKey(playerSource, "j", "down", turnJobChat)
end

function postCrewLeaveJob(playerSource, staticJobID, locationID, playerJobRank)
	setElementModel(playerSource, g_playerstat[playerSource]["Skin"])
	if g_playerstat[playerSource]["postMode"] == 2.2 then
		for id, value in pairs(postLetters) do
			if postLetters[id]["Blip"] then
				setElementVisibleTo(postLetters[id]["Blip"], playerSource, false)
			end
		end
	end
	g_playerstat[playerSource]["postMode"] = nil
end

function postPickupeHitMailBox(player)
	if not getPedOccupiedVehicle(player) then
		rpcCallClientFunction(player, "showWritePost", true)
		if source == postMailBox[1] then
			postPlayerMailBox[player] = "mailBox1"
		elseif source == postMailBox[2] then
			postPlayerMailBox[player] = "mailBox2"
		elseif source == postMailBox[3] then
			postPlayerMailBox[player] = "mailBox3"
		elseif source == postMailBox[4] then
			postPlayerMailBox[player] = "mailBox4"
		elseif source == postMailBox[5] then
			postPlayerMailBox[player] = "mailBox5"
		elseif source == postMailBox[6] then
			postPlayerMailBox[player] = "mailBox6"
		elseif source == postMailBox[7] then
			postPlayerMailBox[player] = "mailBox7"
		elseif source == postMailBox[8] then
			postPlayerMailBox[player] = "mailBox8"
		elseif source == postMailBox[9] then
			postPlayerMailBox[player] = "mailBox9"
		elseif source == postMailBox[10] then
			postPlayerMailBox[player] = "mailBox10"
		elseif source == postMailBox[11] then
			postPlayerMailBox[player] = "mailBox11"
		elseif source == postMailBox[12] then
			postPlayerMailBox[player] = "mailBox12"
		elseif source == postMailBox[13] then
			postPlayerMailBox[player] = "mailBox13"
		elseif source == postMailBox[14] then
			postPlayerMailBox[player] = "mailBox14"
		elseif source == postMailBox[15] then
			postPlayerMailBox[player] = "mailBox15"
		end
	else
		if isPlayerActiveInJob(player, 3) then
			if g_playerstat[player]["postMode"] == 1.2 then
				local vehicle = getPedOccupiedVehicle(player)
				if vehicle then
					local x, y, z = getVehicleTurnVelocity (vehicle)
					if x < 2 and y < 2 and z < 2 and x > -2 and y > -2 and z > -2 then
						local trailer = getVehicleTowedByVehicle(vehicle)
						if trailer then
							local letters = 0
							if source == postMailBox[1] then
								for id, value in pairs(postLetters) do
									if postLetters[id]["ort"] == "mailBox1" then
										clearElementVisibleTo(postMailBoxBlip[1])
										postLetters[id]["ort"] = g_vehiclestat[trailer]["ID"]
										letters = letters + 1
										addPlayerJobExtraMoney(player, 10)
										mysql_query(g_mysql["connection"], "UPDATE `post` SET `ort` = '"..tostring(postLetters[id]["ort"]).."' WHERE `id` = "..id.." LIMIT 1;")
									end
								end
							elseif source == postMailBox[2] then
								for id, value in pairs(postLetters) do					
									if postLetters[id]["ort"] == "mailBox2" then
										clearElementVisibleTo(postMailBoxBlip[2])
										postLetters[id]["ort"] = g_vehiclestat[trailer]["ID"]
										letters = letters + 1
										addPlayerJobExtraMoney(player, 10)
										mysql_query(g_mysql["connection"], "UPDATE `post` SET `ort` = '"..tostring(postLetters[id]["ort"]).."' WHERE `id` = "..id.." LIMIT 1;")
									end
								end
							elseif source == postMailBox[3] then
								for id, value in pairs(postLetters) do					
									if postLetters[id]["ort"] == "mailBox3" then
										clearElementVisibleTo(postMailBoxBlip[3])
										postLetters[id]["ort"] = g_vehiclestat[trailer]["ID"]
										letters = letters + 1
										addPlayerJobExtraMoney(player, 10)
										mysql_query(g_mysql["connection"], "UPDATE `post` SET `ort` = '"..tostring(postLetters[id]["ort"]).."' WHERE `id` = "..id.." LIMIT 1;")
									end
								end
							elseif source == postMailBox[4] then
								for id, value in pairs(postLetters) do					
									if postLetters[id]["ort"] == "mailBox4" then
										clearElementVisibleTo(postMailBoxBlip[4])
										postLetters[id]["ort"] = g_vehiclestat[trailer]["ID"]
										letters = letters + 1
										addPlayerJobExtraMoney(player, 10)
										mysql_query(g_mysql["connection"], "UPDATE `post` SET `ort` = '"..tostring(postLetters[id]["ort"]).."' WHERE `id` = "..id.." LIMIT 1;")
									end
								end
							elseif source == postMailBox[5] then
								for id, value in pairs(postLetters) do					
									if postLetters[id]["ort"] == "mailBox5" then
										clearElementVisibleTo(postMailBoxBlip[5])
										postLetters[id]["ort"] = g_vehiclestat[trailer]["ID"]
										letters = letters + 1
										addPlayerJobExtraMoney(player, 10)
										mysql_query(g_mysql["connection"], "UPDATE `post` SET `ort` = '"..tostring(postLetters[id]["ort"]).."' WHERE `id` = "..id.." LIMIT 1;")
									end
								end
							elseif source == postMailBox[6] then
								for id, value in pairs(postLetters) do					
									if postLetters[id]["ort"] == "mailBox6" then
										clearElementVisibleTo(postMailBoxBlip[6])
										postLetters[id]["ort"] = g_vehiclestat[trailer]["ID"]
										letters = letters + 1
										addPlayerJobExtraMoney(player, 10)
										mysql_query(g_mysql["connection"], "UPDATE `post` SET `ort` = '"..tostring(postLetters[id]["ort"]).."' WHERE `id` = "..id.." LIMIT 1;")
									end
								end
							elseif source == postMailBox[7] then
								for id, value in pairs(postLetters) do					
									if postLetters[id]["ort"] == "mailBox7" then
										clearElementVisibleTo(postMailBoxBlip[7])
										postLetters[id]["ort"] = g_vehiclestat[trailer]["ID"]
										letters = letters + 1
										addPlayerJobExtraMoney(player, 10)
										mysql_query(g_mysql["connection"], "UPDATE `post` SET `ort` = '"..tostring(postLetters[id]["ort"]).."' WHERE `id` = "..id.." LIMIT 1;")
									end
								end
							elseif source == postMailBox[8] then
								for id, value in pairs(postLetters) do					
									if postLetters[id]["ort"] == "mailBox8" then
										clearElementVisibleTo(postMailBoxBlip[8])
										postLetters[id]["ort"] = g_vehiclestat[trailer]["ID"]
										letters = letters + 1
										addPlayerJobExtraMoney(player, 10)
										mysql_query(g_mysql["connection"], "UPDATE `post` SET `ort` = '"..tostring(postLetters[id]["ort"]).."' WHERE `id` = "..id.." LIMIT 1;")
									end
								end
							elseif source == postMailBox[9] then
								for id, value in pairs(postLetters) do					
									if postLetters[id]["ort"] == "mailBox9" then
										clearElementVisibleTo(postMailBoxBlip[9])
										postLetters[id]["ort"] = g_vehiclestat[trailer]["ID"]
										letters = letters + 1
										addPlayerJobExtraMoney(player, 10)
										mysql_query(g_mysql["connection"], "UPDATE `post` SET `ort` = '"..tostring(postLetters[id]["ort"]).."' WHERE `id` = "..id.." LIMIT 1;")
									end
								end
							elseif source == postMailBox[10] then
								for id, value in pairs(postLetters) do					
									if postLetters[id]["ort"] == "mailBox10" then
										clearElementVisibleTo(postMailBoxBlip[10])
										postLetters[id]["ort"] = g_vehiclestat[trailer]["ID"]
										letters = letters + 1
										addPlayerJobExtraMoney(player, 10)
										mysql_query(g_mysql["connection"], "UPDATE `post` SET `ort` = '"..tostring(postLetters[id]["ort"]).."' WHERE `id` = "..id.." LIMIT 1;")
									end
								end
							elseif source == postMailBox[11] then
								for id, value in pairs(postLetters) do					
									if postLetters[id]["ort"] == "mailBox11" then
										clearElementVisibleTo(postMailBoxBlip[11])
										postLetters[id]["ort"] = g_vehiclestat[trailer]["ID"]
										letters = letters + 1
										addPlayerJobExtraMoney(player, 10)
										mysql_query(g_mysql["connection"], "UPDATE `post` SET `ort` = '"..tostring(postLetters[id]["ort"]).."' WHERE `id` = "..id.." LIMIT 1;")
									end
								end
							elseif source == postMailBox[12] then
								for id, value in pairs(postLetters) do					
									if postLetters[id]["ort"] == "mailBox12" then
										clearElementVisibleTo(postMailBoxBlip[12])
										postLetters[id]["ort"] = g_vehiclestat[trailer]["ID"]
										letters = letters + 1
										addPlayerJobExtraMoney(player, 10)
										mysql_query(g_mysql["connection"], "UPDATE `post` SET `ort` = '"..tostring(postLetters[id]["ort"]).."' WHERE `id` = "..id.." LIMIT 1;")
									end
								end
							elseif source == postMailBox[13] then
								for id, value in pairs(postLetters) do					
									if postLetters[id]["ort"] == "mailBox13" then
										clearElementVisibleTo(postMailBoxBlip[13])
										postLetters[id]["ort"] = g_vehiclestat[trailer]["ID"]
										letters = letters + 1
										addPlayerJobExtraMoney(player, 10)
										mysql_query(g_mysql["connection"], "UPDATE `post` SET `ort` = '"..tostring(postLetters[id]["ort"]).."' WHERE `id` = "..id.." LIMIT 1;")
									end
								end
							elseif source == postMailBox[14] then
								for id, value in pairs(postLetters) do					
									if postLetters[id]["ort"] == "mailBox14" then
										clearElementVisibleTo(postMailBoxBlip[14])
										postLetters[id]["ort"] = g_vehiclestat[trailer]["ID"]
										letters = letters + 1
										addPlayerJobExtraMoney(player, 10)
										mysql_query(g_mysql["connection"], "UPDATE `post` SET `ort` = '"..tostring(postLetters[id]["ort"]).."' WHERE `id` = "..id.." LIMIT 1;")
									end
								end
							elseif source == postMailBox[15] then
								for id, value in pairs(postLetters) do					
									if postLetters[id]["ort"] == "mailBox15" then
										clearElementVisibleTo(postMailBoxBlip[15])
										postLetters[id]["ort"] = g_vehiclestat[trailer]["ID"]
										letters = letters + 1
										addPlayerJobExtraMoney(player, 10)
										mysql_query(g_mysql["connection"], "UPDATE `post` SET `ort` = '"..tostring(postLetters[id]["ort"]).."' WHERE `id` = "..id.." LIMIT 1;")
									end
								end
							end
							sendPlayerInfo(player, "Du hast "..letters.." Briefe erhalten.", true)
							letters = nil
						else
							sendPlayerInfo(player, "Kein Trailer gefunden!", true)
						end
					end
				end
			end
		end
	end
end

function postVehEnter(playerSource)
	if g_vehiclestat[source]["Specialcar"] == "Post" then
		if isPlayerActiveInJob(playerSource, 3) then
			local veh = getElementModel(source)
			if veh == 515 then
				if g_playerstat[playerSource]["postMode"] == 2.2 then
					for id, value in pairs(postLetters) do
						if postLetters[id]["Blip"] then
							setElementVisibleTo(postLetters[id]["Blip"], playerSource, false)
						end
					end
				end
				local trailer = getVehicleTowedByVehicle(source)
				if not trailer then
					sendPlayerInfo(playerSource, "Hänge zuerst einen Trailer an!", true)
					g_playerstat[playerSource]["postMode"] = 1.1
				else
					g_playerstat[playerSource]["postMode"] = 1.2
					local letters = 0
					for id, value in pairs(postLetters) do
						local ort = postLetters[id]["ort"]
						if ort == "mailBox1" then
							setElementVisibleTo(postMailBoxBlip[1], playerSource, true)
						elseif ort == "mailBox2" then
							setElementVisibleTo(postMailBoxBlip[2], playerSource, true)
						elseif ort == "mailBox3" then
							setElementVisibleTo(postMailBoxBlip[3], playerSource, true)
						elseif ort == "mailBox4" then
							setElementVisibleTo(postMailBoxBlip[4], playerSource, true)
						elseif ort == "mailBox5" then
							setElementVisibleTo(postMailBoxBlip[5], playerSource, true)
						elseif ort == "mailBox6" then
							setElementVisibleTo(postMailBoxBlip[6], playerSource, true)
						elseif ort == "mailBox7" then
							setElementVisibleTo(postMailBoxBlip[7], playerSource, true)
						elseif ort == "mailBox8" then
							setElementVisibleTo(postMailBoxBlip[8], playerSource, true)
						elseif ort == "mailBox9" then
							setElementVisibleTo(postMailBoxBlip[9], playerSource, true)
						elseif ort == "mailBox10" then
							setElementVisibleTo(postMailBoxBlip[10], playerSource, true)
						elseif ort == "mailBox11" then
							setElementVisibleTo(postMailBoxBlip[11], playerSource, true)
						elseif ort == "mailBox12" then
							setElementVisibleTo(postMailBoxBlip[12], playerSource, true)
						elseif ort == "mailBox13" then
							setElementVisibleTo(postMailBoxBlip[13], playerSource, true)
						elseif ort == "mailBox14" then
							setElementVisibleTo(postMailBoxBlip[14], playerSource, true)
						elseif ort == "mailBox15" then
							setElementVisibleTo(postMailBoxBlip[15], playerSource, true)
						elseif ort == g_vehiclestat[trailer]["ID"] then
							letters = letters + 1
						end
					end
					sendPlayerInfo(playerSource, "Mach dich nun auf den Weg um die Briefkästen zu entleeren.\n\nDu hast "..letters.." Brief(e) im Trailer", true)
					letters = nil
				end
			elseif veh == 609 then
				if g_playerstat[playerSource]["postMode"] ~= 2.2 then
					sendPlayerInfo(playerSource, "Fahre an eine Laderampe um dein Fahrzeug zu beladen.", true)
					g_playerstat[playerSource]["postMode"] = 2.1
				end
			else
				sendPlayerInfo(playerSource, "Das ist kein Postfahrzeug!", true)
			end
		else
			sendPlayerInfo(playerSource, "Du bist nicht im Job!", true)
		end
	end
end
addEventHandler("onVehicleEnter", getResourceRootElement(), postVehEnter)

function postVehExit(playerSource)
	if g_vehiclestat[source]["Specialcar"] == "Post" then
		if isPlayerActiveInJob(playerSource, 3) then
			if g_playerstat[playerSource]["postMode"] == 1.2 then
				for number = 1, #postMailBox, 1 do
					setElementVisibleTo(postMailBoxBlip[number], playerSource, false)
				end
			end
		end
	end
end
addEventHandler("onVehicleExit", getResourceRootElement(), postVehExit)

function postTrailerAttach(vehicle)
	if g_vehiclestat[vehicle]["Specialcar"] == "Post" then
		local player = getVehicleOccupant (vehicle)
		if player then
			if g_vehiclestat[source]["Specialcar"] == "Post" then
				if isPlayerActiveInJob(player, 3) then
					g_playerstat[player]["postMode"] = 1.2
					local letters = 0
					for id, value in pairs(postLetters) do
						local ort = postLetters[id]["ort"]
						if ort == "mailBox1" then
							setElementVisibleTo(postMailBoxBlip[1], player, true)
						elseif ort == "mailBox2" then
							setElementVisibleTo(postMailBoxBlip[2], player, true)
						elseif ort == "mailBox3" then
							setElementVisibleTo(postMailBoxBlip[3], player, true)
						elseif ort == "mailBox4" then
							setElementVisibleTo(postMailBoxBlip[4], player, true)
						elseif ort == "mailBox5" then
							setElementVisibleTo(postMailBoxBlip[5], player, true)
						elseif ort == "mailBox6" then
							setElementVisibleTo(postMailBoxBlip[6], player, true)
						elseif ort == "mailBox7" then
							setElementVisibleTo(postMailBoxBlip[7], player, true)
						elseif ort == "mailBox8" then
							setElementVisibleTo(postMailBoxBlip[8], player, true)
						elseif ort == "mailBox9" then
							setElementVisibleTo(postMailBoxBlip[9], player, true)
						elseif ort == "mailBox10" then
							setElementVisibleTo(postMailBoxBlip[10], player, true)
						elseif ort == "mailBox11" then
							setElementVisibleTo(postMailBoxBlip[11], player, true)
						elseif ort == "mailBox12" then
							setElementVisibleTo(postMailBoxBlip[12], player, true)
						elseif ort == "mailBox13" then
							setElementVisibleTo(postMailBoxBlip[13], player, true)
						elseif ort == "mailBox14" then
							setElementVisibleTo(postMailBoxBlip[14], player, true)
						elseif ort == "mailBox15" then
							setElementVisibleTo(postMailBoxBlip[15], player, true)
						elseif ort == g_vehiclestat[source]["ID"] then
							letters = letters + 1
						end
					end
					sendPlayerInfo(player, "Mach dich nun auf den Weg um die Briefkästen zu entleeren.\n\nDu hast "..letters.." Brief(e) im Trailer", true)
					letters = nil
				end
			else
				sendPlayerInfo(player, "Das ist kein Posttrailer!", true)
			end
		end
	end
end
addEventHandler("onTrailerAttach", getRootElement(), postTrailerAttach)

function postColShapeHitRamp(element)
	if getElementType(element) == "vehicle" then
		local player = getVehicleOccupant(element)
		if not player then player = getVehicleOccupant(getVehicleTowedByVehicle(element)) end
		if player then
			if isPlayerActiveInJob(player, 3) then
				if g_playerstat[player]["postMode"] == 2.1 or g_playerstat[player]["postMode"] == 2.2 then
					g_playerstat[player]["postMode"] = 2.2
					sendPlayerInfo(player, "Mach dich nun auf den Weg um die Post zu verteilen.", true)
					for id, value in pairs(postLetters) do
						if postLetters[id]["ort"] then
							if postLetters[id]["ort"] == "Lager" then
								if not postLetters[id]["Blip"] then
									if postLetters[id]["x"] and postLetters[id]["y"] and postLetters[id]["z"] then
										postLetters[id]["Blip"] = createBlip(postLetters[id]["x"], postLetters[id]["y"], postLetters[id]["z"], 0, 2, 255, 255, 0, 155, 0, 99999, getRootElement())
										setElementVisibleTo(postLetters[id]["Blip"], getRootElement(), false)
										setElementVisibleTo(postLetters[id]["Blip"], player, true)
									end
								else
									setElementVisibleTo(postLetters[id]["Blip"], player, true)
								end
							end	
						end
					end
				elseif g_playerstat[player]["postMode"] == 1.2 then
					local letters = 0
					if getElementModel(element) == 435 then
						for id, value in pairs(postLetters) do
							if postLetters[id]["ort"] == g_vehiclestat[element]["ID"] then
								postLetters[id]["ort"] = "Lager"
								addPlayerJobExtraMoney(player, 10)
								letters = letters + 1
								
								mysql_query(g_mysql["connection"], "UPDATE `post` SET `ort` = 'Lager' WHERE `id` = "..id.." LIMIT 1;")
							end	
						end
					else 
						element = getVehicleTowedByVehicle(element)
						for id, value in pairs(postLetters) do
							if postLetters[id]["ort"] == g_vehiclestat[element]["ID"] then
								postLetters[id]["ort"] = "Lager"
								addPlayerJobExtraMoney(player, 10)
								letters = letters + 1
								
								mysql_query(g_mysql["connection"], "UPDATE `post` SET `ort` = 'Lager' WHERE `id` = "..id.." LIMIT 1;")
							end
						end
					end
					sendPlayerInfo(player, "Du hast "..letters.." Brief(e) abgeliefert.", true)
					letters = nil
				end
			end
		end
	end
end

function postSurrender(player, playerid, special)
	if player and playerid then
		if isPlayerActiveInJob(player, 3) then
			if g_playerstat[player]["postMode"] == 2.2 then
				local letters = 0
				if playerid ~= -1 then
					for id, value in pairs(postLetters) do
						if postLetters[id]["ort"] == "Lager" then
							if postLetters[id]["playerID"] == playerid then
								addPlayerJobExtraMoney(player, 20)
								letters = letters + 1
							
								mysql_query(g_mysql["connection"], "UPDATE `post` SET `ort` = 'Ausgeliefert' WHERE `id` = "..id.." LIMIT 1;")
								destroyElement(postLetters[id]["Blip"])
								postLetters[id] = nil
							end
						end
					end
				else
					for id, value in pairs(postLetters) do
						if postLetters[id]["ort"] == "Lager" then
							if postLetters[id]["special"] == special then
								addPlayerJobExtraMoney(player, 20)
								letters = letters + 1
							
								mysql_query(g_mysql["connection"], "UPDATE `post` SET `ort` = 'Ausgeliefert' WHERE `id` = "..id.." LIMIT 1;")
								destroyElement(postLetters[id]["Blip"])
								postLetters[id] = nil
							end
						end
					end
				end
				sendPlayerInfo(player, "Du hast "..letters.." Brief(e) ausgeliefert.", true)
				letters = nil
			end
		end
	end
end

function postIsPostApplication()
	for id, value in pairs(postLetters) do
		if postLetters[id]["ort"] == "Lager" then
			if postLetters[id]["special"] == "Post" then
				return true				
			end
		end
	end
	return false
end

function writePostClient(player, head, text)
	if player and head and text then
		local sendername = false
		local houseid = -1
		local id = -1
		
		local name = mysql_query(g_mysql["connection"], "SELECT * FROM `players` WHERE `playername` LIKE '"..player.."' LIMIT 1;")
		if name then
			while true do
				local row = mysql_fetch_assoc(name)
				if not row then break end
				
				id = tonumber(row["id"])
				sendername = row["playername"]
				
			end
			mysql_free_result(name)
		end
		
		if sendername == false then
			sendPlayerInfo(client, "Der Name konnte nicht gefunden werden!", true)
			return false
		end
		
		local name = mysql_query(g_mysql["connection"], "SELECT * FROM `houses` WHERE `playerid` = '"..id.."' OR `member` = '"..id.."' OR `member` LIKE '%|"..id.."|%' OR `member` LIKE '"..id.."|%' OR `member` LIKE '%|"..id.."' LIMIT 1;")
		if name then
			while true do
				local row = mysql_fetch_assoc(name)
				if not row then break end
				
				houseid = tonumber(row["id"])
			end
			mysql_free_result(name)
		end	
		
		if houseid == -1 then
			sendPlayerInfo(client, "Diser Spieler hat noch kein Haus!", true)
			return false
		end
		
		local brief = addBrief(getPlayerName(client), id, head, text, postPlayerMailBox[client])		
		if brief then
			takePlayerMoney(client, 80)
			giveStaatsKasse(80)
			outputChatBox(g_colors["green"].."Du hast den Brief erfolgreich an "..sendername.." gesendet (80$)", client, 0, 0, 0, true)	
			rpcCallClientFunction(client, "showWritePost", false)
		end
	end	
end

function writePostBewerbung(job, head, text)
	if job and head and text then
		if isCorrectJob(job) then
			local brief = addBrief(getPlayerName(client), -1, head, text, postPlayerMailBox[client], job)
			if brief then
				takePlayerMoney(client, 80)
				giveStaatsKasse(80)
				outputChatBox(g_colors["green"].."Du hast deine Bewerbung erfolgreich an "..job.." gesendet (80$)", client, 0, 0, 0, true)
				rpcCallClientFunction(client, "showWritePost", false)
			else
				outputChatBox(g_colors["red"].."Es ist ein Systemfehler aufgetreten, wende dich an einen Developer! ", client, 0, 0, 0, true)
			end
		else
			outputChatBox(g_colors["red"].."Es ist ein Systemfehler aufgetreten, wende dich an einen Developer! ", client, 0, 0, 0, true)
		end
	end	
end

function addBrief(from, to, head, text, ort, special)
	if not special then special = "false" end
	if from and to and head and text then
		local playerid = tonumber(to)
		mysql_query(g_mysql["connection"] , "INSERT INTO `post` (`id`) VALUES (NULL);")
		
		local lastid = mysql_insert_id(g_mysql["connection"])
			
		local post = mysql_query(g_mysql["connection"], "UPDATE `post` SET\
															  `fromPlayer` = '"..escapeString(from).."',\
															  `toPlayerID` = '"..playerid.."',\
															  `head` = '"..escapeString(head).."',\
															  `text` = '"..escapeString(text).."',\
															  `ort` = '"..escapeString(ort).."',\
															  `special` = '"..escapeString(special).."'\
											WHERE `id` = "..lastid.." LIMIT 1;")		
		
		local id = lastid
		postLetters[id] = {}
		postLetters[id]["playerID"] = playerid
		postLetters[id]["ort"] = ort
		postLetters[id]["special"] = special
		
		if special == "false" then
			local x, y, z = getHousePosFromPlayerID(playerid)
			postLetters[id]["x"] = x
			postLetters[id]["y"] = y
			postLetters[id]["z"] = z
		elseif special == "Feuerwehr" then				
			postLetters[id]["x"] = 1775.423828125
			postLetters[id]["y"] = 2066.365234375
			postLetters[id]["z"] = 9.8203125
		elseif special == "ADAC" then
			postLetters[id]["x"] = 1812.5263671875
			postLetters[id]["y"] = -1881.42578125
			postLetters[id]["z"] = 12.578125
		elseif special == "Post" then
			postLetters[id]["x"] = -495.8994140625
			postLetters[id]["y"] = -557.4326171875
			postLetters[id]["z"] = 24.5234375
		elseif special == "Taxi" then
			postLetters[id]["x"] = 1544.6728515625
			postLetters[id]["y"] = -1675.1279296875
			postLetters[id]["z"] = 12.558868408203
		elseif special == "VPolizei" then
			postLetters[id]["x"] = 2282.072265625
			postLetters[id]["y"] = 2429.439453125
			postLetters[id]["z"] = 9.8203125
		elseif special == "KPolizei" then
			postLetters[id]["x"] = 1712.869140625
			postLetters[id]["y"] = 1315.4384765625
			postLetters[id]["z"] = 9.8203125
		elseif special == "Medic" then
			postLetters[id]["x"] = -2654.23046875
			postLetters[id]["y"] = 637.7353515625
			postLetters[id]["z"] = 13.453125
		elseif special == "Tanker" then
			postLetters[id]["x"] = 294.5234375
			postLetters[id]["y"] = 1405.4052734375
			postLetters[id]["z"] = 8.9704437255859
		elseif special == "El-Salvador" then
			postLetters[id]["x"] = 2220.86401
			postLetters[id]["y"] = -1163.43494
			postLetters[id]["z"] = 25.733
		elseif special == "Yakuza" then
			postLetters[id]["x"] = 1913.27112
			postLetters[id]["y"] = 956.40320
			postLetters[id]["z"] = 10.8203
		elseif special == "18th-Street-Gang" then
			postLetters[id]["x"] = -2618.49658
			postLetters[id]["y"] = 1390.58020
			postLetters[id]["z"] = 7.10821
		end
		
		if post and postLetters[id] then return true else return false end
	end
end

function getHousePost()
	local post = mysql_query(g_mysql["connection"], "SELECT * FROM `post` WHERE `toPlayerID` = '"..g_playerstat[client]["Userid"].."' AND `ort` = 'Ausgeliefert'")
	if post then
		while true do
			local row = mysql_fetch_assoc(post)
			if not row then break end
			
			if row["special"] == "false" then
				rpcCallClientFunction(client, "addPostTitle", row["id"], row["fromPlayer"], row["head"])
			end	
		end
	mysql_free_result(post)	
	end
end

function getHousePostRead(postid)
	if postid then
		local post = mysql_query(g_mysql["connection"], "SELECT * FROM `post` WHERE `toPlayerID` = '"..g_playerstat[client]["Userid"].."' AND `id` = "..postid.."")
		if post then
			while true do
				local row = mysql_fetch_assoc(post)
				if not row then break end
				rpcCallClientFunction(client, "addReadPost", row["head"], row["text"])
				break
			end
		end	
		mysql_free_result(post)	
	end								
end

function deletePost(show, postid)
	postID = tonumber(postid)
	playerID = tonumber(g_playerstat[client]["Userid"])
	if playerID and postID then
		local sql = mysql_query(g_mysql["connection"], "DELETE FROM `post` WHERE `id` = '"..postID.."' LIMIT 1")
		if sql and show == true then
			rpcCallClientFunction(client, "showPostMenu", true)
		end
	end	
end
