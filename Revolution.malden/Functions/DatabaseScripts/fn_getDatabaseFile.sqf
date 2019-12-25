/*
 Author: GamesByChris

 Description:
 Find the database file reference.

 Parameters:
 0: STRING - Player profile Name
 1: STRING - Player Unique ID
 2: STRING - Server Database ID

 Returns:
 CODE - Player File Reference
*/

params[["_name","UNKOWN",[""]],["_UID","000",[""]]];

private _serverDatabaseID = getText(missionConfigFile >> "CfgDatabase" >> "name");

if !(typeName _serverDatabaseID isEqualTo "STRING") exitWith
{["REV_fnc_findDatabaseFile - "] remoteExec ["REV_fnc_error",0];};

private _databasename = format ["%1_%2_"+_serverDatabaseID, _name, _UID];
private _playerFile = ["new", _databasename] call OO_INIDBI;

_playerFile