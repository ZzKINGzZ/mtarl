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



--Generell
local timerCheck = 0

local function createFireForServer(x, y, z)
	rpcCallServerFunction("createFireBrigadeFire", x, y, z)
end

local function createFireInAreaByTimer()
	local nz	= math.random(1, 2)
	local pX, pY, pZ = getElementPosition(localPlayer)
	local createdFire = false
	if nz == 1 then
		for i = 0, 150 do
			local x = pX - 100 + i
			local ground = getGroundPosition (x, pY, pZ + 500)
			if ground > 0 then
				createFireForServer(x, pY, ground)
				createdFire = true
				break
			end
		end
	else
		for i = 0, 150 do
			local y = pX - 100 + i
			local ground = getGroundPosition (pX, y, pZ + 500)
			if ground > 0 then
				createFireForServer(pX, y, ground)
				createFire = true
				break
			end
		end		
	end
	
	--Wenn kein Feuer erstellt worden konnte
	--setzen wir die Zeit niedriger
	if not createFire then
		timerCheck = 500
	end
end
addCommandHandler("debugfire", createFireInAreaByTimer)


local function fireBrigadeTimer()
	timerCheck = timerCheck + 1
	if timerCheck == 900 then
		timerCheck = 0
		createFireInAreaByTimer()
	end
end	
addEventHandler("onClientGeneralTimer", root, fireBrigadeTimer)

--Feuerwehr
local isFireBrigade = false
local fireTable = {}

local function eventHandlerStartFire(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
	if weapon == 42 then
		if hitElement then
			if getElementType(hitElement) == "object" then
				local model = getElementModel(hitElement)
				if model == 2024 or model == 2022 or model == 2023 then
					local ti = getRealTime()
					local timeStampNow = ti.timestamp
					
					if not fireTable[hitElement] then
						fireTable[hitElement] = {}
						fireTable[hitElement]["start"] = timeStampNow
						fireTable[hitElement]["shooted"] = timeStampNow
					else
						local newTime = timeStampNow - fireTable[hitElement]["start"]
						fireTable[hitElement]["shooted"] = newTime
						if newTime > 10 then
							rpcCallServerFunction("changeFireBrigadeFire", hitElement)
							fireTable[hitElement] = nil
							cancelEvent()
						end
					end	
				end
			end
		end
	end	
end

function setPlayerInFireBrigadeJob(toggle)
	isFireBrigade = toggle
	if toggle == true then
		fireTable = nil
		fireTable = {}
		addEventHandler("onClientPlayerWeaponFire", localPlayer, eventHandlerStartFire)
	else
		fireTable = nil
		fireTable = {}
		removeEventHandler("onClientPlayerWeaponFire", localPlayer, eventHandlerStartFire)
	end
end
