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
            class AnimalsSpawn {};
            class ResourcesSpawn {};
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
        
        class VirtualItemsScripts 
        {
            class CraftingGUI {};
            class CraftingHandler {};
            class CraftingMaterialNeeded {};
            class SlotsHandler {};
            class VItemsHandlerPlayer {};
            class VirtualItemsSetup {};
            class VirtualItemsCheck {};
        };
    };
};
