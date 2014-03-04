_MolosMarkerSize = getMarkerSize "Molos_Area";

TR_City_Molos = createTrigger["EmptyDetector", position "Molos_Area"];
_array = getMarkerSize "Molos_Area";
_radX = _array select 0;
_radY = _array select 1;
TR_City_Molos setTriggerArea[ _radX, _radY, 0, false];
TR_City_Molos setTriggerActivation ["EAST", "PRESENT", true];
TR_City_Molos setTriggerStatements["this","
MolosOcuMarker = createMarker["MolosOcuMarker", position TR_City_Molos];
MolosOcuMarker setMarkerType "flag_CSAT";
MolosOcuMarker setMarkerText "CSAT";"
, 
"MolosOcuMarker setMarkerType "flag_NATO";
MolosOcuMarker setMarkerText "NATO";"];