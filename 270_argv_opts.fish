#!/usr/bin/env fish

function foofunc
    argparse 'x/xray=' 'y/year=?&' 'h/help' -- $argv ; or return

    echo $argv_opts
end

foofunc -x 33 -y1979 -h
foofunc --xray 33 --year=1979 --help
foofunc --xray 33 --help
foofunc -x 33 --year=1979 --help
foofunc -x 33 -h --year=1979 
foofunc -h -x 33 --year=1979 
foofunc --help -x 33 -y1979 


# Starting with fish 4.1.0 (released 27.Sep.2025) the
# $argv_opts variable stores all options and arguments
# as a single string.  However, if an ampersand (&) is
# postfixed to a flag, such as "y/year=?&", then that
# option and its argument is removed from $argv_opts.
# The "fish_opt --delete" command may also be used to 
# remove an option and its argument from $argv_opts.

# A flag postfixed with "=", such as "x/xray=", does
# not include a "=" when the function is called, e.g.,
# "foofunc -x 33" or "foofunc --xray 33".

# A flag postfixed with "=?", such as "y/year=?", must
# include a "=" when the function is called using the
# long name of the flag, e.g., "foofunc --year=1979",
# but must not when using the short name of the flag,
# e.g., "foofunc -y1979" (notice, no space character).

# A flag postfixed with nothing, such as "h/help", 
# does not take any argument when called, e.g., 
# "foofunc -h" or "foofunc --help".  A special case
# of this is when a hashmark (#) is used instead of
# a forward slash (/) for integers, but there are no
# examples of this above.
