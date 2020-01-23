/*
 Author: Koalas :P

 Description:
 Handle the items gained and removed from a player.

 Parameter(s):
 0: Array (items)
 1: Array (amount of each item)
 2: Array (add or remove for each item)

 Returns:
 Bool
*/

params [
    ["_items",[],[[]]],
    ["_amounts",[],[[]]],
    ["_operations",[],[[]]]
];

if (_items isEqualTo [] || {_amounts isEqualTo []}) exitWith {};

private _return = false;
private _virtualitems = missionNamespace getVariable "ClientVirtualItems";
private _slotsadd = 0;
private _slotsrem = 0;
private _vitemsconfig = getArray(missionConfigFile >> "CfgVirtualItems" >> "General" >> "VirtualItems");
private _config = missionConfigFile >> "CfgVirtualItems" >> "VirtualItems";

private ["_index","_array","_userquantity"];
for "_i" from 0 to count(_items)-1 do {
    _index = _vitemsconfig find (_items select _i);
    _array = _virtualitems select _index;
    _userquantity = _array select 1;

    if (_operations select _i) then {
        _userquantity = _userquantity + (_amounts select _i);
        _array set [1, _userquantity];
        _virtualitems set [_index, _array];
        _slotsadd = _slotsadd + (getNumber(_config >> (_items select _i) >> "Slots") * (_amounts select _i));
    } else {
        _userquantity = _userquantity - (_amounts select _i);
        _array set [1, _userquantity];
        _virtualitems set [_index, _array];
        _slotsrem = _slotsrem + (getNumber(_config >> (_items select _i) >> "Slots") * (_amounts select _i));
    };
};

private _totslots = (missionNamespace getVariable "Slots") + _slotsadd - _slotsrem;
private _maxslots = missionNamespace getVariable "Max_Slots";
if (_totslots > _maxslots) exitWith {
     format ["Need more space, Slots Needed: %1", _totslots - _maxslots] remoteExec ["systemChat"];
    _return;
};

missionNamespace setVariable ["ClientVirtualItems", _virtualitems];
missionNamespace setVariable ["Slots", _totslots];
["write", ["INFO", "VirtualItems", _virtualitems]] call ([clientOwner, profileName] call REV_fnc_getDatabaseFile);
_return = true;

_return;
