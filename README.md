# iso-proc
This tool takes all ISOs in the working directory and creates aptly named folder,
creates md5sums for each ISO, places files in new directory, and creates a list 
including URLs for easy curl/wget!

Mini ISO's do not include SATA/SAS disk firmware

Intended batch use:

  download all isos (parallel)

        curl $YourURL/list.txt|parallel -j 5 --gnu "wget {}"

  download all isos (one at a time)

        wget -i $YourURL/list.txt
