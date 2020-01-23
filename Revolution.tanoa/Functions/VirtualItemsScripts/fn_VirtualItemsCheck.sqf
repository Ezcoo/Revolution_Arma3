/*
 Author: Koalas :P

 Description:
 Check if the player has the virtual items.

 Parameter(s):
 0: Array (Items needed)
 1: Array (Amounts)
 2: Bool (true = message; false = no message)

 Returns:
 Bool
*/

params [
    ["_itemsneeded",[],[[]]],
    ["_amounts",[],[[]]],
    ["_message",false,[false]]
];
if (_itemsneeded isEqualTo [] || {_amounts isEqualTo []}) exitWith {};

private _return = true;
private _arrayplayer = missionNamespace getVariable "ClientVirtualItems";
private _array = getArray(missionConfigFile >> "CfgVirtualItems" >> "General" >> "VirtualItems");

for "_i" from 0 to count(_itemsneeded)-1 do {
    if (((_arrayplayer select (_array find (_itemsneeded select _i))) select 1) < (_amounts select _i)) then {
        _return = false;
        if (_message) then {
            systemChat format ["Missing Item(s): %1 %2", getText(missionConfigFile >> "CfgVirtualItems" >> "VirtualItems" >> _itemsneeded select _i >> "Name"), ((_amounts select _i) - ((_arrayplayer select (_array find (_itemsneeded select _i))) select 1))];
        };
    };
};

_return;
