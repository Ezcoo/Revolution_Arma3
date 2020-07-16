/*
	author: Marco
	description: none
	returns: nothing
*/

private _clientitems = missionNamespace getVariable ["ClientItems", []];

if (_clientitems isEqualTo []) then {/* ERROR! */};

rev_clientitems = _clientitems;
publicVariableServer "rev_clientitems";