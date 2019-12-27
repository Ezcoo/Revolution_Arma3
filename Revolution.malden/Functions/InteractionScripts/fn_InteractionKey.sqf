/*
Author: Koalas :P

Description:
Handle the interaction action.

Params:
Nothing

Output:
Nothing
*/

private _cursorobject = cursorObject;

switch (true) do {
    case (false): {};

    default {
        private _resource = (nearestObjects [player, (getArray(missionConfigFile >> "CfgFarming" >> "General" >> "ResourcesAllowed")), 3]) select 0;
        if (!isNil "_resource") then {
                [_resource] call REV_fnc_GatherResources;
        } else {
            private _body = (nearestObjects [player, (getArray (missionConfigFile >> "CfgFarming" >> "General" >> "AnimalsAllowed")), 3]) select 0;
            if (!isNil "_body") then {
                if (!alive _body) then {
                    [_body] call REV_fnc_GatherBody;
                };
            };
        };
    };
};
