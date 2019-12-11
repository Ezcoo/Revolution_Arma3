/*
 Author: GamesByChris

 Description:
 Initializes the PublicVariableEventHandler for joining players and communicates with iniDB

 Parameters:
 Nothing

 Returns:
 BOOL
*/

if(!isNil "rev_database_save") exitWith {hint "REV_fnc_savePlayerData: rev_database_save is not nil!";};

rev_database_save = 
[
	profileName,
	getPlayerUID player,
	ASLToAGL(getPosASL player)
];

publicVariableServer "rev_database_save";

rev_database_save = nil;