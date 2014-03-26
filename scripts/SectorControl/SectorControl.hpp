class SectorControlText {
    idc = -1;
    type = CT_STATIC;
    style = ST_LEFT;
    font = "EtelkaNarrowMediumPro";
    colorBackground[] = {0,0,0,1};
    colorText[] = {1,1,1,1};
    x = 0.1;
    y = 0;
    w = 1.0;
    h = 0.04;
    sizeEx = 0.04;
    lineSpacing = 1;
    text = "";
};

class SectorControlStatusDialog {
    idd = -1;
    enableSimulation = true;
    duration = 2;
    onLoad = "uiNamespace setVariable ['TAG_Controls', _this select 0]; _this call onLoadSectorControlStatusDialog;";
    class controls {
	class StatusText : SectorControlText {
	    text = "Sector Status";
	    h = 0.1;
	    sizeEx = 0.1;
	};
	class StatusEastText : SectorControlText {
	    idc = 1;
	    //type = 0;  // 0 = single line text box, 16 = multiline
	    text = "East:";
	    y = 0.15;
	};
	class StatusWestText : SectorControlText {
	    idc = 2;
	    text = "West:";
	    y = 0.20;
	};
	class StatusUnoccupiedText : SectorControlText {
	    idc = 3;
	    text = "Unoccupied:";
	    y = 0.25;
	};
    };
};

