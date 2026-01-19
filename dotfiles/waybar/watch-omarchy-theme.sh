#!/usr/bin/env bash
# Watch Omarchy theme changes and auto-update waybar

OMARCHY_THEME_NAME="${HOME}/.config/omarchy/current/theme.name"
WAYBAR_SCRIPT="${HOME}/.config/waybar/update-theme-from-omarchy.sh"
LAST_THEME=""

# Function to update waybar when theme changes
update_waybar_on_theme_change() {
    while true; do
        if [[ -f "$OMARCHY_THEME_NAME" ]]; then
            CURRENT_THEME=$(cat "$OMARCHY_THEME_NAME")
            
            if [[ "$CURRENT_THEME" != "$LAST_THEME" && -n "$LAST_THEME" ]]; then
                echo "[$(date '+%H:%M:%S')] Theme changed to: $CURRENT_THEME"
                
                # Update waybar theme
                "$WAYBAR_SCRIPT"
                
                # Reload waybar without killing (smoother transition)
                pkill -SIGUSR2 waybar || {
                    # If waybar not running, start it
                    waybar &
                }
                
                LAST_THEME="$CURRENT_THEME"
            elif [[ -z "$LAST_THEME" ]]; then
                # First run - just record theme and start waybar if needed
                LAST_THEME="$CURRENT_THEME"
                pgrep -x waybar > /dev/null || waybar &
            fi
        fi
        
        sleep 2  # Check every 2 seconds
    done
}

# Run in background
update_waybar_on_theme_change &
