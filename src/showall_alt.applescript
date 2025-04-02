tell application "System Events"
    set appList to application processes whose visible is false
    repeat with theApplication in appList
        set visible of theApplication to true
    end repeat
end tell

delay 0.5

tell application "Finder"
    set finderWindows to (every Finder window)
    if (count of finderWindows) > 0 then
        repeat with w in finderWindows
            set collapsed of w to false
        end repeat
    end if
end tell
