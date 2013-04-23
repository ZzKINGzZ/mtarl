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



function table.find(t, ...)
	local args = { ... }
	if #args == 0 then
		for k,v in pairs(t) do
			if v then
				return k
			end
		end
		return false
	end
	
	local value = table.remove(args)
	if value == '[nil]' then
		value = nil
	end
	for k,v in pairs(t) do
		for i,index in ipairs(args) do
			if type(index) == 'function' then
				v = index(v)
			else
				if index == '[last]' then
					index = #v
				end
				v = v[index]
			end
		end
		if v == value then
			return k
		end
	end
	return false
end

function table.findall(t, ...)
	local args = { ... }
	local result = {}
	if #args == 0 then
		for k,v in pairs(t) do
			if v then
				result[#result+1] = k
			end
		end
		return result
	end
	
	local value = table.remove(args)
	if value == '[nil]' then
		value = nil
	end
	for k,v in pairs(t) do
		for i,index in ipairs(args) do
			if type(index) == 'function' then
				v = index(v)
			else
				if index == '[last]' then
					index = #v
				end
				v = v[index]
			end
		end
		if v == value then
			result[#result+1] = k
		end
	end
	return result
end

function table.removevalue(t, val)
	for i,v in ipairs(t) do
		if v == val then
			table.remove(t, i)
			return i
		end
	end
	return false
end

function table.merge(appendTo, ...)
	-- table.merge(targetTable, table1, table2, ...)
	-- Append the values of one or more tables to a target table.
	--
	-- In the arguments list, a table pointer can be followed by a
	-- numeric or textual key. In that case the values in the table
	-- will be assumed to be tables, and of each of these the value
	-- corresponding to the given key will be appended instead of the
	-- subtable itself.
	local appendval
	local args = { ... }
	for i,a in ipairs(args) do
		if type(a) == 'table' then
			for k,v in pairs(a) do
				if args[i+1] and type(args[i+1]) ~= 'table' then
					appendval = v[args[i+1]]
				else
					appendval = v
				end
				if appendval then
					if type(k) == 'number' then
						table.insert(appendTo, appendval)
					else
						appendTo[k] = appendval
					end
				end
			end
		end
	end
	return appendTo
end

function table.map(t, callback)
	for k,v in ipairs(t) do
		t[k] = callback(v)
	end
	return t
end

function table.dump(t, caption, depth)
	if not depth then
		depth = 1
	end
	if depth == 1 and caption then
		outputConsole(caption .. ':')
	end
	if not t then
		outputConsole('Table is nil')
	elseif type(t) ~= 'table' then
		outputConsole('Argument passed is of type ' .. type(t))
		local str = tostring(t)
		if str then
			outputConsole(str)
		end
	else
		local braceIndent = string.rep('  ', depth-1)
		local fieldIndent = braceIndent .. '  '
		outputConsole(braceIndent .. '{')
		for k,v in pairs(t) do
			if type(v) == 'table' and k ~= 'siblings' and k ~= 'parent' then
				outputConsole(fieldIndent .. tostring(k) .. ' = ')
				table.dump(v, nil, depth+1)
			else
				outputConsole(fieldIndent .. tostring(k) .. ' = ' .. tostring(v))
			end
		end
		outputConsole(braceIndent .. '}')
	end
end

function table.flatten(t, result)
	if not result then
		result = {}
	end
	for k,v in ipairs(t) do
		if type(v) == 'table' then
			table.flatten(v, result)
		else
			table.insert(result, v)
		end
	end
	return result
end

function table.rep(value, times)
	local result = {}
	for i=1,times do
		table.insert(result, value)
	end
	return result
end

function table.each(t, index, callback, ...)
	local args = { ... }
	if type(index) == 'function' then
		table.insert(args, 1, callback)
		callback = index
		index = false
	end
	for k,v in pairs(t) do
		callback(index and v[index] or v, unpack(args))
	end
	return t
end
