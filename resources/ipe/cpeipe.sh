#!/bin/bash

# ---------------------------------------------------------------------
# cpeipe 0.3.0 (C) Christian Kral 2023-07-27
#     Exchange ColorPalette.X.isy in ipe file
#     by ColorPalette.Y.isy
# ---------------------------------------------------------------------

echo "cpeipe.sh 0.3.0 (C) Christian Kral 2023-07-27"

if test $# -eq 0
then
  echo ""
  echo "cpeipe.sh FILE ColorPalette.Y.isy"
  echo ""
  echo "    Converts one file or more IPE files"
  echo "    by exchanging any color palette ColorPalette.X.isy"
  echo "    by another color palette ColorPalette.Y.isy"
  echo ""
  echo "    FILE   File to be converted or file pattern, e.g. \"*.ipe\""
  echo "    ColorPalette.Y.isy Color palette file to be substuted in IPE file(s)"
  echo "           If the file path is not specified, the file is taken from:"
  echo "               ~/.ipe/styles/ColorPalette.Y.isy"
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
echo "Attempting to substitute color palette by:"
echo "    ${CPN}"
echo "    from file ${CP}"


# Copy $CP to local folder and modify it for being substituted
cp "${CP}" ".ins"
sed -i '/<ipestyle name=\"ColorPalette./d' .ins
sed -i '/<?xml version=\"1.0\"?>/d' .ins
sed -i '/<!DOCTYPE ipestyle SYSTEM \"ipe.dtd\">/d' .ins
sed -i '/<\/ipestyle>/d' .ins

for file in $(find . -maxdepth 1 -name "$1"); do
  echo "Processing ${file}"
  sed -i -ne '/<ipestyle name=\"ColorPalette./ {p; r .ins' -e ':a; n; /<\/ipestyle>/ {p; b}; ba}; p' "${file}"
done
sed -i "/<ipestyle name=\"ColorPalette./c\\<ipestyle name=\"${CPN}\">" "${file}"
rm .ins
