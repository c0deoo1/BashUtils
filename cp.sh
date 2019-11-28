#!/bin/bash
echo "mkdir $1"
mkdir $1
for img in `ls .`;
do
filename=$(echo $img | cut -d . -f1)
extension=$(echo $img | cut -d . -f2)
if [ "$extension" = "png" ]
then
    for resolution in 1x 2x 3x 1_5x;
        do
                newFile="${filename}_${resolution}.${extension}"
                cp $img "$1/${newFile}"
        done
fi
done
