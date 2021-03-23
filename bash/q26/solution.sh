awk -F "," 'split($6, d, "[- ]"){}; (d[2]=="01" || d[2]=="02" || d[2]=="03"){count++;}; END{ print count;}' person
