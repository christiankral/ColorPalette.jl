#!/bin/bash

# ---------------------------------------------------------------------
# cpaipe 0.3.0 (C) Christian Kral 2023-07-27
#     Add ColorPalette.Y.isy in ipe file
# ---------------------------------------------------------------------

echo "cpaipe.sh 0.3.0 (C) Christian Kral 2023-07-27"

if test $# -eq 0
then
  echo ""
  echo "cpaipe.sh FILE ColorPalette.Y.isy"
  echo ""
  echo "    Converts one file or more IPE files"
  echo "    by adding color palette ColorPalette.Y.isy"
  echo ""
  echo "    FILE   File to be converted or file pattern, e.g. \"*.ipe\""
  echo "    ColorPalette.Y.isy Color palette file to be substuted in IPE file(s)"
  echo "           If the file path is not specified, the file is taken from:"
  echo "               ~/.ipe/styles/ColorPalette.Y.isy"
  echo ""
  echo "    NOTE   that the conent of the file ColorPalette.Y.isy is added to the"
  echo "           IPE files, so the inserted XML tag may differ from ColorPalette.Y"
  exit
fi

# Check if ColorPalette.Y.isy exists in default directory .ipe/styles
if [ ! -f "${2}" ];
then
  CP="${HOME}/.ipe/styles/${2}"
  if [ ! -f "${CP}" ];
    then
    echo "${CP} does not exist."
    exit
  fi
else
  CP=${2}
fi

CPN=$(basename ${CP} .isy)
echo "Attempting to add color palette:"
echo "    ${CPN}"
echo "    from file ${CP}"

# Copy $CP to local folder and modify it for being substituted
cp "${CP}" ".ins"
sed -i '/<?xml version=\"1.0\"?>/d' .ins
sed -i '/<!DOCTYPE ipestyle SYSTEM \"ipe.dtd\">/d' .ins

for file in $(find . -maxdepth 1 -name "$1"); do
  echo "Processing ${file}"
  awk '{a[NR]=$0} /\/ipestyle>/ {found=NR} END {for (i=1; i<=NR; i++) {print a[i]; if (i==found) system("cat .ins")}}' ${file} > tmpfile && mv tmpfile ${file}
done
rm .ins
