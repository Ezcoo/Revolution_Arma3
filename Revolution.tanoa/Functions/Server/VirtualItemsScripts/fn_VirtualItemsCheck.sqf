/*
 Author: Koalas :P

 Description:
 Check if the player has the virtual items.

 Parameter(s):
 0: Array (Items needed)
    Array structure: [ Item->"" and so on ]
    Array example:  ["pizza" , "tomato" , "fish"]

 1: Array (Amounts needed for each item) (-1 = get the quantity)
    Array structure: [ Amount->* and so on ]
    Array example:  [1 , 6 , -1]

 2: Array (Storages where to check for the items)
    Array structure: [  [storage->"" , *player*]  and so on]
    Array example: [ ["Hand" , *player*] , ["Pocket" , *player*] ]

 Returns:
 Array [
 (true = has the items needed ; false = miss all/some of the items needed),
 Array missing items,
 Array based on the storage-> [item amount->[*items*] , [*amounts*] , item quantity->[*items* , *quantity*] , [*missing items*]]
 ]
*/

params [
    ["_itemsneeded",[],[[]]],
    ["_amounts",[],[[]]],
    ["_storage",[],[[]]]
];
if (_itemsneeded isEqualTo [] || {_amounts isEqualTo [] || _storage isEqualTo []}) exitWith {};

private _return = [1];
private _array = [];
private ["_item","_startarray","_amount","_quantity","_arrayitems","_temparray","_arrayquantity","_handler","_owner"];

/* Check for the items needed */
{
    _temparray = [];
    _arrayitems = [[] , []];
    _arrayquantity = [[] , []];

    _owner = owner (_x select 1);

    if (_owner isEqualTo 0) exitWith {
        _return set [0, 2];
    };

    _handler = format ["VIClientItems_%1", _owner];

    switch (_x select 0) do {

        case "Hand": {
            remoteExecCall ["REV_fnc_GetInventoryVars" , _owner];
            waitUntil {sleep 0.01;!isNil _handler};
            _startarray = (+(missionNamespace getVariable _handler)) select 0;
            missionNamespace setVariable [_handler, nil];
        };

        case "Pocket": {
            remoteExecCall ["REV_fnc_GetInventoryVars" , _owner];
            waitUntil {sleep 0.01;!isNil _handler};
            _startarray = (+(missionNamespace getVariable _handler)) select 1;
            missionNamespace setVariable [_handler, nil];
        };
    };

    /* Check for the items needed */
    {
        _item = _x;
        _quantity = ((_startarray select {(_x select 0) isEqualTo _item}) select 0) select 1;
        _amount = _amounts select _forEachIndex;

        if (_amount isEqualTo -1) then {
            if (isNil "_quantity") then {
                (_arrayquantity select 1) pushBack _item;
            } else {
                (_arrayquantity select 0) pushBack [_item , _quantity];
            };

        } else {
            _amount = _amount - (_quantity + 0);

            if (_amount > 0) then {
                _amounts set [_forEachIndex , _amount];

            } else {
                _amounts set [_forEachIndex , 0];
                _temparray pushBack _item;
            };

            (_arrayitems select 0) pushBack _item;
            (_arrayitems select 1) pushBack _amount;
        };

    } forEach _itemsneeded;

    _itemsneeded = _itemsneeded select {!(_x in _temparray)};
    _amounts = _amounts select {_x != 0};
    _array pushBack [_x, [_arrayitems, _arrayquantity]];

} forEach _storage;

/* Remove the items with amount = -1 */
if (-1 in _amounts) then {
    _temparray = [];
    {
        if (_x isEqualTo -1) then {
            _temparray pushBack (_itemsneeded select _forEachIndex);
        };
    } forEach _amounts;

    _itemsneeded = _itemsneeded select {!(_x in _temparray)};
    _amounts = _amounts select {_x != -1};
};

/* Check for missing items */
if (count _itemsneeded != 0) then {
    private _arraymissing = [];

    {
        _arraymissing pushBack [_x , _amounts select _forEachIndex];
    } forEach _itemsneeded;

    _return set [0, 0];
    _return pushBack _arraymissing;
};

_return pushBack _array;

private _callerRE = remoteExecutedOwner;

if (_callerRE isEqualTo 0) exitWith {};

VIResult = _return;
_callerRE publicVariableClient "VIResult";
