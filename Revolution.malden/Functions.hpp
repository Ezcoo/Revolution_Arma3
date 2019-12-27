class Revolution_Functions {
    tag = "REV";
    class Database
    {
        file = "Functions\DatabaseScripts";
        class getDatabaseFile {};
        class initPlayerDatabase {};
        class initServerDatabase {};
        class savePlayerData {};
        class startSendingDynamicData {};
    };

    class Farming
    {
        file = "Functions\Farming";
        class GatherBody {};
        class GatherResources {};
    };

    class Financial
    {
        file = "Functions\FinancialScripts";
        class addMoneyServer {};
        class formatMoney {};
        class initAllATMs {};
        class openBankGUI {};
        class openSmallBankGUI {};
        class transferMoneyServer {};
    };

    class Interaction
    {
        file = "Functions\InteractionScripts";
        class InteractionKey {};
        class addInteraction {};
    };

    class Utility
    {
        file = "Functions\UtilityScripts";
        class KeyHandler {};
        class error {};
    };
};
