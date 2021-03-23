for f in *\ *
do
	if [ ${#f} -gt 3 ]
		then
			mv "$f" "${f// /_}";
		fi
done
temp=0;
for f in *.txt
do
	((temp += $(awk -F "\",\"" 'split($1, d, "[- ]"){}; d[2]=="1192" {count++;}; END{ print count;}' $f)))
done
echo $temp;
