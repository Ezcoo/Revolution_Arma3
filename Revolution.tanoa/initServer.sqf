
// ----------------------------------------------------------------- Server Database Related -----------------------------------------------------------------
_value = getNumber (missionConfigFile >> "CfgDatabase" >> "allowedToRun");

isServerDatabaseRunning = true;

if(_value == 0) then {isServerDatabaseRunning = false};

if(isServerDatabaseRunning) then {call REV_fnc_initServerDatabase;};

[] spawn REV_fnc_startSendingDynamicData;

// ----------------------------------------------------------------- ATM Related -----------------------------------------------------------------

/* Farming Related */
[] spawn REV_fnc_AnimalsSpawn;
[] spawn REV_fnc_ResourcesSpawn;
