/*
 Author: Koalas :P

 Description:
 Handles the keys pressed.

 Parameter(s):
 0: Display OR Contorl
 1: Int (Pressed Key)
 2: Bool
 3: Bool
 4: Bool

 Returns:
 Nothing
*/

params [
    ["_displayorcontrol",displayNull,[controlNull,displayNull]],
    ["_key",-1,[-1]],
    ["_shift",false,[false]],
    ["_ctrl",false,[false]],
    ["_alt",false,[false]]
];

if (_key isEqualTo -1) exitWith {};
private _handled = false;

switch (_key) do {
    // E key test for interaction
    case 18: {
        ["Player_Inventory"] spawn REV_fnc_InteractionKey;
        _handled = true;
    };
};

_handled;
