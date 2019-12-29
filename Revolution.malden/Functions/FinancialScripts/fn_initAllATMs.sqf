/*
 Author: GamesByChris

 Description:
 Initializes all ATMs.

 Parameter(s):
 Nothing

 Returns:
 Nothing
*/

_ATMClasses = getArray(missionConfigFile >> "CfgATM" >> "ClassNames");
_ATMs = ((getMissionLayerEntities "ATMs") select 0);
{
	if(typeOf _x in _ATMClasses) then 
	{
		[_x,"ATM","Interact",2,[0,0]] spawn REV_fnc_addInteraction;
	}
	else
	{
		["REV_fnc_initAllATMs - Invalid className provided"] call REV_fnc_error;
	};
} foreach _ATMs;