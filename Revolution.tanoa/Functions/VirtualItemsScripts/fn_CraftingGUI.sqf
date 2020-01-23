/*
 Author: Koalas :P

 Description:
 Create the Crafting GUI.

 Parameter(s):
 0: String

 Returns:
 Nothing
*/

if (!alive player || dialog) exitWith {};
params [
    ["_type","",[""]]
];
if (_type isEqualTo "") exitWith {};

private "_itemtocraft";
private _recipes = getArray(missionConfigFile >> "CfgCrafting" >> "CraftingStations" >> _type >> "Recipes");
private _config = missionConfigFile >> "CfgVirtualItems" >> "VirtualItems";

disableSerialization;
createDialog "CraftingMenu";
((findDisplay 1500) displayCtrl 1502) ctrlSetText format ["Crafting Station: %1" , getText(missionConfigFile >> "CfgCrafting" >> "CraftingStations" >> _type >> "Name")];
private _ctrl = (findDisplay 1500) displayCtrl 1501;

for "_i" from 0 to count(_recipes)-1 do {
    _itemtocraft = _recipes select _i;
    _ctrl lbAdd (getText(_config >> _itemtocraft >> "Name"));
    _ctrl lbSetData [_i, _itemtocraft];
};
