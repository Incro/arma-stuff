enableSaving [false,false];
enableTeamswitch false;

//ConfigFile
call compile preprocessFile "config.sqf";


// Sector Control Setup
execVm "scripts\SectorControl\SectorControl.sqf";


//Unit Setup
null = [] execVM "CapUnitSetup.sqf";



