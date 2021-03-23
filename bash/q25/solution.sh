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
	((temp += $(awk -F "\",\"" 'split($2, d, "[/ ]"){}; d[1]=="Oct" || d[1]=="Nov" || d[1]=="Dec" {count++;}; END{ print count;}' $f)))
done
echo $temp;
