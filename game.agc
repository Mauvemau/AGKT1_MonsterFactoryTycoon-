// File: game.agc
// Created: 24-04-13

#include "ui_utils.agc"
#include "object_entity.agc"
#include "console_utils.agc"

global playerImage as integer
global player as Entity
global goBackButton as Button

function DrawGame()
	DrawButton(goBackButton)
endfunction

function HandleGameInput()
	v as Vector2
	sp = 150
	if(GetRawKeyState(87)) // W
		v.x = 0
		v.y = (-1 * GetFrameTime()) * sp
		MoveEntity(player, v)
	endif
	if(GetRawKeyState(65)) // A
		v.x = (-1 * GetFrameTime()) * sp
		v.y = 0
		MoveEntity(player, v)
	endif
	if(GetRawKeyState(83)) // S
		v.x = 0
		v.y = (1 * GetFrameTime()) * sp
		MoveEntity(player, v)
	endif
	if(GetRawKeyState(68)) // D
		v.x = (1 * GetFrameTime()) * sp
		v.y = 0
		MoveEntity(player, v)
	endif
endfunction

function UpdateGame()
	HandleGameInput()
	
	if(UpdateButton(goBackButton))
		SetGameState(state_MainMenu)
	endif
	
	UpdateEntity(player)
	DrawGame()
endfunction

function InitGame()
	playerImage = LoadImage("wizard.png")
	player = CreateEntity(100, 100, 50, 50, playerImage)
	goBackButton = CreateButton((GetWindowWidth() * .65), 10, 200, 50, MakeColor(200, 200, 200), "shit go back!")
endfunction

function UninitGame()
	DestroyButton(goBackButton)
	DestroyEntity(player)
	DeleteImage(playerImage)
endfunction