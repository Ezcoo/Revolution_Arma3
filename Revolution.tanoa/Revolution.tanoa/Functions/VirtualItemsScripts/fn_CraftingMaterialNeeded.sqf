/*
 Author: Koalas :P

 Description:
 Change the material needed in the crafting GUI.

 Parameter(s):
 0: Control
 1: Number (INT)

 Returns:
 Nothing
*/

params [
    ["_control",controlNull,[controlNull]],
    ["_selectedindex",-1,[-1]]
];
if (isNull _control || {_selectedindex isEqualTo -1}) exitWith {};

private _itemtocraft = _control lbData _selectedindex;
private _itemsneeded = getArray(missionConfigFile >> "CfgCrafting" >> "Recipes" >> _itemtocraft >> "ItemsNeeded");
private _amountsneeded = getArray(missionConfigFile >> "CfgCrafting" >> "Recipes" >> _itemtocraft >> "AmountNeeded");
private _config = missionConfigFile >> "CfgVirtualItems" >> "VirtualItems";
private _text = "";
for "_i" from 0 to count(_itemsneeded)-1 do {
      _text = _text + format ["%1 : %2<br/>", getText(_config >> _itemsneeded select _i >> "Name"), _amountsneeded select _i];
};

((findDisplay 1500) displayCtrl 1503) ctrlSetStructuredText parseText _text;
if ([_itemsneeded, _amountsneeded, false] call REV_fnc_VirtualItemsCheck) then {_ctrl ctrlSetTextColor [255,49,49,0.1];};