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
# sed -i '/<ipestyle name=\"ColorPalette./d' .ins
sed -i '/<?xml version=\"1.0\"?>/d' .ins
sed -i '/<!DOCTYPE ipestyle SYSTEM \"ipe.dtd\">/d' .ins
# sed -i '/<\/ipestyle>/d' .ins

for file in $(find . -maxdepth 1 -name "$1"); do
  echo "Processing ${file}"
  # Inspired by:
  # https://unix.stackexchange.com/questions/121161/how-to-insert-text-after-a-certain-string-in-a-file
  sed -i "/<info created/ r .ins" ${file}
done
# rm .ins
