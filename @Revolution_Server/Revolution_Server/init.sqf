
call compile preprocessFileLineNumbers "\Revolution_Server\Functions.sqf";

/* Start Animal and Resource Spawn */
[] spawn REV_fnc_AnimalsSpawn; 
[] spawn REV_fnc_ResourcesSpawn;
