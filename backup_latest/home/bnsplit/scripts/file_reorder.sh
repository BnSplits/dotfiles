#!/bin/bash

# Function to ask for the numbering format
ask_padding() {
    echo "Choose the numbering format:"
    echo "1) Thousands (0001)"
    echo "2) Hundreds (001)"
    echo "3) Tens (01)"
    echo "4) Units (1)"
    read -rp "Enter your choice (1-4): " choice

    case $choice in
        1) echo 4 ;;
        2) echo 3 ;;
        3) echo 2 ;;
        4) echo 1 ;;
        *)
            echo "Invalid choice. Defaulting to thousands (0001)."
            echo 4
            ;;
    esac
}

# Check if the user provided a directory
if [[ -z $1 ]]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

directory=$1
if [[ ! -d $directory ]]; then
    echo "Error: $directory is not a valid directory."
    exit 1
fi

cd "$directory" || exit

# Get the padding for numbering
padding=$(ask_padding)

# Temporary directory for renaming
temp_dir="$(mktemp -d)"

# Rename files to temporary names
counter=1
for file in *; do
    if [[ -f "$file" ]]; then
        temp_name="$temp_dir/temp_$counter"
        mv "$file" "$temp_name"
        ((counter++))
    fi
done

# Rename temporary files to final names
counter=1
for temp_file in "$temp_dir"/*; do
    extension="${temp_file##*.}"
    new_name=$(printf "%0${padding}d.%s" "$counter" "$extension")
    mv "$temp_file" "$new_name"
    ((counter++))
done

# Cleanup temporary directory
rmdir "$temp_dir"

echo "Renaming completed!"
