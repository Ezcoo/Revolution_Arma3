#define true 1
#define false 0
class CfgFarming
{
    class General {
        /* Animals Allowed To Be Gathered */
        AnimalsAllowed[] = {
            "Hen_random_F",
            "Cock_random_F",
            "Goat_random_F",
            "Sheep_random_F",
            "Rabbit_F"
        };

        /* Resources Allowed To Be Gathered */
        ResourcesAllowed[] = {
            "UserTexture1m_F", /* FOR ALL P3D Resources Keep this */
            "TEST"
        };
    };

    class Resources
    {
     /* class MarkerName {    -> Marker Name of the resourse
            UseP3D = true;      -> Use P3D path instead of class name (true = P3D path; false = classname)
            P3D = "";       -> if UseP3D = true then use a P3D path else use classname
            Items[] = {""};     -> Name of the item WIP
            Amounts[] = {1};     -> Number of how much you gain from each resource node
            RequiredItem = "";     -> Item required to get the resource node
            Condition = "";     -> Condition required to get the resource node
            AmountSpawn = 10;   -> Number or resource node to spawn
            ZoneArea = 50;      -> Area of the marker where resource node shuold spawn
        }; */

        class Rock_Zone
        {
            UseP3D = true;
            P3D = "";
            Items[] = {"Wood" , "Apple"};
            Amounts[] = {1 , 1};
            RequiredItem = "WoodAxe";
            Condition = ""; /* LATER WIP */
            AmountSpawn = 10;
            ZoneArea = 50;
        };
    };

    class Animals
    {
     /* class ClassName {    -> Class Name of the animal see: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_Animals
            Items[] = {"Meat" , "Hide"};     -> Items name to give
            Amounts[] = {1 , 1};     -> Amount of each item to give (es. Meat => 1; Hide => 1; in this case)
        }; */

        class Hen_random_F {
            Items[] = {"Meat" , "Hide"};
            Amounts[] = {1 , 1};
        };

        class Cock_random_F {
            Items[] = {"Meat" , "Hide"};
            Amounts[] = {1 , 1};
        };

    };

    class AnimalsSpawn
    {
     /* class MarkerName {    -> Name of the Marker
            MaxAnimals = 10;   -> Number of animal that will spawn
            Animals[] = { "Hen_random_F", "Cock_random_F" };    -> Animals that will spawn see: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_Animals
        }; */

        class Hunting1
        {
            MaxAnimals = 10;
            Animals[] = {
                "Hen_random_F",
                "Cock_random_F",
                "Goat_random_F",
                "Sheep_random_F",
                "Rabbit_F"
            };
        };

        class Hunting2
        {
            MaxAnimals = 10;
            Animals[] = {
                "Hen_random_F",
                "Cock_random_F",
                "Goat_random_F",
                "Sheep_random_F",
                "Rabbit_F"
            };
        };
    };
};
