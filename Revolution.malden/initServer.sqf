
// ----------------------------------------------------------------- Server Database Related -----------------------------------------------------------------
_value = getNumber (missionConfigFile >> "CfgDatabase" >> "allowedToRun");
if(_value == 1) then {isServerDatabaseRunning = true} else {isServerDatabaseRunning = false};

// Start the database?
if(isServerDatabaseRunning) then {call REV_fnc_initServerDatabase;};