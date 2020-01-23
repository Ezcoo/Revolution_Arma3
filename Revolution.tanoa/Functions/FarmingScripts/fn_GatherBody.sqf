/*
Author: Koalas :P

Description:
Gather an item from a killed animal.

Params:
0: Object (The animal body)

Output:
Nothing
*/

params [
    ["_body",objNull,[objNull]]
];

if (isNull _body || {player distance _body > 3}) exitWith {};

private _config = missionConfigFile >> "CfgFarming" >> "Animals" >> typeOf _body;
private _cp = 0;

/* Progress Bar */
//disableSerialization;
// WIP
while {_cp < 1} do {
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
    deleteVehicle _body;
};
