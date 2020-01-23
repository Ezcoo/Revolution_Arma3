/*
 Author: Koalas :P

 Description:
 Handle the crafting.

 Parameter(s):
 Nothing

 Returns:
 Nothing
*/

if ((lbCurSel 1501) isEqualTo -1) exitWith {};
private _itemtocraft = (lbData[1501,lbCurSel 1501]);
private _itemsneeded = getArray(missionConfigFile >> "CfgCrafting" >> "Recipes" >> _itemtocraft >> "ItemsNeeded");
private _amountsneeded = getArray(missionConfigFile >> "CfgCrafting" >> "Recipes" >> _itemtocraft >> "AmountNeeded");
if !([_itemsneeded, _amountsneeded, true] call REV_fnc_VirtualItemsCheck) exitWith {};

private _operations = [];
for "_i" from 1 to count(_itemsneeded) do {
    _operations pushBack false;
};

[_itemsneeded pushBack _itemtocraft, _itemsneeded pushBack 1, _operations pushBack true] call REV_fnc_VItemsHandlerPlayer;
