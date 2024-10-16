#!/bin/bash

### Cache wallpaper image
# Copy the specified wallpaper to the cache directory
cp "$1" ~/.cache/wallpaper

### Apply color scheme using 'wal'
# Generate a color scheme based on the wallpaper
wal -i "$1"

### Generate color configuration for Hyprland
# Clear existing color configuration for Hyprland
> "$HOME/.config/hypr/colors/colors-hypr.conf"

# Initialize a counter for color names
i=1
while IFS= read -r line; do
    # Remove '#' from the start of each color and append 'FF' for opacity
    formatted_color="${line#\#}FF"
    # Write the formatted color to the Hyprland color config file
    echo "\$color$i = $formatted_color" >> "$HOME/.config/hypr/colors/colors-hypr.conf"
    ((i++))
done < "$HOME/.cache/wal/colors"

### Generate color configuration for GTK
# Clear existing GTK color configuration files (blur and solid)
> "$HOME/.config/hypr/colors/blur-colors-gtk.css"
> "$HOME/.config/hypr/colors/solid-colors-gtk.css"

# Reset the counter for GTK color names
i=1
while IFS= read -r line; do
    # Create 'blur' and 'solid' versions of each color in rgba format
    blur_color="rgba(${line},0.7)"
    solid_color="rgba(${line},1)"
    # Write the formatted colors to the respective GTK config files
    echo "@define-color color-blur$i $blur_color;" >> "$HOME/.config/hypr/colors/blur-colors-gtk.css"
    echo "@define-color color-solid$i $solid_color;" >> "$HOME/.config/hypr/colors/solid-colors-gtk.css"
    ((i++))
done < "$HOME/.cache/wal/colors-rgb"

exit 0

