/*
 Author: GamesByChris

 Description:
 Creates a new thread for the custom interaction system.

 Parameter(s):
 0: OBJECT - object the interaction is attached to
 1: NUMBER - max range
 2: ARRAY - position offset

 Returns:
 Nothing
*/

params[["_object",objNull],["_name","Object"],["_actionName","Take"],["_range",1],["_offset",[0,0,0.5]]];

if(_object isEqualTo objNull) exitWith {["REV_fnc_addInteraction - Null object provided"] call REV_fnc_error;};

_display = displayNull;
_layer = -1;
while {!(_object isEqualTo objNull)} do 
{
	_target = cursorTarget;

	if(_target isEqualTo _object && (player distance _object) <= _range) then 
	{
		// Check if already open
		if (_layer != -1) exitWith {};

		// Open interaction GUI
		_layer = ("InteractionLayer" call BIS_fnc_rscLayer);
		_layer cutRsc ["interactionGUI","PLAIN"];
		_display = (uiNamespace getVariable "interactionGUI");
		_ctrlCircle = (_display displayCtrl 1201);
		_ctrlAction = (_display displayCtrl 1100);
		_ctrlObject = (_display displayCtrl 1101);
		_ctrlAction ctrlSetStructuredText parseText ("<t shadow='0'>"+_actionName+"</t>");
		_ctrlCircle ctrlSetTextColor [0,1,0,1];
		_ctrlObject ctrlSetStructuredText parseText ("<t shadow='0'>"+_name+"</t>");
	}
	else 
	{
		if(_layer != -1) then 
		{
			_layer cutFadeOut 0.1;
			_layer = -1;
			_display = displayNull;
		};
	};
	sleep 0.25;
};