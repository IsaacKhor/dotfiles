#Requires AutoHotkey >=2.0
#SingleInstance Force

; To use hyper keys, run this (script must also run as admin)
; REG ADD HKCU\Software\Classes\ms-officeapp\Shell\Open\Command /t REG_SZ /d rundll32

if not A_IsAdmin
{
    Run '*RunAs "' A_ScriptFullPath '"'
    ExitApp
}

^+!#t::
{
    if WinExist("ahk_exe firefox.exe")
        WinActivate
}

caps_down_duration := 0
CAPS_MAX_DURATION := 250
enable_laptop_mode := false

*CapsLock::
{
    Send "{Blind}{Ctrl Down}"
    global caps_down_duration := A_TickCount
}

*CapsLock up::
{
    if ((A_TickCount - caps_down_duration) < CAPS_MAX_DURATION) {
        Send "{Blind}{Ctrl Up}{Esc}"
    } else {
        Send "{Blind}{Ctrl Up}"
    }
}

LCtrl & Tab::AltTab
#+[::Send "^+{Tab}"
#+]::Send "^{Tab}"

#HotIf enable_laptop_mode

e & u::LCtrl
o & e::LAlt

LAlt & Tab::AltTab

LAlt::LCtrl
LWin::LAlt
LCtrl::LWin
RAlt::RCtrl
RCtrl::RAlt

F9::Send "^+{Tab}"
F10::Send "^{Tab}"

#HotIf
