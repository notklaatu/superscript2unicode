# Awk script to convert XML superscripts to unicode

[G]awk script to find instances of

    <superscript>(1)</superscript>

and convert it to its Unicode superscript equivalent:

    &sup1;


## Usage

    $ chmod +x ./superscripter.awk

    $ ./superscripter.awk test.xml


## Requires

GNU Awk. I haven't tested it with other awks, but I believe I'm using some features specific to GNU's version.

Otherwise, should work as expected on any POSIX system.


## Bugs

* This probably should be redone with Beautiful Soup in Python, or some XML Perl module.

* Only works for 1..9; for double-digits, a little extra work is needed.