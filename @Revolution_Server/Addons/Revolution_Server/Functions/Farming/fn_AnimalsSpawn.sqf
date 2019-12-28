/*
Author: Koalas :P

Description:
Spawn animals in determinated marker. SERVER-SIDE

Parameter(s):
Nothing

Returns:
Nothing
*/

private _markers = missionConfigFile >> "CfgFarming" >> "AnimalsSpawn";
private ["_currentMarker","_markerAnimals"];

while {true} do {
    for "_i" from 0 to count(_markers)-1 do{
        _currentMarker = _markers select _i;
        _currentMarker = configName _currentMarker;
        diag_log format ["2: %1",_currentMarker];
        if ((count (allPlayers inAreaArray _currentMarker)) isEqualTo 0) then {
            if (!(isNil (missionNamespace getVariable format ["animalsOfMarker_%1", _currentMarker]))) then {
                _markerAnimals = missionNamespace getVariable format ["animalsOfMarker_%1", _currentMarker];
                for "_i" from 0 to (count _markerAnimals) do {
                    if (!alive (_markerAnimals select _i)) then {
                        _markerAnimals deleteAt _i;
                    };
                };
                if (count _markerAnimals < 1) then {
                    sleep 60;
                    {deleteVehicle _x;} forEach _markerAnimals;
                    missionNamespace setVariable [format ["animalsOfMarker_%1", _currentMarker], [_currentMarker] call REV_FNC_spawnAnimals];
                };
            } else {
                missionNamespace setVariable [format ["animalsOfMarker_%1", _currentMarker], [_currentMarker] call REV_FNC_spawnAnimals];
            };
        };
    };

    uiSleep (30 + random 50);
};