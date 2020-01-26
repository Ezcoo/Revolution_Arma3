/*
	author: Ezcoo
	description: The function can be used to monitor terrain objects in proximity of given entity, like player.

    Parameter(s):
    0: STRING - center position of search (can be object as well)
    1: STRING - object that we're looking for
    2: STRING - list of types of terrain objects to look for (types: see documentation at https://community.bistudio.com/wiki/nearestTerrainObjects )
    3: NUMBER - maximum distance from given location used in search
    4: NUMBER - sleep between cycles/iterations of the while-true loop

	returns: nothing (template function)
*/


params ["_position", "_object", "_terrainObjectList", "_distance", "_sleep"];

while {true} do {

    if ((str (nearestTerrainObjects [_position, [_terrainObjectList], _distance]) find _object) != -1 ) then {
        hintSilent "Correct type of object found!";
    } else {
        hintSilent "No that type of objects found!";
    };

    uiSleep _sleep;

};