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



local player
local animation
local zahl

function animAll(playerSource, commandName, anim, number)
	if not anim then
		outputChatBox(g_colors["darkorange"].."Du musst eine Nummer und eine Animation Angeben!", playerSource, 0, 0, 0, true)
		outputChatBox(g_colors["darkorange"].."Animationen:", playerSource, 0, 0, 0, true)
		outputChatBox(g_colors["darkorange"].."lustig 1-10", playerSource, 0, 0, 0, true)
		outputChatBox(g_colors["darkorange"].."kiss 1-3", playerSource, 0, 0, 0, true)
		outputChatBox(g_colors["darkorange"].."rap 1-3", playerSource, 0, 0, 0, true)
		outputChatBox(g_colors["darkorange"].."smoke 1-2", playerSource, 0, 0, 0, true)
		outputChatBox(g_colors["darkorange"].."sun 1-6", playerSource, 0, 0, 0, true)
		outputChatBox(g_colors["darkorange"].."dance 1-31", playerSource, 0, 0, 0, true)
		return false
	end
	
	animation = tostring(anim)
	player = playerSource
	zahl = tonumber(number)
	
	if animation == "lustig" then 
		animGHANDS(player, zahl)
	elseif animation == "kiss" then
		animKISSING(player, zahl)
	elseif animation == "rap" then
		animRAPPING(player, zahl)
	elseif animation == "smoke" then
		animSMOKING(player, zahl)
	elseif animation == "sun" then
		animSUNBATHE(player, zahl)
	elseif animation == "dance" then
		animDANCING(player, zahl)
	elseif animation == "stop" then
		setPedAnimation(playerSource)
	end
end
addCommandHandler("anim", animAll)

function animGHANDS(player, zahl)
	if zahl > 0 or zahl < 11 then
		outputChatBox(g_colors["darkorange"].."Nur von 1-10 verfügbar!", player, 0, 0, 0, true)
		return false
	end
	if zahl >= 5 then
		setPedAnimation (player, "GHANDS", "LHGsign"..zahl, -1, true, false)
	else
		zahl = zahl - 5
		setPedAnimation (player, "GHANDS", "RHGsign"..zahl, -1, true, false)
	end
end

function animKISSING(player, zahl)
	if zahl > 0 and zahl < 4 then
		outputChatBox(g_colors["darkorange"].."Nur von 1-3 verfügbar!", player, 0, 0, 0, true)
		return false
	end
	setPedAnimation (player, "KISSING", "Grlfrd_Kiss_."..zahl, -1, true, false)
end

function animRAPPING(player, zahl)
	if zahl > 0 and zahl < 4 then
		outputChatBox(g_colors["darkorange"].."Nur von 1-3 verfügbar!", player, 0, 0, 0, true)
		return false
	end
	if zahl == 1 then
		setPedAnimation (player, "RAPPING", "RAP_A_Loop", -1, true, false)
	elseif zahl == 2 then
		setPedAnimation (player, "RAPPING", "RAP_B_Loop", -1, true, false)
	elseif zahl == 3 then
		setPedAnimation (player, "RAPPING", "RAP_C_Loop", -1, true, false)
	end
end

function animSMOKING(player, zahl)
	if zahl > 0 and zahl < 3 then
		outputChatBox(g_colors["darkorange"].."Nur von 1-2 verfügbar!", player, 0, 0, 0, true)
		return false
	end
	if zahl == 1 then
		setPedAnimation (player, "SMOKING", "RAP_A_Loop", -1, true, false)
	elseif zahl == 2 then
		setPedAnimation (player, "SMOKING", "RAP_B_Loop", -1, true, false)
	end
end

function animSUNBATHE(player, zahl)
	if zahl > 0 and zahl < 7 then
		outputChatBox(g_colors["darkorange"].."Nur von 1-6 verfügbar!", player, 0, 0, 0, true)
		return false
	end
	if zahl == 1 then
		setPedAnimation (player, "SUNBATHE", "ParkSit_M_IdleA", -1, true, false)
	elseif zahl == 2 then
		setPedAnimation (player, "SUNBATHE", "ParkSit_M_IdleB", -1, true, false)
	elseif zahl == 3 then
		setPedAnimation (player, "SUNBATHE", "ParkSit_M_IdleC", -1, true, false)
	elseif zahl == 4 then
		setPedAnimation (player, "SUNBATHE", "ParkSit_W_IdleA", -1, true, false)
	elseif zahl == 5 then
		setPedAnimation (player, "SUNBATHE", "ParkSit_W_IdleB", -1, true, false)
	elseif zahl == 6 then
		setPedAnimation (player, "SUNBATHE", "ParkSit_W_IdleC", -1, true, false)
	end
end

function animDANCING(player, zahl)
	if zahl > 0 and zahl < 32 then
		outputChatBox(g_colors["darkorange"].."Nur von 1-31 verfügbar!", player, 0, 0, 0, true)
		return false
	end
	if zahl == 1 then
		setPedAnimation (player, "STRIP", "PUN_HOLLER", -1, true, false)
	elseif zahl == 2 then
		setPedAnimation (player, "STRIP", "PUN_LOOP", -1, true, false)
	elseif zahl == 3 then
		setPedAnimation (player, "STRIP", "strip_A", -1, true, false)
	elseif zahl == 4 then
		setPedAnimation (player, "STRIP", "strip_B", -1, true, false)
	elseif zahl == 5 then
		setPedAnimation (player, "STRIP", "strip_C", -1, true, false)
	elseif zahl == 6 then
		setPedAnimation (player, "STRIP", "strip_D", -1, true, false)
	elseif zahl == 7 then
		setPedAnimation (player, "STRIP", "strip_E", -1, true, false)
	elseif zahl == 8 then
		setPedAnimation (player, "STRIP", "strip_F", -1, true, false)
	elseif zahl == 9 then
		setPedAnimation (player, "STRIP", "strip_G", -1, true, false)
	elseif zahl == 10 then
		setPedAnimation (player, "STRIP", "STR_A2B", -1, true, false)
	elseif zahl == 11 then
		setPedAnimation (player, "STRIP", "STR_B2A", -1, true, false)
	elseif zahl == 12 then
		setPedAnimation (player, "STRIP", "STR_B2C", -1, true, false)
	elseif zahl == 13 then
		setPedAnimation (player, "STRIP", "STR_C1", -1, true, false)
	elseif zahl == 14 then
		setPedAnimation (player, "STRIP", "STR_C2", -1, true, false)
	elseif zahl == 15 then
		setPedAnimation (player, "STRIP", "STR_C2B", -1, true, false)
	elseif zahl == 16 then
		setPedAnimation (player, "STRIP", "STR_Loop_A", -1, true, false)
	elseif zahl == 17 then
		setPedAnimation (player, "STRIP", "STR_Loop_B", -1, true, false)
	elseif zahl == 18 then
		setPedAnimation (player, "STRIP", "STR_Loop_C", -1, true, false)
	elseif zahl == 19 then
		setPedAnimation (player, "DANCING", "bd_clap", -1, true, false)
	elseif zahl == 20 then
		setPedAnimation (player, "DANCING", "bd_clap1", -1, true, false)
	elseif zahl == 21 then
		setPedAnimation (player, "DANCING", "dance_loop", -1, true, false)
	elseif zahl == 22 then
		setPedAnimation (player, "DANCING", "DAN_Down_A", -1, true, false)
	elseif zahl == 23 then
		setPedAnimation (player, "DANCING", "DAN_Left_A", -1, true, false)
	elseif zahl == 24 then
		setPedAnimation (player, "DANCING", "DAN_Loop_A", -1, true, false)
	elseif zahl == 25 then
		setPedAnimation (player, "DANCING", "DAN_Right_A", -1, true, false)
	elseif zahl == 26 then
		setPedAnimation (player, "DANCING", "DAN_Up_A", -1, true, false)
	elseif zahl == 27 then
		setPedAnimation (player, "DANCING", "dnce_M_a", -1, true, false)
	elseif zahl == 28 then
		setPedAnimation (player, "DANCING", "dnce_M_b", -1, true, false)
	elseif zahl == 29 then
		setPedAnimation (player, "DANCING", "dnce_M_c", -1, true, false)
	elseif zahl == 30 then
		setPedAnimation (player, "DANCING", "dnce_M_d", -1, true, false)
	elseif zahl == 31 then
		setPedAnimation (player, "DANCING", "dnce_M_e", -1, true, false)
	end
end
