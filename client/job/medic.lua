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



local deadTime = 0
local shader
local screen
local imgX,imgY = guiGetScreenSize()

function medicStartDeadTimer(toggle)
	if toggle == true then
		shader = dxCreateShader("./files/shader/color.fx")
		screen = dxCreateScreenSource(imgX,imgY)
		dxSetShaderValue(shader, "gColorRedFactor", 1, 1, 1)
		dxSetShaderValue(shader, "gColorGreenFactor", 1, 1, 1)
		dxSetShaderValue(shader, "gColorBlueFactor", 1, 1, 1)
		dxSetShaderValue(shader, "gTexture", screen)
		addEventHandler("onClientGeneralTimer", getRootElement(), medicChageDeadTime)
		deadTime = 150
		addEventHandler("onClientHUDRender", getRootElement(), medicDeadTextDisplay)
	else
		removeEventHandler("onClientHUDRender", getRootElement(), medicDeadTextDisplay)
		removeEventHandler("onClientGeneralTimer", getRootElement(), medicChageDeadTime)
		setCameraTarget(localPlayer, localPlayer)
	end
end

function medicDeadTextDisplay()
	local x, y, z = getElementPosition(localPlayer)
	setCameraMatrix ( x-3, y-3, z+4 , x, y, z)
	dxSetRenderTarget()
	dxUpdateScreenSource(screen)
	dxDrawImage(0, 0, imgX,imgY, shader)
	dxDrawText("Noch "..tostring(deadTime).."s bis zum Tod!",705.0,737.0,1169.0,787.0,tocolor(255,0,0,160),3.0,"clear","left","top",false,false,false)
end

function medicChageDeadTime()
	if deadTime > 1 then
		deadTime = deadTime - 1
	else
		medicStartDeadTimer(false)
		rpcCallServerFunction("medicOnPlayerDeadTimerKill")
	end
end
