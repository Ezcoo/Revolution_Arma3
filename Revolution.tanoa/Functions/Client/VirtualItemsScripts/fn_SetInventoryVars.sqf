/*
 Author: Koalas :P

 Description:
 Update the virtual items of the player on the client and on the database.

 Parameter(s):
 0: Array (Virtual Items)

 Returns:
 Nothing
*/

params [
    ["_array",[],[[]]]
];

if (_array isEqualTo []) exitWith {/* ERROR! */};

missionNamespace setVariable ["ClientItems", _array];
["write", ["INFO", "VirtualItems", _array]] call ([profileName, getPlayerUID player] call REV_fnc_getDatabaseFile);
