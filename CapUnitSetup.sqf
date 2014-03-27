//Setup AI Groups 

_SideHQ = createCenter east;

/*
//20 squadleaders at marker FOB1
for "_i" from 1 to 20 do {
_gname = format["Capgroup%1",_i];
call compile format["%1 = createGroup east", _gname];
call compile format["%1 setGroupId['AI%1']", _gname];
call compile format["'O_Soldier_SL_F' createUnit[getMarkerPos 'FOB1', %1]",_gname];
}; */



AIGroups = [];
//Amout of Units
AmountSentries = 10;
AmountFireteams = 6;
AmountSquads = 4;
AmountWeaponSquads = 2;
STARTMarker = "HQ";

for "_i" from 1 to AmountSentries do {null = [getMarkerPos STARTMarker, "Sentry"] call SpawnGroup};
for "_i" from 1 to AmountFireteams do {null = [getMarkerPos STARTMarker,"Fireteam"] call SpawnGroup};
for "_i" from 1 to AmountSquads do {null = [getMarkerPos STARTMarker,"Squad"] call SpawnGroup};
for "_i" from 1 to AmountWeaponSquads do {null = [getMarkerPos STARTMarker,"WeaponsSquad"] call SpawnGroup};



/*[getMarkerPos "HQ", "Squad"] call SpawnGroup;
[getMarkerPos "FOB1", "OIA_InfSquad_weapons"] call SpawnGroup;
[getMarkerPos "FOB2", "OI_SniperTeam"] call SpawnGroup;
[getMarkerPos "FOB3", "Tetsttetet"] call SpawnGroup;*/



SpawnGroup = {
    _group = "no group";
    _pos = _this select 0;
    _tgroup = _this select 1;
    switch _tgroup do {
            case "Squad": {_group = [_pos]call SpawnSquad;};
            case "WeaponsSquad": {_group = [_pos]call SpawnWeaponsSquad; };
            case "Fireteam": {_group = [_pos]call SpawnFireteam;};
            case "Sentry": { _group = [_pos]call SpawnSentry;};
        default {
            call compile format['_group = [_pos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "OPF_F" >> "Infantry" >> "%1") ] call BIS_fnc_spawnGroup;',_tgroup ];
        };
        };
        Player globalChat format["Spawned:%1", _group];
        AIGroup = AIGroup + _group;
        _group
    };
        

SpawnSentry = {
	_SpawnPos = _this select 0;	
	_group = [_SpawnPos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry") ] call BIS_fnc_spawnGroup;
	Player globalChat "Spawned Sentry";
	_group
	};
	
	
SpawnFireteam = {	
	_SpawnPos = _this select 0;	
	_group = [_SpawnPos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam") ] call BIS_fnc_spawnGroup;
	Player globalChat "Spawned Fireteam";
	_group
};

SpawnSquad = {	
	_SpawnPos = _this select 0;	
	_group = [_SpawnPos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad") ] call BIS_fnc_spawnGroup;
	Player globalChat "Spawned Squad";
	_group
};

SpawnWeaponsSquad = {	
	_SpawnPos = _this select 0;	
	_group = [_SpawnPos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad_weapons") ] call BIS_fnc_spawnGroup;
	Player globalChat "Spawned WeaponsSquad";
	_group
};

/*
for "_i" from 0 to count AIGroups do{
    {
    
    }forEach units group AIGroups select _i;
};
*/

