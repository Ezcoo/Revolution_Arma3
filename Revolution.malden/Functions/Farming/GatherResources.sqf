/*
Author: Koalas :P

Description:
Gather an item from a resource.

Params:
0: Object (The resource)

Output:
Nothing
*/

params [
    ["_resource","",[""]]
];

if (_resource isEqualTo "") exitWith {};
if (player distance _resource > 3) exitWith {};
private _config = missionConfigFile >> "CfgFarming" >> "Resources";

/*WIP progress bar*/
deleteVehicle _resource;
/*WIP give item system*/