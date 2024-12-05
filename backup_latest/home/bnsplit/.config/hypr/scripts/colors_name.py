import json

# Define Papirus colors and their approximate hex codes
papirus_colors = {
    "adwaita": "#606060",
    "black": "#000000",
    "blue": "#2196f3",
    "bluegrey": "#607d8b",
    "breeze": "#87ceeb",
    "brown": "#795548",
    "carmine": "#960018",
    "cyan": "#00bcd4",
    "darkcyan": "#008b8b",
    "deeporange": "#ff5722",
    "green": "#4caf50",
    "grey": "#9e9e9e",
    "indigo": "#3f51b5",
    "magenta": "#ff00ff",
    "nordic": "#5e81ac",
    "orange": "#ff9800",
    "palebrown": "#d7ccc8",
    "paleorange": "#ffe0b2",
    "pink": "#e91e63",
    "red": "#f44336",
    "teal": "#009688",
    "violet": "#9c27b0",
    "white": "#ffffff",
    "yellow": "#ffeb3b",
    "yaru": "#d32f2f",
}

# Load the primary color from Pywal's JSON file
with open('/home/bnsplit/.cache/wal/colors.json', 'r') as f:
    colors = json.load(f)
primary_color_hex = colors["colors"]["color2"]

# Function to find the closest Papirus color
def closest_color(hex_value, color_map):
    min_distance = float('inf')
    closest_name = None
    r1, g1, b1 = int(hex_value[1:3], 16), int(hex_value[3:5], 16), int(hex_value[5:7], 16)
    for name, hex_code in color_map.items():
        r2, g2, b2 = int(hex_code[1:3], 16), int(hex_code[3:5], 16), int(hex_code[5:7], 16)
        distance = ((r1 - r2)**2 + (g1 - g2)**2 + (b1 - b2)**2)**0.5
        if distance < min_distance:
            min_distance = distance
            closest_name = name
    return closest_name

# Find and print the closest Papirus color
closest_name = closest_color(primary_color_hex, papirus_colors)
# print(f"The closest Papirus color is: {closest_name} ({primary_color_hex})")
print(f"{closest_name}")
