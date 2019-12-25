class CfgDatabase
{
	// Set to 0 if you want to run the server without the database
	allowedToRun = 1;

	// Unique identifier to only write/read from this database
	name = "Dev_Database_01";

	// Default position for players that haven't been saved yet
	defaultWorldPosition[] = {7233.42,7787.46,0};

	// Money a new player starts with
	defaultMoneyValue = 10000;

	// max cash that can be carried
	maxCash = 999999;

	// max bank account size
	maxBankSize = 999999;

	// how often in seconds the server sends
	// dyanamic data, like money, to all clients
	clientUpdateRate = 2;
};