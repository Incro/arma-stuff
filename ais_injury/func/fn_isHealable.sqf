// by psycho
private["_injured","_return"];
_injured = _this select 0;
_return = if (alive _injured && {isNull(_injured getVariable ["dragger",objNull])} && {isNull(_injured getVariable ["healer", objNull])}) then {true} else {false};
if !(alive _injured) then {["It's already to late for this guy.",0, 0.035 * safezoneH + safezoneY,5,0.3] spawn BIS_fnc_dynamicText};

_return