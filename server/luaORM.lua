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



--[[
	luaORM for Multi Theft Auto San Andreas
	Copyright (c) 2012 Einstein
	Parts of code written by arc_

	Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--]]

local eDatabase
local sType
local tIDs = {}
local tTableInfoCache = {}
local tTableDataCache = {}
local tIDToTable = {}

---
--Local
---
local function getID()
    local id = #tIDs + 1
    tIDs[id] = true
    return id
end

local function releaseID(id)
    tIDs[id] = nil
end

local function dump(o)
	if type(o) == 'table' then
		local s = '{ '
		for k,v in pairs(o) do
			if type(k) ~= 'number' then k = '"'..k..'"' end
			s = s .. '['..k..'] = ' .. dump(v) .. ','
		end
		return s .. '} '
	else
		return tostring(o)
	end
end

local function databaseLoad(tableName)
	local sql 	
	if sType == "sqlite" then 
		sql = "CREATE TABLE IF NOT EXISTS "..tableName.." (id INTEGER PRIMARY KEY AUTOINCREMENT)"
	else 
		--TODO
	end
	executeSQLQuery(sql)
	
	if not tTableInfoCache[tableName] then 
		if sType == "sqlite" then 
			local sql = "PRAGMA table_info("..tableName..")"		
			local result = executeSQLQuery(sql)

			if not tTableInfoCache[tableName] then tTableInfoCache[tableName] = {} end			
			for field, table in pairs(result) do
				local fieldName = table.name

				tTableInfoCache[tableName][fieldName] = {}
				tTableInfoCache[tableName][fieldName]["type"] = table.field
				tTableInfoCache[tableName][fieldName]["fieldID"] = field
				tTableInfoCache[tableName][fieldName]["pk"] = table.pk
				tTableInfoCache[tableName][fieldName]["notnull"] = table.notnull
 			end

			return true
		else
			--TODO: MySQL
		end
	end
		

	return false
end


---
--Public
---
function databaseConnect(databaseType, host, username, password, options)
	eDatabase = dbConnect(databaseType, host, username or nil, password or nil, options or nil)
	if isElement(eDatabase) then 
		sType = databaseType		
		return true 
	else return false end
end

function databaseLoadData(tableName, searchInt)
	if not tTableInfoCache[tableName] then 
		databaseLoad(tableName)
	end

	local sql = "SELECT * FROM "..tableName.." WHERE "
	--Seach ID
	if type(searchInt) == "number" then
		if searchInt < 0 then return false end
		sql = sql.."id = "..searchInt
	--Custom SQL Search
	elseif type(searchInt) == "string" then
		sql = sql..searchInt
	end

	local result = executeSQLQuery(sql)
	--Loop,loop...tsch,tsch,tsch,tsch,tsch

	local dataIDTables = {}

	for resultID, valTable in pairs(result) do	
		local dataID = getID()

		if tTableDataCache[dataID] then tTableDataCache[dataID] = nil end
		tTableDataCache[dataID] = {}

		tIDToTable[dataID] = tableName

		table.insert(dataIDTables, dataID)

		for field, value in pairs(valTable) do
			tTableDataCache[dataID][field] = value
		end
	end

	if #dataIDTables == 1 then return dataIDTables[1] end
	return dataIDTables
end

function databaseNewData(tableName)
	if not tTableInfoCache[tableName] then 
		databaseLoad(tableName)
	end

	local sql = "INSERT INTO "..tableName.." ( id ) VALUES ( NULL )"
	local result = executeSQLQuery(sql)
	
	local dataID = -1

	if sType == "sqlite" then
		local sql = "select last_insert_rowid()"
		local result = executeSQLQuery(sql)
		dataID = tonumber(result[1]["last_insert_rowid()"])
	else
		--TODO: MySQL
	end	
	
	return databaseLoadData(tableName, dataID)
end

function databaseGetValue(dataID, field)
	if not dataID or not field then return nil end
	field = string.lower(field)
	if not tTableDataCache[dataID] then return nil end
	if not tTableDataCache[dataID][field] then return nil end

	return tTableDataCache[dataID][field]
end

function databaseSetValue(dataID, field, value)
	if not dataID or not field or not value then return false end
	field = string.lower(field)
	if field == "id" then return false end
	
	if not tTableDataCache[dataID] then return false end
	
	tTableDataCache[dataID][field] = value
	return true
end

function databaseTrash(dataID)
	if not dataID then return false end

	local tableName = tIDToTable[dataID]
	local databaseID = tTableDataCache[dataID]["id"]

	local sql = "DELETE FROM "..tableName.." WHERE id = "..databaseID
	executeSQLQuery(sql)
	return true
end

function databaseSave(dataID)
	if not dataID then return false end	
	if not tTableDataCache[dataID] then return false end

	local tableName = tIDToTable[dataID]

	for field, value in pairs(tTableDataCache[dataID]) do
		if field ~= "id" then
			if not tTableInfoCache[tableName][field] then
				--Now we have to add the new field
				if type(value) == "number" then
					if sType == "sqlite" then
						--Int
						if math.fpart(value) == 0 then
							local sql = "ALTER TABLE "..tableName.." ADD "..field.." INTEGER"
							executeSQLQuery(sql)
						else
							local sql = "ALTER TABLE "..tableName.." ADD "..field.." REAL"
							executeSQLQuery(sql)						
						end
					else
						--TODO: MySQL
					end
				elseif type(value) == "string" then
					if sType == "sqlite" then
						local sql = "ALTER TABLE "..tableName.." ADD "..field.." TEXT"
						executeSQLQuery(sql)					
					else
						--TODO: MySQL
					end
				elseif type(value) == "boolean" then 
					if sType == "sqlite" then
						local sql = "ALTER TABLE "..tableName.." ADD "..field.." INTEGER"
						executeSQLQuery(sql)
					else
						--TODO: MySQL
					end
				end
			end
		end
	end

	local insertTable = {}
	local insertID = -1
	
	--TODO
	for field, value in pairs(tTableDataCache[dataID]) do
		if field ~= "id" then		
			if type(value) == "number" then
				table.insert(insertTable, field.." = "..value)
			else
				table.insert(insertTable, field.." = '"..value.."'")
			end
		else
			insertID = value
		end
	end

	local sql = "UPDATE "..tableName.." SET "..table.concat(insertTable, ", ").." WHERE id = "..insertID
	executeSQLQuery(sql)
	
	return databaseEnd(dataID)
end

function databaseEnd(dataID)
	tTableDataCache[dataID] = nil
	tIDToTable[dataID] = nil
	releaseID(dataID)
	if not tTableDataCache[dataID] then return true end
	return false
end

