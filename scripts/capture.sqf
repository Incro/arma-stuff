_trigger = _this select 0;
_tlist = list _trigger;
_countWEST = null;
_countEAST = null;
_areaOwned = "NONE";

_countWEST = west countSide _tlist;
_countEAST = east countSide _tlist;
//hint format["PlayersWest:%1, PlayersEast:%2",_countWEST, _countEAST];


if({_countEAST == 0} and {_countWEST > 0}) then 
{
_areaOwned = "WEST";
};

if({_countWEST == 0} and {_countEAST > 0}) then
{
_areaOwned = "EAST";
};

hint format["Area owned by %1", _areaOwned];

//this is for further scripts


/* switch (_areaOwned) do
{
	case "WEST":
	{
	null = ["sofia_flag", "sofia_area", "WEST"] execVM "scripts/markerchange.sqf";
	};
	case "EAST":
	{
	null = ["sofia_flag", "sofia_area", "EAST"] execVM "scripts/markerchange.sqf";
	};
	default
	{
	
	};
}; 
*/