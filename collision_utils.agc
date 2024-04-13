// File: collision_utils.agc
// Created: 24-04-13

#include "general_utils.agc"

function CheckVector2RectCollision(v as Vector2, rectPos as Vector2, rectSize as Vector2)
	if v.x > rectPos.x and v.x < (rectPos.x + rectSize.x) and v.y > rectPos.y and v.y < (rectPos.y + rectSize.y)
		coll = true
	else
		coll = false
	endif
endfunction coll

function CheckPointerRectCollision(rectPos as Vector2, rectSize as Vector2)
	pointerPos as Vector2
	pointerPos = GetPointerPosition()
	coll = CheckVector2RectCollision(pointerPos, rectPos, rectSize)
endfunction coll