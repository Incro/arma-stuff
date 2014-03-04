_trigger = _this select 0;
_tlist = list _trigger;
_countWEST = null;
_countEAST = null;
_areaOwned = "NONE";

_countWEST = west countSide _tlist;
_countEAST = east countSide _tlist;
//hint format["PlayersWest:%1, PlayersEast:%2",_countWEST, _countEAST];

//Find out if any of the sides is alone inside the city.
//Check if WEST owns area

if(_countEAST == 0 and _countWEST > 0;) then 
{
_areaOwned = "WEST";
};

/*Check if East force are the only ones around and therefore own the area. East owns all areas
 by default */

if(_countWEST == 0 and _countEAST > 0) then
{
_areaOwned = "EAST";
};

hint format["Area owned by %1", _areaOwned];