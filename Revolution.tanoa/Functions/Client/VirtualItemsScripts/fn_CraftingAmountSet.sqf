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

disableSerialization;
private _display = findDisplay 1500;
private _craftamount = parseNumber (ctrlText (_display displayCtrl 1506));

if ((_craftamount + _number) < 1) exitWith {};

(_display displayCtrl 1506) ctrlSetStructuredText parseText format ["%1",_craftamount + _number];

private _ctrl = _display displayCtrl 1501;
[_ctrl, lbCurSel _ctrl] call REV_fnc_CraftingMaterialNeeded;
