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



function getOneVar(key)
	if not key then return false end
	local sql = "SELECT `val` FROM `onevar` WHERE `key` = '"..key.."';" 
	local res = mysql_query(g_mysql["connection"], sql)
	if not res then return false end
	local row = mysql_fetch_row(res)
	if not row then return false end
	mysql_free_result(res)
	return row[1]
end

function setOneVar(key, val)
	if not key or not val then return false end
	--INSERT INTO users (username, email) VALUES ('Jo', 'jo@email.com') ON DUPLICATE KEY UPDATE email = 'jo@email.com'
	local sql = "INSERT INTO `onevar` (`key`, `val`) VALUES ('"..key.."', '"..val.."') ON DUPLICATE KEY UPDATE `val` = '"..val.."';"
	local res = mysql_query(g_mysql["connection"], sql)
	if not res then return false end
	return true
end
