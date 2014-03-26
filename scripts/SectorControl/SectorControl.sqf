/**
 * Name:   SectorControl.sqf
 * Author: TG WhichDokta <whichdokta@gmail.com>
 *
 * Very simple sector control script. 
 *
 * Usage:
 *
 *   - Create a marker in the editor for each Sector you want to create.
 *   - Name your markers as follows: "Sector<Name>" e.g. "SectorCharlie"
 *   - Markers can be rectangles or ellipses
 *   - Add the following line to your Init.sqf file: execVM "SectorControl.sqf"
 *   - Add the following line to your description.ext file: #include "SectorControl.hpp"
 *
 */

Player globalChat "loading SectorControl.sqf";


// get all sector markers on the map
private "_sectorMarkers";
_sectorMarkers = [];
{
    private "_name";
    _name = toArray _x;
    _name resize 6; // Sector<Name>
    if (toString _name == "Sector")  then {
	_shape = markerShape _x;
	if ((_shape == "RECTANGLE") or (_shape == "ELLIPSE")) then {
	    _sectorMarkers = _sectorMarkers + [_x];
	} else {
	    player globalChat(format ["Invalid Sector Marker: %1", _x]);
	};
    };
} forEach allMapMarkers;


// trigger capture/occupation logic
StatusUnoccupied = _sectorMarkers;
StatusWest = [];
StatusEast = [];

Occupied = {
    _trigger = _this select 0;
    _activatingObjects = _this select 1;
    _t = _this select 2;

    _name = triggerText _trigger;
    _name setMarkerColor "ColorRed";
    hint format ["%1 has been occupied by EAST", _name];
    StatusEast = StatusEast + [ _name ];
    StatusWest = StatusWest - [ _name ];
    StatusUnoccupied = StatusUnoccupied - [ _name ];
};

Captured = {
    _trigger = _this select 0;
    _activatingObjects = _this select 1;
    _t = _this select 2;

    _name = triggerText _trigger;
    _name setMarkerColor "ColorBlue";
    hint format ["%1 has been captured by WEST", _name];
    StatusWest = StatusWest + [ _name ];
    StatusEast = StatusEast - [ _name ];
    StatusUnoccupied = StatusUnoccupied - [ _name ];
};


// create sectors on the sector markers
_sectorTriggers = [];
{
    _x setMarkerColor "ColorBlack";
    _x setMarkerBrush "DiagGrid";

    _shape = markerShape _x;
    _direction = markerDir _x;
    _size = getMarkerSize _x;
    _position = getMarkerPos _x;

    _trigger = createTrigger ["EmptyDetector", _position];
    _trigger setTriggerText _x;
    _area = _position + [
	_direction,
	switch (_shape) do { case "RECTANGLE": { true }; case "ELLIPSE": { false }; }
    ];
    _trigger setTriggerArea _area;
    _trigger setTriggerActivation ["EAST", "PRESENT", true];
    _trigger setTriggerStatements [ 
	"this", 
	"[thisTrigger, thisList, this] call Occupied;",
	"[thisTrigger, thisList, this] call Captured;" 
    ];

    _sectorTriggers = _sectorTriggers + [_trigger];
    Player globalChat format ["Created trigger for: %1", _x];
} forEach _sectorMarkers;


// Add action for sector status view
Player addAction ["Sector Status", {
    _ok = createDialog "SectorControlStatusDialog";
    waitUntil {!dialog};
    hint "Dialog closed";
}];


// Show a scoreboard
/*while {alive player} do {
    hint format ["WEST: %1\nEAST: %2\nUNOCCUPIED: %3\n", StatusWest, StatusEast, StatusUnoccupied];
    sleep 5;
};*/


onLoadSectorControlStatusDialog = {
    Player globalChat "onLoadSectorControlStatusDialog";
    ((uiNamespace getVariable "TAG_Controls") displayCtrl 1) ctrlSetText format ["East: %1", StatusEast];
    ((uiNamespace getVariable "TAG_Controls") displayCtrl 2) ctrlSetText format ["West: %1", StatusWest];
    ((uiNamespace getVariable "TAG_Controls") displayCtrl 3) ctrlSetText format ["Unoccupied: %1", StatusUnoccupied];
};
