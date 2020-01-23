class CfgVirtualItems
{
    class General {
        /* Virtual Items */
        VirtualItems[] = {
            "Wood",
            "Rock",
            "WoodAxe",
            "StoneAxe"
        };

        /* Number of slots by deafult */
        DefaultSlots = 10;
    };

    class VirtualItems {
     /* class ItemName {    -> Name of the item
            Name = "";      -> Display name of the Item
            Slots = 1;      -> Slots the items occupy
         };*/

        class Wood {
            Name = "Wood";
            Slots = 1;
        };

        class Rock {
            Name = "Rock";
            Slots = 1;
        };

        class WoodAxe {
            Name = "Wooden Axe";
            Slots = 1;
        };

        class StoneAxe {
            Name = "Stone Axe";
            Slots = 1;
        };
    };
};
