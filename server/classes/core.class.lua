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



Core = newclass("Core")

--Vars
Core.players = {}


--Functions
function Core:init()

end

function Core:getPlayer(element)
	return self.players[element] or false
end

function Core:addPlayer(element, playerID)
	self.players[element] = Player(element)
	return self.players[element]
end

function Core:removePlayer(element)
	self.players[element] = nil
	return true
end

function Core:playerExists(element)
	if self.players[element] then return true end
	return false
end
