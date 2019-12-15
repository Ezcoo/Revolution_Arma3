
// ----------------------------------------------------------------- Server Database Related -----------------------------------------------------------------
_value = getNumber (missionConfigFile >> "CfgDatabase" >> "allowedToRun");

isServerDatabaseRunning = true

if(_value == 0) then {isServerDatabaseRunning = false};

// Start the database?
if(isServerDatabaseRunning) then {call REV_fnc_initServerDatabase;};

// ----------------------------------------------------------------- ATM Related -----------------------------------------------------------------

