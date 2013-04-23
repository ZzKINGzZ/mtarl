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



sourceCoroutine = nil

local _addEventHandler = addEventHandler
function addEventHandler ( event, element, handler )
        _addEventHandler ( event, element, corouteHandler ( handler ) )
end

function corouteHandler ( handler )
        return function ( ... )
                local c = coroutine.create ( handler )
                sourceCoroutine = c
                local result, error = coroutine.resume ( c, ... )
                if ( not result ) then
                        outputDebugString ( tostring ( error ) )
                end
                if ( sourceCoroutine == c ) then
                        sourceCoroutine = nil
                end
        end
end

function coroutineKill ( cr )
        if ( coroutine.status ( c ) ~= 'dead' ) then
                coroutine.resume ( c, nil )
        end
end
