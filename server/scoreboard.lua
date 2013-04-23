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



g_serverOnlineTime = "0"

function setPlayerScoreboardJob(player, jobName, jobColorR, jobColorG, jobColorB)
	if jobName == false then
		setElementData(player, "ScoreboardDienstR", 255, true)
		setElementData(player, "ScoreboardDienstG", 255, true)
		setElementData(player, "ScoreboardDienstB", 255, true)
		setElementData(player, "ScoreboardDienst", "Kein Dienst", true)
		return true
	else
		setElementData(player, "ScoreboardDienstR", jobColorR, true)
		setElementData(player, "ScoreboardDienstG", jobColorG, true)
		setElementData(player, "ScoreboardDienstB", jobColorB, true)
		setElementData(player, "ScoreboardDienst", jobName, true)
		return true		
	end
	
	return false
end

local function setServerOnlineTime()
	local theTime = getRealTime()
	if theTime.minute < 10 then
		theTime.minute = "0"..theTime.minute
	end
	local year = theTime.year + 1900
	local month = theTime.month + 1
	g_serverOnlineTime = theTime.monthday.."."..month.."."..tostring(year).."  "..theTime.hour..":"..theTime.minute.." Uhr"
end
addEventHandler('onResourceStart', getResourceRootElement(getThisResource()), setServerOnlineTime)
