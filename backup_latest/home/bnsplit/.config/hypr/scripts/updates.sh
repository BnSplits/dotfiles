# !/usr/bin/expect -f
sudo echo 
clear
echo "---------------------------------------------------------------------------------"
yay -Qu
echo "---------------------------------------------------------------------------------"
yay -Su -q --noconfirm 
# set timeout -1
# set password "ban"
# set filepath [file join $env(HOME) ".icons/Papirus/64x64/apps/update-notifier.svg"]
#
# # Get all workspaces information from hyprctl
# set workspaces_output [exec hyprctl workspaces]
# set active_workspace ""
#
# # Parse output to find the workspace where lastwindowtitle is empty
# foreach line [split $workspaces_output "\n"] {
#     if {[regexp {^workspace ID ([0-9]+)} $line _ id]} {
#         set current_workspace $id
#     }
#     if {[regexp {lastwindowtitle:\s*$} $line]} {
#         set active_workspace $current_workspace
#         break
#     }
# }
#
# # Default to "unknown" if no matching workspace is found
# if {$active_workspace eq ""} {
#     set active_workspace "unknown"
# }
#
# # Send notification with the active workspace ID
# spawn bash -c "notify-send 'Updates on workspace $active_workspace...' '<i><b> </b></i>' -i '$filepath' -t '5000'"
#
# # Log user input visibility
# log_user 0
# # Start updating
# spawn bash -c "echo ' ' && echo 'Installing updates...' && yay -Syu --noconfirm"
# log_user 1
#
# expect {
#     -re "Mot de passe de bnsplit" { send "$password\r" }
#     eof
# }
#
# # Send completion notification after updates are done
# spawn bash -c "notify-send 'Updates done!' '<i><b> </b></i>' -i '$filepath' -t '5000'"
#
# interact
#
# # Send end notification
# spawn bash -c "notify-send 'Updates done !' '<i><b> </b></i>' -i '$filepath' -t '5000'"
#
