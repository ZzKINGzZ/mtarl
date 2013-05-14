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

g_admingui = {}

g_guiloaded["Admingui"] = false
g_guiloaded["AdminguiConfirm1"] = false
g_guiloaded["AdminguiConfirm2"] = false
g_guiloaded["AdminguiConfirm3"] = false
g_guiloaded["AdminguiConfirm4"] = false
g_guiloaded["AdminguiConfirm5"] = false
g_guiloaded["AdminguiConfirm6"] = false
g_guiloaded["AdminguiConfirm7"] = false
g_guiloaded["AdminguiConfirm8"] = false

function initalizeAdminGui()
	if not g_guiloaded["Admingui"] then
	
		g_admingui["window"] = guiCreateWindow(0.2765,0.1388,0.4469,0.585,"Admin",true)
		g_admingui["tabPanel"] = guiCreateTabPanel(0.0192,0.0491,0.9615,0.9316,true,g_admingui["window"])
		
		g_admingui["tabPlayer"] = guiCreateTab("Spieler",g_admingui["tabPanel"])
			g_admingui["tabPlayerSearch"] = guiCreateEdit(0.0127,0.0243,0.2873,0.068,"",true,g_admingui["tabPlayer"])
			g_admingui["tabPlayerList"] = guiCreateGridList(0.0109,0.1068,0.2873,0.8665,true,g_admingui["tabPlayer"])
				g_admingui["tabPlayerListCol"] = guiGridListAddColumn ( g_admingui["tabPlayerList"], "Spieler", 0.9 )
				guiGridListSetSelectionMode(g_admingui["tabPlayerList"],0)
				guiGridListSetSortingEnabled (g_admingui["tabPlayerList"], false)
			
			local name = guiCreateLabel(0.3091,0.1117,0.0945,0.0388,"Name:",true,g_admingui["tabPlayer"])
				guiSetFont(name,"default-bold-small")
			local money = guiCreateLabel(0.3091,0.1626,0.1444,0.0388,"Geld:",true,g_admingui["tabPlayer"])
				guiSetFont(money,"default-bold-small")
			local bank = guiCreateLabel(0.5964,0.1626,0.1444,0.0388,"Bank:",true,g_admingui["tabPlayer"])
				guiSetFont(bank,"default-bold-small")
			local health = guiCreateLabel(0.3091,0.2233,0.1309,0.0388,"Gesundheit:",true,g_admingui["tabPlayer"])
				guiSetFont(health,"default-bold-small")
			local armor = guiCreateLabel(0.5964,0.2233,0.0818,0.0388,"Armor:",true,g_admingui["tabPlayer"])
				guiSetFont(armor,"default-bold-small")
			local skin = guiCreateLabel(0.3091,0.2791,0.0947,0.0388,"Skin-ID:",true,g_admingui["tabPlayer"])
				guiSetFont(skin,"default-bold-small")
			local serial = guiCreateLabel(0.3091,0.3398,0.0947,0.0388,"Serial:",true,g_admingui["tabPlayer"])
				guiSetFont(serial,"default-bold-small")
			local vehicle = guiCreateLabel(0.3091,0.4005,0.1055,0.0388,"Fahrzeug:",true,g_admingui["tabPlayer"])
				guiSetFont(vehicle,"default-bold-small")
			local ip = guiCreateLabel(0.5964,0.1117,0.1444,0.0388,"IP:",true,g_admingui["tabPlayer"])
				guiSetFont(ip,"default-bold-small")
			local version = guiCreateLabel(0.5964,0.2791,0.1444,0.0388,"Version:",true,g_admingui["tabPlayer"])
				guiSetFont(version,"default-bold-small")
			local pos = guiCreateLabel(0.3091,0.4612,0.0947,0.0388,"Pos:",true,g_admingui["tabPlayer"])
				guiSetFont(pos,"default-bold-small")
				
			g_admingui["tabPlayerName"] = guiCreateLabel(0.4491,0.1117,0.3873,0.0413,"",true,g_admingui["tabPlayer"])
			g_admingui["tabPlayerMoney"] = guiCreateLabel(0.4491,0.1626,0.14,0.0364,"",true,g_admingui["tabPlayer"])
			g_admingui["tabPlayerBank"] = guiCreateLabel(0.6891,0.1626,0.2018,0.034,"",true,g_admingui["tabPlayer"])
			g_admingui["tabPlayerHealth"] = guiCreateLabel(0.4491,0.2233,0.1436,0.0364,"",true,g_admingui["tabPlayer"])
			g_admingui["tabPlayerArmor"] = guiCreateLabel(0.6909,0.2233,0.1109,0.0485,"",true,g_admingui["tabPlayer"])
			g_admingui["tabPlayerSkin"] = guiCreateLabel(0.4527,0.2791,0.3028,0.0413,"",true,g_admingui["tabPlayer"])
			g_admingui["tabPlayerSerial"] = guiCreateLabel(0.4527,0.3398,0.5236,0.0364,"",true,g_admingui["tabPlayer"])
			g_admingui["tabPlayerIP"] = guiCreateLabel(0.6891,0.1117,0.2018,0.034,"",true,g_admingui["tabPlayer"])
			g_admingui["tabPlayerVersion"] = guiCreateLabel(0.6891,0.2791,0.2018,0.034,"",true,g_admingui["tabPlayer"])
			g_admingui["tabPlayerPos"] = guiCreateLabel(0.4527,0.4612,0.5236,0.0364,"",true,g_admingui["tabPlayer"])
			g_admingui["tabPlayerVehicle"] = guiCreateLabel(0.4527,0.4005,0.3028,0.0413,"Kein Fahrzeug",true,g_admingui["tabPlayer"])
			
			g_admingui["tabPlayerButtonBan"] = guiCreateButton(0.3218,0.5461,0.2078,0.0704,"Ban",true,g_admingui["tabPlayer"])
			g_admingui["tabPlayerButtonKick"] = guiCreateButton(0.5436,0.5461,0.2078,0.0704,"Kick",true,g_admingui["tabPlayer"])
			g_admingui["tabPlayerButtonMute"] = guiCreateButton(0.7673,0.5461,0.2078,0.0704,"Mute",true,g_admingui["tabPlayer"])
			g_admingui["tabPlayerButtonJob"] = guiCreateButton(0.3218,0.6408,0.2078,0.0704,"Job",true,g_admingui["tabPlayer"])
			g_admingui["tabPlayerButtonFreeze"] = guiCreateButton(0.5436,0.6408,0.2078,0.0704,"Freeze",true,g_admingui["tabPlayer"])
			g_admingui["tabPlayerButtonMoney"] = guiCreateButton(0.7673,0.6408,0.2078,0.0704,"Geld",true,g_admingui["tabPlayer"])
			g_admingui["tabPlayerButtonSpawn"] = guiCreateButton(0.3218,0.7379,0.2073,0.0704,"Spawn",true,g_admingui["tabPlayer"])
			g_admingui["tabPlayerButtonHealth"] = guiCreateButton(0.5436,0.7379,0.2073,0.0704,"Health",true,g_admingui["tabPlayer"])
			g_admingui["tabPlayerButtonTeam"] = guiCreateButton(0.7673,0.7379,0.2073,0.0704,"Team",true,g_admingui["tabPlayer"])
			g_admingui["tabPlayerButtonCar"] = guiCreateButton(0.4509,0.3981,0.2455,0.0364,"Ausw"..auml.."hlen",true,g_admingui["tabPlayer"]) --Button Ausw"..auml.."hlen des Spielerfahrzeuges
			
		g_admingui["tabVeh"] = guiCreateTab("Fahrzeuge",g_admingui["tabPanel"])
			g_admingui["tabVehSearch"] = guiCreateEdit(0.0109,0.0243,0.4545,0.0728,"",true,g_admingui["tabVeh"])
			g_admingui["tabVehList"] = guiCreateGridList(0.0091,0.1092,0.4582,0.8762,true,g_admingui["tabVeh"])
				g_admingui["tabVehListColID"] = guiGridListAddColumn ( g_admingui["tabVehList"], "ID", 0.2 )
				g_admingui["tabVehListColName"] = guiGridListAddColumn ( g_admingui["tabVehList"], "Name", 0.4 )
				g_admingui["tabVehListColTyp"] = guiGridListAddColumn ( g_admingui["tabVehList"], "Typ", 0.3 )
					guiGridListSetSelectionMode(g_admingui["tabVehList"],0)
					guiGridListSetSortingEnabled (g_admingui["tabVehList"], false)
			
			local id = guiCreateLabel(0.4945,0.1117,0.14,0.0364,"ID:",true,g_admingui["tabVeh"])
				guiSetFont(id,"default-bold-small")
			local owner = guiCreateLabel(0.7473,0.1117,0.14,0.0364,"Besitzer:",true,g_admingui["tabVeh"])
				guiSetFont(owner,"default-bold-small")
			local name = guiCreateLabel(0.4945,0.1699,0.14,0.0364,"Name:",true,g_admingui["tabVeh"])
				guiSetFont(name,"default-bold-small")
			local condition = guiCreateLabel(0.4945,0.2257,0.14,0.0364,"Zustand:",true,g_admingui["tabVeh"])
				guiSetFont(condition,"default-bold-small")
			local tank = guiCreateLabel(0.7473,0.2257,0.14,0.0364,"Tank:",true,g_admingui["tabVeh"])
				guiSetFont(tank,"default-bold-small")
			local km = guiCreateLabel(0.4945,0.2864,0.14,0.0364,"KM:",true,g_admingui["tabVeh"])
				guiSetFont(km,"default-bold-small")
			local prop = guiCreateLabel(0.7473,0.2864,0.14,0.0364,"Prop:",true,g_admingui["tabVeh"])
				guiSetFont(prop,"default-bold-small")
			local temp = guiCreateLabel(0.7473,0.1699,0.14,0.0364,"Temp:",true,g_admingui["tabVeh"])
				guiSetFont(temp,"default-bold-small")
			local pos = guiCreateLabel(0.4945,0.3398,0.14,0.0364,"Pos:",true,g_admingui["tabVeh"])
				guiSetFont(pos,"default-bold-small")
				
			g_admingui["tabVehID"] = guiCreateLabel(0.6055,0.1117,0.1236,0.0364,"",true,g_admingui["tabVeh"])
			g_admingui["tabVehName"] = guiCreateLabel(0.6055,0.1699,0.1236,0.0364,"",true,g_admingui["tabVeh"])
			g_admingui["tabVehHealth"] = guiCreateLabel(0.6055,0.2257,0.1236,0.0364,"",true,g_admingui["tabVeh"])
			g_admingui["tabVehKM"] = guiCreateLabel(0.6055,0.2864,0.1236,0.0364,"",true,g_admingui["tabVeh"])
			g_admingui["tabVehOwner"] = guiCreateLabel(0.8491,0.1117,0.1236,0.0364,"",true,g_admingui["tabVeh"])
			g_admingui["tabVehTemp"] = guiCreateLabel(0.8491,0.1699,0.1236,0.0364,"",true,g_admingui["tabVeh"])
			g_admingui["tabVehTank"] = guiCreateLabel(0.8491,0.2257,0.1236,0.0364,"",true,g_admingui["tabVeh"])
			g_admingui["tabVehProp"] = guiCreateLabel(0.8491,0.2816,0.1236,0.0364,"",true,g_admingui["tabVeh"])
			g_admingui["tabVehPos"] = guiCreateLabel(0.6091,0.3398,0.3721,0.1363,"",true,g_admingui["tabVeh"])
				guiLabelSetHorizontalAlign(g_admingui["tabVehPos"], "left", true)
			
			g_admingui["tabVehButtonLock"] = guiCreateButton(0.5091,0.4879,0.2036,0.0655,"Zuschlie"..szlig.."en",true,g_admingui["tabVeh"])
			g_admingui["tabVehButtonUnlock"] = guiCreateButton(0.7473,0.4879,0.2036,0.0655,"Aufschlie"..szlig.."en",true,g_admingui["tabVeh"])
			g_admingui["tabVehButtonProp"] = guiCreateButton(0.5091,0.5752,0.2036,0.0655,"Prop",true,g_admingui["tabVeh"])
			g_admingui["tabVehButtonRep"] = guiCreateButton(0.7473,0.5752,0.2036,0.0655,"Reparieren",true,g_admingui["tabVeh"])
			g_admingui["tabVehButtonCol"] = guiCreateButton(0.5091,0.6626,0.2036,0.0655,"Farbe",true,g_admingui["tabVeh"])
			g_admingui["tabVehButtonDelete"] = guiCreateButton(0.7473,0.6626,0.2036,0.0655,"L"..ouml.."schen",true,g_admingui["tabVeh"])
			g_admingui["tabVehButtonCreate"] = guiCreateButton(0.5091,0.9053,0.4455,0.068,"Erstellen",true,g_admingui["tabVeh"])
			
		g_admingui["tabWL"] = guiCreateTab("Whitelist",g_admingui["tabPanel"])
			g_admingui["tabWlList"] = guiCreateGridList(0.0218,0.0425,0.48,0.9327,true,g_admingui["tabWL"])
				g_admingui["tabWlListColName"] = guiGridListAddColumn(g_admingui["tabWlList"],"Name",0.55)
				g_admingui["tabWlListColPin"] = guiGridListAddColumn(g_admingui["tabWlList"],"PIN",0.35)
				guiGridListSetSortingEnabled (g_admingui["tabWlList"], false)
			g_admingui["tabWlButtonDel"] = guiCreateButton(0.6255,0.2336,0.2545,0.0549,"von Whitelist l"..ouml.."schen",true,g_admingui["tabWL"])
			g_admingui["tabWlAddEdit"] = guiCreateEdit(0.6255,0.4248,0.2545,0.0549,"",true,g_admingui["tabWL"])
			g_admingui["tabWlButtonAdd"] = guiCreateButton(0.6255,0.5044,0.2545,0.0549,"zur Whitelist hinzuf"..uuml.."gen",true,g_admingui["tabWL"])
			g_admingui["tabWlPinEdit"] = guiCreateEdit(0.6279,0.5876,0.2545,0.0549,"PIN:",true,g_admingui["tabWL"])
				guiEditSetReadOnly(g_admingui["tabWlPinEdit"],true)
	
		g_admingui["tabPost"] = guiCreateTab("Post",g_admingui["tabPanel"])
			guiCreateLabel(0.0279,0.0673,0.1212,0.0336,"Absender:",true,g_admingui["tabPost"])
			guiCreateLabel(0.0279,0.1416,0.1212,0.0336,"Betreff:",true,g_admingui["tabPost"])
			guiCreateLabel(0.0279,0.1947,0.1212,0.0336,"Inhalt:",true,g_admingui["tabPost"])
			g_admingui["tabPostSenderEdit"] = guiCreateEdit(0.1139,0.0389,0.3539,0.0531,"MTA:RL Bot",true,g_admingui["tabPost"])
			g_admingui["tabPostSubjectEdit"] = guiCreateEdit(0.1127,0.115,0.3539,0.0531,"",true,g_admingui["tabPost"])
			g_admingui["tabPostContentEdit"] = guiCreateMemo(0.0279,0.2319,0.9491,0.6814,"",true,g_admingui["tabPost"])
			g_admingui["tabPostButtonSend"] = guiCreateButton(0.6376,0.9327,0.3358,0.0513,"An alle Spieler senden!",true,g_admingui["tabPost"])
			g_admingui["tabPostErrorLabel"] = guiCreateLabel(0.0279,0.9345,0.5127,0.046,"Fehler!",true,g_admingui["tabPost"])
				guiLabelSetColor(g_admingui["tabPostErrorLabel"],255,0,0)
				guiSetFont(g_admingui["tabPostErrorLabel"], "default-bold-small")
				guiSetVisible(g_admingui["tabPostErrorLabel"], false)
		
		guiWindowSetSizable(g_admingui["window"], false)
		guiSetVisible(g_admingui["window"], false)
		guiSetVisible(g_admingui["tabPlayerVehicle"], false)
		guiSetVisible(g_admingui["tabPlayerButtonCar"], false)
		
		guiSetInputMode("no_binds_when_editing")
		g_guiloaded["Admingui"] = true
	end
end

function initalizeAdminGuiConfirm1()
	if not g_guiloaded["AdminguiConfirm1"] then --Best"..auml.."tigungs Fenster 1 (mit Grund)
	
		g_admingui["windowConfirm1"] = guiCreateWindow(0.4088,0.3222,0.1594,0.1824,"Bes"..auml.."tigung",true)
		g_admingui["confirm1Text"] = guiCreateLabel(0.0458,0.1371,0.9118,0.2995,"M"..ouml.."chtest du den Spieler ... wirklich ...?",true,g_admingui["windowConfirm1"])
			guiLabelSetVerticalAlign(g_admingui["confirm1Text"],"center")
			guiLabelSetHorizontalAlign(g_admingui["confirm1Text"],"center",true)
			guiSetFont(g_admingui["confirm1Text"],"default-bold-small")
		g_admingui["confirm1Reason"] = guiCreateMemo(0.0425,0.5381,0.9183,0.2234,"",true,g_admingui["windowConfirm1"])
		guiCreateLabel(0.0425,0.4416,0.1373,0.0914,"Grund:",true,g_admingui["windowConfirm1"])
		g_admingui["confirm1ButtonYes"] = guiCreateButton(0.0882,0.8426,0.3922,0.1168,"Ja",true,g_admingui["windowConfirm1"])
		g_admingui["confirm1ButtonNo"] = guiCreateButton(0.5065,0.8426,0.3922,0.1168,"Nein",true,g_admingui["windowConfirm1"])
		
		guiWindowSetSizable(g_admingui["windowConfirm1"], false)
		guiWindowSetMovable(g_admingui["windowConfirm1"], false)
		guiSetVisible(g_admingui["windowConfirm1"], false)
		guiSetEnabled(g_admingui["confirm1ButtonYes"], false)
		
		g_guiloaded["AdminguiConfirm1"] = true
	end
end

function initalizeAdminGuiConfirm2()
	if not g_guiloaded["AdminguiConfirm2"] then --Best"..auml.."tigungs Fenster 2 (ohne Grund)
	
		g_admingui["windowConfirm2"] = guiCreateWindow(0.4088,0.3222,0.1594,0.1824,"Bes"..auml.."tigung",true)
		g_admingui["confirm2Text"] = guiCreateLabel(0.0458,0.1953,0.902,0.4766,"M"..ouml.."chtest du den Spieler ... wirklich ...?",true,g_admingui["windowConfirm2"])
			guiLabelSetVerticalAlign(g_admingui["confirm2Text"],"center")
			guiLabelSetHorizontalAlign(g_admingui["confirm2Text"],"center",true)
			guiSetFont(g_admingui["confirm2Text"],"default-bold-small")
		g_admingui["confirm2ButtonYes"] = guiCreateButton(0.0882,0.7422,0.3922,0.1719,"Ja",true,g_admingui["windowConfirm2"])
		g_admingui["confirm2ButtonNo"] = guiCreateButton(0.5065,0.7422,0.3922,0.1719,"Nein",true,g_admingui["windowConfirm2"])
		
		guiWindowSetSizable(g_admingui["windowConfirm2"], false)
		guiWindowSetMovable(g_admingui["windowConfirm2"], false)
		guiSetVisible(g_admingui["windowConfirm2"], false)
		
		g_guiloaded["AdminguiConfirm2"] = true
	end
end

function initalizeAdminGuiConfirm3()
	if not g_guiloaded["AdminguiConfirm3"] then --Best"..auml.."tigungs Fenster 3 (Job)
	
		g_admingui["windowConfirm3"] = guiCreateWindow(0.4088,0.3222,0.1594,0.2148,"Bes"..auml.."tigung",true)
		g_admingui["confirm3Text"] = guiCreateLabel(0.0425,0.1034,0.9183,0.2241,"M"..ouml.."chtest du den Spieler ... wirklich dem in einen Job eintragen?",true,g_admingui["windowConfirm3"])
			guiLabelSetVerticalAlign(g_admingui["confirm3Text"],"center")
			guiLabelSetHorizontalAlign(g_admingui["confirm3Text"],"center",true)
			guiSetFont(g_admingui["confirm3Text"],"default-bold-small")
		g_admingui["confirm3ButtonYes"] = guiCreateButton(0.0882,0.8578,0.3922,0.0948,"Ja",true,g_admingui["windowConfirm3"])
		g_admingui["confirm3ButtonNo"] = guiCreateButton(0.5065,0.8578,0.3922,0.0948,"Nein",true,g_admingui["windowConfirm3"])
		g_admingui["confirm3Job"] = guiCreateComboBox (0.049,0.3534,0.9118,0.53, "Job", true, g_admingui["windowConfirm3"])
			rpcCallServerFunction("getAllJobNames", 2)
		guiCreateLabel(0.3137,0.6767,0.1765,0.0733,"Job-Rank:",true,g_admingui["windowConfirm3"])
		g_admingui["confirm3JobRank"] = guiCreateEdit(0.5261,0.6121,0.1242,0.1336,"",true,g_admingui["windowConfirm3"])
			guiEditSetMaxLength (g_admingui["confirm3JobRank"], 1)
		
		guiWindowSetSizable(g_admingui["windowConfirm3"], false)
		guiWindowSetMovable(g_admingui["windowConfirm3"], false)
		guiSetVisible(g_admingui["windowConfirm3"], false)
		guiSetEnabled(g_admingui["confirm3ButtonYes"], false)
		
		g_guiloaded["AdminguiConfirm3"] = true
	end
end

function initalizeAdminGuiConfirm4()
	if not g_guiloaded["AdminguiConfirm4"] then --Best"..auml.."tigungs Fenster 4 (Geld)
	
		g_admingui["windowConfirm4"] = guiCreateWindow(0.4088,0.3222,0.1594,0.2148,"Bes"..auml.."tigung",true)
		g_admingui["confirm4Text"] = guiCreateLabel(0.0425,0.1034,0.9183,0.2241,"M"..ouml.."chtest du den Spieler ... wirklich Geld geben?",true,g_admingui["windowConfirm4"])
			guiLabelSetVerticalAlign(g_admingui["confirm4Text"],"center")
			guiLabelSetHorizontalAlign(g_admingui["confirm4Text"],"center",true)
			guiSetFont(g_admingui["confirm4Text"],"default-bold-small")		
		g_admingui["confirm4ButtonYes"] = guiCreateButton(0.0882,0.8578,0.3922,0.0948,"Ja",true,g_admingui["windowConfirm4"])
		g_admingui["confirm4ButtonNo"] = guiCreateButton(0.5065,0.8578,0.3922,0.0948,"Nein",true,g_admingui["windowConfirm4"])
		guiCreateLabel(0.0458,0.3836,0.1405,0.0776,"Betrag:",true,g_admingui["windowConfirm4"])
		g_admingui["confirm4Amount"] = guiCreateEdit(0.1993,0.3276,0.5719,0.1207,"",true,g_admingui["windowConfirm4"])
		local dollar = guiCreateLabel(0.732,0.3491,0.0588,0.0819,"$",true,g_admingui["windowConfirm4"])
			guiLabelSetColor(dollar,0,0,0)
			guiSetProperty (dollar, "AlwaysOnTop", "True")
		g_admingui["confirm4Reason"] = guiCreateMemo(0.0458,0.5517,0.9183,0.2845,"",true,g_admingui["windowConfirm4"])
		guiCreateLabel(0.0458,0.4828,0.1405,0.0776,"Grund:",true,g_admingui["windowConfirm4"])
		
		guiWindowSetSizable(g_admingui["windowConfirm4"], false)
		guiWindowSetMovable(g_admingui["windowConfirm4"], false)
		guiSetVisible(g_admingui["windowConfirm4"], false)
		guiSetEnabled(g_admingui["confirm4ButtonYes"], false)
		
		g_guiloaded["AdminguiConfirm4"] = true
	end
end

function initalizeAdminGuiConfirm5()
	if not g_guiloaded["AdminguiConfirm5"] then --Best"..auml.."tigungs Fenster 5 (Prop)
	
		g_admingui["windowConfirm5"] = guiCreateWindow(0.4088,0.3222,0.1594,0.1574,"Best"..auml.."tigung",true)
		g_admingui["confirm5Text"] = guiCreateLabel(0.0327,0.1412,0.9281,0.3353,"W"..auml.."hle das Prop aus was du dem Fahrzeug zuweisen willst!",true,g_admingui["windowConfirm5"])
			guiLabelSetVerticalAlign(g_admingui["confirm5Text"],"center")
			guiLabelSetHorizontalAlign(g_admingui["confirm5Text"],"center",true)
			guiSetFont(g_admingui["confirm5Text"],"default-bold-small")
		g_admingui["confirm5Prop"] = guiCreateComboBox (0.0654,0.4882,0.8758,0.53, "Prop", true, g_admingui["windowConfirm5"])
			guiComboBoxAddItem(g_admingui["confirm5Prop"], "ADAC")
			guiComboBoxAddItem(g_admingui["confirm5Prop"], "Polizei")
			guiComboBoxAddItem(g_admingui["confirm5Prop"], "Taxi")
			guiComboBoxAddItem(g_admingui["confirm5Prop"], "Medic")
			guiComboBoxAddItem(g_admingui["confirm5Prop"], "Feuerwehr")
			guiComboBoxAddItem(g_admingui["confirm5Prop"], "Post")
			guiComboBoxAddItem(g_admingui["confirm5Prop"], "Tanker")
		g_admingui["confirm5ButtonYes"] = guiCreateButton(0.1078,0.7706,0.3758,0.1353,"Ja",true,g_admingui["windowConfirm5"])
		g_admingui["confirm5ButtonNo"] = guiCreateButton(0.5065,0.7706,0.3758,0.1353,"Nein",true,g_admingui["windowConfirm5"])
		
		guiWindowSetSizable(g_admingui["windowConfirm5"], false)
		guiWindowSetMovable(g_admingui["windowConfirm5"], false)
		guiSetVisible(g_admingui["windowConfirm5"], false)
		guiSetEnabled(g_admingui["confirm5ButtonYes"], false)
		
		g_guiloaded["AdminguiConfirm5"] = true
	end
end

function initalizeAdminGuiConfirm6()
	if not g_guiloaded["AdminguiConfirm6"] then	--Best"..auml.."tigungs Fenster 6 (Farbe)
	
		g_admingui["windowConfirm6"] = guiCreateWindow(0.4088,0.3222,0.1594,0.2833,"Best"..auml.."tigung",true)
		g_admingui["confirm6Text"] = guiCreateLabel(0.0327,0.0784,0.9281,0.1863,"W"..auml.."hle die Farb die du dem Fahrzeug zuweisen willst!",true,g_admingui["windowConfirm6"])
			guiLabelSetVerticalAlign(g_admingui["confirm6Text"],"center")
			guiLabelSetHorizontalAlign(g_admingui["confirm6Text"],"center",true)
			guiSetFont(g_admingui["confirm6Text"],"default-bold-small")
		guiCreateLabel(0.3072,0.3072,0.1961,0.0654,"Farbe 1",true,g_admingui["windowConfirm6"])
		guiCreateLabel(0.6275,0.3072,0.1961,0.0437,"Farbe 2",true,g_admingui["windowConfirm6"])
		g_admingui["windowConfirm6Col1R"] = guiCreateEdit(0.2876,0.3954,0.183,0.0948,"",true,g_admingui["windowConfirm6"])
			guiEditSetMaxLength(g_admingui["windowConfirm6Col1R"], 3)
		g_admingui["windowConfirm6Col1G"] = guiCreateEdit(0.2876,0.549,0.183,0.0948,"",true,g_admingui["windowConfirm6"])
			guiEditSetMaxLength(g_admingui["windowConfirm6Col1G"], 3)
		g_admingui["windowConfirm6Col1B"] = guiCreateEdit(0.2876,0.7092,0.183,0.0948,"",true,g_admingui["windowConfirm6"])
			guiEditSetMaxLength(g_admingui["windowConfirm6Col1B"], 3)
		g_admingui["windowConfirm6Col2R"]  = guiCreateEdit(0.6078,0.3954,0.183,0.0948,"",true,g_admingui["windowConfirm6"])
			guiEditSetMaxLength(g_admingui["windowConfirm6Col2R"], 3)
		g_admingui["windowConfirm6Col2G"]  = guiCreateEdit(0.6078,0.549,0.183,0.0948,"",true,g_admingui["windowConfirm6"])
			guiEditSetMaxLength(g_admingui["windowConfirm6Col2G"], 3)
		g_admingui["windowConfirm6Col2B"]  = guiCreateEdit(0.6078,0.7092,0.183,0.0948,"",true,g_admingui["windowConfirm6"])
			guiEditSetMaxLength(g_admingui["windowConfirm6Col2B"], 3)
		local label_r = guiCreateLabel(0.1569,0.415,0.049,0.0621,"R",true,g_admingui["windowConfirm6"])
			guiLabelSetColor(label_r,255,0,0)
		local label_g = guiCreateLabel(0.1569,0.5719,0.049,0.0415,"G",true,g_admingui["windowConfirm6"])
			guiLabelSetColor(label_g,0,255,0)
		local label_b = guiCreateLabel(0.1569,0.7288,0.049,0.0415,"B",true,g_admingui["windowConfirm6"])
			guiLabelSetColor(label_b,0,0,255)
		g_admingui["confirm6ButtonYes"] = guiCreateButton(0.098,0.8824,0.3889,0.0686,"Ja",true,g_admingui["windowConfirm6"])
		g_admingui["confirm6ButtonNo"] = guiCreateButton(0.5163,0.8824,0.3889,0.0686,"Nein",true,g_admingui["windowConfirm6"])
		
		guiWindowSetSizable(g_admingui["windowConfirm6"], false)
		guiWindowSetMovable(g_admingui["windowConfirm6"], false)
		guiSetVisible(g_admingui["windowConfirm6"], false)
		guiSetEnabled(g_admingui["confirm6ButtonYes"], false)
		
		g_guiloaded["AdminguiConfirm6"] = true
	end
end

function initalizeAdminGuiConfirm7()
	if not g_guiloaded["AdminguiConfirm7"] then	--Best"..auml.."tigungs Fenster 7 (Erstellen)
	
		g_admingui["windowConfirm7"] = guiCreateWindow(0.412,0.3843,0.1594,0.2167,"Best"..auml.."tigung",true)
		g_admingui["confirm7Text"] = guiCreateLabel(0.0294,0.1068,0.9281,0.2137,"W"..auml.."hle ein Fahrzeug aus was du erstellen m"..ouml.."chtest",true,g_admingui["windowConfirm7"])
			guiLabelSetVerticalAlign(g_admingui["confirm7Text"],"center")
			guiLabelSetHorizontalAlign(g_admingui["confirm7Text"],"center",true)
			guiSetFont(g_admingui["confirm7Text"],"default-bold-small")
		g_admingui["confirm7ButtonYes"] = guiCreateButton(0.0915,0.8291,0.3758,0.0983,"Ja",true,g_admingui["windowConfirm7"])
		g_admingui["confirm7ButtonNo"] = guiCreateButton(0.5065,0.8291,0.3758,0.0983,"Nein",true,g_admingui["windowConfirm7"])
		guiCreateLabel(0.0654,0.3632,0.6242,0.0812,"Name oder ID:",true,g_admingui["windowConfirm7"])
		g_admingui["confirm7Car"] = guiCreateEdit(0.0588,0.4487,0.8856,0.1197,"",true,g_admingui["windowConfirm7"])
		g_admingui["confirm7Temp"] = guiCreateCheckBox(0.0588,0.641,0.7222,0.1026,"Tempcar",false,true,g_admingui["windowConfirm7"])
		
		guiWindowSetSizable(g_admingui["windowConfirm7"], false)
		guiWindowSetMovable(g_admingui["windowConfirm7"], false)
		guiSetVisible(g_admingui["windowConfirm7"], false)
		guiSetEnabled(g_admingui["confirm7ButtonYes"], false)
		
		g_guiloaded["AdminguiConfirm7"] = true
	end	
end

function initalizeAdminGuiConfirm8()
	if not g_guiloaded["AdminguiConfirm8"] then --Best"..auml.."tigungs Fenster 8 (Team)
	
		g_admingui["windowConfirm8"] = guiCreateWindow(0.4088,0.3222,0.1594,0.2148,"Bes"..auml.."tigung",true)
		g_admingui["confirm8Text"] = guiCreateLabel(0.0425,0.1034,0.9183,0.2241,"M"..ouml.."chtest du den Spieler ... wirklich zum Team hinzuf"..uuml.."gen?",true,g_admingui["windowConfirm8"])
			guiLabelSetVerticalAlign(g_admingui["confirm8Text"],"center")
			guiLabelSetHorizontalAlign(g_admingui["confirm8Text"],"center",true)
			guiSetFont(g_admingui["confirm8Text"],"default-bold-small")
		g_admingui["confirm8ButtonYes"] = guiCreateButton(0.0882,0.8578,0.3922,0.0948,"Ja",true,g_admingui["windowConfirm8"])
		g_admingui["confirm8ButtonNo"] = guiCreateButton(0.5065,0.8578,0.3922,0.0948,"Nein",true,g_admingui["windowConfirm8"])
		g_admingui["confirm8Team"] = guiCreateComboBox (0.049,0.3534,0.9118,0.53, "Team", true, g_admingui["windowConfirm8"])
			guiComboBoxAddItem(g_admingui["confirm8Team"], "Entlassen")
			guiComboBoxAddItem(g_admingui["confirm8Team"], "Supporter")
			guiComboBoxAddItem(g_admingui["confirm8Team"], "Team")
		
		guiWindowSetSizable(g_admingui["windowConfirm8"], false)
		guiWindowSetMovable(g_admingui["windowConfirm8"], false)
		guiSetVisible(g_admingui["windowConfirm8"], false)
		guiSetEnabled(g_admingui["confirm8ButtonYes"], false)
		
		g_guiloaded["AdminguiConfirm8"] = true
	end
end
