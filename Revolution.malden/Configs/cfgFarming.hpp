#Define true 1
#Define false 0

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
                        "UserTexture1m_F", /* FOR ALL P3D Keep this*/
                        "TEST"
                };
    };

    class Resources
    {
        /*
        class MarerName     -> Marker Name of the resourse
        {
            Item = "";     -> Name of the item WIP

            Amount = 1;     -> Number of how much you gain from each resource node

            AmountSpawn = 10;     -> Number of how many resource node shuold spawn

            RequiredItem = "";     -> MAYBE WIP

            Condition = "";     -> WIP
        }
        */

        class Rock_Zone
        {
            UseP3D = true; //WIP Almost done
            P3D = ""; //WIP Almost done
            Item = "Rock";
            Amount = 1;
            AmountSpawn = 10;
            RequiredItem = ""; /* MAYBE LATER WIP* */
            Condition = ""; /* LATER WIP */
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
