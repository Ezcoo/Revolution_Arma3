#Define true 1
#Define false 0
class CfgFarming
{
    class General {
        /* Animals Allowed To be Gathered */
        AnimalsAllowed[] = {
                "Hen_random_F",
                "Cock_random_F",
                "Goat_random_F",
                "Sheep_random_F",
                "Rabbit_F"
        };
    };

    class Resources
    {
        /*
        class ClassName     -> Class Name of the resourse
        {
            Item = "";     -> Name of the item WIP

            Amount = 1;     -> Number of how much you gain from 1 resource node

            AmountSpawn = 10;     -> Number of how many resource node shuold spawn

            RequiredItem = "";     -> MAYBE WIP

            Condition = "";     -> WIP

            Markers[] = {"test1", "test2"};   -> Markers where the resourse spawn

        }
        */

        class Rock
        {
            UseP3D = true; //WIP
            P3D = ""; // WIP
            Item = "Rock";
            Amount = 1;
            AmountSpawn = 10;
            RequiredItem = ""; /* MAYBE LATER WIP* */
            Condition = ""; /* LATER WIP */
            Markers[] = {};
        };
    };

    class AnimalsSpawn
    {
        /*
        class MarkerName     -> Name of the Marker
        {
            MaxAnimals = 10;   -> Number of animal that will spawn

            Animals[] = { "Hen_random_F", "Cock_random_F" };    -> Animals that will spawn see: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_Animals
        }
        */

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