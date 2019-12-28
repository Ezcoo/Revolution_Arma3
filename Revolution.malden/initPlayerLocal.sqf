// Request to load player profile
call REV_fnc_initPlayerDatabase;

// Initialize ATMs
call REV_fnc_initAllATMs;

/* Event Handler for a pressed key */
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call REV_fnc_keyHandler"];
