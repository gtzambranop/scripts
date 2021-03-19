cat data.csv | awk -v FS=',' '{print $2}' | head -3| tail -n 1
