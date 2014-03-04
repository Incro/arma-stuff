//Setup AI Groups 

_SideHQ = createCenter east;

//20 squadleaders at marker FOB1
for "_i" from 1 to 20 do {
_gname = format["Capgroup%1",_i];
call compile format["%1 = createGroup east", _gname];
call compile format["%1 setGroupId['AI%1']", _gname];
call compile format["'O_Soldier_SL_F' createUnit[getMarkerPos 'FOB1', %1]",_gname];
};