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



local isOnHit = false
local hitTime = 0
local screenX, screenY = guiGetScreenSize()
local alphaDamage = 0

function startPlayerDamage()
	
end
addEventHandler('onClientResourceStart', getResourceRootElement(getThisResource()), startPlayerDamage)

function triggerPlayerDamage(attacker, wepaon, bodypart, loss)
	if not isOnHit then
		isOnHit = true
		hitTime = getTickCount()
		addEventHandler("onClientRender", getRootElement(), renderPlayerDamage)
	end
end
addEventHandler("onClientPlayerDamage", getLocalPlayer(), triggerPlayerDamage)

function renderPlayerDamage()
	local curHit = getTickCount()
	local timeHit = curHit - hitTime
	
	local x, y, z, lx, ly, lz, roll, fov = getCameraMatrix()
	--[[if timeHit < 200 then
		local newfov = fov - 0.5
		if newfov > 0 then
			setCameraMatrix(x, y, z, lx, ly, lz, roll, newfov)
		end	
	elseif timeHit > 200 then
		local newfov = fov + 0.5
		setCameraMatrix(x, y, z, lx, ly, lz, roll, newov)
		if newfov > 70 then
			hitTime = 0
			isOnHit = false
			removeEventHandler("onClientRender", getRootElement(), renderPlayerDamage)
			setCameraTarget(getLocalPlayer())
		end
	end--]]
	if timeHit < 50 then
		if alphaDamage < 255 then alphaDamage = alphaDamage + 50 end
		local redColor = tocolor(255, 0, 0, alphaDamage)
		dxDrawRectangle(0, 0, screenX, screenY, redColor)
	elseif timeHit > 50 then
		alphaDamage = alphaDamage - 50
		local redColor = tocolor(255, 0, 0, alphaDamage)
		dxDrawRectangle(0, 0, screenX, screenY, redColor)
		if alphaDamage < 1 then
			hitTime = 0
			isOnHit = false		
			removeEventHandler("onClientRender", getRootElement(), renderPlayerDamage)
		end	
	end
end
