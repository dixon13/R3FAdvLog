/*
Modified by Sean Crowe
please see orginal work @ forums.bistudio.com/topic/188980-advanced-towing

To get a full list of changes please contant me on the biforums under the username S.Crowe

The MIT License (MIT)

Copyright (c) 2016 Seth Duda

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
/*
* Author: Seth Duda
* [Description]
*
* Arguments:
* 0: Argument Name <TYPE>
*
* Return Value:
* Return Name <TYPE>
*
* Example:
* ["example"] call r3fadvlog_[module]_fnc_[functionName]
*
* Public: [Yes/No]
*/
#include "script_component.hpp"

params ["_vehicle"];
    private _cornerPoints = [_vehicle] call AdvLog_fnc_getCornerPoints;
    private _rearCorner = _cornerPoints select 0;
    private _rearCorner2 = _cornerPoints select 1;
    private _frontCorner = _cornerPoints select 2;
    private _frontCorner2 = _cornerPoints select 3;
    private _rearHitchPoint = ((_rearCorner vectorDiff _rearCorner2) vectorMultiply 0.5) vectorAdd  _rearCorner2;
    private _frontHitchPoint = ((_frontCorner vectorDiff _frontCorner2) vectorMultiply 0.5) vectorAdd  _frontCorner2;
    //private _sideLeftPoint = ((_frontCorner vectorDiff _rearCorner) vectorMultiply 0.5) vectorAdd  _frontCorner;
    //private _sideRightPoint = ((_frontCorner2 vectorDiff _rearCorner2) vectorMultiply 0.5) vectorAdd  _frontCorner2;

    [_frontHitchPoint,_rearHitchPoint]
