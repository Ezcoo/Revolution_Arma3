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
        /* Default IMG in case the item Img is not defined ("") */
        DefaultIMG = "Textures\Logos\Logo.paa";
    };

    class VirtualItems {
     /* class ItemName {    -> Name of the item
            Name = "";      -> Display name of the Item
            Slots = 1;      -> Slots the items occupy
            Img = "";       -> Image of the item
         };*/

        class Wood {
            Name = "Wood";
            Slots = 1;
            Img = "";
        };

        class Rock {
            Name = "Rock";
            Slots = 1;
            Img = "";
        };

        class WoodAxe {
            Name = "Wooden Axe";
            Slots = 1;
            Img = "";
        };

        class StoneAxe {
            Name = "Stone Axe";
            Slots = 1;
            Img = "";
        };
    };
};
