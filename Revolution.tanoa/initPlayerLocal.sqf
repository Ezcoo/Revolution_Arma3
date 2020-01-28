// Request to load player profile
call REV_fnc_initPlayerDatabase;

// Initialize ATMs
call REV_fnc_initAllATMs;

/* Event Handler for a pressed key */
(findDisplay 46) displayAddEventHandler ["KeyDown", "call REV_fnc_keyHandler"];

// -------------------------------------- DEBUGGING ONLY --------------------------------------
// Money Counter
with uiNamespace do 
{
    _ctrl = (findDisplay 46) ctrlCreate ["RscStructuredText",-1];
    _ctrl ctrlSetPosition [0.808438 * safezoneW + safezoneX,0.878 * safezoneH + safezoneY,0.150937 * safezoneW,0.056 * safezoneH];
    _ctrl ctrlSetStructuredText parseText ("<t size='2' align='left' font='RobotoCondensedBold' shadow='0'>$00000000000</t>");
    _ctrl ctrlSetBackgroundColor [0,0,0,0.5];
    _ctrl ctrlCommit 0;
    DebugMoneyCounterCtrl = _ctrl;
};
