/*
 Author: Koalas :P

 Description:
 Update the virtual items of the player on the client and on the database.

 Parameter(s):
 0: Array (Virtual Items)

 Returns:
 Nothing
*/

private _array = param [0,[],[[]]];

if (_array isEqualTo []) exitWith {/* ERROR! */};

missionNamespace setVariable ["ClientItems", _array];

private _handler = format ["VICheck_%1", clientOwner];

missionNamespace setVariable [_handler, 1];
publicVariableServer _handler;
missionNamespace setVariable [_handler, nil];
