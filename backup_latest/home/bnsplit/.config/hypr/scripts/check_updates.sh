#!/bin/bash

filepath="$HOME/.icons/Papirus/64x64/apps/update-notifier.svg"
temp_file="/tmp/updates_notification_count"

# Sudo password
PASSWORD="ban"

# Function to synchronize packages and check for updates
check_updates() {
    updates=$(expect -c "
        spawn yay -Sy
        expect {
            \"Mot de passe de bnsplit\" { send \"$PASSWORD\r\"; exp_continue }
            eof
        }
    ")

    available_updates=$(yay -Qu | wc -l)

    # Check the number of updates in the temporary file
    if [[ -f $temp_file ]]; then
        previous_updates=$(cat $temp_file)
    else
        previous_updates=0
    fi

    if (( available_updates > 0 )); then
        # Send a notification if the number of updates has changed
        if (( available_updates != previous_updates )); then
          notify-send "Updates Available : ( $available_updates )" "<i><b> </b></i>" -i "$filepath" -t "10000"
            # Update the temporary file with the new number of updates
            echo $available_updates > $temp_file
        fi
    else
        # If no updates are available, delete the temporary file
        [[ -f $temp_file ]] && rm $temp_file
    fi
}

# Show the number of updates
check_updates
yay -Qu | wc -l
