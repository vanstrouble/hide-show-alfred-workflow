tell application "System Events"
    set visibleApps to (every process whose visible is true and name is not "Finder")

    repeat with appProc in visibleApps
        if (visible of appProc is true) then
            try
                set visible of appProc to false
            on error
                log "Hidding error: " & (name of appProc) & " - " & errMsg
            end try
        end if
    end repeat
end tell

delay 0.5

tell application "Finder"
    set finderWindows to (every Finder window)
    if (count of finderWindows) > 0 then
        repeat with w in finderWindows
            set collapsed of w to true
        end repeat
    end if
end tell
