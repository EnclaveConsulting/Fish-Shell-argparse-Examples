#!/usr/bin/env fish

function foofunc
    argparse 'x=+' -- $argv ; or return

    echo $_flag_x
end

foofunc -x 3 -x 5 -x 7
