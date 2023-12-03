#!/bin/bash
# update_config.sh

item=$1
file_path=$2

key=$(echo "$item" | sed -e 's/=.*$//')

# Check if the line to be replaced already exists with the correct value
if grep -q "^$key=" "$file_path"; then
    # If it exists, check if the line needs to be changed
    current_value=$(grep "^$key=" "$file_path")
    if [ "$current_value" != "$item" ]; then
        # If the current value is different, perform the replacement
        sed -i "/^$key=/c\\$item" "$file_path"
    fi
else
    # If the line does not exist, append it to the file
    echo "$item" >> "$file_path"
fi
