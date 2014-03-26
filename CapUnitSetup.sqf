//Setup AI Groups 

_SideHQ = createCenter east;


//20 squadleaders at marker FOB1
for "_i" from 1 to 20 do {
_gname = format["Capgroup%1",_i];
call compile format["%1 = createGroup east", _gname];
call compile format["%1 setGroupId['AI%1']", _gname];
call compile format["'O_Soldier_SL_F' createUnit[getMarkerPos 'FOB1', %1]",_gname];
};



AIGroups = [];
//Amout of Units
AmountSentries = 10;
AmountFireteams = 6;
AmountSquads = 4;
AmountWeaponSquads = 2;
STARTMarker = "HQ";

for "_i" from 1 to AmountSentries do {[getMarkerPos STARTMarker] call SpawnSentry};
for "_i" from 1 to AmountFireteams do {[getMarkerPos STARTMarker] call SpawnFireteam};
for "_i" from 1 to AmountSquads do {[getMarkerPos STARTMarker] call SpawnSquad};
for "_i" from 1 to AmountWeaponSquads do {[getMarkerPos STARTMarker] call SpawnWeaponSquad};



/*
AIGroups = AIGroups + [getMarkerPos "FOB2"]call SpawnFireteam;
AIGroups = AIGroups + [getMarkerPos "FOB3"]call SpawnSquad;
AIGroups = AIGroups + [getMarkerPos "FOB4"]call SpawnWeaponsSquad; */
//[getMarkerPos "FOB5"]call SpawnFireteam;


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

