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
disableSerialization;
private _display = findDisplay 1500;

/* Adjust the amounts based on how much items need to be crafted */
private _craftamount = parseNumber (ctrlText (_display displayCtrl 1506));
for "_i" from 0 to count(_amountsneeded)-1 do {
    _amountsneeded set [_i,(_amountsneeded select _i) * _craftamount];
};

/* Set IMG Text and the IMG */
private _imgtext = getText(_config >> _itemtocraft >> "Name");
private _ctrlimg = _display displayCtrl 1504;
if (_imgtext != ctrlText _ctrlimg) then {
    _ctrlimg ctrlSetStructuredText parseText format ["%1",_imgtext];
    private _img = getText(_config >> _itemtocraft >> "Img");
    if (_img isEqualTo "") then { _img = getText(missionConfigFile >> "CfgVirtualItems" >> "General" >> "DefaultIMG")};
    (_display displayCtrl 1505) ctrlSetText _img;
};

/* Prepare text to be displayed */
private _text = "";
for "_i" from 0 to count(_itemsneeded)-1 do {
      _text = _text + format ["%1 : %2<br/>", getText(_config >> _itemsneeded select _i >> "Name"), _amountsneeded select _i];
};

/* Display the text */
if ([_itemsneeded, _amountsneeded, false] call REV_fnc_VirtualItemsCheck) then {
    (_display displayCtrl 1503) ctrlSetStructuredText parseText format ["<t color='#00ff00'>%1</t>",_text];
} else {
    (_display displayCtrl 1503) ctrlSetStructuredText parseText format ["<t color='#ff0000'>%1</t>",_text];
};
