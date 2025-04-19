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

# The following does not fail, but it
# includes the "=" in the argument, which
# is most likely not intended or desired:

foofunc -x=33 -y=1979
