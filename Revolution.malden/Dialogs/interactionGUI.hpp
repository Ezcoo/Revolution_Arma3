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
		//////////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by GamesByChris, v1.063, #Gucydy)
		//////////////////////////////////////////////////////////////

		class RscControlsGroup_2300: RscControlsGroup
		{
			idc = 2300;
			x = 0.36875 * safezoneW + safezoneX;
			y = 0.444 * safezoneH + safezoneY;
			w = 0.2625 * safezoneW;
			h = 0.112 * safezoneH;
			class Controls
			{
				class RscPicture_1201: RscPicture
				{
					idc = 1201;
					text = "textures\resources\gradient_rect_small.paa";
					x = 0.00656201 * safezoneW;
					y = 0.014 * safezoneH;
					w = 0.249375 * safezoneW;
					h = 0.084 * safezoneH;
					colorText[] = {0,0,0,0.5};
				};
				class RscStructuredText_1100: RscStructuredText
				{
					idc = 1100;
					text = "<t shadow='0' size= '1'>Action (object name)</t>"; //--- ToDo: Localize;
					x = 0.0524995 * safezoneW;
					y = 0.042 * safezoneH;
					w = 0.150937 * safezoneW;
					h = 0.028 * safezoneH;
					colorBackground[] = {0,0,0,0};
				};
				class RscPicture_1202: RscPicture
				{
					idc = 1202;
					text = "textures\resources\icon_circle_small.paa";
					x = 0.21 * safezoneW;
					y = 0.028 * safezoneH;
					w = 0.0328125 * safezoneW;
					h = 0.056 * safezoneH;
					colorBackground[] = {1,1,1,0.75};
				};
				class RscPicture_1203: RscPicture
				{
					idc = 1203;
					text = "textures\resources\keys\spacebar.paa";
					x = 0.013125 * safezoneW;
					y = 0.028 * safezoneH;
					w = 0.0328125 * safezoneW;
					h = 0.056 * safezoneH;
				};
			};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};