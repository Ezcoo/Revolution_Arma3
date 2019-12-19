/*
DESCRIPTION:
Add commas to a integer value and return as string
PARAMS:
0 - number (int)
RETURN:
Formatted number (string)
*/

params[
    ["_number",0,[0]]
];

_final = "ERROR";

// convert number to string
_sNumber = _number toFixed 0;

// convert string into array of strings
_array = _sNumber splitString "";

// reverse array of strings
reverse _array;

_organizedArray = [];

_g = [];
_str = "";
for "_i" from 0 to ((count _array)-1) do 
{
	_n = (_array select _i);
	_g pushBack _n;

	if (count _g isEqualTo 3) then // group of 3 created
	{
		_str = _g joinString "";
		_organizedArray pushBack _str;
		_str = "";
		_g = [];
	};

	if(_i isEqualTo ((count _array)-1)) then 
	{
		_str = _g joinString "";
		if !(_str isEqualTo "") then {_organizedArray pushBack _str;};
		_str = "";
		_g = [];
	};
};

// add comma to each element
for "_i" from 0 to ((count _organizedArray)-1) do 
{
	_elem = _organizedArray select _i;
	_nextIndex = _i+1;
	if !(_nextIndex > ((count _organizedArray)-1)) then 
	{
		_elem = (_elem + ",");
		_organizedArray set[_i,_elem];
	};
	_elem = _organizedArray select _i;
	_a = _elem splitString "";
	reverse _a;
	_elem = _a joinString "";
	_organizedArray set[_i,_elem];
};

// reverse the array and joinString
reverse _organizedArray;
_final = _organizedArray joinString "";

//hint str _final;

_final
