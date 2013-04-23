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



local waterShader

function setWaterEffectsEnabled(toggle)
	if toggle == true then
		waterShaderCreate()
		addEventHandler("onClientGeneralTimer", getRootElement(), waterUpdateShader)
	else
		engineRemoveShaderFromWorldTexture(waterShader, "waterclear256")
		removeEventHandler("onClientGeneralTimer", getRootElement(), waterUpdateShader)
	end
end

function waterShaderCreate()
	waterShader = dxCreateShader("./files/shader/water.fx")
	
	local textureVol = dxCreateTexture("./files/shader/images/smallnoise3d.dds")
	local textureCube = dxCreateTexture("./files/shader/images/cube_env256.dds")
	dxSetShaderValue(waterShader, "microflakeNMapVol_Tex", textureVol)
	dxSetShaderValue(waterShader, "showroomMapCube_Tex", textureCube)
	
	engineApplyShaderToWorldTexture(waterShader, "waterclear256")
end


function waterUpdateShader()
	if waterShader then
		local r,g,b,a = getWaterColor()
		dxSetShaderValue (waterShader, "gWaterColor", r/255, g/255, b/255, a/255 )
	end
end
