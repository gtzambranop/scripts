awk -F "," '$3 == "\"Albuquerque (New Mexico)\""{ count++ }; END{ print NR - count; }' person
