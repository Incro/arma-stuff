
//Format: Marker, SizeX , SizeY  
aGatolia = ["Gatolia","mGatolia",150,150];

//##Marker and Trigger for Capture##

//markerSetup
fnc_markerSetup = {
    _marker = createMarker[aGatolia select 1, getMarkerPos (aGatolia select 0)];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize[aGatolia select 2, aGatolia select 3];
_marker setMarkerBrush "GRID";
_marker setMarkerColor "ColorRED";
};

fnc_createTrigger = {
    

    
    
};
