#!/bin/bash

INPUT_DIR=$1
echo "$INPUT_DIR"

if [ "$#" -ne 1 ]; then
    echo "Wrong usage"
    echo "Usage: move_bracket_shots_and_generate_tiff.sh <INPUT_DIR>"
    exit
fi

if [ ! -d $INPUT_DIR ]; then
    echo "The argument must be an directory"
    exit
fi


OUTPUT_DIR="$INPUT_DIR/HDR"
mkdir -p $OUTPUT_DIR

exiftool "-directory=$OUTPUT_DIR" -if '$BracketMode eq "AEB"' $INPUT_DIR/*

echo "Converting $(ls -l $OUTPUT_DIR/*.CR2 | wc -l) images"
ufraw-batch $OUTPUT_DIR/*.CR2 --out-depth=16 --out-type=tif
