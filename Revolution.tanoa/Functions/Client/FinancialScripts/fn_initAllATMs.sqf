/*
 Author: GamesByChris

 Description:
 Initializes all ATMs.

 Parameter(s):
 Nothing

 Returns:
 Nothing
*/

private _ATMClasses = getArray(missionConfigFile >> "CfgATM" >> "ClassNames");
private _ATMs = ((getMissionLayerEntities "ATMs") select 0);

// Check if there are any ATMs
if(count _ATMs == 0) exitWith {["REV_fnc_initAllATMs - No ATM's were found!"] call REV_fnc_error;};

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