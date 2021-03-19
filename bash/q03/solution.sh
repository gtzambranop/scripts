cat data.csv | awk -v FS=',' '{print $1}' | head -2| tail -n 1
