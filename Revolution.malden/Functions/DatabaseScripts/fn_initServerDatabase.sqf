/*
 Author: GamesByChris

 Description:
 Initializes the PublicVariableEventHandler for joining players and communicates with iniDB

 Parameters:
 Nothing

 Returns:
 Nothing
*/

waitUntil {time > 0};

"rev_database_check" addPublicVariableEventHandler {
    if(isNil "OO_INIDBI") exitWith {};
  	_packet = _this select 1;
 	_dataplayerowner = _packet select 0;
  	_dataplayername = _packet select 1;
  	_dataplayeruid = _packet select 2;
    _serverDatabaseID = getText(missionConfigFile >> "CfgDatabase" >> "name");
  	_databasename = format ["%1_%2_"+_serverDatabaseID, _dataplayername, _dataplayeruid];
  	_playerFile = ["new", _databasename] call OO_INIDBI;
  	_isFilePresent = "exists" call _playerFile;
 
// ------------------------------------------------------cant find the database saving new players name and uid---------------------------------------------------
    _defaultPosition = getArray(missionConfigFile >> "CfgDatabase" >> "defaultWorldPosition");
    _defaultLoadout = selectRandom([missionConfigFile >> "CfgLoadouts" >> "civilian" >> "default"] call BIS_fnc_returnChildren);
    _defaultMoneyValue = getNumber(missionConfigFile >> "CfgDatabase" >> "defaultMoneyValue");

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
        _readpos = ["read", ["POSITION", "Position"]] call _playerFile;
        _readdir = ["read", ["POSITION", "Direction"]] call _playerFile;
        _readdamage = ["read", ["INFO", "Damage"]] call _playerFile;
        _readloadout = ["read", ["GEAR", "Loadout"]] call _playerFile;
        _readMoneyValue = ["read", ["INFO", "Money"]] call _playerFile;

        // Check if any values are nil, if so set to default (error handling)
        if(isNil "_readPos") then {["write", ["POSITION", "Position", _defaultPosition]] call _playerFile; _readPos = _defaultPosition;};
        if(isNil "_readdir") then {["write", ["POSITION", "Direction", 0]] call _playerFile; _readdir = 0;};
        if(isNil "_readdamage") then {["write", ["INFO", "Damage", 0]] call _playerFile; _readdamage = 0;};
        if(isNil "_readloadout") then {["write", ["GEAR", "Loadout", _defaultLoadout]] call _playerFile; _readloadout = _defaultLoadout;};
        if(isNil "_readMoneyValue") then {["write", ["INFO", "Money", _defaultMoneyValue]] call _playerFile; _readMoneyValue = _defaultMoneyValue;};

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
    if(isNil "OO_INIDBI") exitWith {};
    _packet = _this select 1;
    _serverDatabaseID = getText(missionConfigFile >> "CfgDatabase" >> "name");
    _databasename = format ["%1_%2_"+_serverDatabaseID, _packet select 0, _packet select 1];
    _playerFile = ["new", _databasename] call OO_INIDBI;
    _isFilePresent = "exists" call _playerFile;

    // Check if file exists
    if (!_isFilePresent) then {["REV_fnc_initServerDatabase - Failed to save player data, file does not exist!"] remoteExec ["REV_fnc_error",0];};
    
    ["write", ["INFO", "Name", _packet select 0]] call _playerFile;
    ["write", ["INFO", "UID", _packet select 1]] call _playerFile;
    ["write", ["POSITION", "Position", _packet select 2]] call _playerFile;
    ["write", ["POSITION", "Direction", _packet select 3]] call _playerFile;
    ["write", ["INFO", "Damage", _packet select 4]] call _playerFile;
    ["write", ["GEAR", "Loadout", _packet select 5]] call _playerFile;

    // Money error checking
    _maxValue = getNumber(missionConfigFile >> "CfgDatabase" >> "maxBankSize");
    _value = _packet select 6;
    if(_value > _maxValue) then {_value = _maxValue};
    ["write", ["INFO", "Money",_value]] call _playerFile;
 
    if (!hasInterface) then {rev_database_save = nil;};

	// Debug
    "Player File Saved" remoteExec ["systemChat"];
};