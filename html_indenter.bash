#!/bin/bash
#input="<html>hh<body>bbb<b>hi</b>BB</body>HH</html>" 
input="<html>hh<body>


bbb<b>
hi</b>
    BB</body>                   HH</html>" 
for src in ${0%bash}*;do
    lang=${src##*.}
    [[ $lang == bash ]] && continue
    echo ======== with $lang
    $src <<<$input
done
