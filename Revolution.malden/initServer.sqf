// ----------------------------------------------------------------- Server Database Related -----------------------------------------------------------------

isServerDatabaseRunning = true;

if(getNumber (missionConfigFile >> "CfgDatabase" >> "allowedToRun") isEqualTo 0) then {isServerDatabaseRunning = false};

if(isServerDatabaseRunning) then {call REV_fnc_initServerDatabase;};

[] spawn REV_fnc_startSendingDynamicData;

// ----------------------------------------------------------------- ATM Related -----------------------------------------------------------------

/* Farming Related */
[] spawn REV_fnc_AnimalsSpawn;
[] spawn REV_fnc_ResourcesSpawn;

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
