; Ctrl+Alt+B - Open Browser of Choice
^!b::
    ; To use Firefox, comment out the Chrome line, To use Chrome, comment out the Firefox line
    Run "Firefox"
    ; Run "Chrome"
    Return

; Ctrl+Alt+E - Open Explorer to home directory
^!e::
    Run Explorer "%HOMEPATH%"
    Return

; Ctrl+Alt+Shift+T - Open Powershell Terminal to home directory
^!+t::
    Run Powershell -noexit -command "cd %HOMEPATH%"
    Return

; Ctrl+Alt+T - Open Ubuntu Subsystem Terminal
^!t::
    Run Ubuntu
    Return