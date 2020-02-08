/*
	author: Ezcoo
	description: The function can be used to monitor terrain objects in proximity of given entity, like player.

    Parameter(s):
    0: OBJECT - center position of search
    1: ARRAY [STRING] - terrain objects that we're looking for
    2: ARRAY - list of types of terrain objects to look for (types: see documentation at https://community.bistudio.com/wiki/nearestTerrainObjects )
    3: NUMBER - maximum distance from given location used in search
    4: BOOLEAN - whether to sort results based on distance from center object or not ('false' = significantly faster to run)
    5: BOOLEAN - 'true' to use 3D search, 'false' to use 2D search (2D projection in [x, y] plane)
    6: BOOLEAN - whether to require one of the searched objects to be also cursorTarget or not
    7: NUMBER - sleep between cycles/iterations of the while-true loop

	returns: nothing (template function) EZC_fnc_monitorSurroundings
*/

params ["_object", "_searchedObjects", "_terrainObjectList", "_distance", "_sortingRequired", "_3Dsearch", "_cursorTargetRequired", "_sleep"];

private _givenObjectFound = false;
private _isCursorTarget = false;

while {true} do {

    _givenObjectFound = false;
    _isCursorTarget = false;

    {

        if ((str (nearestTerrainObjects [getPos _object, _terrainObjectList, _distance, _sortingRequired, _3Dsearch]) find _x) != -1 ) then {
            if (_cursorTargetRequired) then {
                if ((str cursorTarget find _x) != -1) then {
                    _givenObjectFound = true;
                    _isCursorTarget = true;
                } else {
                    _givenObjectFound = true;
                };
            } else {
                _givenObjectFound = true;
            };
        };

    } forEach _searchedObjects;

    // Do what you want with the results: example code below

    if (_givenObjectFound) then {
        if (_isCursorTarget) then {
            hintSilent format ["There are given objects nearby and one of them (%1) is cursorTarget!", str cursorTarget];
        } else {
            hintSilent "There are given objects nearby!";
        };
    } else {
        hintSilent "No given objects found nearby";
    };

    uiSleep _sleep;
};