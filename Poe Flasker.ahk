; Function to generate a random interval between min and max milliseconds
RandomInterval(min, max) {
    Random, interval, min, max
    return interval
}

; Function to generate a random key press duration between min and max milliseconds
RandomKeyPressDuration(min, max) {
    Random, duration, min, max
    return duration
}

; Only activate the hotkey if Path of Exile is the active window
#IfWinActive ahk_exe PathOfExileSteam.exe

; When the letter E is pressed
$e::
    ; Randomize the sequence of key presses to add unpredictability
    keys := [3, 4, 5]
    Loop, % keys.MaxIndex() {
        Random, idx, 1, % keys.MaxIndex()
        key := keys[idx]
        keys.RemoveAt(idx)

        ; Simulate key down
        Send, {%key% down}
        Sleep, % RandomKeyPressDuration(30, 70) ; Random key press duration between 30 and 70 ms

        ; Simulate key up
        Send, {%key% up}
        Sleep, % RandomInterval(50, 200) ; Random interval between 50 and 200 ms
    }
return

#IfWinActive

; Hotkey to toggle script suspension (F12)
F12::Suspend
