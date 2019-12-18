/*
 Author: GamesByChris

 Description:
 Prompts the server to check if the player file exists and loads it.

 Parameter(s):
 Nothing

 Returns:
 Nothing
*/

// Create Load Event Handler
"rev_database_load" addPublicVariableEventHandler {
	_packet = _this select 1;
	_position = _packet select 0;
	_dir = _packet select 1;
	_damage = _packet select 2;
	_loadout = _packet select 3;
	_money = _packet select 4;

	player setPos _position;
	player setDir _dir;
	player setDamage _damage;

	// Remove Default Loaodut
	removeAllAssignedItems player;
 	removeAllItems player;
 	clearAllItemsFromBackpack player;
 	removeBackpack player;
 	removeUniform player;
 	removeVest player;
 	removeHeadgear player;
 	removeGoggles player;
 	removeAllWeapons player;
 	removeAllPrimaryWeaponItems player;
 	removeAllHandgunItems player;

	player setUnitLoadout _loadout;
	missionNamespace setVariable ["clientMoneyValue",_money];

	// Debug
	"Player File Data Loaded" remoteExec ["systemChat"];
};

if (!isNil "rev_database_check") then {
	rev_database_check = nil;
};

waitUntil {time > 1};
if(isMultiplayer) then {waitUntil {getClientState isEqualTo "BRIEFING READ"}};

// Request database check
if (isNil "rev_database_check") then {
	_dataplayrowner = clientOwner;
	_dataplayrname = profileName;
	_dataplayruid = getPlayerUID player;
	
	rev_database_check = [_dataplayrowner,_dataplayrname,_dataplayruid];
	publicVariableServer "rev_database_check";
};