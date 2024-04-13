// File: game_state_manager.agc
// Created: 24-04-12

#include "console_utils.agc"
#include "menu_main.agc"

#CONSTANT state_MainMenu 0
#CONSTANT state_GameMenu 1

global gState = 0

function GetIsStateValid(state as integer)
	if state >= 0 and state <= 1
		valid = true
	else
		valid = false
	endif
endfunction valid

function UpdateGameTitle(stateTitle as string)
	currentFPS = ScreenFPS()
	SetWindowTitle("Monster Factory Tycoon! - " + stateTitle + " -  FPS: " + str(currentFPS))
endfunction

function UpdateGameState()
	do
		select gState:
			case state_MainMenu:
				UpdateGameTitle("On Main Menu")
				UpdateMainMenu()
				
			endcase
			case state_GameMenu:
				UpdateGameTitle("Playing!")
				
			endcase
			case default:
				
			endcase
		endselect
		DrawConsole()
		Sync()
	loop
endfunction

function InitGameState(state as integer)
	select state:
		case state_MainMenu:
			InitMainMenu()
			
		endcase
		case state_GameMenu:
			
		endcase
		case default:
		endcase
	endselect
endfunction

function UninitGameState(state as integer)
		select state:
		case state_MainMenu:
			UninitMainMenu()
			
		endcase
		case state_GameMenu:
			
		endcase
		case default:
		endcase
	endselect
endfunction

function SetGameState(state as integer)
	if(GetIsStateValid(state))
		UninitGameState(gState)
		InitGameState(state)
		gState = state
		
	else
		LogError("Trying to set invalid game state!")
	endif
endfunction

function StartGame()
	SetGameState(state_MainMenu)
	UpdateGameState()
endfunction