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



addEvent("onClientGeneralTimer")
addEvent("onClientLogedInMTARL")

function initGeneral()
	setTimer(timeTimer, 1000, 0)
	setWaterColor(50, 50, 175, 175)
	engineSetAsynchronousLoading(true, true)
	
	guiSetInputMode("no_binds_when_editing")
	
	setAmbientSoundEnabled("general", false)
	setAmbientSoundEnabled("gunfire", false)
	
	--setFarClipDistance(2500) --Mehr nicht, sonst FPS Drop
	--outputChatBox(tostring(loadFont("./files/fonts/symbols.ttf", false, 20)))
	--loadFont("./files/fonts/symbols2.ttf", false, 20 )
end
addEventHandler("onClientResourceStart", getResourceRootElement(), initGeneral)

function timeTimer()
	triggerEvent("onClientGeneralTimer", getRootElement())
end
