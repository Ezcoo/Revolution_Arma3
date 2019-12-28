class CfgFunctions 
{
    class REV 
    {
        class DatabaseScripts
        {
            class initServerDatabase {};
            class initPlayerDatabase {};
            class savePlayerData {};
            class startSendingDynamicData {};
            class getDatabaseFile {};
        };

        class FinancialScripts 
        {
            class formatMoney {};
            class openBankGUI {};
            class openSmallBankGUI {};
            class transferMoneyServer {};
            class addMoneyServer {};
            class initAllATMs {};
        };
        
        class FarmingScripts
        {
            class GatherBody {};
            class GatherResources {};
        };

        class InteractionScripts 
        {
            class addInteraction {};
            class InteractionKey {};
        };

        class UtilityScripts 
        {
            class error {};
            class KeyHandler {};
        };
    };
};
