#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

; Final Fansaty 14
; ================

; Globals
ProcessName := "ffxiv_dx11.exe"
NoAfkToggle := false

^F12::CraftLoop14()

CraftLoop14() {
    loop 34 {
        ; Initiate craft with cursor over "synthesize"
        Click, Down
        Sleep 300
        Click, Up
        Sleep 3 * 1000
        ; Initiate crafting macro
        Send {F3}
        Sleep 60 * 1000 ; sleep expects msecs
    }
}

SendToGame(KeyToSend, SleepTime) {
    global
    ; ahk_exe searches by exe name e.g. Task Manager process name
    ControlSend,, %KeyToSend%, ahk_exe %ProcessName%
    Sleep %SleepTime%
}

; Builtin keyboard

*CapsLock::
    Send {Blind}{Ctrl Down}
    cDown := A_TickCount
Return

*CapsLock up::
    If ((A_TickCount-cDown)<250)  ; Modify press time as needed (milliseconds)
        Send {Blind}{Ctrl Up}{Esc}
    Else
        Send {Blind}{Ctrl Up}
Return

!Space::LWin
RAlt::RCtrl
F10::^+Tab
F11::^Tab

; FF14 Sim
#IfWinActive ahk_exe XivMechanicSimNetworked.exe
a::a
o::s
e::w
u::d
!4::e
#IfWinActive

#IfWinActive ahk_exe chrome.exe
a::a
o::s
e::w
u::d
!4::e
#IfWinActive

; Runescape binds
#IfWinActive ahk_exe rs2client.exe
Home::SendInput !{Home}
End::SendInput !{End}
PgUp::SendInput !{PgUp}
PgDn::SendInput !{PgDn}

^Home::SendInput !{Home}
^End::SendInput !{End}
^PgUp::SendInput !{PgUp}
^PgDn::SendInput !{PgDn}

Numpad9::Send {j}{k}
!Numpad9::Send {j}{k}
^Numpad9::Send {j}{k}

NumpadAdd::Send {k}

LAlt & Tab::AltTab
Tab::Numpad0
#IfWinActive
