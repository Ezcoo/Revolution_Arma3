_ret = [getPlayerUID player, "account", "weapon", currentWeapon player] call iniDB_write;

diag_log format["Result #1: %1", _ret];

_ret = [getPlayerUID player, "account", "magazines", getMagazineCargo player] call iniDB_write;

diag_log format["Result #2: %1", _ret];

_ret = [getPlayerUID player, "account", "pos", position player] call iniDB_write;

diag_log format["Result #3: %1", _ret];

_ret = [getPlayerUID player, "account", "stupidity", 99.5] call iniDB_write;

diag_log format["Result #4: %1", _ret];

_testArray = ['hello', ['hello again']];
_testArrayStr = format["%1", _testArray];

_ret = [getPlayerUID player, "account", "arrayTest", _testArray] call iniDB_write;

diag_log format["Result #5: %1", _ret];

diag_log format["Test String: %1", _testArrayStr];

_crcTest = "SicSemperTyrannis" call iniDB_CRC32;
_md5Test = "SicSemperTyrannis" call iniDB_MD5;
_b64Test = _testArrayStr call iniDB_Base64Encode;

diag_log _crcTest;
diag_log _md5Test;
diag_log _b64Test;

_ret = [getPlayerUID player, "account", "arrayTest", "ARRAY"] call iniDB_read;

diag_log format["Read (arrayTest): %1 (%2)", _ret, typeName _ret];

_ret = [getPlayerUID player, "account", "stupidity", "NUMBER"] call iniDB_read;

diag_log format["Read (stupidity): %1 (%2)", _ret, typeName _ret];