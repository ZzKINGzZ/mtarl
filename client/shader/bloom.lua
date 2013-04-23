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



function setBloomEffectsEnabled(toggle)
	if toggle == true then
		bloomShaderCreate()
		addEventHandler( "onClientHUDRender", getRootElement(), bloomRenderFunction)
	else
		removeEventHandler( "onClientHUDRender", getRootElement(), bloomRenderFunction)
	end
end

local scx, scy = guiGetScreenSize()
local myScreenSource

-----------------
--Einstellungen--
-----------------
Settings = {}
Settings.var = {}
Settings.var.cutoff = 0.08
Settings.var.power = 1.88
Settings.var.bloom = 3.0
Settings.var.blendR = 204
Settings.var.blendG = 153
Settings.var.blendB = 130
Settings.var.blendA = 140

function bloomShaderCreate()
    myScreenSource = dxCreateScreenSource( scx/2, scy/2 )

    blurHShader,tecName = dxCreateShader( "./files/shader/blurH.fx" )
    blurVShader,tecName = dxCreateShader( "./files/shader/blurV.fx" )
    brightPassShader,tecName = dxCreateShader( "./files/shader/brightPass.fx" )
    addBlendShader,tecName = dxCreateShader( "./files/shader/addBlend.fx" )

	bAllValid = myScreenSource and blurHShader and blurVShader and brightPassShader and addBlendShader

	if not bAllValid then
		showInfoMessage( "Dieser Effect ist mit deiner Hardware nicht Kompatibel")
	end
end

function bloomRenderFunction()
	if not Settings.var then
		return
	end
    if bAllValid then
		-- Reset render target pool
		RTPool.frameStart()

		-- Update screen
		dxUpdateScreenSource( myScreenSource )

		-- Start with screen
		local current = myScreenSource

		-- Apply all the effects, bouncing from one render target to another
		current = applyBrightPass( current, Settings.var.cutoff, Settings.var.power )
		current = applyDownsample( current )
		current = applyDownsample( current )
		current = applyGBlurH( current, Settings.var.bloom )
		current = applyGBlurV( current, Settings.var.bloom )

		-- When we're done, turn the render target back to default
		dxSetRenderTarget()

		-- Mix result onto the screen using 'add' rather than 'alpha blend'
		dxSetShaderValue( addBlendShader, "tex0", current )
		local col = tocolor(Settings.var.blendR, Settings.var.blendG, Settings.var.blendB, Settings.var.blendA)
		dxDrawImage( 0, 0, scx, scy, addBlendShader, 0,0,0, col )
       end
end

------------------------------
--Apply the different stages--
------------------------------
function applyDownsample( Src, amount )
	amount = amount or 2
	local mx,my = dxGetMaterialSize( Src )
	mx = mx / amount
	my = my / amount
	local newRT = RTPool.GetUnused(mx,my)
	dxSetRenderTarget( newRT )
	dxDrawImage( 0, 0, mx, my, Src )
	return newRT
end

function applyGBlurH( Src, bloom )
	local mx,my = dxGetMaterialSize( Src )
	local newRT = RTPool.GetUnused(mx,my)
	dxSetRenderTarget( newRT, true ) 
	dxSetShaderValue( blurHShader, "tex0", Src )
	dxSetShaderValue( blurHShader, "tex0size", mx,my )
	dxSetShaderValue( blurHShader, "bloom", bloom )
	dxDrawImage( 0, 0, mx, my, blurHShader )
	return newRT
end

function applyGBlurV( Src, bloom )
	local mx,my = dxGetMaterialSize( Src )
	local newRT = RTPool.GetUnused(mx,my)
	dxSetRenderTarget( newRT, true ) 
	dxSetShaderValue( blurVShader, "tex0", Src )
	dxSetShaderValue( blurVShader, "tex0size", mx,my )
	dxSetShaderValue( blurVShader, "bloom", bloom )
	dxDrawImage( 0, 0, mx,my, blurVShader )
	return newRT
end

function applyBrightPass( Src, cutoff, power )
	local mx,my = dxGetMaterialSize( Src )
	local newRT = RTPool.GetUnused(mx,my)
	dxSetRenderTarget( newRT, true ) 
	dxSetShaderValue( brightPassShader, "tex0", Src )
	dxSetShaderValue( brightPassShader, "cutoff", cutoff )
	dxSetShaderValue( brightPassShader, "power", power )
	dxDrawImage( 0, 0, mx,my, brightPassShader )
	return newRT
end


--------------------------
--Pool of render targets--
--------------------------
RTPool = {}
RTPool.list = {}

function RTPool.frameStart()
	for rt,info in pairs(RTPool.list) do
		info.bInUse = false
	end
end

function RTPool.GetUnused( mx, my )
	-- Find unused existing
	for rt,info in pairs(RTPool.list) do
		if not info.bInUse and info.mx == mx and info.my == my then
			info.bInUse = true
			return rt
		end
	end
	-- Add new
	local rt = dxCreateRenderTarget( mx, my )
	if rt then
		RTPool.list[rt] = { bInUse = true, mx = mx, my = my }
	end
	return rt
end
