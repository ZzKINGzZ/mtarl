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



--rooms: asia, bad, normal, hardcore
local ausgang
local eingang 

--
--setPedAnimation(cj,"sex","sex_1_cum_p",1,true,false)
--setPedAnimation(slut,"sex","sex_1_cum_w",1,true,false)

local function warpAround(element, dimension)
	if dimension then
		if getElementType(element) == "player" then
			if g_playerstat[element]["Level"] == "Admin" then
				if source == eingang then
					setElementPosition(element, 960.25891113281, -53.195514678955, 1000.063659668)
					setElementInterior(element, 3)
					setElementDimension(element, 666)
				elseif source == ausgang then
				
				end
			else
				sendPlayerInfo(element, "Diese Anstalt ist zur Zeit geschlossen.", true)
			end
		end
	end
end

local function laufhausInit()
	local obj = createObject(2395, 968.34094238281, -51.486461639404, 1000.1245727539, 0, 0, 267.27648925781)
	setElementInterior(obj, 3)
	setElementDimension(obj, 666)
	obj = createObject(2395, 968.34094238281, -51.486461639404, 1001.1245727539, 0, 0, 267.27648925781)
	setElementInterior(obj, 3)
	setElementDimension(obj, 666)
	
	local barriere = createObject(8674, 956.04925537109, -51.131057739258, 1001.5841064453, 0, 0, 270.14477539063)
	setElementAlpha(barriere, 0)
	setElementInterior(obj, 3)
	setElementDimension(obj, 666)
	
	ausgang = createMarker(966.25891113281, -53.195514678955, 1000.063659668, "cylinder", 1.5, 255, 0, 0, 200)
	setElementInterior(ausgang, 3)
	setElementDimension(ausgang, 666)
	addEventHandler("onMarkerHit", ausgang, warpAround)
	eingang = createMarker(693.807, 1964.6035, 4.539, "cylinder", 1.5, 255, 0, 0, 200)
	addEventHandler("onMarkerHit", eingang, warpAround)
end
addEventHandler('onResourceStart', getResourceRootElement(), laufhausInit)
