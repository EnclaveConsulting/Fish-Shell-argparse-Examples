#!/usr/bin/env fish

function foofunc
    argparse 'x=' 'y=' -- $argv ; or return

    echo $_flag_x
    echo $_flag_y
end

foofunc -x 3 -y 5
