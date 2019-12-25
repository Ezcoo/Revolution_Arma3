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
private ["_type","_markers","_object","_obj","_loc"];

while {true} do {
    for "_i" from 0 to count(_config) do {
        _type = _config select _i;
        _markers = getArray(_type >> "Markers");
        {
            if ((count (allPlayers inAreaArray _x)) isEqualTo 0 && {count (_config inAreaArray _x) isEqualTo 0}) then {
                _object = getText(_type >> "P3D");
                if (getNumber(_type >> "UseP3D") isEqualTo 1) then {
                        for "_i" from 0 to (getNumber(_type >> "AmountSpawn")) do {
                            _obj = createSimpleObject [_object, [0,0,0]];// WIP
                            _loc = markerPos [_x, true]; // WIP
                            _obj setPos [(_loc select 0) + random(15), (_loc select 1) + random(15), _loc select 2]; // WIP
                        };
                    } else {
                        for "_i" from 0 to (getNumber(_type >> "AmountSpawn")) do {
                            createVehicle [_object, markerPos _x, [], 50, "NONE"];
                        };
                    };
                };
        } forEach _markers;
    };

    uiSleep (3 + random 5);
};