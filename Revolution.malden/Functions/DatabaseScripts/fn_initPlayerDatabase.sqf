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
    params [
        "",
        ["_packet",[],[]]
    ];
	
    if (_packet IsEqualTo []) ExitWith {/*Error message incorrect value (not an array)*/}

    _packet params [
        ["_position"locationNull,[locationNull]],
        ["_dir",0,[0]],
        ["_damage",-1,[-1]],
        ["_loadout",[],[[]]],
        ["_money",-1,[-1]]
    ];

    if (IsNull _position || {_damage IsEqualTo -1 || _money IsEqualTo -1}) ExitWith {/*error message*/}
	
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
    rev_database_check = [clientOwner,profileName,getPlayerUID player];
    publicVariableServer "rev_database_check";
};
