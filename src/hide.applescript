tell application "System Events"
    set frontAppProc to first application process whose frontmost is true
    set frontAppName to name of frontAppProc

    set visibleApps to (every process whose visible is true and name is not frontAppName and name is not "Finder")
end tell

if frontAppName is not "Finder" then
    tell application "Finder"
        set finderWindows to (every Finder window)
        if (count of finderWindows) > 0 then
            repeat with w in finderWindows
                set collapsed of w to true
            end repeat
        end if
    end tell
else if frontAppName is "Finder" then
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

    delay 1

end if

tell application "System Events"
    repeat with appProc in visibleApps
        set visible of appProc to false
    end repeat
end tell
