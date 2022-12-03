#!/usr/bin/sed -f
# test with:
# chmod +x html_converter.sed
# echo "<html>hh<body>bbb<b>hi</b>BB</body>HH</html>" | ./html_converter.sed
/./!D
/>\n*/s//>\n/
/^<\//{
x
s/  //
x
bl
}
/^</!s/</\n</
:l
s/^ *//
H
x
s/\n//
P
/^ *</{
/^ *<\//!s/^/  /
}
s/[^ ].*//
x
D
