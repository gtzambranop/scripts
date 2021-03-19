awk -F "," '$3 == "\"Anaheim (California)\""{ count++ }; END{ print NR - count; }' person
