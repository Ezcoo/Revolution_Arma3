class errorDialog 
{

    idd = 100001;
    class controls 
    {
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT START (by Capt. Chris, v1.063, #Nyguki)
        ////////////////////////////////////////////////////////

        class RscPicture_1200: RscPicture
        {
        	idc = 1200;
        	text = "#(argb,8,8,3)color(1,1,1,1)";
        	x = -7.45058e-008;
        	y = 0.22;
        	w = 1;
        	h = 0.48;
        	colorText[] = {0,0,0,0.25};
        };
        class RscPicture_1201: RscPicture
        {
        	idc = 1201;
        	text = "#(argb,8,8,3)color(1,1,1,1)";
        	x = 0.0125;
        	y = 0.28;
        	w = 0.975;
        	h = 0.4;
        	colorText[] = {0,0,0,0.85};
        };
        class RscButtonMenu_2400: RscButtonMenu
        {
        	idc = 2400;
        	text = "ok"; //--- ToDo: Localize;
        	x = 0.875;
        	y = 0.58;
        	w = 0.1;
        	h = 0.08;
        };
        class RscEdit_1400: RscEdit
        {
        	idc = 1400;
        	text = ""; //--- ToDo: Localize;
        	x = 0.0249999;
        	y = 0.3;
        	w = 0.95;
        	h = 0.26;
        	colorText[] = {1,0,0,1};
        	colorBackground[] = {0,0,0,1};
        };
        class RscStructuredText_1100: RscStructuredText
        {
        	idc = 1100;
        	text = "ERROR!"; //--- ToDo: Localize;
        	x = 0.0125;
        	y = 0.24;
        	w = 0.975;
        	h = 0.04;
        	colorBackground[] = {1,0,0,1};
        };
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT END
        ////////////////////////////////////////////////////////
    };
};