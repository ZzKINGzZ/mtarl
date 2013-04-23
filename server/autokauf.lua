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



rpcRegisterGlobalFunction("carsaleserver")
rpcRegisterGlobalFunction("sellOptionServer")

local car = {}
local autokauf = {}
local sell = {}

local function placeCars()
	outputDebug("autokauf.lua start...")
	
	autokauf[1] = createMarker ( 2172.0859375, 1397.134765625, 11.0625-1, "cylinder", 1.5, 55, 100, 250, 190) --Bike
	autokauf[2] = createMarker ( 541.4638671875, 2363.703125, 30.874475479126-1, "cylinder", 1.5, 55, 100, 250, 190) --Truck
	autokauf[3] = createMarker ( 538.4853515625, -1292.375, 17.2421875-1, "cylinder", 1.5, 55, 100, 250, 190) --Vans
	autokauf[4] = createMarker ( 2131.40625, -1149.701171875, 24.23360824585-1, "cylinder", 1.5, 55, 100, 250, 190) --Offroad
	autokauf[5] = createMarker ( 2282.2470703125, -2363.8984375, 13.546875-1, "cylinder", 1.5, 55, 100, 250, 190) --Trailer
	autokauf[6] = createMarker ( -1952.2763671875, 295.2265625, 35.46875-1, "cylinder", 1.5, 55, 100, 250, 190) --Wang
	autokauf[7] = createMarker ( -1658.5986328125, 1207.3076171875, 7.25-1, "cylinder", 1.5, 55, 100, 250, 190) --Luxus
	autokauf[8] = createMarker ( 401.34375, 2538.306640625, 16.545127868652-1, "cylinder", 1.5, 55, 100, 250, 190) --Air
	autokauf[9] = createMarker ( -2184.6015625, 2416.0927734375, 5.1876344680786-1, "cylinder", 1.5, 55, 100, 250, 190) --Boot
	
	for id, marker in pairs(autokauf) do
		addEventHandler("onMarkerHit",  autokauf[id], startCarSale)
	end
	
	--TODO
	--If Vereinfachen
	for _, car in pairs(carTable) do
		if not car["jobonly"] then
			if car["category"] ~= "rc" then
				if car["category"] ~= "extra" then
					if car["category"] ~= "rc" then
						if car["category"] ~= "train" then
							if car["name"] ~= "Andromeda" then
								local vehicle = createVehicle(car["id"], car["autohausSpawn"]["x"], car["autohausSpawn"]["y"], car["autohausSpawn"]["z"], car["autohausSpawn"]["rx"], car["autohausSpawn"]["ry"], car["autohausSpawn"]["rz"], "Muster")

								setVehicleFrozen(vehicle, true)
								setElementHealth(vehicle, 1000)
								setVehicleLocked(vehicle, true)
								setVehicleDoorsUndamageable(vehicle, true)
								setVehicleDamageProof(vehicle, true)
								setVehicleFuelTankExplodable(vehicle, false)
							end
						end
					end
				end
			end
		end
	end
end
addEventHandler('onResourceStart', getResourceRootElement(), placeCars)

function startCarSale(playerSource)
	if source == autokauf[1] or source == autokauf[2] or source == autokauf[3] or source == autokauf[4] or source == autokauf[5] or source == autokauf[6] or source == autokauf[7] or source == autokauf[8] or source == autokauf[9] then
		if getElementType(playerSource) == "player" then
			if g_playerstat[playerSource] then
				--CORE:getPlayer(playerSource):callClient("startCarInfoList", true, car["category"])
				local paintjob
				if source == autokauf[1] then
					CORE:getPlayer(playerSource):callClient("startCarInfoList", true, "bike")
					for _, car in pairs(carTable) do
						if car["category"] == "bike" then
							local carName = car["name"]
							local tankart = getTankartName(tostring(car["tankart"]))
							if car["paintjob"] == true then paintjob = "Verf"..uuml.."gbar" else paintjob = "Nicht verf"..uuml.."gbar" end
							local text = "Auto: "..carName.."
Preis: "..tostring(car["preis"]).."$
T"..Uuml.."V-Klasse: "..tostring(car["TUV"]).."
Tankvolumen: "..tostring(car["tank"]).."l
Tankart: "..tankart.."
Sicherheitsklasse: "..tostring(car["safty"]).."
Paintjob: "..paintjob
							local id = car["id"]
							CORE:getPlayer(playerSource):callClient("fillCarInfoList", carName, text, id)
						end
					end
				end
				if source == autokauf[2] then
					CORE:getPlayer(playerSource):callClient("startCarInfoList", true, "truck")
					for _, car in pairs(carTable) do
						if car["category"] == "bus" or car["category"] == "truck" then							
							local carName = car["name"]
							local tankart = getTankartName(tostring(car["tankart"]))
							if car["paintjob"] == true then paintjob = "Verf"..uuml.."gbar" else paintjob = "Nicht verf"..uuml.."gbar" end
							local text = "Auto: "..carName.."
Preis: "..tostring(car["preis"]).."$
T"..Uuml.."V-Klasse: "..tostring(car["TUV"]).."
Tankvolumen: "..tostring(car["tank"]).."l
Tankart: "..tankart.."
Sicherheitsklasse: "..tostring(car["safty"]).."
Paintjob: "..paintjob
							local id = car["id"]
							CORE:getPlayer(playerSource):callClient("fillCarInfoList", carName, text, id)
						end
					end
				end
				if source == autokauf[3] then
					CORE:getPlayer(playerSource):callClient("startCarInfoList", true, "van")
					for _, car in pairs(carTable) do
						if car["category"] == "van" then							
							local carName = car["name"]
							local tankart = getTankartName(tostring(car["tankart"]))
							if car["paintjob"] == true then paintjob = "Verf"..uuml.."gbar" else paintjob = "Nicht verf"..uuml.."gbar" end
							local text = "Auto: "..carName.."
Preis: "..tostring(car["preis"]).."$
T"..Uuml.."V-Klasse: "..tostring(car["TUV"]).."
Tankvolumen: "..tostring(car["tank"]).."l
Tankart: "..tankart.."
Sicherheitsklasse: "..tostring(car["safty"]).."
Paintjob: "..paintjob
							local id = car["id"]
							CORE:getPlayer(playerSource):callClient("fillCarInfoList", carName, text, id)
						end
					end
				end
				if source == autokauf[4] then
					CORE:getPlayer(playerSource):callClient("startCarInfoList", true, "offroad")
					for _, car in pairs(carTable) do
						if car["category"] == "offroad" then							
							local carName = car["name"]
							local tankart = getTankartName(tostring(car["tankart"]))
							if car["paintjob"] == true then paintjob = "Verf"..uuml.."gbar" else paintjob = "Nicht verf"..uuml.."gbar" end
							local text = "Auto: "..carName.."
Preis: "..tostring(car["preis"]).."$
T"..Uuml.."V-Klasse: "..tostring(car["TUV"]).."
Tankvolumen: "..tostring(car["tank"]).."l
Tankart: "..tankart.."
Sicherheitsklasse: "..tostring(car["safty"]).."
Paintjob: "..paintjob
							local id = car["id"]
							CORE:getPlayer(playerSource):callClient("fillCarInfoList", carName, text, id)
						end
					end
				end
				if source == autokauf[5] then
					CORE:getPlayer(playerSource):callClient("startCarInfoList", true, "trailer")
					for _, car in pairs(carTable) do
						if car["category"] == "trailer" then
							local carName = car["name"]
							local tankart = getTankartName(tostring(car["tankart"]))
							if car["paintjob"] == true then paintjob = "Verf"..uuml.."gbar" else paintjob = "Nicht verf"..uuml.."gbar" end
							local text = "Auto: "..carName.."
Preis: "..tostring(car["preis"]).."$
T"..Uuml.."V-Klasse: "..tostring(car["TUV"]).."
Tankvolumen: "..tostring(car["tank"]).."l
Tankart: "..tankart.."
Sicherheitsklasse: "..tostring(car["safty"]).."
Paintjob: "..paintjob
							local id = car["id"]
							CORE:getPlayer(playerSource):callClient("fillCarInfoList", carName, text, id)
						end
					end
				end
				if source == autokauf[6] then
					CORE:getPlayer(playerSource):callClient("startCarInfoList", true, "wang")
					for _, car in pairs(carTable) do
						if car["category"] == "normal" then
							local carName = car["name"]
							local tankart = getTankartName(tostring(car["tankart"]))
							if car["paintjob"] == true then paintjob = "Verf"..uuml.."gbar" else paintjob = "Nicht verf"..uuml.."gbar" end
							local text = "Auto: "..carName.."
Preis: "..tostring(car["preis"]).."$
T"..Uuml.."V-Klasse: "..tostring(car["TUV"]).."
Tankvolumen: "..tostring(car["tank"]).."l
Tankart: "..tankart.."
Sicherheitsklasse: "..tostring(car["safty"]).."
Paintjob: "..paintjob
							local id = car["id"]
							CORE:getPlayer(playerSource):callClient("fillCarInfoList", carName, text, id)
						end
					end
				end
				if source == autokauf[7] then
					CORE:getPlayer(playerSource):callClient("startCarInfoList", true, "ottos")
					for _, car in pairs(carTable) do
						if car["category"] == "luxus" or car["category"] == "sport" then
							local carName = car["name"]
							local tankart = getTankartName(tostring(car["tankart"]))
							if car["paintjob"] == true then paintjob = "Verf"..uuml.."gbar" else paintjob = "Nicht verf"..uuml.."gbar" end
							local text = "Auto: "..carName.."
Preis: "..tostring(car["preis"]).."$
T"..Uuml.."V-Klasse: "..tostring(car["TUV"]).."
Tankvolumen: "..tostring(car["tank"]).."l
Tankart: "..tankart.."
Sicherheitsklasse: "..tostring(car["safty"]).."
Paintjob: "..paintjob
							local id = car["id"]
							CORE:getPlayer(playerSource):callClient("fillCarInfoList", carName, text, id)
						end
					end
				end
				if source == autokauf[8] then
					CORE:getPlayer(playerSource):callClient("startCarInfoList", true, "air")
					for _, car in pairs(carTable) do
						if car["category"] == "air" then							
							local carName = car["name"]
							local tankart = getTankartName(tostring(car["tankart"]))
							if car["paintjob"] == true then paintjob = "Verf"..uuml.."gbar" else paintjob = "Nicht verf"..uuml.."gbar" end
							local text = "Auto: "..carName.."
Preis: "..tostring(car["preis"]).."$
T"..Uuml.."V-Klasse: "..tostring(car["TUV"]).."
Tankvolumen: "..tostring(car["tank"]).."l
Tankart: "..tankart.."
Sicherheitsklasse: "..tostring(car["safty"]).."
Paintjob: "..paintjob
							local id = car["id"]
							CORE:getPlayer(playerSource):callClient("fillCarInfoList", carName, text, id)
						end
					end
				end
				if source == autokauf[9] then
					CORE:getPlayer(playerSource):callClient("startCarInfoList", true, "boat")
					for _, car in pairs(carTable) do
						if car["category"] == "boat" then
							local carName = car["name"]
							local tankart = getTankartName(tostring(car["tankart"]))
							if car["paintjob"] == true then paintjob = "Verf"..uuml.."gbar" else paintjob = "Nicht verf"..uuml.."gbar" end
							local text = "Auto: "..carName.."
Preis: "..tostring(car["preis"]).."$
T"..Uuml.."V-Klasse: "..tostring(car["TUV"]).."
Tankvolumen: "..tostring(car["tank"]).."l
Tankart: "..tankart.."
Sicherheitsklasse: "..tostring(car["safty"]).."
Paintjob: "..paintjob
							local id = car["id"]
							CORE:getPlayer(playerSource):callClient("fillCarInfoList", carName, text, id)
						end
					end
				end	
			end	
		end
	end
end

function carsaleserver(carid, carShop)
	if carid and carShop then
		local carPrice = getCarPrice(carid)
		local carID = carid
		createCar(client, carID, carPrice, carShop)
	end
end

function createCar(buyer, carid, price, carShop)
	if getPlayerMoney(buyer) > price then
		takePlayerMoney(buyer, price)
		giveStaatsKasse(price)
		--Fahrzeug erstellen	
		local x,y,z,rx,ry,rz = 0,0,0,0,0,0
		if carShop == "ottos" then
			x,y,z,rx,ry,rz = -1769.0755615234, 1204.7950439453, 24.804708480835, 359.99987792969, 0.0001220703125, 179.55834960938
		elseif carShop == "wang" then
			x,y,z,rx,ry,rz = -1921.048828125, 303.81402587891, 40.87833404541, 359.96398925781, 359.99993896484, 270.16351318359
		elseif carShop == "offroad" then
			x,y,z,rx,ry,rz = 2148.5395507813, -1134.0451660156, 25.294622421265, 0.0419921875, 359.70422363281, 266.7744140625
		elseif carShop == "bike" then
			x,y,z,rx,ry,rz = 2186.0029296875, 1392.0849609375, 10.443153381348, 359.57153320313, 359.99450683594, 89.27490234375
		elseif carShop == "boat" then
			--x,y,z,rx,ry,rz = -2232.9780273438, 2391.9721679688, 0.21841007471085, 1.3773193359375, 359.9697265625, 43.443298339844
			x,y,z,rx,ry,rz = -2217.39453, 2427.41968, 0.44670, 0, 0, 270+45
		elseif carShop == "truck" then
			x,y,z,rx,ry,rz = 502.833984375, 2351.5185546875, 30.647155761719, 0.604248046875, 53.42468261719, 233.49792480469
		elseif carShop == "van" then
			x,y,z,rx,ry,rz = 549.2841796875, -1265.0048828125, 17.26469039917, 0.5767822265625, 0.0054931640625, 307.29858398438
		elseif carShop == "trailer" then
			x,y,z,rx,ry,rz = 2305.03125, -2378.052734375, 13.571382522583, 0.5657958984375, 0.0054931640625, 132.36877441406
		elseif carShop == "air" then
			x,y,z,rx,ry,rz = 335.4453125, 2503.380859375, 16.921041488647, 0, 0, 88.692626953125
		end
		carid = tonumber(carid)
		createVehicleMTARL(carid, x, y, z, rx, ry, rz, buyer)
	else
		sendPlayerInfo(buyer, "Du hast nicht genug Geld für den Kauf!", true)
	end
end

function getCarPrice(carid)
	if carid then
		local carTableID = tonumber(carid) - 399
		if carTable[carTableID] then
			if carTable[carTableID]["preis"] then 
				return carTable[carTableID]["preis"] 
			end	
		end
	end	
	return false
end

function getTankartName(tankart)
	if tankart == "diesel" then
		return "Diesel"
	elseif tankart == "benzin" then
		return "Benzin"
	elseif tankart == "super" then
		return	"Super"
	elseif tankart == "superP" then
		return "Super Plus"
	elseif tankart == "boot" then
		return "Bootsdiesel"
	elseif tankart == "kerosin" then
		return "Kerosin"
	else
		return "Falsche Eingabe"
	end
end
