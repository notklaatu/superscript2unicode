#!/usr/bin/gawk -f

# GNU All-Permissive License
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

## perl works but only for 1..3 
#find . -type f -iname "*.xml" -exec perl -i.orig -p -e 's/(<superscript>\().*(\d).+script>/("&sup".$2.";")/ge' {} \;

## pass through if not superscript
!/superscript/ {
    print;
}

/superscript/ {
    gsub("<superscript>","");
    gsub("</superscript>","");
    match($0, "\([[:digit:]]\)", arr);

    # if 1..3 then use easy HTML code
    if ( arr[0] < 4 ) 
	gsub(/\([[:digit:]]\)/, "\\&sup"arr[0]";");
    # if 4..9 use obscure HTML code +4 offset
    else if ( arr[0] > 3 && arr[0] < 10) {
	gsub(/\([[:digit:]]\)/, "\\&#830"arr[0]+4";");
    }
    # TODO: if 10..19 then we have to construct double digit numbers
    
    print;
}

