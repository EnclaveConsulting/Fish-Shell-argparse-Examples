#!/usr/bin/env fish

function foofunc
    set --function options 'x/xray=' 'y/year=?' 'h/help' 
    argparse $options -- $argv ; or return

    echo $_flag_x
    echo $_flag_xray

    echo $_flag_y
    echo $_flag_year

    echo $_flag_h
    echo $_flag_help

    echo Done
end

foofunc -x 33 -y1979 -h
foofunc --xray 33 --year=1979 --help
foofunc --xray 33 --help
foofunc -x 33 --year=1979 --help
foofunc -x 33 -h --year=1979 
foofunc -h -x 33 --year=1979 
foofunc --help -x 33 -y1979 

# The following does not fail, but it includes
# the "=" in the argument to -y, which is
# most likely not intended or desired:

foofunc -x 33 -y=1979

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
