// Area, Area Marker Name, Flag Marker Name, Owned by(RED, BLUE, GREEN)
_area = _this select 0;
_owned = _this select 1;
/*_markarea = _this select 1;
_markflag = _this select 2;
_owned = _this select 3;


//_markflag = format["MarkerFlag",_area];

if(_owned =="BLUE") then { 
hint format["%1 now owned by BLUFOR",_area];
_markflag setMarkerType "flag_NATO"; 
_markflag setMarkerText "NATO"; 
_markarea setMarkerColor "ColorBlue";
}
else {
if(_owned == "RED") then {
hint format["%1 now owned by CSAT", _area];
_markflag setMarkerType "flag_CSAT";
_markflag setMarkerText "CSAT";
_markarea setMarkerColor "ColorRed";
}
	else
	{
	hint format["%1 currently not occupied", _area];
	_markflag setMarkerType "flag_ALTIS";
	_markflag setMarkerText "CIVILIAN";
	_markarea setMarkerColor "ColorYellow";
	}
};

*/

//SecondVersion with just area as needed parameter. All Marker should be named like:
//Area Marker: <Area>_Area, Flag Marker: MarkerFlag_<Area>


//###Creation of Marker String with format function###
_markflag = format["%1_Flag",_area];
_markarea = format["%1_Area",_area];


if(_owned =="BLUE") then { 
hint format["%1 now owned by BLUFOR",_area];
_markflag setMarkerType "flag_NATO"; 
_markflag setMarkerText "NATO"; 
_markarea setMarkerColor "ColorBlue";
}
else {
if(_owned == "RED") then {
hint format["%1 now owned by CSAT", _area];
_markflag setMarkerType "flag_CSAT";
_markflag setMarkerText "CSAT";
_markarea setMarkerColor "ColorRed";
}
	else
	{
	hint format["%1, currently not occupied",_area];
	_markflag setMarkerType "flag_ALTIS";
	_markflag setMarkerText "CIVILIAN";
	_markarea setMarkerColor "ColorYellow";
	}
};