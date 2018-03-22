#!/usr/bin/env bash

# confirmation
read -p "Would you like to process all ISOs in the current directory? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

for file in *.iso
do
        dir="${file%.iso}"
        mkdir -- "$dir"
        mv -- "$file" "$dir"
done

find "$PWD" -type d | sort | while read dir
        do cd "${dir}"
        [ ! -f md5sum.txt ] && echo "Processing " "${dir}" || echo "Skipping " "${dir}" " md5sum.txt already present" 
        [ ! -f md5sum.txt ] &&  md5sum * > md5sum.txt
        chmod a=r "${dir}"/md5sum.txt
done

yes | rm ./md5sum.txt

fi

find /home/ebh.312.ninja/ -name '*.iso' -not -path '/home/ebh.312.ninja/dell/archive/*' \
	|sed -e 's/\/home\/ebh.312.ninja/http:\/\/ebh.312.ninja/' > list.txt

chown www-data.www-data /home/ebh.312.ninja/dell/ -R

echo
echo "Complete"
echo
cat /home/ebh.312.ninja/dell/list.txt
