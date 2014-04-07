enableSaving [false,false];
enableTeamswitch false;

//ConfigFile
call compile preprocessFile "config.sqf";

//Setup EAST HQ 

EASTSideHQ = createCenter east;

// Sector Control Setup
execVm "scripts\SectorControl\SectorControl.sqf";


//Unit Setup
execVM "scripts\UnitControl\UnitSetup.sqf";



