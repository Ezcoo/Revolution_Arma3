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

params[
	["_object",objNull,[objNull]],
	["_objectName","Object",[""]],
	["_actionName","Take",[""]],
	["_range",1,[1]],
	["_offset",[0,0,0.5],[]]
];

if (_object isEqualTo objNull) exitWith {["REV_fnc_addInteraction - Null object provided"] call REV_fnc_error;};

private _layer = -1;
private ["_display","_ctrlCircle","_ctrlText"];

while {!(_object isEqualTo objNull)} do 
{

	if(cursorTarget isEqualTo _object && (player distance _object) <= _range) then 
	{
		// Check if already open
		if (_layer != -1) exitWith {};

		// Open interaction GUI
		_layer = ("InteractionLayer" call BIS_fnc_rscLayer);
		_layer cutRsc ["interactionGUI","PLAIN"];
		_display = (uiNamespace getVariable "interactionGUI");
		_ctrlCircle = (_display displayCtrl 1202);
		_ctrlText = (_display displayCtrl 1100);
		_ctrlText ctrlSetStructuredText parseText ("<t shadow='0'>"+_actionName+" "+"("+_objectName+")"+"</t>");
		_ctrlCircle ctrlSetTextColor [0,1,0,0.75];
	}
	else 
	{
		if(_layer != -1) then 
		{
			_layer cutFadeOut 0.1;
			_layer = -1;
		};
	};
	sleep 0.25;
};
