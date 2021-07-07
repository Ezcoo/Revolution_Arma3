/*
 Author: Koalas :P

 Description:
 Get the virtual items array of the player and send it to the server.

 Parameter(s):
 Nothing

 Returns:
 Nothing
*/

private _clientitems = missionNamespace getVariable ["ClientItems", []];

if (_clientitems isEqualTo []) then {/* ERROR! */};
private _clientvar = format ["VIClientItems_%1",clientOwner];
missionNamespace setVariable [_clientvar, +_clientitems];
publicVariableServer _clientvar;
missionNamespace setVariable [_clientvar, nil];
