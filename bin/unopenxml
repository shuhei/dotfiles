#!/bin/sh
unzip -c -a $1 | iconv -f utf-8 -t utf-8 -c | perl -pe 's/></>\n</g' | perl -p -0777 -e 's/ extracting: .*( inflating: |\Z)/\1/s'
