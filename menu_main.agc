// File: menu_main.agc
// Created: 24-04-13

#include "ui_utils.agc"
#include "console_utils.agc"

global playButton as Button
global mainMenuText as integer

function DrawMainMenu()
	DrawButton(playButton)
endfunction

function UpdateMainMenu()
	if(UpdateButton(playButton))
		SetGameState(state_GameMenu)
	endif
	
	DrawMainMenu()
endfunction

function InitMainMenu()
	playButton = CreateButton((GetWindowWidth() * .5) - 100, 300, 200, 80, MakeColor(200, 200, 200), "Play")
	mainMenuText = CreateText("You should be able to move with WASD, if not contact the developer")
	SetTextAlignment(mainMenuText, 1)
	SetTextSize(mainMenuText, 21)
	SetTextPosition(mainMenuText, (GetWindowWidth() * .5), 30)
endfunction

function UninitMainMenu()
	DestroyButton(playButton)
	DeleteText(mainMenuText)
endfunction