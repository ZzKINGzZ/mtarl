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



local radio = 0

function toggeleRadioMTARL(playerSource)
	if g_playerstat[playerSource]["Level"] == "Admin" then
		if radio == 0 then
			radio = 1
			CORE:getPlayer(playerSource):callClient("changeRadioMTARL", true)
			outputChatBox(g_colors["limegreen"].."Radio gestartet...", playerSource, 0, 0, 0, true)
		else
			radio = 0
			CORE:getPlayer(playerSource):callClient("changeRadioMTARL", false)
			outputChatBox(g_colors["red"].."Radio gestoppt...", playerSource, 0, 0, 0, true)
		end
	end
end
--addCommandHandler("startstream", toggeleRadioMTARL)
--addCommandHandler("stopstream", toggeleRadioMTARL)
