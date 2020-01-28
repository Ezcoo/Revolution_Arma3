class CraftingMenu
{
	idd = 1500;
	movingEnable = false;
	enableSimulation = true;

	class Controls
	{
        class RscPicture1 : RscPicture
        {
        	text = "#(argb,8,8,3)color(1,1,1,1)";
        	x = 0;
        	y = 0;
        	w = 1;
        	h = 1;
        	colorText[] = {0,0,0,0.25};
        };

		class CraftingListBox : RscListBox
		{
			idc = 1501;
			x = 0.05;
			y = 0.25;
			w = 0.35;
			h = 0.7;
			onLBSelChanged = "call REV_fnc_CraftingMaterialNeeded;";
			colorBackground[] = {0,0,0,1};
		};

		class CraftingTitle : RscStructuredText
		{
			idc = 1502;
			x = 0.05;
			y = 0.05;
			w = 0.8;
			h = 0.1;
			colorBackground[] = {0,0,0,1};
			size = 0.09;
            class Attributes
            {
                align = "center";
            };
		};

		class CloseButton : RscButton
		{
			x = 0.85;
			y = 0.05;
			w = 0.1;
			h = 0.1;
			text = "✘";
			onButtonClick = "closeDialog 0;";
			colorBackground[] = {0,0,0,1};
		};

		class TextRecipes : RscStructuredText
		{
			x = 0.05;
			y = 0.151;
			w = 0.35;
			h = 0.1;
			text = "RECIPES:";
			size = 0.09;
			colorBackground[] = {0,0,0,1};
            class Attributes
            {
                align = "center";
            };
		};

        class MaterialsNeededTitle : RscStructuredText
		{
			x = 0.45;
			y = 0.151;
			w = 0.25;
			h = 0.1;
			text = "Material Needed:";
			colorBackground[] = {0,0,0,1};
			size = 0.05;
            class Attributes
            {
                align = "center";
            };
		};

		class MaterialsNeeded : RscStructuredText
		{
			idc = 1503;
			x = 0.45;
			y = 0.251;
			w = 0.25;
			h = 0.3;
			colorBackground[] = {0,0,0,1};
            class Attributes
            {
                align = "center";
            };
		};

        class CraftIMGTitle : RscStructuredText
		{
			idc = 1504;
			x = 0.7;
			y = 0.151;
			w = 0.25;
			h = 0.1;
			colorBackground[] = {0,0,0,1};
			size = 0.09;
            class Attributes
            {
                align = "center";
            };
		};

		class CraftIMG : RscPicture
		{
			idc = 1505;
			x = 0.7;
			y = 0.251;
			w = 0.25;
			h = 0.3;
			colorBackground[] = {0,0,0,1};
		};

		class CraftButton : RscButton
		{
			x = 0.8;
			y = 0.8;
			w = 0.15;
			h = 0.15;
			text = "CRAFT";
			onButtonClick = "call REV_fnc_CraftingHandler;";
			colorBackground[] = {0,0,0,1};
		};

		class AmountText : RscStructuredText
		{
			x = 0.45;
			y = 0.65;
			w = 0.1;
			h = 0.08;
			text = "AMOUNT";
			colorBackground[] = {0,0,0,1};
            class Attributes
            {
                align = "center";
            };
		};

		class UpArrow : RscButton
		{
			x = 0.57;
			y = 0.65;
			w = 0.08;
			h = 0.08;
			text = "▲";
			onButtonClick = "[1] call REV_fnc_CraftingAmountSet;";
			colorBackground[] = {0,0,0,1};
		};

		class DownArrow : RscButton
		{
			x = 0.57;
			y = 0.78;
			w = 0.08;
			h = 0.08;
			text = "▼";
			onButtonClick = "[-1] call REV_fnc_CraftingAmountSet;";
			colorBackground[] = {0,0,0,1};
		};

		class AmountNumber : RscStructuredText
		{
			idc = 1506;
			x = 0.45;
			y = 0.73;
			w = 0.1;
			h = 0.13;
			text = "1";
			size = 0.09;
			colorBackground[] = {0,0,0,1};
            class Attributes
            {
                align = "center";
            };
		};
	};
};
