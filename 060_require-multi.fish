#!/usr/bin/env fish

function foofunc
    argparse 'x=+' -- $argv ; or return

    echo $_flag_x
end

foofunc -x 3 -x 5 -x 7

# The "=+" postfix in "x=+" permits multiple uses in one command.
# The $_flag_x variable is automatically created by Fish and
# it will contain "3 5 7" in the above example.
