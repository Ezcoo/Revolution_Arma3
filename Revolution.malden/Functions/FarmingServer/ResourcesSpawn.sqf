/*
Author: Koalas :P

Description:
Spawn resources in determinated markers. SERVER-SIDE

Params:
Nothing

Output:
Nothing
*/

private _config = missionConfigFile >> "CfgFarming" >> "Resources";
private ["_type","_markers"];

while {true} do {
    for "_i" from 0 to count(_config) do {
        _type = _config select _i;
        _markers = (getArray(_type >> "Markers"));
        {
            if ((count (allPlayers inAreaArray _x)) isEqualTo 0 && {count (_config inAreaArray _x) isEqualTo 0}) then {
                for "_i" from 0 to (getNumber(_type >> "AmountSpawn")) do {
                    createVehicle [_type, markerPos _x, [], 50, "NONE"];
                };
            };
        } forEach _markers;
    };

    uiSleep (3 + random 5);
};