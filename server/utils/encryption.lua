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




iaEncryptionArray = {};
iaDecryptionArray = {};
caPassword = "";
iPasswordLength = 0;
caText = "";
caEncryptedText = "";
iPasswordPosition = 1;

function addEncryptionPasswordChar(value)
	iPasswordPosition = iPasswordPosition + 1;
	if (iPasswordPosition > iPasswordLength) then
		iPasswordPosition = 1;
	end
	output = value + string.byte(caPassword,iPasswordPosition);
	if (output > 999) then
		output = output - 1000;
	end
	return output;
end

function subsEncryptionPasswordChar(value)
	iPasswordPosition = iPasswordPosition - 1;
	if (iPasswordPosition < 1) then
		iPasswordPosition = iPasswordLength;
	end
	output = value - string.byte(caPassword,iPasswordPosition);
	if (output < 0) then
		output = output + 1000;
	end
	return output;
end

function generateEncryptionPassword()
	iPasswordHash = 0;
	caOutput = "";
	for i=1, iPasswordLength, 1 do
		iPasswordHash = iPasswordHash + string.byte(caPassword,i); -- char!
	end
	for i=1, iPasswordLength, 1 do
		caOutput = caOutput .. string.char(iPasswordHash % string.byte(caPassword,i)); -- char! char!
	end
	return caOutput;
end

function stringSetChar(string,char,pos)
	length = string.len(string);
	if pos > length then
		return string;
	end
	string = string.sub(string,1,pos) .. char .. string.sub(string,pos+1,length);
	return string;
end

function generateEncryptionArray()
	generateDecryptionArray();
end

function generateDecryptionArray()
	caEncryptionPassword = generateEncryptionPassword(caPassword);
	for i=0, 999, 1 do
		iaEncryptionArray[i]=NIL;
	end
	iPosition = 0;
	n=1;
	for i=0, 999, 1 do
		n = n + 1;
		if (string.byte(caPassword,n) == NIL) then
			n=1;
		end
		iPosition = iPosition + string.byte(caEncryptionPassword,n) + string.byte(caPassword,n);
		iPosition = iPosition % 1000;
		while (iaEncryptionArray[iPosition]) do
			iPosition = iPosition + 1;
			if (iPosition >= 1000) then
				iPosition = iPosition - 1000;
			end
		end
		iaEncryptionArray[iPosition] = i;
		iaDecryptionArray[i] = iPosition;
	end
end

function encrypt()
	generateEncryptionArray();
	iTextSize = string.len(caText);
	iEncryptedTextSize = iTextSize*3;
	caEncryptedText = "";
	aEncryptedText = {};
	for i=1, iTextSize, 1 do
		value = string.byte(caText,i);
		n=i*3;
		if (value < 10) then
			value = string.format("00%i",value);
		elseif (value < 100) then
			value = string.format("0%i",value);
		else
			value = string.format("%i",value);
		end
		aEncryptedText[(i-1)*3+1] = string.byte(value,1) - 48;
		aEncryptedText[(i-1)*3+2] = string.byte(value,2) - 48;
		aEncryptedText[(i-1)*3+3] = string.byte(value,3) - 48;
	end
	iCounter = 1;
	iPasswordPosition = 1;
	for runs=1, 32, 1 do
		for i=1, iEncryptedTextSize, 1 do
			iCounter = iCounter + 1;
			pos1 = i;
			pos2 = i+1;
			pos3 = i+2;
			if (pos2 > iEncryptedTextSize) then
				pos2 = pos2 - iEncryptedTextSize;
				pos3 = pos3 - iEncryptedTextSize;
			elseif (pos3 > iEncryptedTextSize) then
				pos3 = pos3 - iEncryptedTextSize;
			end
			local h = aEncryptedText[pos1];
			local z = aEncryptedText[pos2];
			local e = aEncryptedText[pos3];
			if not e then
				caEncryptedText = "";
				return;
			end
			value = 100*h + 10*z + e;
			value = iaEncryptionArray[value];
			value = subsEncryptionPasswordChar(value);
			h = math.floor(value / 100);
			value = value - 100*h;
			z = math.floor(value / 10);
			value = value - 10*z;
			e = value;
			aEncryptedText[pos1] = h;
			aEncryptedText[pos2] = z;
			aEncryptedText[pos3] = e;
		end
	end
	caEncryptedText = "";
	for i=1,iEncryptedTextSize,1 do
		caEncryptedText = caEncryptedText .. string.format("%i",aEncryptedText[i]);
	end
end

function decrypt()
	generateDecryptionArray();
	iEncryptedTextSize = string.len(caEncryptedText);
	aEncryptedText = {};
	for i=1,iEncryptedTextSize,1 do
		aEncryptedText[i] = string.byte(caEncryptedText,i) - 48;
	end
	caEncryptedText = "";
	iPasswordPosition = - (iEncryptedTextSize*32) - 1;
	iPasswordPosition = iPasswordPosition % iPasswordLength + 1;
	for runs=1, 32, 1 do
		for i=iEncryptedTextSize, 1, -1 do
			pos1 = i;
			pos2 = i+1;
			pos3 = i+2;
			if (pos2 > iEncryptedTextSize) then
				pos2 = pos2 - iEncryptedTextSize;
				pos3 = pos3 - iEncryptedTextSize;
			elseif (pos3 > iEncryptedTextSize) then
				pos3 = pos3 - iEncryptedTextSize;
			end
			local h = aEncryptedText[pos1];
			local z = aEncryptedText[pos2];
			local e = aEncryptedText[pos3];
			if not e then
				caText = "";
				return;
			end

			value = 100*h + 10*z + e;
			value = addEncryptionPasswordChar(value);
			value = iaDecryptionArray[value];
			h = math.floor(value / 100);
			value = value - 100*h;
			z = math.floor(value / 10);
			value = value - 10*z;
			e = value;
			aEncryptedText[pos1] = h;
			aEncryptedText[pos2] = z;
			aEncryptedText[pos3] = e;
		end
	end
	iTextSize = iEncryptedTextSize / 3
	caText = "";
	for i=1,iEncryptedTextSize,1 do
		caEncryptedText = caEncryptedText .. string.format("%i",aEncryptedText[i]);
	end
	for i=1, iTextSize, 1 do
		n = (i-1)*3+1;
		char = aEncryptedText[n]*100 + aEncryptedText[n+1]*10 + aEncryptedText[n+2];
		if char > 255 then
			caText = "";
			return;
		end
		caText = caText .. string.char(char);
	end
end

function encryptString(caTextInput,caPasswordInput)
	if not caTextInput or not caPasswordInput then
		outputDebugString("NIL or FALSE values given!");
		return nil;
	end
	caText = caTextInput;
	caPassword = caPasswordInput;
	iPasswordLength = string.len(caPassword);
	encrypt();
	return (caEncryptedText);
end

function decryptString(caTextInput,caPasswordInput)
	if not caTextInput or not caPasswordInput then
		outputDebugString("NIL or FALSE values given!");
		return nil;
	end
	caEncryptedText = caTextInput;
	caPassword = caPasswordInput;
	iPasswordLength = string.len(caPassword);
	decrypt();
	return (caText);
end
