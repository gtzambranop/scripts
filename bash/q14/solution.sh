sort -t . -nrk2 person > del ; mv del person ; cat person | awk -v FS="," '{print $3}' | head -3| tail -n 1
