/*
 Author: GamesByChris

 Description:
 Adds money to a player file on server.

 Parameter(s):
 0:
 1:
 2:

 Returns:
 Nothing
*/

// Money error checking
private _maxValue = getNumber(missionConfigFile >> "CfgDatabase" >> "maxBankSize");
private _value = _packet select 6;
if(_value > _maxValue) then {_value = _maxValue};
["write", ["INFO", "Money",_value]] call _playerFile;