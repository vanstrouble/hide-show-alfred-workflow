#!/bin/zsh --no-rcs

# Get the frontmost application
frontmost_app=$(osascript -e 'tell application "System Events" to return name of first application process whose frontmost is true')

echo "Frontmost application: $frontmost_app"

# Function to collapse all Finder windows except the active one
collapse_finder_windows() {
    if [[ "$frontmost_app" == "Finder" ]]; then
        osascript <<EOT
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
EOT
    else
        # Collapse all Finder windows
        osascript <<EOT
            tell application "Finder"
                set finderWindows to (every Finder window)
                if (count of finderWindows) > 0 then
                    repeat with w in finderWindows
                        set collapsed of w to true
                    end repeat
                end if
            end tell
EOT
    fi
}

# Function to hide all applications except the frontmost one and Finder
hide_other_apps() {
    osascript <<EOT
        tell application "System Events"
            set visibleApps to (every process whose visible is true and name is not "$frontmost_app" and name is not "Finder")
            repeat with appProc in visibleApps
                set visible of appProc to false
            end repeat
        end tell
EOT
}

# Execute the functions
collapse_finder_windows
hide_other_apps

echo "Applications hidden successfully"
