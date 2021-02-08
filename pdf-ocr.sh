#!/bin/bash

MYFONTS=$(pdffonts -l 5 "$1" | tail -n +3 | cut -d' ' -f1 | sort | uniq)
if [ "$MYFONTS" = '' ] || [ "$MYFONTS" = '[none]' ]; then
    echo "-------- Processing --------"
        echo "FILE: $1 "
        ocrmypdf "$1" "$1"
        echo " "
else
    echo "Already OCR'ed skipping file: $1"
echo " "
fi
