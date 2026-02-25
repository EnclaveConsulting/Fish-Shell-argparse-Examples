#!/usr/bin/env fish

function foofunc
    argparse --strict-longopts 'xray=' 'year=?' 'help' -- $argv ; or return

    echo "xray: $_flag_xray"
    echo "year: $_flag_year"
    echo "help: $_flag_help"
    echo "argv: $argv"
    echo "argv_opts: $argv_opts"
    echo "-------------------------"
end

# These work as expected, no errors
foofunc --xray 0 --year=2000 --help
foofunc --xray 1 --year=2001
foofunc --xray 2 --help

# With --strict-longopts, no abbreviations are allowed,
# hence, these fail with "unknown option" errors
foofunc --xra 3 --yea=2003 --hel
foofunc --x 3 --y=2003 --h


# Starting with fish 4.1.0 (released 27.Sep.2025), argparse
# supports "--strict-longopts" to require that the full
# name of a long option be used, such as "--xray", and
# to reject abbreviations of that option's name even when
# there are no other similarly-named options.  Fish's 
# documentation states that, "This option may be on all the
# time in the future, so do not rely on the behavior
# without it."  You have been warned. 



# As a reminder:
# A flag postfixed with "=", such as "xray=", does
# not include a "=" when the function is called, e.g.,
# "foofunc --xray 2".

# A flag postfixed with "=?", such as "year=?", must
# include a "=" when the function is called using the
# long name of the flag, e.g., "foofunc --year=2001".

# A flag postfixed with nothing, such as "help", 
# does not take any argument when called, e.g., 
# "foofunc --help".

