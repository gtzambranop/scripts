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
	((temp += $(awk -F "\",\"" 'split($2, d, "[/ ]"){}; d[1]=="Jul" || d[1]=="Aug" || d[1]=="Sep" {count++;}; END{ print count;}' $f)))
done
echo $temp;
