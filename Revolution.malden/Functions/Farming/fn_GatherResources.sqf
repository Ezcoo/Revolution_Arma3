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

private _zone = "";
{
    if ((_resource distance (getMarkerPos _x)) < getNumber(_config >> _x >> "ZoneArea")) exitWith {_zone = _x;};
} forEach _config;

/*WIP progress bar*/
if (getNumber(_config >> _zone >> "UseP3D") isEqualTo 1) then {
    deleteVehicle ((nearestTerrainObjects [_resource, ["TREE"], 1]) select 0);
    deleteVehicle _resource;
} else {
    deleteVehicle _resource;
};


private _item = getNumber(_config >> _zone >> "Item");

/*WIP give item system*/
