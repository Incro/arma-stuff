/*
Author: TG Incro <jaincro@gmail.com>

Description: Makes AI move to given Position if postion is more than 500 meters 
away it lets them get into the nearest Vehicle and after that move to the given position
e.g. put this into init of a unit null = [group this, getMarkerPos "Waypoint One"] execVM <direction>;

Parameter: 0: Group
                 1: Position to move to.
                 (2: Behavior https://community.bistudio.com/wiki/setWaypointBehaviour)
                 (3: Speed of group. https://community.bistudio.com/wiki/setWaypointSpeed)

*/


private ["_maxWalkDistance","_group","_pos","_rad","_wp","_behavior","_speed","_distance","_closestVehicles","_vehicle","_wp2","_leader","_countunits","_vehiclefound","_emptyseats","_i"];

_maxWalkDistance = 500; //Moximum distance AI will go by foot.
_rad = 0; //Radius of waypoint.
_behavior = "UNCHANGED"; //Preset of behavior
_speed = "UNCHANGED"; //Preset of speed.

//Get the given Vars.
_group = _this select 0;
_pos = _this select 1;
if (_this select 2 != _behavior) then {_behavior = _this select 2;};
if (_this select 3 != _speed) then {_speed = _this select 3;};

_leader = leader _group; //Group leader.
_distance = _leader distance _pos; //Distance between leader of group and target pos.
_countunits = count units _group;

//If Distance is to high units will use a vehicle to move to desginated pos.
if (_maxWalkDistance > _distance) then{
    _wp = [_group,_pos,"MOVE",_behavior,_speed, _rad] call UC_fnc_createWaypoint;
}
else {
    hint format["Distance: %1",_distance];
    _closestVehicles = nearestObjects[getPos _leader,["Car","Truck","Tank","Helicopter"],500]; 
   
    //Choose vehicle with enough seats.
    _vehiclefound = 0;
    _i = 0;
    while{_vehiclefound == 0}do{
        if(count _closestVehicles < _i) exitWith{_vehiclefound = 0;};
     _vehicle = _closestVehicles select _i;
     _emptyseats = [_vehicle] call UC_fnc_getNumberofEmptySeats;
        hint format["Empty Seats: %1",_emptyseats];
        if(_emptyseats >= _countunits)then{_vehiclefound = 1;};
        _i = _i +1;
    };
    
    if(_vehiclefound == 0) then{hint "There is no suitable vehicle around.";};//Later there will be a script splitting the group into different groups and move them into different vehicles.
    //Group will go by foot if there is no vehicle around.
    
    
        _leader assignAsCommander _vehicle; //Assigning group leader as commander otherwise some vehicles wont move.
    _wp = [_group,getPos _vehicle,"GETIN NEAREST"] call UC_fnc_createWaypoint;
 
    
    //Original waypoint to move to(with vehicle)
    _wp2 = [_group,_pos,"MOVE",_behavior,_speed, _rad] call UC_fnc_createWaypoint;

    
};


