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
private _amountsneeded = getArray(missionConfigFile >> "CfgCrafting" >> "Recipes" >> _itemtocraft >> "AmountsNeeded");
private _config = missionConfigFile >> "CfgVirtualItems" >> "VirtualItems";

/* Set IMG Text and the IMG */
ctrlSetText [1504,getText(_config >> _itemtocraft >> "Name")];
ctrlSetText [1505,getText(_config >> _itemtocraft >> "Img")];

/* Adjust the amounts based on how much items need to be crafted */
private _craftamount = parseNumber (ctrlText 1506);
for "_i" from 0 to count(_amountsneeded)-1 do {
    _amountsneeded set [_i,(_amountsneeded select _i) * _craftamount];
};

/* Prepare text to be displayed */
private _text = "";
for "_i" from 0 to count(_itemsneeded)-1 do {
      _text = _text + format ["%1 : %2<br/>", getText(_config >> _itemsneeded select _i >> "Name"), _amountsneeded select _i];
};

/* Display the text and change the color in case the player miss the items */
((findDisplay 1500) displayCtrl 1503) ctrlSetStructuredText parseText _text;
if ([_itemsneeded, _amountsneeded, false] call REV_fnc_VirtualItemsCheck) then {((findDisplay 1500) displayCtrl 1503) ctrlSetTextColor [255,49,49,0.1];};