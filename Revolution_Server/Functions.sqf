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

publicVariable "REV_FNC_spawnAnimals";
