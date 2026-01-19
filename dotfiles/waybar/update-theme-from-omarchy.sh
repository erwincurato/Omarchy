#!/usr/bin/env bash
# Generate omarchy-colors.css from Omarchy's colors.toml

OMARCHY_COLORS="${HOME}/.config/omarchy/current/theme/colors.toml"
WAYBAR_OMARCHY="${HOME}/.config/waybar/omarchy-colors.css"

if [[ ! -f "$OMARCHY_COLORS" ]]; then
    echo "Error: Omarchy colors.toml not found at $OMARCHY_COLORS"
    exit 1
fi

# Extract colors from colors.toml
eval $(grep "=" "$OMARCHY_COLORS" | sed 's/ //g')

# Generate omarchy-colors.css with all color variables
cat > "$WAYBAR_OMARCHY" << EOF
/* Auto-generated from Omarchy theme - DO NOT EDIT MANUALLY */

@define-color omarchy-accent        $accent;
@define-color omarchy-background    $background;
@define-color omarchy-foreground    $foreground;
@define-color omarchy-cursor        $cursor;
@define-color omarchy-color0        $color0;
@define-color omarchy-color1        $color1;
@define-color omarchy-color2        $color2;
@define-color omarchy-color3        $color3;
@define-color omarchy-color4        $color4;
@define-color omarchy-color5        $color5;
@define-color omarchy-color6        $color6;
@define-color omarchy-color7        $color7;
@define-color omarchy-color8        $color8;
@define-color omarchy-color9        $color9;
@define-color omarchy-color10       $color10;
@define-color omarchy-color11       $color11;
@define-color omarchy-color12       $color12;
@define-color omarchy-color13       $color13;
@define-color omarchy-color14       $color14;
@define-color omarchy-color15       $color15;
EOF

echo "✓ omarchy-colors.css generated!"
echo "  Accent: $accent"
echo "  Background: $background"
echo "  Foreground: $foreground"

