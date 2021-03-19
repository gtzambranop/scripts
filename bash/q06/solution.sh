cat data.csv | awk -v FS=',' '{print $3}' | tail -1| tail -n 1
