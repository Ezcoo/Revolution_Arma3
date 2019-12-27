/*
Author: Koalas :P

Description:
Spawn resources in determinated markers. SERVER-SIDE

Params:
Nothing

Output:
Nothing
*/

private _markers = missionConfigFile >> "CfgFarming" >> "Resources";
private ["_object","_obj"];

while {true} do {
    {
        if ((count (allPlayers inAreaArray _x)) isEqualTo 0 && {count (_config inAreaArray _x) isEqualTo 0}) then {
            _object = getText(_markers >> _x >> "P3D");
            if (getNumber(_x >> "UseP3D") isEqualTo 1) then {
                for "_i" from 0 to (getNumber(_markers >> _x >> "AmountSpawn")) do {
                    _obj = createVehicle [
                    "UserTexture1m_F",
                    markerPos _x,
                    [],
                    getNumber(_markers >> _x >> "ZoneSize"),
                    "NONE"
                    ];
                    /* Maybe hide the OBJ need to test */
                    createSimpleObject [_object, getPosWorld _obj];
                    };
            } else {
                for "_i" from 0 to (getNumber(_markers >> _x >> "AmountSpawn")) do {
                    createVehicle [
                    _object,
                    markerPos _x,
                    [],
                    getNumber(_markers >> _x >> "ZoneSize"),
                    "NONE"
                    ];
                };
            };
        };
    } forEach _markers;

    uiSleep (3 + random 5);
};
