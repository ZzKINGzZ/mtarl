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



Player = newclass("Player")

--Vars


--Functions
function Player:init(element)
	self.Element = element
	self.userID = -1
	self.level = "User"
end

--MTA:RL
function Player:setLevel(level)
	self.level = level
end

function Player:getLevel()
	return self.level
end

function Player:setUserID(id)
	self.userID = id
end

function Player:getUserID()
	return self.userID
end

--Call functions
function Player:callClient(theFunction, ...)
	rpcCallClientFunction(self.Element, theFunction, ...)
end

--Element
function Player:getData(key, inherit)
	return getElementData(self.Element, inherit or true)
end

function Player:getHealth()
	return getElementHealth(self.Element)
end

function Player:getPosition()
	return getElementPosition(self.Element)
end

function Player:getVelocity()
	return getElementVelocity(self.Element)
end

function Player:getInterior()
	return getElementInterior(self.Element)
end

function Player:getDimension()
	return getElementDimension(self.Element)
end

function Player:getZoneName(citiesonly)
	return getElementZoneName(self.Element, citiesonly or false)
end

function Player:isAttached()
	return isElementAttached(self.Element)
end

function Player:isInWater(model)
	return isElementInWater(self.Element)
end

function Player:getAlpha()
	return getElementAlpha(self.Element)
end

function Player:getModel()
	return getElementModel(self.Element)
end

function Player:setData(key, var, sync)
	if not sync then sync = true end
	return setElementData(self.Element, key, var, sync)
end

function Player:removeData(key)
	return removeElementData(self.Element, key)
end

function Player:setHealth(health)
	return setElementHealth(self.Element, health)
end

function Player:setPosition(x, y, z)
	return setElementPosition(self.Element, x, y, z)
end

function Player:setVelocity(x, y, z)
	return setElementVelocity(self.Element, x, y, z)
end

function Player:setInterior(interior)
	return setElementInterior(self.Element, interior)
end

function Player:setDimension(dimension)
	return setElementDimension(self.Element, dimension)
end

function Player:setModel(model)
	return setElementModel(self.Element, model)
end

--Input
function Player:bindKey(key, keyState, handlerFunction, ...)
	return bindKey(self.Element, key, keyState, handlerFunction, ...)
end

function Player:getControlState(control)
	return getControlState(self.Element, control)
end

function Player:setControlState(control, state)
	return setControlState(self.Element, control, state)
end	

function Player:toggleControl(controlname, toggled)
	return toggleControl(self.Element, controlname, toggled)
end

function Player:toggleAllControls(enabled, toggledGame, toggledMTA)
	if not toggledGame then toggledGame = true end
	if not toggledMTA then toggledMTA = true end
	toggleAllControls(self.Element, enabled, toggledGame, toggledMTA)
end

--Ped
function Player:getArmor()
	return getPedArmor(self.Element)
end

function Player:getFightingStyle()
	return getPedFightingStyle(self.Element)
end

function Player:getGravity()
	return getPedGravity(self.Element)
end

function Player:getOccupiedVehicle()
	return getPedOccupiedVehicle(self.Element)
end

function Player:getOccupiedVehicleSeat()
	return getPedOccupiedVehicleSeat(self.Element)
end

function Player:getStat(statname)
	return getPedStat(self.Element, statname)
end

function Player:getTarget()
	return getPedTarget(self.Element)
end

function Player:getTotalAmmo(curr)
	if not curr then
		return getPedTotalAmmo(self.Element)
	end
	return getPedTotalAmmo(self.Element, curr)
end

function Player:getWeapon(curr)
	if not curr then
		return getPedWeapon(self.Element)
	end
	return getPedWeapon(self.Element, curr)
end

function Player:getWeaponSlot()
	return getPedWeaponSlot(self.Element)
end

function Player:isChoking()
	return isPedChoking(self.Element)
end

function Player:isDead()
	return isPedDead(self.Element)
end

function Player:isDoingGangDriveby()
	return isPedDoingGangDriveby(self.Element)
end

function Player:isDucked()
	return isPedDucked(self.Element)
end

function Player:isFrozen()
	return isPedFrozen(self.Element)
end

function Player:isHeadless()
	return isPedHeadless(self.Element)
end

function Player:isInVehicle()
	return isPedInVehicle(self.Element)
end

function Player:isOnFire()
	return isPedOnFire(self.Element)
end

function Player:isOnGround()
	return isPedOnGround(self.Element)
end

function Player:kill()
	return killPed(self.Element)
end

function Player:reloadPedWeapon()
	return reloadPedWeapon(self.Element)
end

function Player:removeFromVehicle()
	return removePedFromVehicle(self.Element)
end

function Player:setAnimation(block, anim, theTime, loop, updatePos, interruptable)
	if not block then return setPedAnimation(self.Element) end
	if not anim then return setPedAnimation(self.Element, block) end
	if not theTime then return setPedAnimation(self.Element, block, anim) end
	if not loop then return setPedAnimation(self.Element, block, anim, theTime) end
	if not updatePos then return setPedAnimation(self.Element, block, anim, theTime, loop) end
	if not interruptable then return setPedAnimation(self.Element, block, anim, theTime, loop, updatePos) end
	return setPedAnimation(self.Element, block, anim, theTime, loop, updatePos, interruptable)
end

function Player:setArmor(armor)
	return setPedArmor(self.Element, armor)
end

function Player:setChocking(toggle)
	return setPedChocking(self.Element, toggle)
end

function Player:setDoingGangDriveby(toggle)
	return setPedDoingGangDriveby(self.Element, toggle)
end

function Player:setFightingStyle(style)
	return setPedFightingStyle(self.Element, style)
end	

function Player:setFrozen(toggle)
	return setPedFrozen(self.Element, toggle)
end

function Player:setHeadless(toggle)
	return setPedHeadless(self.Element, toggle)
end

function Player:setOnFire(toggle)
	return setPedOnFire(self.Element, toggle)
end

function Player:setStat(statname, value)
	return setPedStat(self.Element, statname, value)
end

function Player:getMoney()
	return getPlayerMoney(self.Element)
end

function Player:getNametagColor()
	return getPlayerNametagColor(self.Element)
end

function Player:getNametagText()
	return getPlayerNametagText(self.Element)
end

function Player:getVersion()
	return getPlayerVersion(self.Element)
end

function Player:getWantedLevel()
	return getPlayerWantedLevel(self.Element)
end

function Player:giveMoney(amount)
	return givePlayerMoney(self.Element, amount)
end

function Player:setMoney(amount)
	return setPlayerMoney(self.Element, amount)
end

function Player:setMuted(muted)
	return setPlayerMuted(self.Element, muted)
end

function Player:setNametagColor(r, g, b)
	if not r then return setPlayerNametagColor(self.Element, false) end
	return setPlayerNametagColor(self.Element, r, g, b)
end

function Player:setNametagText(text)
	return setPlayerNametagText(self.Element, text)
end

function Player:showHudComponent(component, toggle)
	return showPlayerHudComponent(self.Element, component, toggle)
end

function Player:setWantedLevel(level)
	return setPlayerWantedLevel(self.Element, level)
end

function Player:spawn(x, y, z, rotation, skinID, interior, dimension)
	if not rotation then return spawnPlayer(self.Element, x, y, z) end
	if not skinID then return spawnPlayer(self.Element, x, y, z, rotation) end
	if not interior then return spawnPlayer(self.Element, x, y, z, rotation, skinID) end
	if not dimension then return spawnPlayer(self.Element, x, y, z, rotation, skinID, interior) end
	return spawnPlayer(self.Element, x, y, z, rotation, skinID, interior, dimension)
end

function Player:takeMoney(amount)
	return takePlayerMoney(self.Element, amount)
end

function Player:getIP()
	return getPlayerIP(self.Element)
end

function Player:getSerial()
	return getPlayerSerial(self.Element)
end

function Player:giveWeapon(weapon, amount, current)
	if not current then return giveWeapon(self.Element, weapon, amount) end
	return giveWeapon(self.Element, weapon, amount, current)
end

function Player:getName()
	return getPlayerName(self.Element)
end

function Player:getRotation()
	return getPedRotation(self.Element)
end

function Player:isMuted()
	return isPlayerMuted(self.Element)
end
