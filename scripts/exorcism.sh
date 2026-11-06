#!/bin/bash
CSV="data/ghost_hosts.csv"

if [ ! -f "$CSV" ]; then
  echo "ERROR: no es troba $CSV"
  exit 1
fi

tail -n +2 "$CSV" | while IFS=',' read -r id ip host nivell estat resta; do
  if [ "$estat" = "Actiu" ] && { [ "$nivell" = "Alt" ] || [ "$nivell" = "Crític" ]; }; then
    echo "[AÏLLANT] $host ($ip) - nivell $nivell"
  fi
done