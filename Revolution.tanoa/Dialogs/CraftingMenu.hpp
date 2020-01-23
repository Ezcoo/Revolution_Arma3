class CraftingMenu
{
	idd = 1500;
	movingEnable = false;
	enableSimulation = true;

	class Controls
	{
		class CraftingListBox : RscListBox
		{
			idc = 1501;
			x = 0.00151516;
			y = 0.20313136;
			w = 0.33333334;
			h = 0.7948485;
			onLBSelChanged = "call REV_fnc_CraftingMaterialNeeded;";
			colorBackground[] = {0,0,0,1};
		};

		class CraftingTitle : RscStructuredText
		{
			idc = 1502;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.22444445;
			w = safeZoneW * 0.379375;
			h = safeZoneH * 0.06111112;
			colorBackground[] = {0,0,0,1};
		};

		class CloseButton : RscButton
		{
			x = 0.91969698;
			y = 0.00202022;
			w = 0.08030304;
			h = 0.11111116;
			onButtonClick = "closeDialog 0;";
			colorBackground[] = {0,0,0,1};
		};

		class TextRecipes : RscStructuredText
		{
			x = 0.0000001;
			y = 0.11000013;
			w = 0.34000001;
			h = 0.09000006;
			text = "RECIPES:";
			colorBackground[] = {0,0,0,1};
		};

		class MaterialsNeeded : RscStructuredText
		{
			idc = 1503;
			x = 0.36000008;
			y = 0.12000011;
			w = 0.35000001;
			h = 0.39000004;
			colorBackground[] = {0,0,0,1};
		};

		class CraftIMG : RscPicture
		{
			idc = 1504;
			x = 0.71241708;
			y = 0.11455703;
			w = 0.28758294;
			h = 0.39405065;
			colorBackground[] = {0,0,0,1};
		};

		class CraftButton : RscButton
		{
			x = 0.34000011;
			y = 0.82000014;
			w = 0.28000004;
			h = 0.17;
			text = "CRAFT";
			onButtonClick = "call REV_fnc_CraftingHandler;";
			colorBackground[] = {0,0,0,1};
		};

		class AmountText : RscStructuredText
		{
			x = 0.84000022;
			y = 0.84000025;
			w = 0.12000005;
			h = 0.15000008;
			text = "AMOUNT";
			colorBackground[] = {0,0,0,1};
		};

		class UpArrow : RscButton
		{
			x = 0.69000008;
			y = 0.78000035;
			w = 0.09000009;
			h = 0.0900002;
			text = "";
			colorBackground[] = {0,0,0,1};
		};

		class DownArrow : RscButton
		{
			x = 0.69000008;
			y = 0.89000019;
			w = 0.09000004;
			h = 0.09000006;
			text = "";
			colorBackground[] = {0,0,0,1};
		};

		class AmountNumber : RscStructuredText
		{
			idc = 1505;
			x = 0.81000004;
			y = 0.75000016;
			w = 0.17;
			h = 0.08000006;
			text = "";
			colorBackground[] = {0,0,0,1};
		};
	};
};