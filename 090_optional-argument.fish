#!/usr/bin/env fish

function foofunc
    argparse 'x/xray=?' 'y/year=?' -- $argv ; or return

    echo $_flag_x
    echo $_flag_y
    echo Done
end

foofunc -x33 -y1979
foofunc --xray=33 --year=1979
foofunc -x33
foofunc --year=1979

# The "=?" postfix in "x/xray=?" indicates that an argument is not required.
# The first "x" in "x/xray=?" is the short name of the option (-x).
# The "xray" in "x/xray=?" is the long name of the option (--xray).
# Use a single dash (-x33) when an argument is not required.
# Do not use = with a short name when an argument is not required.
# Long option names are mentioned with two dashes (--xray=1979).
# Use = with long names when an argument is not required.

# The following does not fail or throw an error, but it
# includes the "=" in the argument values, which is
# most likely not intended or desired:

foofunc -x=33 -y=1979
