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



local carShader

function setCarEffectsEnabled(toggle)
	if toggle == true then
		carShaderCreate()
	else
		if carShader then
			engineRemoveShaderFromWorldTexture(carShader, "vehiclegrunge256")
		end
	end
end

function carShaderCreate()
	carShader = dxCreateShader("./files/shader/car.fx")
	
	local textureVol = dxCreateTexture("./files/shader/images/smallnoise3d.dds")
	local textureCube = dxCreateTexture("./files/shader/images/cube_env256.dds")
	dxSetShaderValue(carShader, "microflakeNMapVol_Tex", textureVol)
	dxSetShaderValue(carShader, "showroomMapCube_Tex", textureCube)
	
	engineApplyShaderToWorldTexture(carShader, "vehiclegrunge256")
end
