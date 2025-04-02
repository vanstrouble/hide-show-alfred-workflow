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

# Execute the function
show_all_apps

echo "All hidden applications have been successfully shown"
