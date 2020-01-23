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
private _cp = 0;
private _zone = "";
{
    if ((_resource distance (getMarkerPos _x)) < getNumber(_config >> _x >> "ZoneArea")) exitWith {_zone = _x;};
} forEach _config;
private _config = missionConfigFile >> "CfgFarming" >> "Resources" >> _zone;

/* Progress Bar */
//disableSerialization;
// WIP
while {_cp >= 1} do {
    sleep 0.85;
    _cp = _cp + 0.001;
    //_progress progressSetPosition _cp;

    if (player distance _body > 3 || !alive player || !(isNull objectParent player)) exitWith {};
};

if (!alive player) exitWith {};
if (player distance _body > 3) exitWith {"Too far away" remoteExec ["systemChat", clientOwner];};
if !(isNull objectParent player) exitWith {"In a Vehicle" remoteExec ["systemChat", clientOwner];};



/* Give Items */
private _items = getArray(_config >> "Items");
private "_operations";
for "_i" from 1 to count(_items) do {
    _operations pushBack true;
};

if ([_items, getArray(_config >> "Amounts"), _operations] call REV_fnc_VItemsHandlerPlayer) then {
    if (getNumber(_config >> _zone >> "UseP3D") isEqualTo 1) then {
        deleteVehicle ((nearestTerrainObjects [_resource, ["TREE"], 1]) select 0);
        deleteVehicle _resource;
    } else {
        deleteVehicle _resource;
    };
};
