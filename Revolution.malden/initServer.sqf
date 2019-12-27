/* Server Side Related */

call compile preprocessFileLineNumbers "\Revolution_Server\init.sqf";

// ----------------------------------------------------------------- Server Database Related -----------------------------------------------------------------

isServerDatabaseRunning = true;

if(getNumber (missionConfigFile >> "CfgDatabase" >> "allowedToRun") isEqualTo 0) then {isServerDatabaseRunning = false};

if(isServerDatabaseRunning) then {call REV_fnc_initServerDatabase;};

[] spawn REV_fnc_startSendingDynamicData;

// ----------------------------------------------------------------- ATM Related -----------------------------------------------------------------
