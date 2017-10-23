#!/bin/bash

find "$PWD" -type d | sort | while read dir
   do cd "${dir}"
   [ ! -f md5sum.txt ] && echo "Processing " "${dir}" || echo "Skipping " "${dir}" " md5sum.txt already present" 
   [ ! -f md5sum.txt ] &&  md5sum * > md5sum.txt ; chmod a=r "${dir}"/md5sum.txt 
done 
