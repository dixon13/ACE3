/*
 * Author: dixon13
 * Waypoint function for placing explosives
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Waypoint position <ARRAY>
 *
 * Return Value:
 * true
 *
 * Example:
 * [_unit, [6560, 12390, 0]] call ace_explosive_fnc_placeExplosiveAIWaypoint
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_group", grpNull, [grpNull]], ["_position", [0, 0, 0], [[]], 3]];
private ["_unit"];

_commander = leader _group;
_speedMode = speedMode _group;

{
    _unit = false;
    if ([_x] call FUNC(hasExplosives)) exitWith {
        _unit = _x;
        true
    };
} count units _group;

if (_unit isEqualType true) exitWith {
    if (hasInterface) then {
        // Note: BIS_fnc_guiMessage causes a CTD with call, so spawn is used instead.
        ["placeExplosiveAIWaypoint was called no AI have explosives", QFUNC(placeExplosiveAIWaypoint)] spawn BIS_fnc_guiMessage;
    };
    ACE_LOGERROR('FUNC(placeExplosiveAIWaypoint): placeExplosiveAIWaypoint was called no AI have explosives');
    false
};

[_unit] call FUNC(placeExplosiveAI)

_result
