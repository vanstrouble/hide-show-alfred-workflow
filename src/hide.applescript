tell application "System Events"
    set frontApp to (get name of first application process whose frontmost is true)

    set visibleApps to (every process whose visible is true and name is not frontApp and name is not "Finder")

    repeat with appProc in visibleApps
        set visible of appProc to false
    end repeat
end tell

tell application "Finder"
    set finderWindows to (every Finder window)

    if frontApp is "Finder" then
        set frontWindow to window 1

        repeat with win in finderWindows
            if win is not frontWindow then
                try
                    set collapsed of win to true
                on error
                end try
            end if
        end repeat
    else
        repeat with win in finderWindows
            try
                set collapsed of win to true
            on error
            end try
        end repeat
    end if
end tell
