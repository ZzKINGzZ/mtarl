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



function xmlSetNode(xmlfile, nodename, nodeval)
	local thenode = xmlFindChild(xmlfile, nodename, 0)
	if not thenode then
		local newnode = xmlCreateChild(xmlfile, nodename)
		xmlNodeSetValue(newnode, tostring(nodeval))
		return newnode
	else
		xmlNodeSetValue(thenode, tostring(nodeval))
		return thenode
	end	
	return false
end

function oneNodeEdit(xmlfile, nodename, nodeval)
	local xml = xmlLoadFile(xmlfile)
	xmlSetNode(xml, nodename, nodeval)
	xmlSaveFile(xml)
	xmlUnloadFile(xml)
end

function oneNodeGet(xmlfile, nodename)
	local xml = xmlLoadFile(xmlfile)
	local find = xmlFindChild(xml, nodename, 0)
	local val = xmlNodeGetValue(find)
	xmlSaveFile(xml)
	xmlUnloadFile(xml)
	return val
end

function xmlGetVal(xmlfile, nodename)
	local find = xmlFindChild(xmlfile, nodename, 0)
	local val = xmlNodeGetValue(find)
	if val then return val end
	return false
end
