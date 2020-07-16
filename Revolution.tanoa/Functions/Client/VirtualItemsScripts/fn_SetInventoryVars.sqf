/*
	author: Marco
	description: none
	returns: nothing
*/

params [
    ["_array",[],[[]]]
];

if (_array isEqualTo []) exitWith {/* ERROR! */};

missionNamespace setVariable ["ClientItems", _array];
["write", ["INFO", "VirtualItems", _array]] call ([profileName, getPlayerUID player] call REV_fnc_getDatabaseFile);