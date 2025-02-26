tell application "System Events"
    set frontAppProc to first application process whose frontmost is true
    set frontAppName to name of frontAppProc
end tell

if frontAppName is not "Finder" then
    tell application "System Events"
        set visibleApps to (every process whose visible is true and name is not frontAppName and name is not "Finder")

        repeat with appProc in visibleApps
            set visible of appProc to false
        end repeat
    end tell

    tell application "Finder"
        set finderWindows to (every Finder window)
        if (count of finderWindows) > 0 then
            repeat with w in finderWindows
                set collapsed of w to true
            end repeat
        end if
    end tell
else
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

    delay 0.5

    tell application "System Events"
        set visibleApps to (every process whose visible is true and name is not frontAppName and name is not "Finder")

        repeat with appProc in visibleApps
            set visible of appProc to false
        end repeat
    end tell
end if
