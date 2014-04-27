/*
Description: creates  a waypoint with all needed stuff.

Parameters: 
0: Group
1: position to move to.
(2:) Type of waypoint 
(3:) behavior of units while moving to waypoint.
(4:) speed of units while moving to waypoint.
(5:) radius of designated waypoint position 

Return value: Waypoint

*/
private ["_wp","_group","_pos","_rad","_type","_behavior","_speed"];

//_type = "MOVE";
//_behavior = "UNCHANGED";
//_speed = "UNCHANGED";
//_rad = 0;


_group = _this select 0; //Group to give waypoint.
_pos = _this select 1; //Pos to move to.


if(count _this > 2)then {_type = _this select 2;} else {_type = "MOVE";}; //Type of Waypoint
if(count _this > 3 ) then {_behavior = _this select 3;} else {_behavior = "UNCHANGED";}; //Bahavior move to waypoint.
if(count _this > 4 ) then {_speed = _this select 4;} else {_speed = "UNCHANGED";}; //Speed units are travelling at.
if(count _this > 5) then {_rad = _this select 5;} else {_rad = 0;}; //Radius of Waypoint.


_wp = _group addWaypoint[_pos,_rad];
_wp setWaypointType _type; 
_wp setWaypointBehaviour _behavior;
_wp setWaypointSpeed _speed;

_wp //returns the waypoint.