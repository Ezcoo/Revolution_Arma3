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
private _scalingCoefficient = getNumber(missionConfigFile >> "CfgDatabase" >> "clientUpdateRateScalingCoefficient");

if (isNil "_rate") exitWith
{["REV_fnc_startSendingDynamicData - Update Rate is not defined!"] remoteExec ["REV_fnc_error",0];};

if !(typeName _rate isEqualTo "SCALAR") exitWith 
{["REV_fnc_startSendingDynamicData - Update Rate is not a number!"] remoteExec ["REV_fnc_error",0];};

if (isNil "_scalingCoefficient") exitWith
{["REV_fnc_startSendingDynamicData - Update Rate Scaling Coefficient is not defined!"] remoteExec ["REV_fnc_error",0];};

if !(typeName _scalingCoefficient isEqualTo "SCALAR") exitWith
{["REV_fnc_startSendingDynamicData - Update Rate Scaling Coefficient is not a number!"] remoteExec ["REV_fnc_error",0];};

while {isServerDatabaseRunning} do 
{
	ClientMoneyValue = nil;
	{
		private ["_player","_name","_uid","_ownerID","_totalPlayers","_interval"];

		_player = _x;
		_name = name _player;
		_uid = getPlayerUID _player;
		_ownerID = owner _player;
		_totalPlayers = playersNumber civilian + playersNumber west + playersNumber independent + playersNumber east;
		
		// Minimize network congestion by spreading out the sending of data evenly
		_interval = (_rate / _totalPlayers) + _scalingCoefficient;
		
		// Set money value on client from server database
		_playerFile = [_name,_uid] call REV_fnc_getDatabaseFile;
		ClientMoneyValue = ["read", ["INFO", "Money"]] call _playerFile;
		_ownerID publicVariableClient "ClientMoneyValue";

		uiSleep _interval;
	} foreach allPlayers;
};