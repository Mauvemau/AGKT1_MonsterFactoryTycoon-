// File: general_utils.agc
// Created: 24-04-13

#CONSTANT false 0
#CONSTANT true 1

type Vector2
	x as float
	y as float
endtype

function GetPointerPosition()
	pos as Vector2
	pos.x = GetPointerX()	
	pos.y = GetPointerY()
endfunction pos