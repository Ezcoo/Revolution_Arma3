/*
 Author: GamesByChris

 Description:
 Opens Error Dialog and displays the message about the error.

 Parameter(s):
 0: STRING - error message content

 Returns:
 Nothing
*/

params["_msg","",[""]];
if (_msg IsEqualTo "") exitWith {};

[_msg] call BIS_fnc_error;

createDialog "errorDialog";

private _i = 0; 
while {_i < 10} do  
{ 
	_i = _i +1; 
	playSound "addItemFailed";
};  

// display
_display = findDisplay 100001;

// edit box
_editBox = _display displayCtrl 1400;
_editBox ctrlSetText _msg;
hint _msg;

// button 
_okButton = _display displayCtrl 2400;
_okButton ctrlAddEventHandler ["ButtonDown",
{
	closeDialog 1;
}];
