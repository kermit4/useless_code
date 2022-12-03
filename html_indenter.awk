#!/usr/bin/gawk -f
BEGIN { RS="<[^>]*>" }
/./ { gsub(/\n/," ");gsub(/^ */,"");print w $0 }
RT~/^.[/]/ { w=substr(w,1,length(w)-2) }
{ print w RT }
RT!~/^.[/]/{ w=w  "  " };
