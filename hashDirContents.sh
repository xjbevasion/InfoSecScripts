#!/bin/bash
# hash all files in directory ($1)

userName="$(id -un)"
hashDir="$1"
dirContents="/tmp/dirContents.txt"
hashStore="/home/$userName/Desktop/Hashes.txt"

function hash_file {
    if [ -d $line ] ; then
        echo "$line is a directory"
    else
        echo "$line" >> $hashStore
        echo "md5    --> $(md5 $hashFile | awk '$1 {print $4}')" >> $hashStore
        echo "sha1   --> $(shasum $hashFile | awk '$1 {print $1}')" >> $hashStore
        echo "sha256 --> $(shasum -a 256 $hashFile | awk '$1 {print $1}')" >> $hashStore
        echo >> $hashStore
    fi
}

cd "$hashDir"
ls -1 >> $dirContents
echo "$hashDir" >> $hashStore
cat $dirContents | while read line
do
    hash_file
done

rm $dirContents