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



function replaceMOD()
	--MTA:RL Werbeschild in Las Venturas
	local txd_floors = engineLoadTXD("files/mods/vgsn_billboard.txd")
	engineImportTXD(txd_floors, 7300)
	
	--Pool
	local txd_pool = engineLoadTXD("files/mods/schwimmbad.txd")
	engineImportTXD(txd_pool, 5390)
	
	--Mauer
	local txd_mauer = engineLoadTXD("files/mods/mauer.txd")
	engineImportTXD(txd_mauer, 8658)
	
	--Garage
	local txd_garage = engineLoadTXD("files/mods/oldgarage_sfse.txd")
	engineImportTXD(txd_garage, 11387)
	
	--Wang
	local txd_wang = engineLoadTXD("files/mods/carshow_sfse.txd")
	engineImportTXD(txd_wang, 11317)
	
	--[[Zaun
	local zaun = engineLoadDFF ("files/mods/pool.dff", 5415)
	engineReplaceModel(zaun, 5415)
	
	local zaunCol = engineLoadCol ("files/mods/pool.col", 5415)
	engineReplaceCol(zaunCol, 5415)--]]
end
addEventHandler('onClientResourceStart', getResourceRootElement(), replaceMOD)

--1903.8955078125 [number], -1399.5789794922 [number], 11.929999351501

function replaceModArea()

end

function restoreModArea()

end
