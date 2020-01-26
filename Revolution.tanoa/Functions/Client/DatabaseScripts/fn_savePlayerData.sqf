/*
 Author: GamesByChris

 Description:
 Requests to save player data on the server.

 Parameters:
 Nothing

 Returns:
 BOOL
*/

if(!isNil "rev_database_save") exitWith {hint "REV_fnc_savePlayerData: rev_database_save is not nil!"; false};

rev_database_save = 
[
	profileName,
	getPlayerUID player,
	ASLToAGL(getPosASL player),
	getDir player,
	damage player,
	getUnitLoadout player
	// missionNamespace getVariable "ClientMoneyValue"
];

publicVariableServer "rev_database_save";

if !(isServer) then {rev_database_save = nil;};

true