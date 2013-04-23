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



--[[local tReported = {}

local function onClientInfo(sMessage, nLevel, sFile, nLine)
	if sFile and nLine then
		--Sicherung das wir nicht den Server flooden, also nur einmal senden!
		if not tReported[sFile..":"..nLine] then
			tReported[sFile..":"..nLine] = true
			--server.onClientInfoRecieve(sMessage, nLevel, sFile, nLine)
			rpcCallServerFunction("onClientInfoRecieve", sMessage, nLevel, sFile, nLine)
		end	
	end	
end
addEventHandler("onClientDebugMessage", getResourceRootElement(getThisResource()), onClientInfo)--]]
