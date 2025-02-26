tell application "Finder"
    set finderWindows to (every Finder window)
    if (count of finderWindows) > 0 then
        set activeWindow to front Finder window

        repeat with w in finderWindows
            if id of w is not id of activeWindow then
                set collapsed of w to true
            end if
        end repeat
    end if
end tell
