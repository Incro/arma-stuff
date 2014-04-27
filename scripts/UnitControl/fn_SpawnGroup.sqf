/*
Author: TG Incro ,jaincro@gmail.com

Description: Spawns different kind of Groups at given position.

Parameters: 
	0: Position where you want squad to spawn.
	1: Kind of Group(Squad,WeaponsSquad,Fireteam,Sentry) or just put in CfgGroups value.

Returns: Group spawned.

*/
    private["_group", "_pos", "_tgroup"];
    _group = "no group";
    _pos = _this select 0;
    _tgroup = _this select 1;
    switch _tgroup do {
            case "Squad": {_group = [_pos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad") ] call BIS_fnc_spawnGroup;
};
            case "WeaponsSquad": {_group = [_pos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad_weapons") ] call BIS_fnc_spawnGroup;
 };
            case "Fireteam": {_group = [_pos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam") ] call BIS_fnc_spawnGroup;};
            case "Sentry": { _group = [_pos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry") ] call BIS_fnc_spawnGroup;
};
        default {
            call compile format['_group = [_pos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "OPF_F" >> "Infantry" >> "%1") ] call BIS_fnc_spawnGroup;',_tgroup ];
        };
        };
        Player globalChat format["Spawned:%1", _group];
        if(_group != "no group") then{ AIGroup = AIGroup + _group;};
        _group
