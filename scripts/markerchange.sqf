_mflag = _this select 0;
_marea = _this select 1;
_side = _this select 2;

//Changes flag and area color.
switch (_side) do {
	case "WEST":
	{
	_mflag setMarkerType "flag_NATO";
	_mflag setMarkerText "NATO";
	_marea setMarkerColor "ColorBlue";
	hint "owned by west";
	};
	case "EAST":
	{
	_mflag setMarkerType "flag_CSAT";
	_mflag setMarkerText "CSAT";
	_marea setMarkerColor "ColorRed";
	hint "owned by east";
	};
	default:
	{
	_marea setMarkerColor "ColorYellow";
	};
};