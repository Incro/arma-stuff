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




[getMarkerPos "HQ", "Squad"] call SpawnGroup;
[getMarkerPos "FOB1", "OIA_InfSquad_weapons"] call SpawnGroup;
[getMarkerPos "FOB2", "OI_SniperTeam"] call SpawnGroup;
[getMarkerPos "FOB3", "Tetsttetet"] call SpawnGroup;

//First startup put units onto Start pos.

STARTSectors = ["SectorMolosAirfield", "SectorMolos"];

//Two random groups as defense in the first two cities, base
_aigroupcount = count AIGroup;
_usedai = [];
for[{_c =0},{_c = count STARTSectors}, {_c=_c+1}]do {
    private["_rnd","_rndgroup"];
    _rnd = random _aigroupcount;
    _rndgroup = AIGroup select _rnd;
    [_rndgroup, STARTSectors select _c] call TeleportGroup;
   
};


TeleportGroup = {
    private["_group","_sector"];
    _group = _this select 0;
    _sector = _this select 1;
    {_x setPos getMarkerPos _sector}forEach units _group;
    Player globalChat format["Teleported:%1",_group];
};


SpawnGroup = {
    private["_group", "_pos", "_tgroup"];
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
        if(AIGroup != "no group") then{ AIGroup = AIGroup + _group;};
        _group
    };
        

SpawnSentry = {
	
private ["_SpawnPos","_group"];
_SpawnPos = _this select 0;	
	_group = [_SpawnPos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry") ] call BIS_fnc_spawnGroup;
	Player globalChat "Spawned Sentry";
	_group
	};
	
	
SpawnFireteam = {	
	
private ["_SpawnPos","_group"];
_SpawnPos = _this select 0;	
	_group = [_SpawnPos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam") ] call BIS_fnc_spawnGroup;
	Player globalChat "Spawned Fireteam";
	_group
};

SpawnSquad = {	
	
private ["_SpawnPos","_group"];
_SpawnPos = _this select 0;	
	_group = [_SpawnPos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad") ] call BIS_fnc_spawnGroup;
	Player globalChat "Spawned Squad";
	_group
};

SpawnWeaponsSquad = {	
	
private ["_SpawnPos","_group"];
_SpawnPos = _this select 0;	
	_group = [_SpawnPos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad_weapons") ] call BIS_fnc_spawnGroup;
	Player globalChat "Spawned WeaponsSquad";
	_group
};







