/*
 Author: Koalas :P

 Description:
 Change the value of the amount to craft in the crafting GUI.

 Parameter(s)
 0: Number (INT)

 Returns:
 Nothing
*/

params [
    ["_number",0,[0]]
];

private _craftamount = parseNumber (ctrlText 1506);

if ((_craftamount + _number) < 1) exitWith {};

((findDisplay 1500) displayCtrl 1506) ctrlSetStructuredText parseText format ["%1",_craftamount + _number];
