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
    params ["",["_packet",[],[]]];
	
    if (_packet IsEqualTo []) ExitWith {["REV_fnc_initPlayerDatabase - packet is corrupted"] call REV_fnc_error;};

    _packet params [
        ["_position",[0,0,0],[]],
        ["_dir",0,[0]],
        ["_damage",-1,[-1]],
        ["_loadout",[],[[]]],
        ["_money",-1,[-1]]
    ];

    if ((_position isEqualTo []) || {_damage IsEqualTo -1 || _money IsEqualTo -1}) ExitWith 
    {["REV_fnc_initPlayerDatabase - invalid argument provided"] call REV_fnc_error;};
	
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
    missionNamespace setVariable ["ClientMoneyValue",_money];

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
    rev_database_check = [clientOwner,profileName,getPlayerUID player];
    publicVariableServer "rev_database_check";
};