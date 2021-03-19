cat data.csv | awk -v FS=',' '{print $3}' | head -4| tail -n 1
