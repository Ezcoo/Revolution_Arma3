/*
 Author: GamesByChris

 Description:
 Prompts the server to check if the player file exists and loads it.

 Parameter(s):
 Nothing

 Returns:
 Nothing
*/

"rev_database_load" addPublicVariableEventHandler {
	_packet = _this select 1;
	_position = _packet select 0;

	player setPos _position;

	// Debug
	"Player File Data Loaded" remoteExec ["systemChat"];
};

waitUntil {time > 10};

if (!isNil "rev_database_check") then {
	rev_database_check = nil;
};
 
sleep 1;

if (isNil "rev_database_check") then {
	_dataplayrowner = clientOwner;
	_dataplayrname = profileName;
	_dataplayruid = getPlayerUID player;
	
	rev_database_check = [_dataplayrowner,_dataplayrname,_dataplayruid];
	publicVariableServer "rev_database_check";
};