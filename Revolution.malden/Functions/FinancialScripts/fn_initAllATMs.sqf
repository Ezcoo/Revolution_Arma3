/*
 Author: GamesByChris

 Description:
 <Info>

 Parameter(s):
 0: 
 1: 
 2:

 Returns:
 <DataType>
*/

_ATMClasses = getArray(missionConfigFile >> "CfgATM" >> "ClassNames");
_ATMs = ((getMissionLayerEntities "ATMs") select 0);

{
	if(typeOf _x in _ATMClasses) then 
	{
		[_x] call REV_fnc_addInteraction;
	}
	else 
	{
		["initAllATMs.sqf - Invalid className provided"] call REV_fnc_error;
	};
} foreach _ATMs;