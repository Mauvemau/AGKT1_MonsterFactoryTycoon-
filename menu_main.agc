// File: menu_main.agc
// Created: 24-04-13

#include "ui_utils.agc"
#include "console_utils.agc"

global playButton as Button

function DrawMainMenu()
	DrawButton(playButton)
endfunction

function UpdateMainMenu()
	if(UpdateButton(playButton))
		LogMessage("Play Button Pressed!")
	endif
	
	DrawMainMenu()
endfunction

function InitMainMenu()
	playButton = CreateButton((GetWindowWidth() * .5) - 100, 300, 200, 80, MakeColor(200, 200, 200), "Play")
endfunction

function UninitMainMenu()
	DestroyButton(playButton)
endfunction