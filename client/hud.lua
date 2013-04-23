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



local hudvisible = 1
local x, y = guiGetScreenSize()

function initHud()
	bindKey("F5", "down", toggleHudModus)
end
addEventHandler('onClientResourceStart', getResourceRootElement(), initHud)

function toggleHudModus(key, keyState)
	if hudvisible == 1 then
		showPlayerHudComponent("ammo", false)
		showPlayerHudComponent("area_name", false)
		showPlayerHudComponent("armour", false)
		showPlayerHudComponent("breath", false)
		showPlayerHudComponent("clock", false)
		showPlayerHudComponent("health", false)
		showPlayerHudComponent("money", false)
		showPlayerHudComponent("radar", false)
		showPlayerHudComponent("weapon", false)
		showChat(false)
		hudvisible = 0
	else
		showPlayerHudComponent("ammo", true)
		showPlayerHudComponent("area_name", false)
		showPlayerHudComponent("armour", true)
		showPlayerHudComponent("breath", true)
		showPlayerHudComponent("clock", true)
		showPlayerHudComponent("health", true)
		showPlayerHudComponent("money", true)
		showPlayerHudComponent("radar", true)
		showPlayerHudComponent("weapon", true)
		showChat(true)
		hudvisible = 1	
	end
end
