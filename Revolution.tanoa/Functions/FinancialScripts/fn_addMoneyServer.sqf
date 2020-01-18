/*
 Author: GamesByChris

 Description:
 Requests add money to a player file on server.

 Parameter(s):
 0: STRING - Profile Name
 1: STRING - Player UID
 2: NUMBER - Money to add

 Returns:
 Nothing
*/

params ["_profileName","_UID","_moneyValue"];

rev_database_addMoney = [_profileName,_UID,_moneyValue];
publicVariableServer "rev_database_addMoney";