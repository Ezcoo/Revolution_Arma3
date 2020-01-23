/*
 Author: Koalas :P

 Description:
 Handle the slot.

 Parameter(s):
 0: Number (INT)

 Returns:
 Nothing
*/

params [
    ["_mode",-1,[-1]]
];
if (_mode isEqualTo -1) exitWith {};

switch (_mode) do {
    case 1: {
        /* Set MaxSlots */
        missionNamespace setVariable ["Max_Slots", (getNumber(missionConfigFile >> "CfgVirtualItems" >> "General" >> "DefaultSlots")) + (getNumber(missionConfigFile >> "WIP" >> (typeOf unitBackpack player) >> "Slot"))];

        /* Set Slots */
        private _virtualitems = missionNamespace getVariable "ClientVirtualItems";
        private _slots = 0;
        private _config = getArray(missionConfigFile >> "CfgVirtualItems" >> "General" >> "VirtualItems");
        private "_array";
        for "_i" from 0 to count(_virtualitems)-1 do {
            _array = _virtualitems select (_config find (_items select _i));
            _slots = _slots + (getNumber(missionConfigFile >> "CfgVirtualItems" >> "VirtualItems" >> (_array select 0) >> "Slots") * _array select 1);
        };
        missionNamespace setVariable ["Slots", _slots];
    };

    case 2: {
        /* Set MaxSlots */
        missionNamespace setVariable ["Max_Slots", (getNumber(missionConfigFile >> "CfgVirtualItems" >> "General" >> "DefaultSlots")) + (getNumber(missionConfigFile >> "WIP" >> (typeOf unitBackpack player) >> "Slot"))];
    };
};
