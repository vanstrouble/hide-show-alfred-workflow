#!/bin/zsh --no-rcs

echo "Starting to hide all applications..."

# Function to hide all applications except Finder
hide_all_apps() {
    osascript <<EOT
        tell application "System Events"
            set visibleApps to (every process whose visible is true and name is not "Finder")

            repeat with appProc in visibleApps
                if (visible of appProc is true) then
                    try
                        set visible of appProc to false
                    on error errMsg
                        log "Error hiding: " & (name of appProc) & " - " & errMsg
                    end try
                end if
            end repeat
        end tell
EOT
}

# Function to collapse all Finder windows
collapse_finder_windows() {
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
}

# Execute the functions
hide_all_apps

# Small pause to ensure all applications have been hidden
sleep 0.5

collapse_finder_windows

echo "All applications have been successfully hidden"
