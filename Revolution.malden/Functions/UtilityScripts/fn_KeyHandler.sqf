/*
Author: Koalas :P

Description:
Handles the keys pressed.

Params:
0: Display OR Contorl
1: Int (Pressed Key)
2: Bool
3: Bool
4: Bool

Output:
Nothing
*/

params [
    ["_displayorcontrol",Nothing,[]],
    ["_key",-1,[-1]],
    ["_shift",false,[false]],
    ["_ctrl",false,[false]],
    ["_alt",false,[false]]
];

if (_key isEqualTo -1) exitWith {};

switch (_key) do {
    // E key test for interaction
    case 18: {
        [] spawn REV_fnc_InteractionKey;
    };
};
