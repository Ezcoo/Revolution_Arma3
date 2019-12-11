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
  	_packet = _this select 1;
 	_dataplayerowner = _packet select 0;
  	_dataplayername = _packet select 1;
  	_dataplayeruid = _packet select 2;
  	_databasename = format ["%1_%2_"+ServerDatabaseID, _dataplayername, _dataplayeruid];
  	_playerFile = ["new", _databasename] call OO_INIDBI;
  	_isFilePresent = "exists" call _playerFile;
 
// ------------------------------------------------------cant find the database saving new players name and uid---------------------------------------------------
    if (!_isFilePresent) then {
    	["write", ["INFO", "Name", _dataplayername]] call _playerFile;
        ["write", ["INFO", "UID", _dataplayeruid]] call _playerFile;
    	["write", ["POSITION", "Position", ServerDatabaseDefaultPosition]] call _playerFile;

    	// Debug
    	"New Player File Created" remoteExec ["systemChat"];
    };
// --------------------------------------------------------found the database now loading data to send to player---------------------------------------------------
    if (_isFilePresent) then {
    
        _readpos = ["read", ["POSITION", "Position"]] call _playerFile;
        //_readdir = ["read", ["POSITION", "Direction"]] call _playerFile;
        //_readdamage = ["read", ["INFO", "Health"]] call _playerFile;
        //_readloadout = ["read", ["GEAR", "Loadout"] call _playerFile;

        rev_database_load = 
    	[
    		_readpos
            //_readdir,
            //_readdamage,
            //_readloadout
    	];
        _dataplayerowner publicVariableClient "rev_database_load";
    };

    rev_database_load = nil;
    rev_database_check = nil;

    // Debug
    "Player File Data Sent" remoteExec ["systemChat"];
};
 
// --------------------------------------------------player sent save game data to server - saving it to database--------------------------------------------------
"rev_database_save" addPublicVariableEventHandler {
    _packet = _this select 1;
    _databasename = format ["%1_%2_"+ServerDatabaseID, _packet select 0, _packet select 1];
    _playerFile = ["new", _databasename] call OO_INIDBI;
    _isFilePresent = "exists" call _playerFile;

    // Check if file exists
    if (!_isFilePresent) then {hint "REV_fnc_initServerDatabase: Failed to save player data, file does not exist!"};
    
    ["write", ["INFO", "Name", _packet select 0]] call _playerFile;
    ["write", ["INFO", "UID", _packet select 1]] call _playerFile;
    ["write", ["POSITION", "Position", _packet select 2]] call _playerFile;
    //["write", ["POSITION", "Direction", _packet select 3]] call _playerFile;
    //["write", ["INFO", "Health", _packet select 4]] call _playerFile;
    //["write", ["GEAR", "Loadout", _packet select 5]] call _playerFile;
 
    rev_database_save = nil;

	// Debug
    "Player File Saved" remoteExec ["systemChat"];
};