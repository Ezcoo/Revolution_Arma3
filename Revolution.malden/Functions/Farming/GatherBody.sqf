/*
Author: Koalas :P

Description:
Gather an item from a killed animal.

Params:
0: Object (The animal body)

Output:
Nothing
*/

params [
    ["_body",objNull,[objNull]]
];

if (isNull _body) exitWith {};
if (player distance _body > 3) exitWith {};

/*WIP progress bar*/
deleteVehicle _body;
/*WIP give item system*/