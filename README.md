# iso-proc
The tool takes all iso files in the current directory, creates aptly named folder, md5sums, places files in new directory, and create a list including URLs for easy curl/wget!

Intended batch use:

  download all isos (parallel)

        curl $YourURL/list.txt|parallel -j 5 --gnu "wget {}"

  download all isos (one at a time)

        wget -i $YourURL/list.txt
