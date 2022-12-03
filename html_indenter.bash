#!/bin/bash
input="<html>hh<body>bbb<b>hi</b>BB</body>HH</html>" 
[[ $TMPDIR ]] || TMPDIR=/tmp/
tmp=/$TMPDIR/html_indenter.input
yes "$input" | head -100000 > $tmp

gcc -O3 html_indenter.c -o html_indenter
for lang in html_indenter{.awk,.sed,,O2,O3};do 
    echo ======== $lang
    time ./$lang  < $tmp > /dev/null
done
