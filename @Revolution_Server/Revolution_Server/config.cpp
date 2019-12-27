class CfgPatches {
    class Revolution_Server {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
        fileName = "Revolution_Server.pbo";
        author = "Koalas :P";
    };
};

class CfgFunctions {
    class REV_Functions {
        Tag = "REV";
        class Farming 
        {
            file = "\Revolution_Server\Functions\Farming";
            class AnimalsSpawn {};
            class ResourcesSpawn {};
        };
    };
};
