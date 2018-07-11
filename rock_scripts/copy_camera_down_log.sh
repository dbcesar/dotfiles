#!/bin/bash

#set -e 

if [ "$#" -ne 2 ]
then
    echo "Wrong usage"
    echo "Usage: copy_camera_down_log.sh <FIND_DIR> <OUTPUT_DIR>"
    exit
fi

################################################################
FIND_DIR=$1
OUTPUT_FOLDER=$2
FIND_EXPRESSION="*camera*.log"
################################################################

mkdir -p "$OUTPUT_FOLDER"

i=$(find $FIND_DIR -iname "${FIND_EXPRESSION}" | wc -l)
echo "Convering ${i} files"

declare -i j
j=1

find $FIND_DIR -iname "${FIND_EXPRESSION}" | while IFS= read -r NAME
do 
    FILENAME=${NAME%.*}
    NO_EXTENSION=${FILENAME##*/}
    STREAM_NAME=${FILENAME##*/}

    FILE_PATH=${NAME%/*}
    FOLDER=${FILE_PATH##*/}
    OUTPUT_FILENAME=${FOLDER}_${NO_EXTENSION}.mkv
    FULL_PATH_OUTPUT_DIR="${OUTPUT_FOLDER}/${OUTPUT_FILENAME}"
    
    if [ -e ${FULL_PATH_OUTPUT_DIR} ]
    then
        echo "File already exists. Jumping to the next on the list"
    else
        Log2Video "$NAME" "$FULL_PATH_OUTPUT_DIR"
    fi

    echo "Converted ${j} files from ${i}"
    j=j+1
done
