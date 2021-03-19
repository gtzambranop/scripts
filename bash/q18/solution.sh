awk -F "," '$3 == "\"Arlington (Texas)\""{ count++ }; END{ print NR - count; }' person
