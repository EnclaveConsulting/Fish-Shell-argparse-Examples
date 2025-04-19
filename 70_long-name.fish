#!/usr/bin/env fish

function foofunc
    argparse 'xray=' 'year=?' 'help' -- $argv ; or return

    echo $_flag_xray
    echo $_flag_year
    echo $_flag_help
    echo Done
end

foofunc --xray 33 --year=1979 --help
foofunc --xray 33 --help

# A flag postfixed with "=", such as "xray=", does
# not include a "=" when the function is called, e.g.,
# "foofunc --xray 33".

# A flag postfixed with "=?", such as "year=?", must
# include a "=" when the function is called using the
# long name of the flag, e.g., "foofunc --year=1979".
# The "=?" postfix means that the argument is optional.

# A flag postfixed with nothing, such as "help", does
# not take any argument when called, e.g., 
# "foofunc --help".  A special case of this is when
# a hashmark (#) is used for integers, but there
# are no examples of this above.
