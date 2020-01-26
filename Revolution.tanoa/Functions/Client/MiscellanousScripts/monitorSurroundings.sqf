/*
	author: Ezcoo
	description: The function can be used to monitor terrain objects in proximity of given entity, like player.

    Parameter(s):
    0: STRING - center position of search (can be object as well)
    1: STRING - object that we're looking for
    2: NUMBER - maximum distance from given location used in search
    3: NUMBER - sleep between cycles/iterations of the while-true loop

	returns: nothing (template function)
*/


params ["_position", "_object", "_distance", "_sleep"];

while {true} do {

    if ((str (nearestTerrainObjects [_position, ["Bush"], _distance]) find _object) != -1 ) then {
        hintSilent "Correct type of bush found!";
    } else {
        hintSilent "No that type of bushes found!";
    };

    uiSleep _sleep;

};