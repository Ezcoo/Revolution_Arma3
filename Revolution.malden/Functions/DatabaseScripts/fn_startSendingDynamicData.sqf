/*
 Author: GamesByChris

 Description:
 Continuously updates client variables from the server.

 Parameter(s):
 Nothing

 Returns:
 Nothing
*/

if(!isServer) exitWith 
{["REV_fnc_startSendingDynamicData - Run only on the server!"] remoteExec ["REV_fnc_error",0];};

waitUntil {!isNil "isServerDatabaseRunning"};

if(!isServerDatabaseRunning) exitWith {};

if(isNil "OO_INIDBI") exitWith
{["REV_fnc_startSendingDynamicData - iniDB not found!"] remoteExec ["REV_fnc_error",0];};

private _rate = getNumber(missionConfigFile >> "CfgDatabase" >> "clientUpdateRate");

if (isNil "_rate") exitWith
{["REV_fnc_startSendingDynamicData - Update Rate is not defined!"] remoteExec ["REV_fnc_error",0];};

if !(typeName _rate isEqualTo "SCALAR") exitWith 
{["REV_fnc_startSendingDynamicData - Update Rate is not a number!"] remoteExec ["REV_fnc_error",0];};

while {isServerDatabaseRunning} do 
{
	ClientMoneyValue = nil;
	{
		private ["_player","_name","_uid","_ownerID"];

		_player = _x;
		_name = name _player;
		_uid = getPlayerUID _player;
		_ownerID = owner _player;
		
		// Set money value on client from server database
		_playerFile = [_name,_uid] call REV_fnc_getDatabaseFile;
		ClientMoneyValue = ["read", ["INFO", "Money"]] call _playerFile;
		_ownerID publicVariableClient "ClientMoneyValue";

		uiSleep 0.01;
	} foreach allPlayers;

	// Rate data is sent
	uiSleep _rate;
};