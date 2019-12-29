/*
Author: Koalas :P

Description:
Spawn animals in determinated marker. SERVER-SIDE

Parameter(s):
Nothing

Returns:
Nothing
*/

// here for now cuz idk where to put it at the moment
REV_FNC_spawnAnimals = {
    params[["_marker","",[""]]];

    if (_marker isEqualTo "") exitWith {};
    private _animals = [];

    for "_i" from 0 to (getNumber (missionConfigFile >> "CfgFarming" >> "AnimalsSpawn" >> _marker >> "MaxAnimals")) do {
        _animals pushBack ((createAgent
                [selectRandom (getArray (missionConfigFile >> "CfgFarming" >> "AnimalsSpawn" >> _marker >> "Animals")),
                markerPos _marker,
                [],
                100,
                "FORM"]
        ) setDir (random 360));
    };
    _animals;
};
call compileFinal "REV_FNC_spawnAnimals";

private _markers = missionConfigFile >> "CfgFarming" >> "AnimalsSpawn";
private ["_currentMarker","_markerAnimals"];

while {true} do {
    for "_i" from 0 to count(_markers)-1 do{
        _currentMarker = _markers select _i;
        _currentMarker = configName _currentMarker;
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
