class CfgCrafting
{
    class Recipes {
        class WoodAxe {
            ItemsNeeded[] = {"Wood"};
            AmountsNeeded[] = {10};
        };

        class StoneAxe {
            ItemsNeeded[] = {"WoodAxe", "Wood", "Rock"};
            AmountsNeeded[] = {1, 5, 8};
        };

    };

    class CraftingStations {
        class Player_Inventory {
            Name = "TEST";
            Condition = ""; //WIP
            Recipes[] = {
                "WoodAxe",
                "StoneAxe"
            };
        };

    };
};