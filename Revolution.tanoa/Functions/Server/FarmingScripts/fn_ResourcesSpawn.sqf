/*
 Author: Koalas :P

 Description:
 Spawn resources in determinated markers. SERVER-SIDE

 Parameter(s):
 Nothing

 Returns:
 Nothing
*/

private _config = missionConfigFile >> "CfgFarming" >> "Resources";
private ["_object","_obj","_currentmarker","_zonearea"];

while {true} do {
    for "_i" from 0 to count(_config)-1 do {
        _currentmarker = _config select _i;
        _currentmarker = configName _currentmarker;
        _zonearea = getNumber(_config >> _currentmarker >> "ZoneArea");
        if ((count (allPlayers inAreaArray [getMarkerPos _currentmarker, _zonearea, _zonearea, 0, false, -1])) isEqualTo 0  && {count ((getArray(missionConfigFile >> "CfgFarming" >> "General" >> "ResourcesAllowed")) inAreaArray [getMarkerPos _currentmarker, _zonearea, _zonearea, 0, false, -1]) isEqualTo 0}) then {
            _object = getText(_config >> _currentmarker >> "P3D");
            if (getNumber(_config >> _currentmarker >> "UseP3D") isEqualTo 1) then {
                for "_i" from 0 to (getNumber(_config >> _currentmarker >> "AmountSpawn")) do {
                    _obj = createVehicle [
                    "UserTexture1m_F",
                    markerPos _currentmarker,
                    [],
                    getNumber(_config >> _currentmarker >> "ZoneSize"),
                    "NONE"
                    ];
                    /* Maybe hide the OBJ need to test */
                    createSimpleObject [_object, getPosWorld _obj];
                    };
            } else {
                for "_i" from 0 to (getNumber(_config >> _currentmarker >> "AmountSpawn")) do {
                    createVehicle [
                    _object,
                    markerPos _currentmarker,
                    [],
                    getNumber(_config >> _currentmarker >> "ZoneSize"),
                    "NONE"
                    ];
                };
            };
        };
    };

    uiSleep (30 + random 50);
};
