/*
Author: TG Incro <jaincro@gmail.com>

Description: Calculates all free pos in the given vehicle.

Parameters: 0: Vehicle

Return value: Number of available steats.
*/



private ["_vehicle","_freeCargoPos","_freeDriverPos","_freeCommanderPos","_freeGunnerPos","_totalseats"];

//hint "Vehicle Empty Pos Script loading";

_vehicle = _this select 0;

_freeCargoPos = _vehicle emptyPositions "Cargo";
_freeDriverPos = _vehicle emptyPositions "Driver";
_freeCommanderPos = _vehicle emptyPositions "Commander";
_freeGunnerPos = _vehicle emptyPositions "Gunner";

_totalseats = _freeCargoPos+_freeDriverPos+_freeCommanderPos+_freeGunnerPos;
//hint format["Free Positions in Cargo: %1,Driver: %2, Commander: %3, Gunner: %4 Total: %5",_freeCargoPos,_freeDriverPos,_freeCommanderPos,_freeGunnerPos,_totalseats];

_totalseats;