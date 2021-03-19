cat data.csv | awk -v FS=',' '{print $5}' | tail -1| tail -n 1
