cat data.csv | awk -v FS=',' '{print $1}' | head -11| tail -n 1
