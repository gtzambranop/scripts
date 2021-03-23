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
	((temp += $(awk -F "\",\"" 'split($2, d, "[/ ]"){}; d[1]=="Apr" || d[1]=="May" || d[1]=="Jun" {count++;}; END{ print count;}' $f)))
done
echo $temp;
