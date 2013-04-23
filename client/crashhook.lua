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



--[[local fileHandler = nil

if fileExists("crashhook.txt") then
	fileHandler = fileCreate("crashhook.txt")
else
	fileHandler = fileOpen("crashhook.txt", false)
end

local function callCrashHook(event, line)
	outputChatBox(tostring(event).."|"..tostring(line))
	if fileHandler ~= nil then
		fileWrite(fileHandler, tostring(event).."|"..tostring(line).."
")
	end
end

debug.sethook(callCrashHook, "c")--]]
