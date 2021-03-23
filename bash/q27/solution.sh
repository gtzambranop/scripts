awk -F "," 'split($6, d, "[- ]"){}; (d[2]=="04" || d[2]=="05" || d[2]=="06"){count++;}; END{ print count;}' person
