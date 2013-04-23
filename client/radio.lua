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



local radiostations = {}
local localPlayer = getLocalPlayer()
--local vehicleSounds = {}
--local localsound
--local sound
--local lastchange
--local change
local soundvolume = 0.5
local stream 
local canChange = true

local function initalizeRadio()
	lastchange = getTickCount()
	
	bindKey("radio_next", "down", radioChange, "next")
	bindKey("radio_previous", "down", radioChange, "prev")
	
	bindKey("m", "down", radioVolumen, "up")
	bindKey("n", "down", radioVolumen, "down")
	
	setRadioChannel(0)
	
	addRadioStation("1Live", "http://gffstream.ic.llnwd.net/stream/gffstream_stream_wdr_einslive_a")
	addRadioStation("WDR 2", "http://gffstream.ic.llnwd.net/stream/gffstream_w17a")	
	addRadioStation("Technobase FM", "http://listen.technobase.fm/tunein-dsl-asx")
	addRadioStation("Housetime FM", "http://listen.housetime.fm/tunein-dsl-asx")
	addRadioStation("Hardbase FM", "http://listen.hardbase.fm/tunein-dsl-asx")
	addRadioStation("Trancebase FM", "http://listen.trancebase.fm/tunein-dsl-asx")
	addRadioStation("Coretime FM", "http://listen.coretime.fm/tunein-dsl-asx")
	addRadioStation("Blackbeats FM", "http://stream.blackbeatslive.de/")
	addRadioStation("Rautemusik FM", "http://main-high.rautemusik.fm/")
	addRadioStation("Rautemusik Club", "http://club-high.rautemusik.fm")
	addRadioStation("Rautemusik eXTreMe", "http://extreme-high.rautemusik.fm")
	addRadioStation("Rautemusik JaM", "http://jam-high.rautemusik.fm")
	addRadioStation("Rautemusik FunkY", "http://funky-high.rautemusik.fm")
	addRadioStation("Rautemusik Lounge", "http://lounge-high.rautemusik.fm")
	addRadioStation("Rautemusik Goldies", "http://goldies-high.rautemusik.fm")
	addRadioStation("Rautemusik HardeR", "http://harder-high.rautemusik.fm")
	addRadioStation("Rautemusik Oriental", "http://oriental-high.rautemusik.fm")
	addRadioStation("Rautemusik Big City Beats", "http://bcb-high.rautemusik.fm")
	addRadioStation("Rautemusik Schlager", "http://schlager-high.rautemusik.fm")
	addRadioStation("sky.fm Country", "http://scfire-ntc-aa04.stream.aol.com:80/stream/1019")
	addRadioStation("Kronehit.at", "http://onair.krone.at/kronehit-hd.mp3")
end
addEventHandler('onClientResourceStart', getResourceRootElement(), initalizeRadio)

function addRadioStation(name, stream)
	local radio = {}
	radio["name"] = name
	radio["stream"] = stream
	
	table.insert(radiostations, radio)
end

local function radioSwitch(station)
	if station ~= 0 then
		setRadioChannel(0)
	end	
	cancelEvent()
end
addEventHandler("onClientPlayerRadioSwitch", localPlayer, radioSwitch)

local function enterVehicleRadio(vehicle, seat)
	setRadioChannel(0)
	
	local curID = getElementData(vehicle, "radioChannel")
	if curID ~= 0 then
		if stream then 
			destroyElement(stream) 
			stream = nil
		end
		
		stream = playSound(radiostations[curID]["stream"])
		setSoundVolume(stream, soundvolume) 
		canChange = false
	else
		canChange = true
	end
end
addEventHandler("onClientPlayerVehicleEnter", localPlayer, enterVehicleRadio)

local function exitVehicleRadio(vehicle, seat)
	local curID = getElementData(vehicle, "radioChannel")
	if curID ~= 0 then
		if stream then 
			destroyElement(stream) 
			stream = nil
		end
		canChange = true	
	end	
end
addEventHandler("onClientPlayerVehicleExit", localPlayer, exitVehicleRadio)

local function streamIsReady(success, length, streamName)
	if source == stream then
		canChange = true
	end
end
addEventHandler("onClientSoundStream", root, streamIsReady)

local function dataChangeRadio(dataname, oldVar)
	if dataname == "radioChannel" then
		if getPedOccupiedVehicle(localPlayer) == source then
			if stream then 
				destroyElement(stream) 
				stream = nil
			end
			
			local curID = getElementData(source, "radioChannel")
			if curID then
				if curID ~= 0 then
					--if stream then destroyElement(stream) end
					stream = playSound(radiostations[curID]["stream"])
					setSoundVolume(stream, soundvolume)
					guiSetText(g_radio["label"], radiostations[curID]["name"])
					local x, y = guiGetScreenSize()
					local extent = guiLabelGetTextExtent(g_radio["label"])
					if x and extent then
						local pos = ((x*0.5)-(extent*0.5))
						guiSetPosition (g_radio["label"], pos, 0.1*y, false)
					end
					guiSetVisible(g_radio["label"], true)
					g_radio["time"] = 0
				else
					canChange = true
					guiSetText(g_radio["label"], "Radio aus")
					guiSetPosition (g_radio["label"], 0.4, 0.1, true)
					guiSetVisible(g_radio["label"], true)
					g_radio["time"] = 0
				end				
			end	
			

		end
	end
end
addEventHandler("onClientElementDataChange", getRootElement(), dataChangeRadio)

function radioChange(key, keyState, arg)
	setRadioChannel(0)
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if vehicle then
		if getVehicleController(vehicle) == localPlayer then
			local curID = getElementData(vehicle, "radioChannel")
			if curID then
				if canChange then
					local curID = getElementData(vehicle, "radioChannel")
					if arg == "next" then
						if curID == #radiostations then
							setElementData(vehicle, "radioChannel", 0)
							return true
						end
						local nextID = curID + 1
						setElementData(vehicle, "radioChannel", nextID, true)	
						canChange = false
					else
						if curID == 0 then
							local radiostationsS = #radiostations
							setElementData(vehicle, "radioChannel", radiostationsS)
							return true
						end
						local nextID = curID - 1
						setElementData(vehicle, "radioChannel", nextID, true)	
						canChange = false
					end
				end
			end	
		end
	end
end

local function radioShowTimer()
	if g_radio["time"] then
		if g_radio["time"] > -1 then
			g_radio["time"] = g_radio["time"] + 1
			if g_radio["time"] == 3 then
				guiSetVisible(g_radio["label"], false)
				if guiGetVisible(g_radio["label_volume"]) then
					guiSetVisible(g_radio["label_volume"], false)
					guiSetVisible(g_radio["volume"], false)
				else
					guiSetVisible(g_radio["label_volume"], false)
					guiSetVisible(g_radio["volume"], false)
				end
				g_radio["time"] = -1
			end
		end
	end	
end
addEventHandler("onClientGeneralTimer", getRootElement(), radioShowTimer)

function radioVolumen(key, keyState, arg)
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if vehicle then
		if stream then
			local progress = guiProgressBarGetProgress(g_radio["volume"])
			local vol = progress/100
			if arg == "up" then
				if vol ~= 1 then
					local newvol = vol + 0.05
					setSoundVolume(stream, newvol)
					soundvolume = newvol
					change = 2
					g_radio["time"] = 1
					guiProgressBarSetProgress(g_radio["volume"],progress+5)
					guiSetVisible(g_radio["label_volume"], true)
					guiSetVisible(g_radio["volume"], true)
				end
			end
			
			if arg == "down" then
				if vol  ~= 0 then
					local newvol = vol - 0.05
					setSoundVolume(stream, newvol)
					soundvolume = newvol
					change = 2
					g_radio["time"] = 1
					guiProgressBarSetProgress(g_radio["volume"],progress-5)
					guiSetVisible(g_radio["label_volume"], true)
					guiSetVisible(g_radio["volume"], true)				
				end		
			end
		end
	end
end

--[[
function enterVehicleRadio(vehicle, seat)
	setRadioChannel(0)
	
	local curID = getElementData(vehicle, "radioChannel")
	if curID ~= 0 then
		if localsound then 
			destroyElement(localsound)
			localsound = nil
		end
		localsound = playSound(radiostations[curID]["stream"])
		
		--Destroy au"..szlig.."ensound, weil es einfach nur schei"..szlig.."e klingt :D
		if vehicleSounds[vehicle] then
			destroyElement(vehicleSounds[vehicle])
			vehicleSounds[vehicle] = nil
		end	
	end
end
addEventHandler("onClientPlayerVehicleEnter", localPlayer, enterVehicleRadio)

function exitVehicleRadio(vehicle, seat)
	if localsound then
		destroyElement(localsound)
		localsound = nil
	end
	
	local curID = getElementData(vehicle, "radioChannel")
	--Recreate
	if curID then
		if curID == 0 then return false end
		if not vehicleSounds[vehicle] then
			if radiostations[curID]["stream"] then
				sound = playSound3D(radiostations[curID]["stream"], 0, 0, 0)
				attachElements(sound, vehicle)
				setSoundMinDistance(sound, 8)
				setSoundMaxDistance(sound, 30)
				--setSoundVolume(sound, 0.5)
			end	
				
			vehicleSounds[vehicle] = sound	
		end
	end	
end
addEventHandler("onClientPlayerVehicleExit", localPlayer, exitVehicleRadio)

function radioChange(key, keyState, arg)
	setRadioChannel(0)
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if vehicle then
		if getVehicleController(vehicle) == localPlayer then
			local curID = getElementData(vehicle, "radioChannel")
			if curID then
				local tickcount = getTickCount()
				local check = tickcount - lastchange
				if check > 600 then
					if arg == "next" then
						if curID == #radiostations then
							setElementData(vehicle, "radioChannel", 0)
							return true
						end
						local nextID = curID + 1
						setElementData(vehicle, "radioChannel", nextID, true)
					else
						if curID == 0 then
							local radiostationsS = #radiostations
							setElementData(vehicle, "radioChannel", radiostationsS)
							return true
						end
						local nextID = curID - 1
						setElementData(vehicle, "radioChannel", nextID, true)
					end
					setSoundVolume(localsound, soundvolume)
					lastchange = getTickCount()
				end	
			end	
		end
	end
end

function dataChangeRadio(dataname, oldVar)
	if dataname == "radioChannel" then
		local curID = getElementData(source, "radioChannel")
		
		if curID then
			
			if curID == 0 then
				if vehicleSounds[source] then
					destroyElement(vehicleSounds[source])
					vehicleSounds[source] = nil
					return true
				end		
			end
			
			local vehicle = getPedOccupiedVehicle(localPlayer)
			if vehicle then
				if vehicle == source then
					if localsound then
						destroyElement(localsound)
						localsound = nil
					end	
					if curID ~= 0 then
						localsound = playSound(radiostations[curID]["stream"])
						setSoundVolume(localsound, soundvolume)
						guiSetText(g_radio["label"], radiostations[curID]["name"])
						local x, y = guiGetScreenSize()
						local extent = guiLabelGetTextExtent (g_radio["label"])
						if x and extent then
							local pos = ((x*0.5)-(extent*0.5))
							guiSetPosition (g_radio["label"], pos, 0.1*y, false)
						end
					else
						guiSetText(g_radio["label"], "Radio aus")
						guiSetPosition (g_radio["label"], 0.4, 0.1, true)
					end

					guiSetVisible(g_radio["label"], true)
					change = 1
					g_radio["time"] = 1
				else
					if vehicleSounds[source] then
						destroyElement(vehicleSounds[source])
						vehicleSounds[source] = nil
					end	
				
					sound = playSound3D(radiostations[curID]["stream"], 0, 0, 0)
					attachElements(sound, source)
					setSoundMinDistance(sound, 8)
					setSoundMaxDistance(sound, 30)
											
					vehicleSounds[source] = sound				
				end
			end	
		end		
	end
end
addEventHandler("onClientElementDataChange", getRootElement(), dataChangeRadio)

function vehicleStreamInRadio()
	if getElementType(source) == "vehicle" then
		local curID = getElementData(source, "radioChannel")
		if curID then
		
			if curID == 0 then
				if vehicleSounds[source] then
					destroyElement(vehicleSounds[source])
					vehicleSounds[source] = nil
				end
			else
				sound = playSound3D(radiostations[curID]["stream"], 0, 0, 0)
				attachElements(sound, source)
				setSoundMinDistance(sound, 8)
				setSoundMaxDistance(sound, 30)
				
				vehicleSounds[source] = sound
			end	
		end	
	end
end
addEventHandler("onClientElementStreamIn", getRootElement(), vehicleStreamInRadio)

function vehicleStreamOutRadio()
	if getElementType(source) == "vehicle" then
		if vehicleSounds[source] then
			destroyElement(vehicleSounds[source])
			vehicleSounds[source] = nil
		end
	end
end
addEventHandler("onClientElementStreamOut", getRootElement(), vehicleStreamOutRadio)

function radioShowTimer()
	if g_radio["time"] then
		if g_radio["time"] > -1 then
			g_radio["time"] = g_radio["time"] + 1
			if g_radio["time"] == 3 then
				if change == 1 then
					guiSetVisible(g_radio["label"], false)
					if guiGetVisible(g_radio["label_volume"]) then
						guiSetVisible(g_radio["label_volume"], false)
						guiSetVisible(g_radio["volume"], false)
					end
				else
					guiSetVisible(g_radio["label_volume"], false)
					guiSetVisible(g_radio["volume"], false)
				end
				g_radio["time"] = -1
			end
		end
	end	
end
addEventHandler("onClientGeneralTimer", getRootElement(), radioShowTimer)

function changeRadioMTARL(toggle)
	if toggle == true then
		addRadioStation("MTA:RL", "dns.werni-host.de:8000")
	else
		local radio = {}
		radio["name"] = "MTA:RL"
		radio["stream"] = "dns.werni-host.de:8000"
		
		table.remove(radiostations, radio)
	end
end

function vehicleDestroyRadio()
	if getElementType(source) == "vehicle" then
		if isElementStreamedIn(source) then
			if vehicleSounds[source] then
				destroyElement(vehicleSounds[source])
				vehicleSounds[source] = nil
			end	

			if getPedOccupiedVehicle(getLocalPlayer()) then
				if localsound then
					destroyElement(localsound)
					localsound = nil
				end	
			end
		end
	end
end
addEventHandler("onClientElementDestroy", getRootElement(), vehicleDestroyRadio)--]]
