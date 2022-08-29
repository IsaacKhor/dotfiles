#NoEnv  		; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  			; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance Force ; Only run a single instance at a time
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Bladed dive macro
F24::
Send ^q
Sleep 10
Send ^j
Sleep 10
Send ^k
KeyWait, LButton, D
Sleep 650
Send o
Sleep 10
Send e
return
