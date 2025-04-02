#!/bin/zsh --no-rcs

echo "Starting to show all hidden applications..."

# Function to show all hidden applications
show_all_apps() {
    osascript <<EOT
        tell application "System Events"
            set appList to application processes whose visible is false
            repeat with theApplication in appList
                set visible of theApplication to true
            end repeat
        end tell
EOT
}

# Function to expand all Finder windows
expand_finder_windows() {
    osascript <<EOT
        tell application "Finder"
            set finderWindows to (every Finder window)
            if (count of finderWindows) > 0 then
                repeat with w in finderWindows
                    set collapsed of w to false
                end repeat
            end if
        end tell
EOT
}

# Execute the functions
show_all_apps

# Small pause to ensure all applications have been shown
sleep 0.5

expand_finder_windows

echo "All hidden applications have been successfully shown"
