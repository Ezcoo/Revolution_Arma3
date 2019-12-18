class interactionGUI 
{
	idd = 100002;
	duration = 60;
	movingEnable = true;
	enableSimulation = true;
	fadein= 0.1;
	fadeout= 0.1;
	onLoad = "uiNamespace setVariable ['interactionGUI', _this select 0]";
    onUnload = "uiNamespace setVariable ['interactionGUI', displayNull]";

	class Controls 
	{

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Hawkins, v1.063, #Micita)
////////////////////////////////////////////////////////

class RscControlsGroup_2300: RscControlsGroup
{
	idc = 2300;
	x = 0.375312 * safezoneW + safezoneX;
	y = 0.402 * safezoneH + safezoneY;
	w = 0.249375 * safezoneW;
	h = 0.14 * safezoneH;
	class Controls
	{
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "textures\resources\gradient_rect_small.paa";
			x = 0.00656299 * safezoneW;
			y = 0.014 * safezoneH;
			w = 0.23625 * safezoneW;
			h = 0.112 * safezoneH;
			colorText[] = {0,0,0,0.5};
		};
		class RscPicture_1202: RscPicture
		{
			idc = 1202;
			text = "textures\resources\keys\spacebar.paa";
			x = 0.0131255 * safezoneW;
			y = 0.07 * safezoneH;
			w = 0.02625 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscStructuredText_1101: RscStructuredText
		{
			idc = 1101;
			text = "<t shadow='0'>OBJECT</t>"; //--- ToDo: Localize;
			x = 0.045938 * safezoneW;
			y = 0.033 * safezoneH;
			w = 0.190312 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "<t shadow='0'>Action</t>"; //--- ToDo: Localize;
			x = 0.045938 * safezoneW;
			y = 0.075 * safezoneH;
			w = 0.190312 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class RscPicture_1201: RscPicture
		{
			idc = 1201;
			text = "textures\resources\icon_circle_small.paa";
			x = 0.0131255 * safezoneW;
			y = 0.026 * safezoneH;
			w = 0.02625 * safezoneW;
			h = 0.042 * safezoneH;
		};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

	};
};