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



--Langeweile eine Tabelle mit Krankheiten für das spätere Krankheitssystem
--Speed: 0=normal 1=kein rennen 2=nur langsam 3=gar nicht
local illnessTable = {}
illnessTable[1] = {
	id = 1,
	name = "Grippe",
	duration = 5,
	job = true,
	speed = 0
}
illnessTable[2] = {
	id = 2,
	name = "Armbruch",
	duration = 15,
	job = false,
	speed = 1
}
illnessTable[3] = {
	id = 3,
	name = "Beinbruch",
	duration = 20,
	job = false,
	speed = 2
}
