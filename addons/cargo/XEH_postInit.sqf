#include "script_component.hpp"





/*TODO: Replace with CBA Setting*/
if("\userconfig\r3f\config.sqf" call AdvLog_fnc_fileExists) then
{

    call {[] execVM "\userconfig\r3f\config.sqf";};
}
else
{
    #include "config.sqf"
};

/*
 * Reverse so user added stuff will override vanilla configs
 */
 /*TODO: Replace with global Variable detection*/
/*reverse R3F_LOG_CFG_can_tow;
reverse R3F_LOG_CFG_cannot_etow;
reverse R3F_LOG_CFG_can_be_towed;
reverse R3F_LOG_CFG_can_transport_cargo;
reverse R3F_LOG_CFG_can_be_transported_cargo;
reverse R3F_LOG_CFG_can_be_moved_by_player;
reverse R3F_LOG_CFG_build_costs;

// We spend all lowercase class names
{R3F_LOG_CFG_can_tow set [_forEachIndex, toLower _x];} forEach R3F_LOG_CFG_can_tow;
{R3F_LOG_CFG_cannot_etow set [_forEachIndex, toLower _x];} forEach R3F_LOG_CFG_cannot_etow;
{R3F_LOG_CFG_can_be_towed set [_forEachIndex, toLower _x];} forEach R3F_LOG_CFG_can_be_towed;
{R3F_LOG_CFG_can_transport_cargo select _forEachIndex set [0, toLower (_x select 0)];} forEach R3F_LOG_CFG_can_transport_cargo;
{R3F_LOG_CFG_can_be_transported_cargo select _forEachIndex set [0, toLower (_x select 0)];} forEach R3F_LOG_CFG_can_be_transported_cargo;
{R3F_LOG_CFG_can_be_moved_by_player set [_forEachIndex, toLower _x];} forEach R3F_LOG_CFG_can_be_moved_by_player;
{R3F_LOG_CFG_can_be_pushed_by_player set [_forEachIndex, toLower _x];} forEach R3F_LOG_CFG_can_be_pushed_by_player;
{R3F_LOG_CFG_build_costs select _forEachIndex set [0, toLower (_x select 0)];} forEach R3F_LOG_CFG_build_costs;*/

// We construct the list of classes of carriers in quantity associated (four the nearestObjects, count isKindOf, ...)
R3F_LOG_transporter_classes = [];
{
    R3F_LOG_transporter_classes pushBack (_x select 0);
} forEach R3F_LOG_CFG_can_transport_cargo;

// We construct the list of classes of transportable in quantity (for the nearestObjects, count isKindOf, ...)
R3F_LOG_classes_transportable_objects = [];
{
    R3F_LOG_classes_transportable_objects pushBack (_x select 0);
} forEach R3F_LOG_CFG_can_be_transported_cargo;

R3F_LOG_classes_build_costs = [];
{
    R3F_LOG_classes_build_costs pushBack (_x select 0);
} forEach R3F_LOG_CFG_build_costs;


/* FIN import config */

if (!hasInterface) exitWith {};

call compile preprocessFile "r3fAdvLog\R3F_LOG\general_functions\lib_visualization_object.sqf";

/** Pseudo- mutex to do such ? Cuter than a script object manipulation ? both (true : v rusty ? ) */
R3F_LOG_mutex_local_lock = false;

call compile preprocessFile "r3fAdvLog\R3F_LOG\general_functions\lib_geometrie_3D.sqf";

//Contains the object selected by unit
GVAR(selectedObject) = objNull;
