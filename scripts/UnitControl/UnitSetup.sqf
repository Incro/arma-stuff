
Player globalChat "loading Unit Setup";


AIGroups = [];
//Amout of Units
AmountSentries = 10;
AmountFireteams = 6;
AmountSquads = 4;
AmountWeaponSquads = 2;
STARTMarker = "HQ";




//[getMarkerPos "HQ", "Squad"] call SpawnGroup;
_returnValue = [getMarkerPos "FOB2", "OIA_InfSquad_weapons"] call UC_fnc_SpawnGroup;
//[getMarkerPos "FOB2", "OI_SniperTeam"] call SpawnGroup;
//[getMarkerPos "FOB3", "Tetsttetet"] call SpawnGroup; 

[_returnValue, getMarkerPos "HQ"] call UC_fnc_TeleportGroup;

//First startup put units onto Start pos.

//STARTSectors = ["SectorMolosAirfield", "SectorMolos"];

//Two random groups as defense in the first two cities, base
/*_aigroupcount = count AIGroup;
_usedai = [];
for[{_c =0},{_c = count STARTSectors}, {_c=_c+1}]do {
    private["_rnd","_rndgroup"];
    _rnd = random _aigroupcount;
    _rndgroup = AIGroup select _rnd;
    [_rndgroup, STARTSectors select _c] call TeleportGroup;
   
}; */
//[AIGroup select 0, "SectorMolos"] call TeleportGroup;







