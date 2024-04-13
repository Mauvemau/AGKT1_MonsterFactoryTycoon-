// File: ui_utils.agc
// Created: 24-04-13

#include "collision_utils.agc"

type Button
	position as Vector2
	size as Vector2
	color as integer
	textID as integer
	hovered as integer // 0-1
endtype

function CenterButton()
	
endfunction

function IsPointerInsideButton(button as Button)
	coll = CheckPointerRectCollision(button.position, button.size)
endfunction coll

//

function DrawButton(button as Button)
	DrawBox(button.position.x, button.position.y, button.position.x + button.size.x, button.position.y + button.size.y, button.color, button.color, button.color, button.color, false)
endfunction

function UpdateButton(button ref as Button)
	button.hovered = IsPointerInsideButton(button)
	
	if(button.textID)
		SetTextAlignment(button.textID, 1)
		SetTextPosition(button.textID, button.position.x + (button.size.x * .5), button.position.y + (button.size.y * .15))
		SetTextSize(button.textID, button.size.y * .65)
		SetTextDepth(button.textID, 0)
	
	
		if(button.hovered)
			SetTextColor(button.textID, GetColorRed(button.color) * .5, GetColorGreen(button.color) * .5, GetColorBlue(button.color) * .5, 255)
		else
			SetTextColor(button.textID, GetColorRed(button.color), GetColorGreen(button.color), GetColorBlue(button.color), 255)
		endif
	endif
	
	// Update Pressed
	pressed = false
	if(button.hovered and GetPointerPressed())
		pressed = true
	endif
	
endfunction pressed

function CreateButton(posX as float, posY as float, width as float, height as float, color as integer, text as string)
	button as Button
	button.position.x = posX
	button.position.y = posY
	button.size.x = width
	button.size.y = height
	button.color = color
	button.textID = CreateText(text)
	button.hovered = false
endfunction button

// Mostly used to create invisible buttons later on, color is kept as debug.
function CreateButtonTextless(posX as float, posY as float, width as float, height as float, color as integer)
	button as Button
	button.position.x = posX
	button.position.y = posY
	button.size.x = width
	button.size.y = height
	button.color = color
	button.hovered = false
endfunction button