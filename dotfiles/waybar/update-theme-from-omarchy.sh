#!/usr/bin/env bash
# Generate waybar theme.css from Omarchy's colors.toml

OMARCHY_COLORS="${HOME}/.config/omarchy/current/theme/colors.toml"
WAYBAR_THEME="${HOME}/.config/waybar/theme.css"

if [[ ! -f "$OMARCHY_COLORS" ]]; then
    echo "Error: Omarchy colors.toml not found at $OMARCHY_COLORS"
    exit 1
fi

# Extract colors from Omarchy's colors.toml
eval $(grep "=" "$OMARCHY_COLORS" | sed 's/ //g')

# Generate waybar theme.css
cat > "$WAYBAR_THEME" << EOF
/* Auto-generated from Omarchy theme */

/* Base colors from Omarchy */

@define-color rosewater     $cursor;
@define-color flamingo      #f2cdcd;
@define-color pink          #f5c2e7;
@define-color mauve         #cba6f7;
@define-color red           $color1;
@define-color maroon        #eba0ac;
@define-color peach         #fab387;
@define-color yellow        $color3;
@define-color green         $color2;
@define-color teal          #94e2d5;
@define-color sky           #89dceb;
@define-color sapphire      #74c7ec;
@define-color blue          #89b4fa;
@define-color lavender      $accent;
@define-color text          $foreground;
@define-color subtext1      #bac2de;
@define-color subtext0      $color7;
@define-color overlay2      #9399b2;
@define-color overlay1      #7f849c;
@define-color overlay0      #6c7086;
@define-color surface2      #585b70;
@define-color surface1      $color8;
@define-color surface0      $color0;
@define-color base          $color0;
@define-color mantle        $color0;
@define-color crust         $background;

/*
	br - border
	bg - background
	fg - foreground
*/

/* main colors */

@define-color accent        $accent;
@define-color main-br       $color7;
@define-color main-bg       $background;
@define-color main-fg       $foreground;
@define-color hover-bg      $color8;
@define-color hover-fg      alpha(@main-fg, 0.75);
@define-color outline       shade(@main-bg, 0.5);

/* module colors */

@define-color workspaces    $color0;
@define-color temperature   $color0;
@define-color memory        $color1;
@define-color cpu           $color3;
@define-color time          $color5;
@define-color date          $color4;
@define-color tray          $color0;
@define-color volume        $color2;
@define-color backlight     $color6;
@define-color battery       $color9;

/* state colors */

@define-color warning       $color3;
@define-color critical      $color1;
@define-color charging      $color2;
EOF

echo "✓ Waybar theme updated from Omarchy!"
echo "  Accent color: $accent"
echo "  Background: $background"
echo "  Foreground: $foreground"

