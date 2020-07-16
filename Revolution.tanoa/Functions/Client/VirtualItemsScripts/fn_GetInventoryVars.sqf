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

rev_clientitems = _clientitems;
publicVariableServer "rev_clientitems";
