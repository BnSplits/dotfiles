#!/bin/bash

# Récupère la date du fichier le plus ancien (supposé être la date d'installation du système)
# Utilise le format de date: année-mois-jour
install_date=$(ls -lct --time-style=long-iso /home/ | tail -1 | awk '{print $6, $7}')

# Convertit la date d'installation en secondes depuis Epoch
install_seconds=$(date -d "$install_date" +%s)

# Récupère la date actuelle en secondes depuis Epoch
current_seconds=$(date +%s)

# Calcule la différence en secondes
diff_seconds=$((current_seconds - install_seconds))

# Convertit la différence en jours, heures, minutes, et secondes
diff_days=$((diff_seconds / 86400))
diff_hours=$(( (diff_seconds % 86400) / 3600 ))
diff_minutes=$(( (diff_seconds % 3600) / 60 ))
diff_seconds=$((diff_seconds % 60))

# Affiche le temps écoulé
echo "$diff_days days, $diff_hours hours, $diff_minutes minutes, $diff_seconds seconds"
