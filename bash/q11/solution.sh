awk -F "," '$3 == "\"Los Angeles (California)\""{ count++ }; END{ print count; }' person
