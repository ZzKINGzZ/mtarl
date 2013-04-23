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



function getNextWeather(oldWeather)
	
end

function changeWeather()
	local wetter, nixs = getWeather()
	
	local time = getRealTime()
    local hours = time.hour
	if hours > 6 and hours < 21 then
		if wetter == 0 then
			local zahl = math.random(6)
			if zahl == 1 or zahl == 4 then
				setWeather(1)
				setWaveHeight(1.5)
				return true
			elseif zahl == 2 or zahl == 5 then
				setWeather(19)
				setWaveHeight(3)
				return true
			elseif zahl == 3 or zahl == 6 then
				setWeather(11)
				setWaveHeight(0.1)
				return true
			end
		elseif wetter == 1 then
			local zahl = math.random(2)
			if zahl == 1 then
				setWeather(10)
				setWaveHeight(2)
				return true
			elseif zahl == 2 then
				setWeather(0)
				setWaveHeight(1)
				return true
			end
		elseif wetter == 10 then
			local zahl = math.random(2)
			if zahl == 1 then
				setWeather(12)
				setWaveHeight(2.5)
				return true
			elseif zahl == 2 then
				setWeather(1)
				setWaveHeight(1.5)
				return true
			end
		elseif wetter == 12 then
			local zahl = math.random(2)
			if zahl == 1 then
				setWeather(8)
				setWaveHeight(3)
				--spawnRandomTree()
				return true
			elseif zahl == 2 then
				setWeather(10)
				setWaveHeight(2)
				return true
			end
		elseif wetter == 8 then
			setWeather(9)
			setWaveHeight(0.5)
		elseif wetter == 9 then	
			setWaveHeight(2.5)
			setWeather(12)
		elseif wetter == 11 then
			local zahl = math.random(2)
			if zahl == 1 then
				setWeather(1)
				setWaveHeight(1.5)
			elseif zahl == 2 then
				setWeather(0)
				setWaveHeight(0.1)
			end
		elseif wetter == 19 then
			setWeather(0)
			setWaveHeight(0.1)
		elseif wetter == 15 then
			setWeather(0)
			setWaveHeight(0.5)
		end
	else
		if wetter == 0 then
			local zahl = math.random(3)
			if zahl == 1 then
				setWeather(9)
				setWaveHeight(2.5)
			elseif zahl == 2 then
				setWeather(10)
				setWaveHeight(2)
			elseif zahl == 3 then
				setWeather(15)
				setWaveHeight(2.5)
			end
		elseif wetter == 9 then
			local zahl = math.random(2)
			if zahl == 1 then
				setWeather(0)
				setWaveHeight(0.5)
			elseif zahl == 2 then
				setWeather(10)
				setWaveHeight(2)
			end
		elseif wetter == 10 then
			local zahl = math.random(2)
			if zahl == 1 then
				setWeather(0)
				setWaveHeight(0.5)			
			elseif zahl == 2 then
				setWeather(12)
				setWaveHeight(2.5)
			end
		elseif wetter == 12 then
			setWeather(8)
			setWaveHeight(3)
			--spawnRandomTree()
		elseif wetter == 8 then
			setWeather(9)
			setWaveHeight(2.5)
		elseif wetter == 15 then
			setWeather(0)
			setWaveHeight(0.5)
		elseif wetter == 19 then
			setWeather(0)
			setWaveHeight(0.1)			
		end
	end
end	
