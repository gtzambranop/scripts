cat data.csv | awk -v FS=',' '{print $2}' | tail -1| tail -n 1
