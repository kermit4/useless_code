#!/usr/bin/gawk -f
# test with:
# chmod +x html_converter.sed
# echo "<html>hh<body>bbb<b>hi</b>BB</body>HH</html>" | ./html_converter.sed
BEGIN { RS="<[^>]*>" }
/./ { gsub(/\n/," ");gsub(/^ */,"");print w $0 }
RT~/^.[/]/ { w=substr(w,1,length(w)-2) }
{ print w RT }
RT!~/^.[/]/{ w=w  "  " };
