// File: console_utils.agc
// Created: 24-04-13

type MyLog
	logMessage as string
	colorR as integer
	colorG as integer
	colorB as integer
endtype

global consoleIndex = 0
global console as MyLog[5]

function DrawConsole()
	consoleLength = console.length
	print("Console (" + str(consoleIndex) + ")")
	if(consoleIndex > 4)
		for i = 0 to 4
			print(console[i].logMessage)
		next i
	else
		for i = 0 to consoleIndex
			print(console[i].logMessage)
		next i
	endif
endfunction

function AddConsoleLog(msg as string, colR as integer, colG as integer, colB as integer)
    newMsg as string
    newMsg = "[" + str(consoleIndex) + "] " + msg
    newLog as MyLog
    newLog.logMessage = newMsg
    newLog.colorR = colR
    newLog.colorG = colG
    newLog.colorB = colB
    
    if(consoleIndex < 5)
        console.insert(newLog, consoleIndex)
    else
        for i = 1 to 4
            console[i - 1] = console[i]
        next i
        console[4] = newLog
    endif
    
    consoleIndex = consoleIndex + 1
endfunction

function LogError(msg as string)
	newMsg as string
	newMsg = "(ERROR) " + msg
	AddConsoleLog(newMsg, 225, 0, 0)
endfunction

function LogWarning(msg as string)
	newMsg as string
	newMsg = "(WARNING) " + msg
	AddConsoleLog(newMsg, 225, 225, 0)
endfunction

function LogMessage(msg as string)
	AddConsoleLog(msg, 225, 225, 255)
endfunction