awk -F "\",\"" 'split($5, d, "[  ]"){}; (substr(d[1],1,1)=="A" && substr(d[2],1,1)=="A"){ count++ }; END{ print count }' person
