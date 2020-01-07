/*
 Author: GamesByChris

 Description:
 Initializes the PublicVariableEventHandler for joining players and communicates with iniDB

 Parameters:
 Nothing

 Returns:
 Nothing
*/

if(!isServer) exitWith
{["REV_fnc_initServerDatabase - Run only on the server!"] remoteExec ["REV_fnc_error",0];};

waitUntil {time > 0};

"rev_database_check" addPublicVariableEventHandler {
    if(isNil "OO_INIDBI") exitWith
    {["REV_fnc_initServerDatabase - iniDB is not running!"] remoteExec ["REV_fnc_error",0];};

  	params ["",["_packet",[],[]]];

    _packet params [
        ["_dataplayerowner",0,[0]],
        ["_dataplayername","",[""]],
        ["_dataplayeruid","",[""]]
    ];

  	private _playerFile = [_dataplayername,_dataplayeruid] call REV_fnc_getDatabaseFile;
  	private _isFilePresent = "exists" call _playerFile;

// ------------------------------------------------------cant find the database saving new players name and uid---------------------------------------------------
    private _defaultPosition = getArray(missionConfigFile >> "CfgDatabase" >> "defaultWorldPosition");
    private _defaultLoadout = selectRandom([missionConfigFile >> "CfgLoadouts" >> "civilian" >> "default"] call BIS_fnc_returnChildren);
    private _defaultMoneyValue = getNumber(missionConfigFile >> "CfgDatabase" >> "defaultMoneyValue");

    if (!_isFilePresent) exitWith {
        ["write", ["INFO", "Name", _dataplayername]] call _playerFile;
        ["write", ["INFO", "UID", _dataplayeruid]] call _playerFile;
    	["write", ["POSITION", "Position", _defaultPosition]] call _playerFile;
        ["write", ["POSITION", "Direction", 0]] call _playerFile;
        ["write", ["INFO", "Damage",0]] call _playerFile;
        ["write", ["GEAR", "Loadout",getUnitLoadout _defaultLoadout]] call _playerFile;
        ["write", ["INFO", "Money",_defaultMoneyValue]] call _playerFile;

        if (!hasInterface) then {rev_database_check = nil;};

        // Debug
        "New Player File Created" remoteExec ["systemChat"];
    };
// --------------------------------------------------------found the database now loading data to send to player---------------------------------------------------
    if (_isFilePresent) exitWith {
        private _readpos = ["read", ["POSITION", "Position"]] call _playerFile;
        private _readdir = ["read", ["POSITION", "Direction"]] call _playerFile;
        private _readdamage = ["read", ["INFO", "Damage"]] call _playerFile;
        private _readloadout = ["read", ["GEAR", "Loadout"]] call _playerFile;
        private _readMoneyValue = ["read", ["INFO", "Money"]] call _playerFile;

        // Check if any values are nil, if so set to default (error handling)
        if (!_readPos) then {["write", ["POSITION", "Position", _defaultPosition]] call _playerFile; _readPos = _defaultPosition;};
        if (!_readdir) then {["write", ["POSITION", "Direction", 0]] call _playerFile; _readdir = 0;};
        if (!_readdamage) then {["write", ["INFO", "Damage", 0]] call _playerFile; _readdamage = 0;};
        if (!_readloadout) then {["write", ["GEAR", "Loadout", _defaultLoadout]] call _playerFile; _readloadout = _defaultLoadout;};
        if (!_readMoneyValue) then {["write", ["INFO", "Money", _defaultMoneyValue]] call _playerFile; _readMoneyValue = _defaultMoneyValue;};

        rev_database_load =
    	[
            _readpos,
            _readdir,
            _readdamage,
            _readloadout,
            _readMoneyValue
    	];

        _dataplayerowner publicVariableClient "rev_database_load";

        if (!hasInterface) then {rev_database_load = nil;};
        if (!hasInterface) then {rev_database_check = nil;};

        // Debug
        "Player File Data Sent" remoteExec ["systemChat"];
    };
};

// --------------------------------------------------player sent save game data to server - saving it to database--------------------------------------------------
"rev_database_save" addPublicVariableEventHandler {
     if(isNil "OO_INIDBI") exitWith
    {["REV_fnc_initServerDatabase - iniDB is not running!"] remoteExec ["REV_fnc_error",0];};

    params ["",["_packet",[],[]]];

    private _playerFile = [_packet select 0,_packet select 1] call REV_fnc_getDatabaseFile;
  	private _isFilePresent = "exists" call _playerFile;

    // Check if file exists
    if (!_isFilePresent) then {["REV_fnc_initServerDatabase - Failed to save player data, file does not exist!"] remoteExec ["REV_fnc_error",0];};

    ["write", ["INFO", "Name", _packet select 0]] call _playerFile;
    ["write", ["INFO", "UID", _packet select 1]] call _playerFile;
    ["write", ["POSITION", "Position", _packet select 2]] call _playerFile;
    ["write", ["POSITION", "Direction", _packet select 3]] call _playerFile;
    ["write", ["INFO", "Damage", _packet select 4]] call _playerFile;
    ["write", ["GEAR", "Loadout", _packet select 5]] call _playerFile;

    if (!hasInterface) then {rev_database_save = nil;};

	// Debug
    "Player File Saved" remoteExec ["systemChat"];
};
