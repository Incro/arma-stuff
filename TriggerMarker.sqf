_trigger = _this select 0; //Trigger who calls this script

//Find out what side triggers.
_tAct = triggerActivation _trigger; //Returns Array of activation [by,type,repeating]
_tActby = _tAct select 0; //Trigger Activated by (WEST, EAST....)
_tTxt = triggerText _trigger; //Text of the Trigger to have Name for the Markers.

hint format["Trigger Activated by %1, Trigger Text:%2",_tActby, _tTxt];

if(_tAct == "WEST")then {
if(triggeractivated _trigger) then {
if(format["%1OPFORPresent",_tTxt] == 0)then{
nul = [_tTxt, "BLUE"] call MMS;
format["%1BLUFORPresent",_tTxt] = 1;
};
};
};




/*
//BLUFOR captured On Act.

format["%1OPFORPresent", _tTxt]
if (triggeractivated _trigger) then{
if(MolosAirfieldOPFORPresent == 0) then{nul = ["MolosAirfield", "BLUE"] call MMS;}; 
MolosAirfieldBLUFORPresent = 1;
};


Trigger of MolosAirfield BLUFOR onAct
if(MolosAirfieldOPFORPresent == 0) then{nul = ["MolosAirfield", "BLUE"] call MMS;};
MolosAirfieldBLUFORPresent = 1;


*/