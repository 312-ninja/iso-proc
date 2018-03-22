# iso-proc
The tool takes all iso files in the current directory
  * creates aptly named folder
  * creates md5sums for each ISO 
  * places files in new directory
  * creates a list including URLs for easy curl/wget!

Intended batch use:

  download all isos (parallel)

        curl $YourURL/list.txt|parallel -j 5 --gnu "wget {}"

  download all isos (one at a time)

        wget -i $YourURL/list.txt
