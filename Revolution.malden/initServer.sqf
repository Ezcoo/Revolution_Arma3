
// ----------------------------------------------------------------- Server Database Related -----------------------------------------------------------------
ServerDatabaseID = getText(missionConfigFile >> "CfgDatabase" >> "name");
ServerDatabaseDefaultPosition = getArray(missionConfigFile >> "CfgDatabase" >> "defaultWorldPosition");
_value = getNumber (missionConfigFile >> "CfgDatabase" >> "allowedToRun");
if(_value == 1) then {isServerDatabaseRunning = true} else {isServerDatabaseRunning = false};

// Start the database
call REV_fnc_initServerDatabase;