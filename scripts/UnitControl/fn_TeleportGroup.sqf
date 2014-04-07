/*
Author: TG Incro <jaincro@gmail.com>

Description: Teleports a group to given position.

Parameters: 
	0: Group
	1: position to teleport to.


*/


    private["_group","_pos"];
    _group = _this select 0;
    _pos = _this select 1;
    {_x setPos _pos}forEach units group _group;
    Player globalChat format["Teleported:%1",_group];
