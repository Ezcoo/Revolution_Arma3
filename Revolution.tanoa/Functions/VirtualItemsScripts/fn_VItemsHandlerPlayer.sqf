/*
 Author: Koalas :P

 Description:
 Handle the items.

 Parameter(s):
 0: Array (items to add and remove for each storage that get specified in _storagearray)
    Array structure: [  first storage->[ items to add->[] , items to remove->[] ] and so on ];
    Array example: [
        [   ["pizza" , "tomato" , "fish"]  ,  ["wheat" , "ring" ]    ],
        [   ["axe"]   ,   ["stone" , "wood"]  ]
    ];

 1: Array (amount to add or remove for each item specified in items) (similar to _itemsarray)
    Array structure: [  first storage->[ amounts to add->[] , amounts to remove->[] ] and so on ];
    Array example: [
        [   [1 , 5 , 2]  ,  [5 , 1 ]    ],
        [   [1]   ,   [3 , 6]  ]
    ];

 2: Array (Storage that spefify where the items in the arrays _itemsarray and _amountsarray need to be handled)
    Array structure: [  [storage->"" , *player*]  and so on]
    Array example: [ ["Hand" , *player*] , ["Pocket" , *player*] ]

 Returns:
 Array [(true = success ; false = failed (missing slots or errors)), Array , Slots]
*/

params [
    ["_itemsarray", [], [[]]],
    ["_amountsarray", [], [[]]],
    ["_storagearray", [], [[]]]
];

if (_itemsarray isEqualTo [] || {_amountsarray isEqualTo [] || _storagearray isEqualTo []}) exitWith {};

private ["_temp","_quantity","_index","_array","_slots","_maxslots","_startarray","_storage"];
private _config = missionConfigFile >> "CfgVirtualItems" >> "VirtualItems";
private _returnarraytrue = [];
private _returnarrayfalse = [];
private _return = true;

/* Add or Remove the item from the item player array */
{

    _storage = _storagearray select _forEachIndex;
    _amountindex = _forEachIndex;

    /* Handle the storage */
    switch (_storage select 0) do {

        case "Hand": {
            remoteExecCall ["REV_fnc_GetInventoryVars" , _storage select 1];
            waitUntil {!isNil "rev_clientitems"};
            _startarray = +rev_clientitems;
            rev_clientitems = nil;
            _array = _startarray select 0;
            _maxslots = 12;
        };

        case "Pocket": {
            remoteExecCall ["REV_fnc_GetInventoryVars" , _storage select 1];
            waitUntil {!isNil "rev_clientitems"};
            _startarray = +rev_clientitems;
            rev_clientitems = nil;
            _array = _startarray select 1;
            _maxslots = 6;
        };
    };

    /* ItemsArray to ADD (ARRAY) */
    _temp = _x select 0;
    if (count _temp != 0) then {
        {
            /* Item (STRING) */
            _temp = _x;
            _index = _array findIf {(_x select 0) isEqualTo _temp};

            /* If the item it's not in the array it gets added */
            if (_index isEqualTo -1) then {
                _index = _array pushBack [_temp, 0];
            };

            /* Array [Item , amount] (ARRAY) */
            _temp = _array select _index;
            _quantity = (_temp select 1) + (((_amountsarray select _amountindex) select 0) select _forEachIndex);
            _temp set [1, _quantity];

        } forEach _temp;
    };

    /* ItemsArray to REMOVE (ARRAY) */
    _temp = _x select 1;
    if (count _temp != 0) then {
        {
            /* Item (STRING) */
            _temp = _x;
            _index = _array findIf {(_x select 0) isEqualTo _temp};
            // MAYBE ADD A CHECK FOR index = -1 (even if it shuoldn't be possible)

            /* Array [Item , amount] (ARRAY) */
            _temp = _array select _index;
            _quantity = (_temp select 1) - (((_amountsarray select _amountindex) select 1) select _forEachIndex);

            /* Handle the quantity of an item, if = 0 remove the items from the array else it change it's value */
            if (_quantity isEqualTo 0) then {
                _array deleteAt _index;
            } else {
                _temp set [1, _quantity];
            };

        } forEach _temp;
    };

    /* Handle the slots */
    _slots = 0;
    {
        _slots = _slots + (ceil ((_x select 1) / getNumber(_config >> (_x select 0) >> "Slots")));
    } count _array;

    /* Maxslots - Slots (if < 0 = need more slots) (INT) */
    _temp = _maxslots - _slots;

    if (_temp > 0) then {
        _returnarraytrue pushBack [_storage, _startarray, _temp];
    } else {
        _return = false;
        _returnarrayfalse pushBack [_storage, _array, _temp];
    };

} forEach _itemsarray;

if !(_return) exitWith {
    _returnarrayfalse
};


/* Update the inventory */
{
    /* Array [*storage* , *player*] (ARRAY) */
    _temp = _x select 0;
    switch (_temp select 0) do {
        case "Hand": {
            /* Update to the player and the database, the slots and the items the player possess */
            [_x select 1] remoteExecCall ["REV_fnc_SetInventoryVars" , _temp select 1];
        };

        case "Pocket": {
            /* Update to the player and the database, the slots and the items the player possess */
            [_x select 1] remoteExecCall ["REV_fnc_SetInventoryVars" , _temp select 1];
        };
    };
} forEach _returnarraytrue;