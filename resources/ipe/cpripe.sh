#!/bin/bash

# ---------------------------------------------------------------------
# cpaipe 0.1.0 (C) Christian Kral 2025-07-29
#     Remove ColorPalette from ipe file
# ---------------------------------------------------------------------

echo "cpripe.sh 0.1.0 (C) Christian Kral 2025-07-29"

if test $# -eq 0
then
  echo ""
  echo "cpripe.sh FILE ColorPalette"
  echo ""
  echo "    Remove from one or more IPE files"
  echo "    the color palette ColorPalette"
  echo ""
  echo "    FILE   File to be converted or file pattern, e.g. \"*.ipe\""
  echo "    ColorPalette is the color palette to be removed"
  exit
fi

CP="${2}"

for file in $(find . -maxdepth 1 -name "$1"); do
    # Überprüfe, ob die Datei existiert
   if [ -f "$file" ]; then
        echo "Processing: ${file}"
        # Erstelle eine temporäre Datei zur Speicherung der Änderungen
        temp_file="${file}.tmp"

        # Variable, um zu verfolgen, ob wir uns innerhalb des zu löschenden Blocks befinden
        in_block=false

        # Lese die Datei Zeile für Zeile
        while IFS= read -r line; do
            # Überprüfe, ob die Zeile den Beginn des zu löschenden Blocks markiert
            if [[ "$line" == "<ipestyle name=\"${CP}\">" ]]; then
                in_block=true
            fi

            # Schreibe die Zeile nur in die temporäre Datei, wenn wir uns nicht im zu löschenden Block befinden
            if [ "$in_block" = false ]; then
                echo "$line" >> "$temp_file"
            fi

            # Überprüfe, ob die Zeile das Ende des zu löschenden Blocks markiert
            if [[ "$line" == '</ipestyle>' ]] && [ "$in_block" = true ]; then
                in_block=false
            fi
        done < "$file"

        # Ersetze die ursprüngliche Datei durch die temporäre Datei
        mv "$temp_file" "$file"
    fi    
done
