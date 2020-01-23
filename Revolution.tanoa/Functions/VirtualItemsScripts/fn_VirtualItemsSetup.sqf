/*
 Author: Koalas :P

 Description:
 Setup the virtual items for the player.

 Parameter(s):
 0: Array

 Returns:
 Nothing
*/

params [
    ["_virtualitems",[],[[]]]
];

private _array = getArray(missionConfigFile >> "CfgVirtualItems" >> "General" >> "VirtualItems");

if (_virtualitems isEqualTo []) exitWith {
    private _playerarray = [];
    for "_i" from 0 to count(_array)-1 do {
        _playerarray pushBack [_array select _i, 0];
    };
    _playerarray;
};

if (count(_array) != count(_virtualitems)) exitWith {
    private ["_index","_amount","_selected"];
    private _playerarray = [];
    for "_i" from 0 to count(_array)-1 do {
        _item = _array select _i;
        _index = _virtualitems find _item;
        if (_index isEqualTo -1) then {
            _amount = 0;
        } else {
            _amount = (_virtualitems select _index) select 1;
        };

        _playerarray pushBack [_item, _amount];
    };
    _playerarray;
};