sed 's/\r$//' person > temp &&\
mv temp person &&\
sed 's/\r$//' bank.csv > temp &&\
mv temp bank.csv &&\
join -t, -1 2 -2 1 -o0,1.1,2.5 <(sort -t, -k2b bank.csv) <(sort -t, -k1b person) > temp &&\
awk -F "," '$2 == "\"3608-2596-5551-1068\""{print $3;}' temp &&\
rm temp
