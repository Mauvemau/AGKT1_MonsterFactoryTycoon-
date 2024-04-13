
// Project: MonsterFactoryTycoon 
// Created: 24-04-12

#include "general_utils.agc"
#include "game_state_manager.agc"

// show all errors

SetErrorMode(2)

// set window properties
SetWindowTitle("Monster Factory Tycoon - Loading...")
SetWindowSize(600, 800, 0)
SetWindowAllowResize(false) // allow the user to resize the window

// set display properties
SetVirtualResolution(600, 800) // doesn't have to match the window
SetOrientationAllowed(1, 1, 1, 1) // allow both portrait and landscape on mobile devices
SetSyncRate(60, 0) // Max FPS 60
SetScissor(0,0,0,0) // use the maximum available screen space, no black borders
UseNewDefaultFonts(true)

SetConsoleVisible(true) // Draw custom console logs

StartGame() // Start the game
