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



addEvent("rpcOnServerCallArrive", true)
addEvent("onClientPlayerReadyToPlay")

--Local
local nSecurityCode = -11

local function rpcProcessServerFunctionRequest(sFunctionname, ...)
	local tArguments = { ... }
	
	for mKey, mValue in next, tArguments do
		tArguments[mKey] = tonumber(mValue) or mValue
	end	

	if _G[sFunctionname] then
		_G[sFunctionname](unpack(tArguments))
	end
end
addEventHandler("rpcOnServerCallArrive", resourceRoot, rpcProcessServerFunctionRequest)

--Public
function rpcSetSecurityCode(p_nCode)
	nSecurityCode = p_nCode
	
	if not nSecurityCode then return false end
	
	rpcCallServerFunction("corePlayerReadyToPlay")
	
	triggerEvent("onClientPlayerReadyToPlay", localPlayer)
	return true
end

function rpcCallServerFunction(p_sFunctionname, ...)
	local tArguments = { ... }
	
	for mKey, mValue in next, tArguments do
		if type(mValue) == "number" then tArguments[mKey] = tostring(mValue) end
	end
	
	return triggerServerEvent("rpcOnClientCallArrive", resourceRoot, p_sFunctionname, nSecurityCode, unpack(tArguments or {}))
end 
