#!/bin/bash

# Obtenir l'usage du CPU directement depuis /proc/stat
cpu_line=$(grep 'cpu ' /proc/stat)
idle=$(echo $cpu_line | awk '{print $5}')
total=$(echo $cpu_line | awk '{print $2+$3+$4+$5+$6+$7+$8}')

sleep 0.5

cpu_line_after=$(grep 'cpu ' /proc/stat)
idle_after=$(echo $cpu_line_after | awk '{print $5}')
total_after=$(echo $cpu_line_after | awk '{print $2+$3+$4+$5+$6+$7+$8}')

# Calculer l'utilisation du CPU en pourcentage
idle_delta=$((idle_after - idle))
total_delta=$((total_after - total))
cpu_usage=$((100 * (total_delta - idle_delta) / total_delta))

# Obtenir la température CPU en utilisant sensors
cpu_temp=$(sensors | awk '/^Tctl:/ {print $2}' | cut -c 2- | sed 's/°C//')
cpu_temp=$(printf "%.0f" "$cpu_temp")

# Ram
used_ram=$(free -b | awk '/Mem:/ {print $3}')
used_ram_gib=$(awk "BEGIN {printf \"%.2f\", $used_ram / (1024^3)}")

# Afficher les informations formatées
echo "$cpu_usage%   / $cpu_temp°C   / $used_ram_gib Gib  "
