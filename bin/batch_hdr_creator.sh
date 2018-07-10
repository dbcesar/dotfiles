#!/bin/bash

# OPTIONS number of group bracket shot and verbose.

# find braket shots pictures
# move them to a folder
# convert them to TIFF 16bits
# generate .exr from TIFF 16bits 
# copy exif information from group header to .ext image 

# extra, create another script to copy EXIF information to the JPEG generated from the HDR (.exr)

set -e

INPUT_DIR="/home/diego/Pictures/Fotos/2017-09-16_-_Alaska/HDR/TIFF/done"
OUTPUT_DIR="/home/diego/Desktop/test_HDR"
HDR_EXTENSION=".exr"
mkdir -p $OUTPUT_DIR
BRACKET_IMAGES=3
IMAGES_DIR=$(ls -l $INPUT_DIR/*.tif| grep -v ^l | wc -l)

#checking if number of files is compatible
if [ $(( $IMAGES_DIR%$BRACKET_IMAGES )) -ne 0 ]; then
    echo "[HDR CREATOR] Number of inputs ($IMAGES_DIR) is not divisible by $BRACKET_IMAGES"
    echo "[HDR CREATOR] Exiting the program"
    exit
fi

declare -i i
i=0
temp=""
temp_debug=""
for filename in $INPUT_DIR/*.tif 
do
    temp_debug="$temp_debug${filename##*/} "
    temp="$temp ${filename}"

    i=i+1
    if [ $(( $i%$BRACKET_IMAGES )) -eq 0 ]; then
        filename=${temp_debug%% *}
        filename=${filename%%.tif}

        if [ -e $OUTPUT_DIR/$filename$HDR_EXTENSION ]; then
            echo "File already exists"
        else
            echo "[HDR CREATOR] Creating HDR for the following files"
            echo "[HDR CREATOR] $temp_debug"
            luminance-hdr-cli $temp --save $OUTPUT_DIR/$filename$HDR_EXTENSION -a AIS
            echo "[HDR CREATOR] output file: $OUTPUT_DIR/$filenam$HDR_EXTENSION"
        fi

        temp=""
        temp_debug=""
    fi
done

rm -rf $INPUT_DIR/*.tif*
