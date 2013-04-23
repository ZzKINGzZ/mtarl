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



mysql_host = "localhost"
mysql_user = "root"
mysql_password = ""
mysql_table = "mtarl"

function checkMySQLCon()
	if not mysql_ping(g_mysql["connection"]) then
		outputServerLog("Verbindung zum MySQL Server verloren, versuche neue Verbindung aufzubauen...")
		mysql_close(g_mysql["connection"])
		g_mysql["connection"] = mysql_connect(mysql_host, mysql_user, mysql_password, mysql_table, 3306, nil, "")
		if g_mysql["connection"] then
			outputServerLog("Verbindung zum MySQL Server wieder aufgebaut!")
		else
			outputServerLog("Verbindung zum MySQL Server fehlgeschlagen!")
		end
	end
end
