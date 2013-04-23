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



g_playerstat = {}
local played = 0

local registerPed
local rot = 230
local loginSend = false
local forbiddenSkins = {3, 4, 5, 6, 8, 16, 27, 42, 61, 65, 70, 71, 74, 86, 119, 149, 153, 155, 167, 205, 208, 239, 260, 265, 266, 267, 268, 274, 273, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 294, 305, 309, 312}
local skin = 0

function setLoginSend(toggle)
	loginSend = toggle
end

function playerLogedInFunction()
	initalizePlayermenu()
	--initalizePlayerstatsMenu()
	
	triggerEvent("onClientLogedInMTARL", root)
end

function checkPlayers()
	rpcCallServerFunction("showPlayerCheck")
end
--Don't ever do this again, the server tells me when im finished!
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), checkPlayers)
 
function showRegister()
	local dim = math.random(0,99999)
	toggleHudModus()
	initalizeRegisterGUI()
	playSoundWelcome()
	played = 1
	guiSetVisible(g_registergui["window"], true)
	setCameraMatrix(2108.408203125, 1907.8408203125, 10.8203125, 2111.1796875, 1908.9, 10.8)
	registerPed = createPed(0, 2111.1796875, 1909.5556640625, 10.8203125)
	setElementRotation(registerPed, 0, 0, 230)
	setElementDimension(registerPed, dim)
	setElementDimension(localPlayer, dim)
	setWeather(2)
	setElementCollisionsEnabled(registerPed, false)
	guiMoveToBack(g_registergui["window"])
	showCursor(true)
	addEventHandler("onClientGUIClick", g_registergui["button_for"], showNextSkin)
	addEventHandler("onClientGUIClick", g_registergui["button_back"], showBackSkin)	
	addEventHandler("onClientGUIClick", g_registergui["button_ok"], checkRegister)
	addEventHandler("onClientRender", getRootElement(), registerRenderHandler)
	guiSetInputEnabled(true)
end

function registerRenderHandler()
	rot = rot + 0.3
	setElementRotation(registerPed, 0, 0, rot)
	setTime(22,0)
end

function showLogin(bool)
	--if played == 0 then
	--	playSoundWelcome()
	--end
	guiSetVisible(g_Logingui["IMG"], bool)
	showCursor(bool)
	if bool == true then
		addEventHandler('onClientGUIClick', g_Logingui["Login_Button"], checkLogin)
		guiSetInputEnabled(true)
	else
		removeEventHandler('onClientGUIClick', g_Logingui["Login_Button"], checkLogin)
		g_playerstat["Logedin"] = true
		guiSetInputEnabled(false)
	end	
end

local function changeAlpha()
	if source == g_Logingui["Username"] then
		guiSetAlpha(g_Logingui["Username"], 1)
		guiSetAlpha(g_Logingui["Password"], 0.5)
	elseif source == g_Logingui["Password"] then
		guiSetAlpha(g_Logingui["Username"], 0.5)
		guiSetAlpha(g_Logingui["Password"], 1)
	else
		guiSetAlpha(g_Logingui["Username"], 0.5)
		guiSetAlpha(g_Logingui["Password"], 0.5)	
	end
end

function playSoundWelcome()
	local sound = playSound("http://files.the-reallife-network.de/mtarl/server/sounds/join.mp3")
	setSoundVolume(sound, 0.5)
end

function ifSkinForbiddenSkin(skin)
	for index,value in ipairs(forbiddenSkins) do
		if(value == skin) then
			return true
		end
	end
	return false
end

function showNextSkin(button)
	setWeather(2)
	if source == g_registergui["button_for"] then
		if skin == 311 then
			skin = 0
		else
			skin = skin + 1
			if ifSkinForbiddenSkin(skin) then
				triggerEvent("onClientGUIClick", g_registergui["button_for"])
			end
		end
		setElementModel(registerPed, skin)
		guiSetText(g_registergui["label_skin"], tostring(skin))
	end	
end

function showBackSkin(button)
	setWeather(2)
	if source == g_registergui["button_back"] then
		if skin == 0 then
			skin = 311
		else
			skin = skin - 1
			if ifSkinForbiddenSkin(skin) then
				triggerEvent("onClientGUIClick", g_registergui["button_back"])
			end
		end
		setElementModel(registerPed, skin)
		guiSetText(g_registergui["label_skin"], tostring(skin))	
	end
end

function checkRegister(button)
	if source == g_registergui["button_ok"] then
		
		if string.len(guiGetText(g_registergui["edit_password"])) < 3 then
			guiLabelSetColor(g_registergui["label_password"], 255, 0, 0)
			return false	
		end

		if guiGetText(g_registergui["edit_password"]) ~= guiGetText(g_registergui["edit_password"]) then
			guiLabelSetColor(g_registergui["label_password"], 255, 0, 0)
			guiLabelSetColor(g_registergui["label_password2"], 255, 0, 0)
			return false	
		end
		
		local splitemailstart, splitemailend = string.find(guiGetText(g_registergui["edit_mail"]), "@")
		if not splitemailstart then 
			guiLabelSetColor(g_registergui["label_mail"], 255, 0, 0)
			return false
		end
		if string.len(guiGetText(g_registergui["edit_mail"])) <= 4 then
			guiLabelSetColor(g_registergui["label_mail"], 255, 0, 0)
			return false	
		end
		removeEventHandler('onClientGUIClick', g_registergui["button_for"], showNextSkin)
		removeEventHandler('onClientGUIClick', g_registergui["button_back"], showBackSkin)
		removeEventHandler('onClientGUIClick', g_registergui["button_ok"], checkRegister)
		removeEventHandler('onClientRender', getRootElement(), registerRenderHandler)
		setElementInterior (localPlayer, 0)
		setCameraInterior(0)
		setCameraTarget(localPlayer, localPlayer)
		showCursor(false)
		guiSetVisible(g_registergui["window"], false)
		local skin = getElementModel(registerPed)
		destroyElement(registerPed)
		registerPed = nil
		guiSetInputEnabled(false)
		rpcCallServerFunction("registerPlayer", guiGetText(g_registergui["edit_password"]), guiGetText(g_registergui["edit_mail"]), skin)
		toggleHudModus()
		setCameraInterior(0)
	end	
end


function checkLogin(button)
	if source == g_Logingui["Login_Button"] then
		if string.len(guiGetText(g_Logingui["Password"])) < 3 then
			guiSetVisible(g_Logingui["false_label"], true)
			--outputChatBox("Das angegebene Passwort ist zu kurz!")
			return false
		end
		if not loginSend then
			--server.loginPlayer(guiGetText(g_Logingui["Password"]))
			rpcCallServerFunction("loginPlayer", guiGetText(g_Logingui["Password"]))
			loginSend = true
		end	
		--server.checkWahl()
	end
end

function showGUIloginfalse()
	guiSetVisible(g_Logingui["true_label"], true)
end

function setLoginVars(email)
	g_playerstat["Email"] = email
end

function setLabelFalsePSW()
	loginSend = false
	guiSetVisible(g_Logingui["false_label"], true)
end
