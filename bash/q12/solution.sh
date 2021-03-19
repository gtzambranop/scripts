awk -F "," '$3 == "\"New York (New York)\""{ count++ }; END{ print count; }' person 
