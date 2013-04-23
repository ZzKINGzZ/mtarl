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



local render = false
local tanke = false

local curtanke = {}
local tankcol = tocolor(255, 255, 0, 255)

function onTankstellenStart()
	for _, tankstelle in ipairs(getElementsByType("tankstelle")) do
		local colshape = getElementData(tankstelle, "colshape")
		addEventHandler("onClientColShapeHit", colshape, onTankstelleColshapeHit)
		addEventHandler("onClientColShapeLeave", colshape, onTankstelleColshapeLeave)
	end
end
addEventHandler('onClientResourceStart', getResourceRootElement(getThisResource()), onTankstellenStart)

local function renderTankstellenPreis()
	if render and tanke then
		local x, y = getScreenFromWorldPosition(curtanke["x"], curtanke["y"], curtanke["z"] + 2, 0, false)
		if x and y then
			local px, py, pz = getElementPosition(getLocalPlayer())
			local dis = getDistanceBetweenPoints3D(curtanke["x"], curtanke["y"], curtanke["z"], px, py, pz)
			local text = "Preise:
"
			if curtanke["benzinPreis"] > 0 then text = text.."Benzin: "..curtanke["benzinPreis"].."$
" end
			if curtanke["superPreis"] > 0 then text = text.."Super: "..curtanke["superPreis"].."$
" end
			if curtanke["superPPreis"] > 0 then text = text.."Super Plus: "..curtanke["superPPreis"].."$
" end
			if curtanke["dieselPreis"] > 0 then text = text.."Diesel: "..curtanke["dieselPreis"].."$
" end
			if curtanke["bootPreis"] > 0 then text = text.."Bootsdiesel: "..curtanke["bootPreis"].."$
" end
			if curtanke["kerosinPreis"] > 0 then text = text.."Kerosin: "..curtanke["kerosinPreis"].."$
" end
			dxDrawText(text, x, y, 0, 0, tankcol, (15 - dis) / 3)
		end	
	end
end

function onTankstelleColshapeHit(element, dimension)
	if element == getLocalPlayer() and dimension then
		render = true
		tanke = getElementData(source, "tankstelle")
		
		curtanke["x"], curtanke["y"], curtanke["z"] = getElementPosition(tanke)
	
		curtanke["benzinPreis"] = getElementData(tanke, "benzinPreis")
		curtanke["superPreis"] = getElementData(tanke, "superPreis")
		curtanke["superPPreis"] = getElementData(tanke, "superPPreis")
		curtanke["dieselPreis"] = getElementData(tanke, "dieselPreis")
		curtanke["bootPreis"] = getElementData(tanke, "bootPreis")
		curtanke["kerosinPreis"] = getElementData(tanke, "kerosinPreis")
		removeEventHandler("onClientRender", getRootElement(), renderTankstellenPreis)		
		addEventHandler("onClientRender", getRootElement(), renderTankstellenPreis)
	end	
end

function onTankstelleColshapeLeave(element, dimension)
	if element == getLocalPlayer() and dimension then
		render = false
		tanke = false
		removeEventHandler("onClientRender", getRootElement(), renderTankstellenPreis)
	end
end
